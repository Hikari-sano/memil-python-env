# Optional helper: install packages from requirements-lab.txt into hello-python .venv
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$UvExe = Join-Path $Root "python\uv\uv.exe"
$Req = Join-Path $Root "requirements-lab.txt"
$Py = Join-Path $Root "projects\hello-python\.venv\Scripts\python.exe"
if (-not (Test-Path $UvExe)) { throw "uv.exe not found. Run Start.bat first." }
if (-not (Test-Path $Py)) { throw "Python venv not found. Run Start.bat first." }
if (-not (Test-Path $Req)) { throw "requirements-lab.txt not found." }
& $UvExe pip install --python $Py -r $Req
