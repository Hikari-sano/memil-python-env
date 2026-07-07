. (Join-Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)) "tools\common-winpython.ps1")
$ProjectDir = Join-Path $Root "projects\jupyter-sample"
$PythonExe = New-ProjectVenv -ProjectDir $ProjectDir
Write-ProjectVscodeSettings -ProjectDir $ProjectDir
Ensure-Dir (Join-Path $ProjectDir "notebooks")
& $PythonExe -m pip install -U jupyterlab notebook ipykernel numpy pandas matplotlib openpyxl
Set-Content -Path (Join-Path $ProjectDir "START_JUPYTER.bat") -Encoding ASCII -Value @('@echo off','setlocal','cd /d "%~dp0"','".\.venv\Scripts\python.exe" -m jupyter lab --notebook-dir="notebooks"','pause','endlocal')
Write-Host "Jupyter environment is ready: $ProjectDir"
