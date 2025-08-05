<template>
  <div class="bar-chart-container">
    <div class="bars-grid">
      <!-- Güç artımı -->
      <div class="bar-item">
        <div class="bar-value">{{ data.powerIncrease }} MW</div>
        <div class="bar" :style="{ height: (data.powerIncrease / 300) * 100 + '%', backgroundColor: '#10B981' }"></div>
        <div class="bar-label">Güç artımı</div>
      </div>

      <!-- Əhali -->
      <div class="bar-item">
        <div class="bar-value">{{ data.population }}</div>
        <div class="bar" :style="{ height: (data.population / 15000) * 100 + '%', backgroundColor: '#84CC16' }"></div>
        <div class="bar-label">Əhali</div>
      </div>

      <!-- Qeyri Əhali -->
      <div class="bar-item">
        <div class="bar-value">{{ data.nonPopulation }}</div>
        <div class="bar" :style="{ height: (data.nonPopulation / 15000) * 100 + '%', backgroundColor: '#60A5FA' }"></div>
        <div class="bar-label">Qeyri Əhali</div>
      </div>

      <!-- TM/KTM -->
      <div class="bar-item">
        <div class="bar-value">{{ data.other }}</div>
        <div class="bar" :style="{ height: (data.other / 15000) * 100 + '%', backgroundColor: '#1E40AF' }"></div>
        <div class="bar-label">TM/KTM</div>
      </div>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  data: {
    type: Object,
    required: true
  }
})
</script>

<style scoped>
.bar-chart-container {
  width: 100%;
  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.bars-grid {
  display: flex;
  gap: 20px;
  align-items: flex-end;
}

.bar-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}

.bar-value {
  font-size: 1.1rem;
  font-weight: 600;
  color: #1E40AF;
  white-space: nowrap;
  font-family: 'Montserrat', sans-serif;
  text-align: center;
}

.bar {
  width: 60px;
  min-height: 80px;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.bar-label {
  font-size: 1rem;
  color: #6B7280;
  font-family: 'Montserrat', sans-serif;
  text-align: center;
  white-space: nowrap;
}
</style> 