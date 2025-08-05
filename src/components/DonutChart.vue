<template>
  <div class="donut-chart-container">
    <canvas ref="chartCanvas"></canvas>
    <div class="donut-center">
      <span class="center-value">{{ data.edcTotal }}</span>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import { Chart, registerables } from 'chart.js'

Chart.register(...registerables)

const props = defineProps({
  data: {
    type: Object,
    required: true
  }
})

const chartCanvas = ref(null)
let chart = null

const createChart = () => {
  if (chart) {
    chart.destroy()
  }

  const ctx = chartCanvas.value.getContext('2d')
  
  chart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ['Bakı RETSİ', 'Digər RETSİLƏR', 'Qarabağ RETSİ'],
      datasets: [{
        data: [60, 20, 20],
        backgroundColor: [
          '#60A5FA', // Light Blue
          '#10B981', // Dark Green
          '#84CC16'  // Light Green
        ],
        borderColor: [
          '#60A5FA',
          '#10B981',
          '#84CC16'
        ],
        borderWidth: 0,
        cutout: '70%'
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        },
        tooltip: {
          callbacks: {
            label: function(context) {
              return `${context.label} ${context.parsed}%`
            }
          }
        }
      },
      elements: {
        arc: {
          borderWidth: 0
        }
      }
    }
  })
}

onMounted(() => {
  createChart()
})

watch(() => props.data, () => {
  if (chart) {
    chart.data.datasets[0].data = [60, 20, 20]
    chart.update()
  }
}, { deep: true })
</script>

<style scoped>
.donut-chart-container {
  width: 120px;
  height: 120px;
  position: relative;
  margin: 0 auto;
}

.donut-center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  z-index: 10;
}

.center-value {
  font-size: 1.25rem;
  font-weight: 700;
  font-family: 'Montserrat', sans-serif;
  color: #1E40AF;
}
</style> 