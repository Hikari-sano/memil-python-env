$ErrorActionPreference = "Continue"
Write-Host "Checking FFmpeg..."
$ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue
if ($ffmpeg) { Write-Host "FFmpeg is already available: $($ffmpeg.Source)"; ffmpeg -version; exit 0 }
Write-Host "FFmpeg was not found. Trying winget package id: Gyan.FFmpeg"
$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) { Write-Host "winget was not found. Please install FFmpeg manually."; exit 1 }
winget install -e --id Gyan.FFmpeg --accept-package-agreements --accept-source-agreements
Write-Host "If ffmpeg is not visible yet, open a new terminal and run: ffmpeg -version"
