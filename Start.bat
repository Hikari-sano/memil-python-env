@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo Mimel Lab Python / AI Environment
echo ========================================
echo Base mode: WinPython only
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File ".\tools\bootstrap.ps1"
if errorlevel 1 (
  echo.
  echo [ERROR] Setup failed.
  echo Please check the messages above.
  pause
  exit /b 1
)

if exist ".\vscode\Code.exe" (
  start "" ".\vscode\Code.exe" ".\projects"
) else (
  echo VS Code was not found. Please check setup messages.
  pause
  exit /b 1
)

endlocal
