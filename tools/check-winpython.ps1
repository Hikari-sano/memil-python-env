$ErrorActionPreference = "Continue"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$WinPythonDir = Join-Path $Root "winpython"

Write-Host "Checking WinPython..."
Write-Host "Root: $Root"
Write-Host "Expected folder: $WinPythonDir"

if (-not (Test-Path $WinPythonDir)) {
    Write-Host "[NG] winpython folder was not found."
    exit 1
}

$candidates = Get-ChildItem -Path $WinPythonDir -Recurse -Filter "python.exe" -ErrorAction SilentlyContinue | Where-Object {
    $_.FullName -notmatch "\\.venv\\" -and $_.FullName -match "\\python\\python.exe$"
} | Sort-Object FullName

if (-not $candidates -or $candidates.Count -eq 0) {
    Write-Host "[NG] WinPython python.exe was not found."
    Write-Host "Expected example: winpython\\WPy64-xxxx\\python\\python.exe"
    Write-Host "Current winpython folder contents:"
    Get-ChildItem -Path $WinPythonDir -Force -ErrorAction SilentlyContinue | Select-Object Mode, LastWriteTime, Length, Name | Format-Table -AutoSize
    exit 1
}

$PythonExe = $candidates[0].FullName
Write-Host "[OK] WinPython found: $PythonExe"
& $PythonExe --version

Write-Host "Checking pip..."
& $PythonExe -m pip --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "[WARN] pip check failed. Trying ensurepip..."
    & $PythonExe -m ensurepip --upgrade
    & $PythonExe -m pip install -U pip setuptools wheel
}

Write-Host "WinPython check completed."
exit 0
