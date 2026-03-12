# Always run from this script's directory
Set-Location -Path $PSScriptRoot

$wk = "C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe"
$md = Join-Path $PSScriptRoot "DFMProUserGuide.md"
$html = Join-Path $PSScriptRoot "DFMProUserGuide.html"
$pdf = Join-Path $PSScriptRoot "DFMProUserGuide.pdf"
$footer = Join-Path $PSScriptRoot "footer.html"
$header = Join-Path $PSScriptRoot "header.html"
$css = Join-Path $PSScriptRoot "style.css"

pandoc $md --toc --toc-depth=3 -s `
  --css $css `
  -o $html

& $wk --enable-local-file-access `
  --page-size A4 `
  --margin-top 20mm `
  --margin-bottom 25mm `
  --margin-left 15mm `
  --margin-right 15mm `
  --footer-html $footer `
  --header-html $header `
  $html $pdf
