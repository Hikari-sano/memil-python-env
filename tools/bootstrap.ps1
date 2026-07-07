# PyDevCatalog bootstrap script
# Windows PowerShell 5.1+ / PowerShell 7+
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$VscodeDir = Join-Path $Root "vscode"
$VscodeExe = Join-Path $VscodeDir "Code.exe"
$VscodeData = Join-Path $VscodeDir "data"
$CacheDir = Join-Path $Root "cache"
$ProjectsDir = Join-Path $Root "projects"
$PythonDir = Join-Path $Root "python"
$UvDir = Join-Path $PythonDir "uv"
$UvExe = Join-Path $UvDir "uv.exe"
$PythonVersionsDir = Join-Path $PythonDir "versions"
$UvCache = Join-Path $CacheDir "uv"

function Ensure-Dir($Path) {
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

Ensure-Dir $VscodeDir
Ensure-Dir $CacheDir
Ensure-Dir $ProjectsDir
Ensure-Dir $PythonDir
Ensure-Dir $UvDir
Ensure-Dir $PythonVersionsDir
Ensure-Dir $UvCache

Write-Host "== PyDevCatalog Setup ==" -ForegroundColor Cyan
Write-Host "Root: $Root"

# 1. Download and extract ZIP version of VS Code if missing.
if (-not (Test-Path $VscodeExe)) {
    Write-Host "[1/5] VS Code ZIP版をダウンロードしています..." -ForegroundColor Yellow
    $ZipUrl = "https://update.code.visualstudio.com/latest/win32-x64-archive/stable"
    $ZipPath = Join-Path $CacheDir "vscode-win32-x64-latest.zip"
    $TempExtract = Join-Path $CacheDir "vscode-extract"
    if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }
    if (Test-Path $TempExtract) { Remove-Item $TempExtract -Recurse -Force }
    Ensure-Dir $TempExtract
    Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath
    Write-Host "[1/5] VS Codeを展開しています..."
    Expand-Archive -Path $ZipPath -DestinationPath $TempExtract -Force
    Get-ChildItem -Path $TempExtract | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination $VscodeDir -Recurse -Force
    }
    Remove-Item $TempExtract -Recurse -Force
} else {
    Write-Host "[1/5] VS Codeは既に存在します。"
}

# Enable VS Code portable mode.
Ensure-Dir $VscodeData

# 2. Install uv locally if missing.
if (-not (Test-Path $UvExe)) {
    Write-Host "[2/5] uvをローカルにインストールしています..." -ForegroundColor Yellow
    $env:UV_INSTALL_DIR = $UvDir
    $env:UV_NO_MODIFY_PATH = "1"
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
} else {
    Write-Host "[2/5] uvは既に存在します。"
}

if (-not (Test-Path $UvExe)) {
    throw "uv.exe が見つかりません: $UvExe"
}

# Keep uv-managed Python and cache inside this portable folder as much as possible.
$env:UV_PYTHON_INSTALL_DIR = $PythonVersionsDir
$env:UV_CACHE_DIR = $UvCache

# 3. Install Python runtime using uv.
Write-Host "[3/5] Python 3.12を確認/導入しています..." -ForegroundColor Yellow
& $UvExe python install 3.12

# 4. Create sample project.
$HelloDir = Join-Path $ProjectsDir "hello-python"
Ensure-Dir $HelloDir
Ensure-Dir (Join-Path $HelloDir ".vscode")

$MainPy = Join-Path $HelloDir "main.py"
if (-not (Test-Path $MainPy)) {
@'
print("こんにちは、PyDevCatalog!")
print("このVS CodeはZIP版ポータブル構成で起動しています。")
'@ | Set-Content -Path $MainPy -Encoding UTF8
}

$PyProject = Join-Path $HelloDir "pyproject.toml"
if (-not (Test-Path $PyProject)) {
@'
[project]
name = "hello-python"
version = "0.1.0"
description = "PyDevCatalog sample project"
requires-python = ">=3.12"
dependencies = []
'@ | Set-Content -Path $PyProject -Encoding UTF8
}

$SettingsJson = Join-Path $HelloDir ".vscode\settings.json"
@'
{
  "python.defaultInterpreterPath": "${workspaceFolder}\\.venv\\Scripts\\python.exe",
  "python.terminal.activateEnvironment": true,
  "editor.formatOnSave": true,
  "python.analysis.typeCheckingMode": "basic"
}
'@ | Set-Content -Path $SettingsJson -Encoding UTF8

# Create virtual environment for the sample project.
$VenvPython = Join-Path $HelloDir ".venv\Scripts\python.exe"
if (-not (Test-Path $VenvPython)) {
    Write-Host "[4/5] サンプルプロジェクト用 .venv を作成しています..." -ForegroundColor Yellow
    & $UvExe venv (Join-Path $HelloDir ".venv") --python 3.12
} else {
    Write-Host "[4/5] サンプルプロジェクト用 .venv は既に存在します。"
}

# 5. Install recommended VS Code extensions.
$CodeCmd = Join-Path $VscodeDir "bin\code.cmd"
if (Test-Path $CodeCmd) {
    Write-Host "[5/5] 推奨VS Code拡張機能を確認/導入しています..." -ForegroundColor Yellow
    $Extensions = @(
        "ms-ceintl.vscode-language-pack-ja",
        "ms-python.python",
        "ms-python.vscode-pylance",
        "ms-python.debugpy",
        "charliermarsh.ruff"
    )
    foreach ($Ext in $Extensions) {
        try {
            & $CodeCmd --install-extension $Ext --force | Out-Host
        } catch {
            Write-Warning "拡張機能 $Ext の導入に失敗しました。VS Code起動後に手動導入できます。"
        }
    }
} else {
    Write-Warning "code.cmd が見つかりません。拡張機能の自動導入をスキップします。"
}

Write-Host "セットアップ完了。VS Codeを起動します。" -ForegroundColor Green
