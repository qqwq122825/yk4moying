# 一键重建 com.lite.cloudfinder（Windows 版；与 build.sh 行为一致）
#
#   powershell -ExecutionPolicy Bypass -File .\build.ps1
#   powershell -ExecutionPolicy Bypass -File .\build.ps1 -Verify
#   $env:SKIP_SIGN=1; .\build.ps1
#
# 相对旧脚本的修复点：
#   1. java / python 不再写死路径（旧脚本把 python 钉在 D:\ai\DSH Desktop\...）；
#   2. 构建失败立即退出，不留半成品；
#   3. 新增产物健全性闸门：尺寸 / dex / 原生库 / arsc / 清单，10KB 空壳会被直接拦下；
#   4. -Verify 打开原始包 vs 重建包的等价比对。
param(
    [switch]$Verify
)
$ErrorActionPreference = 'Stop'
$BASE = $PSScriptRoot
$PROJECT = Join-Path $BASE 'project'
$TOOLS = Join-Path $BASE 'tools'
$OUT_DIR = Join-Path $BASE 'build'
$UNSIGNED = Join-Path $OUT_DIR 'cloudfinder-unsigned.apk'
$SIGNED_DIR = Join-Path $OUT_DIR 'signed'
$REFERENCE = Join-Path $BASE 'reference\a0dcf711.apk'
$APKTOOL = Join-Path $TOOLS 'apktool.jar'
$SIGNER = Join-Path $TOOLS 'uber-apk-signer.jar'

# ---------------------------------------------------------------- java 发现
function Find-Java {
    $cands = @()
    $cands += Get-ChildItem -Path $TOOLS -Filter 'java.exe' -Recurse -ErrorAction SilentlyContinue |
              ForEach-Object { $_.FullName }
    if ($env:JAVA_HOME) { $cands += (Join-Path $env:JAVA_HOME 'bin\java.exe') }
    foreach ($root in @($env:ProgramFiles, ${env:ProgramFiles(x86)}, 'C:\Java', 'D:\Tools')) {
        if ($root -and (Test-Path $root)) {
            $cands += (Get-ChildItem -Path $root -Filter 'java.exe' -Recurse -ErrorAction SilentlyContinue |
                       Where-Object { $_.FullName -match 'jdk|jre|Java' } | ForEach-Object { $_.FullName })
        }
    }
    $onPath = (Get-Command java -ErrorAction SilentlyContinue)
    if ($onPath) { $cands += $onPath.Source }
    foreach ($c in $cands) {
        if ($c -and (Test-Path $c)) {
            $out = & $c -version 2>&1
            if ($LASTEXITCODE -eq 0) { return $c }
        }
    }
    return $null
}

function Find-Python {
    foreach ($c in @('python', 'py', 'python3')) {
        $p = Get-Command $c -ErrorAction SilentlyContinue
        if ($p) { return $p.Source }
    }
    return $null
}

$JAVA = Find-Java
if (-not $JAVA) {
    throw "缺少 Java 运行时（JRE 17）。可把 Temurin 17 解压到 tools\ 下，或安装 https://adoptium.net/temurin/releases/?version=17"
}
if (-not (Test-Path (Join-Path $PROJECT 'apktool.yml'))) { throw "工程不完整：缺 $PROJECT\apktool.yml" }
if (-not (Test-Path $APKTOOL)) { throw "缺 apktool：$APKTOOL" }

# ---------------------------------------------------------------- 产物闸门
function Test-Apk([string]$Path) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $map = @{}
        $raw = 0
        foreach ($e in $zip.Entries) { $map[$e.FullName] = $e.Length; $raw += $e.Length }
    } finally { $zip.Dispose() }

    $errs = @()
    if ($raw -lt 3MB) { $errs += ("解压后总体积 {0} 字节 < 3MB（空壳/半成品）" -f $raw) }
    if (-not $map.ContainsKey('classes.dex')) { $errs += '缺 classes.dex' }
    elseif ($map['classes.dex'] -lt 1MB) { $errs += ("classes.dex 只有 {0} 字节" -f $map['classes.dex']) }
    if (-not $map.ContainsKey('resources.arsc')) { $errs += '缺 resources.arsc' }
    elseif ($map['resources.arsc'] -lt 100KB) { $errs += ("resources.arsc 只有 {0} 字节" -f $map['resources.arsc']) }
    if (-not $map.ContainsKey('AndroidManifest.xml')) { $errs += '缺 AndroidManifest.xml' }
    $so = @($map.Keys | Where-Object { $_ -like 'lib/*.so' })
    if ($so.Count -lt 4) { $errs += ("原生库只有 {0} 个" -f $so.Count) }

    Write-Host ("  条目 {0} / 解压 {1:N1} MB / dex {2:N1} MB / arsc {3:N2} MB / so {4}" -f `
        $map.Count, ($raw / 1MB), ($map['classes.dex'] / 1MB), ($map['resources.arsc'] / 1MB), $so.Count)
    if ($errs.Count -gt 0) {
        $errs | ForEach-Object { Write-Host "  [FAIL] $_" -ForegroundColor Red }
        return $false
    }
    Write-Host '  [OK] 产物健全性检查通过' -ForegroundColor Green
    return $true
}

function Clear-Partial {
    Remove-Item -Force $UNSIGNED -ErrorAction SilentlyContinue
    if (Test-Path $SIGNED_DIR) { Get-ChildItem $SIGNED_DIR -Filter '*.apk' | Remove-Item -Force -ErrorAction SilentlyContinue }
}

New-Item -ItemType Directory -Force -Path $OUT_DIR, $SIGNED_DIR | Out-Null
Clear-Partial

Write-Host '[1/3] apktool b：smali + res -> APK' -ForegroundColor Cyan
& $JAVA -jar $APKTOOL b -f -o $UNSIGNED $PROJECT
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $UNSIGNED)) {
    Clear-Partial
    throw '构建失败：apktool 未产出 APK'
}
Write-Host ('  未签名: {0:N1} MB' -f ((Get-Item $UNSIGNED).Length / 1MB))
if (-not (Test-Apk $UNSIGNED)) { Clear-Partial; throw '产物不成型，已在签名前中止' }

if ($env:SKIP_SIGN -eq '1') { Write-Host 'SKIP_SIGN=1，跳过签名'; exit 0 }

Write-Host '[2/3] uber-apk-signer：zipalign + v1/v2/v3 签名' -ForegroundColor Cyan
& $JAVA -jar $SIGNER -a $UNSIGNED --out $SIGNED_DIR
if ($LASTEXITCODE -ne 0) { throw '签名失败' }
$SIGNED = Get-ChildItem $SIGNED_DIR -Filter '*.apk' | Sort-Object LastWriteTime | Select-Object -Last 1
if (-not $SIGNED) { throw '签名失败：没有产出 apk' }
Write-Host ('  已签名: {0:N1} MB' -f ($SIGNED.Length / 1MB))
if (-not (Test-Apk $SIGNED.FullName)) { throw '签名产物不成型' }

if ($Verify) {
    Write-Host '[3/3] 等价比对（原始包 vs 重建包）' -ForegroundColor Cyan
    $PY = Find-Python
    if ($PY -and (Test-Path $REFERENCE)) {
        & $PY (Join-Path $BASE 'analysis\scripts\verify_rebuild.py') $REFERENCE $SIGNED.FullName | Select-Object -Last 8
    } else {
        Write-Host '  跳过：缺 python 或 reference\a0dcf711.apk'
    }
} else {
    Write-Host '[3/3] 跳过等价比对（-Verify 开启）'
}

Write-Host ''
Write-Host ('DONE  ' + $SIGNED.FullName) -ForegroundColor Green
Write-Host ('SHA256 ' + (Get-FileHash $SIGNED.FullName -Algorithm SHA256).Hash)
