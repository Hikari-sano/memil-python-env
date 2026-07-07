. (Join-Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)) "tools\common-winpython.ps1")
$ProjectDir = Join-Path $Root "projects\common-python-sample"
$PythonExe = New-ProjectVenv -ProjectDir $ProjectDir
Write-ProjectVscodeSettings -ProjectDir $ProjectDir
& $PythonExe -m pip install -U numpy pandas matplotlib scipy scikit-learn pillow opencv-python jupyter ipykernel openpyxl tqdm seaborn
Set-Content -Path (Join-Path $ProjectDir "main.py") -Encoding UTF8 -Value @('import numpy, pandas, matplotlib, scipy, sklearn, cv2','print("Common Python packages are ready.")','print("numpy", numpy.__version__)')
Set-Content -Path (Join-Path $ProjectDir "RUN_COMMON_PYTHON.bat") -Encoding ASCII -Value @('@echo off','setlocal','cd /d "%~dp0"','".\.venv\Scripts\python.exe" "main.py"','pause','endlocal')
Write-Host "Common Python environment is ready: $ProjectDir"
