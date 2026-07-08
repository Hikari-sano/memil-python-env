$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$WinPythonDir = Join-Path $Root "winpython"
if (-not (Test-Path $WinPythonDir)) { New-Item -ItemType Directory -Path $WinPythonDir | Out-Null }
Write-Host "WinPython manual setup helper"
Write-Host "1. Download WinPython from https://winpython.github.io/"
Write-Host "2. Extract it into: $WinPythonDir"
Write-Host "3. Expected: winpython\\WPy64-xxxx\\python\\python.exe"
Start-Process "https://winpython.github.io/"
Start-Process $WinPythonDir
