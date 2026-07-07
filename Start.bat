@echo off
setlocal

set "ROOT=%~dp0"
set "VSCODE=%ROOT%vscode\Code.exe"
set "PROJECTS=%ROOT%projects"
set "BOOTSTRAP=%ROOT%tools\bootstrap.ps1"

echo ========================================
echo PyDevCatalog setup
echo ========================================
echo ROOT=%ROOT%
echo.

if not exist "%BOOTSTRAP%" (
  echo [ERROR] bootstrap.ps1 not found.
  echo Path: %BOOTSTRAP%
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%BOOTSTRAP%"

if errorlevel 1 (
  echo.
  echo [ERROR] Setup failed.
  pause
  exit /b 1
)

if not exist "%VSCODE%" (
  echo.
  echo [ERROR] VS Code not found.
  echo Path: %VSCODE%
  pause
  exit /b 1
)

if not exist "%PROJECTS%" (
  mkdir "%PROJECTS%"
)

echo.
echo Starting VS Code...
start "" "%VSCODE%" "%PROJECTS%"

endlocal
