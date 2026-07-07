@echo off
setlocal
set ROOT=%~dp0
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%tools\bootstrap.ps1"
if errorlevel 1 (
  echo.
  echo [ERROR] セットアップに失敗しました。
  echo PowerShell のエラー内容を確認してください。
  pause
  exit /b 1
)
start "" "%ROOT%vscode\Code.exe" "%ROOT%projects"
endlocal
