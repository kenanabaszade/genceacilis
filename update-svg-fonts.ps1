# PowerShell script to update SVG fonts
$svgFiles = Get-ChildItem -Path "public/map" -Filter "*.svg" -Exclude "Azerbaijan.svg", "BAkuRetsi.svg"

foreach ($file in $svgFiles) {
    Write-Host "Updating $($file.Name)..."
    
    $content = Get-Content $file.FullName -Raw
    
    # Add font-face definitions after the first <style> tag
    $fontFaces = @"
      @font-face {
        font-family: 'Montserrat';
        src: url('/fonts/Montserrat-Regular.ttf') format('truetype');
        font-weight: 400;
        font-style: normal;
      }
      @font-face {
        font-family: 'Montserrat';
        src: url('/fonts/Montserrat-Bold.ttf') format('truetype');
        font-weight: 700;
        font-style: normal;
      }
      @font-face {
        font-family: 'Montserrat';
        src: url('/fonts/Montserrat-ExtraBold.ttf') format('truetype');
        font-weight: 800;
        font-style: normal;
      }
"@
    
    # Replace font-family references
    $content = $content -replace "font-family: ArialMT, Arial;", "font-family: 'Montserrat', sans-serif;"
    $content = $content -replace "font-family: Montserrat-Black, Montserrat;", "font-family: 'Montserrat', sans-serif;"
    
    # Add font-face definitions after <style> tag
    $content = $content -replace "(<style>)", "`$1`n$fontFaces"
    
    # Write back to file
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "All SVG files updated successfully!" 