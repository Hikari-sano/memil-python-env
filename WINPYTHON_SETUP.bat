@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo WinPython setup helper
echo ========================================
echo This helper will guide you through placing WinPython in this folder.
echo.
echo Step 1: A browser page will open.
echo Step 2: Download a WinPython 64-bit package.
echo Step 3: Extract it into the winpython folder.
echo Step 4: Come back here and press Enter.
echo.
echo Recommended layout:
echo   winpython\WPy64-xxxx\python\python.exe
echo.
if not exist ".\winpython" mkdir ".\winpython"

choice /C YN /M "Open WinPython download page now"
if errorlevel 2 goto check
start "" "https://winpython.github.io/"

:check
echo.
echo After extracting WinPython into the winpython folder, press Enter.
pause >nul
powershell -NoProfile -ExecutionPolicy Bypass -File ".\tools\check-winpython.ps1"
if errorlevel 1 (
  echo.
  echo [ERROR] WinPython was not detected.
  echo Please check that python.exe exists like:
  echo   winpython\WPy64-xxxx\python\python.exe
  echo.
  echo Opening winpython folder...
  start "" ".\winpython"
  pause
  exit /b 1
)

echo.
echo WinPython was detected successfully.
echo Next step: run Start.bat
echo.
pause
endlocal
