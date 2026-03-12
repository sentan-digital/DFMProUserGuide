@echo off
chcp 65001 > nul

powershell -NoProfile -ExecutionPolicy Bypass -File build_pdf.ps1
if errorlevel 1 goto :err



echo 完了
pause
exit /b 0

:err
echo エラーが発生したため中断しました（errorlevel=%errorlevel%）
pause
exit /b %errorlevel%
