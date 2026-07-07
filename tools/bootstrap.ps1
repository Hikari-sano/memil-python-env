$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. (Join-Path $Root "tools\common-winpython.ps1")

$VscodeDir = Join-Path $Root "vscode"
$VscodeExe = Join-Path $VscodeDir "Code.exe"
$VscodeData = Join-Path $VscodeDir "data"
$CacheDir = Join-Path $Root "cache"
$ProjectsDir = Join-Path $Root "projects"

Ensure-Dir $VscodeDir
Ensure-Dir $VscodeData
Ensure-Dir $CacheDir
Ensure-Dir $ProjectsDir
Ensure-Dir (Join-Path $Root "winpython")

Write-Host "== Mimel Lab setup =="
Write-Host "Mode: WinPython only"
Write-Host "Root: $Root"

try {
    $BasePython = Get-WinPythonBasePython
    Write-Host "WinPython found: $BasePython"
    & $BasePython --version
} catch {
    Write-Host ""
    Write-Host "[ERROR] WinPython was not found."
    Write-Host "Please download WinPython and extract it under the winpython folder."
    Write-Host "Expected example: winpython\\WPy64-*\\python\\python.exe"
    Write-Host "Guide: docs\\WINPYTHON_GUIDE.md"
    throw $_
}

if (-not (Test-Path $VscodeExe)) {
    Write-Host "Downloading VS Code ZIP..."
    $ZipUrl = "https://update.code.visualstudio.com/latest/win32-x64-archive/stable"
    $ZipPath = Join-Path $CacheDir "vscode-win32-x64-latest.zip"
    $TempExtract = Join-Path $CacheDir "vscode-extract"
    if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }
    if (Test-Path $TempExtract) { Remove-Item $TempExtract -Recurse -Force }
    Ensure-Dir $TempExtract
    Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath
    Expand-Archive -Path $ZipPath -DestinationPath $TempExtract -Force
    Get-ChildItem -Path $TempExtract | ForEach-Object { Copy-Item -Path $_.FullName -Destination $VscodeDir -Recurse -Force }
    Remove-Item $TempExtract -Recurse -Force
} else {
    Write-Host "VS Code already exists."
}

$HelloDir = Join-Path $ProjectsDir "hello-python"
$HelloPython = New-ProjectVenv -ProjectDir $HelloDir
Write-ProjectVscodeSettings -ProjectDir $HelloDir

$MainPy = Join-Path $HelloDir "main.py"
if (-not (Test-Path $MainPy)) {
    Set-Content -Path $MainPy -Encoding UTF8 -Value @(
        'print("Hello from Mimel Lab WinPython environment!")',
        'print("VS Code portable environment is ready.")'
    )
}

$RunBat = Join-Path $HelloDir "RUN_HELLO.bat"
Set-Content -Path $RunBat -Encoding ASCII -Value @(
    '@echo off',
    'setlocal',
    'cd /d "%~dp0"',
    '".\.venv\Scripts\python.exe" "main.py"',
    'pause',
    'endlocal'
)

Write-Host "Setup completed."
