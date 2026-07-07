$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) { New-Item -ItemType Directory -Path $Path | Out-Null }
}

function Get-WinPythonBasePython {
    $WinPythonDir = Join-Path $Root "winpython"
    if (-not (Test-Path $WinPythonDir)) {
        throw "WinPython folder not found. Please put WinPython under: $WinPythonDir"
    }
    $candidates = Get-ChildItem -Path $WinPythonDir -Recurse -Filter "python.exe" -ErrorAction SilentlyContinue | Where-Object {
        $_.FullName -notmatch "\\.venv\\" -and $_.FullName -match "\\python\\python.exe$"
    } | Sort-Object FullName
    if (-not $candidates -or $candidates.Count -eq 0) {
        throw "WinPython python.exe not found. Expected something like winpython\\WPy64-*\\python\\python.exe"
    }
    return $candidates[0].FullName
}

function New-ProjectVenv {
    param([string]$ProjectDir)
    Ensure-Dir $ProjectDir
    $BasePython = Get-WinPythonBasePython
    $VenvDir = Join-Path $ProjectDir ".venv"
    $PythonExe = Join-Path $VenvDir "Scripts\python.exe"
    if (-not (Test-Path $PythonExe)) {
        Write-Host "Creating virtual environment: $VenvDir"
        & $BasePython -m venv "$VenvDir"
    } else {
        Write-Host "Virtual environment already exists: $VenvDir"
    }
    & $PythonExe -m pip install -U pip setuptools wheel
    return $PythonExe
}

function Write-ProjectVscodeSettings {
    param([string]$ProjectDir)
    $VsDir = Join-Path $ProjectDir ".vscode"
    Ensure-Dir $VsDir
    $SettingsPath = Join-Path $VsDir "settings.json"
    Set-Content -Path $SettingsPath -Encoding UTF8 -Value @(
        '{',
        '  "python.defaultInterpreterPath": "${workspaceFolder}\\.venv\\Scripts\\python.exe",',
        '  "python.terminal.activateEnvironment": true',
        '}'
    )
}
