#!/usr/bin/env bash
# 编译 A 包基座（installer-1.3.1）：Gradle assembleDebug → 签名 → 校验
#
#   ./build-installer.sh                 # 用工程里的默认参数编一次
#   APP_ID=org.boundarylab.installer VERSION_NAME=1.3.1 VERSION_CODE=5 ./build-installer.sh
#
# 需要：JDK 17（tools/jdk-*）+ Gradle 8.11.1（tools/gradle-8.11.1）+ Android SDK（ANDROID_HOME）
# 产物：installer-1.3.1/app/build/outputs/apk/debug/app-debug.apk
#       → build/installer-1.3.1-base.apk（已签名）
set -euo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$BASE/installer-1.3.1"
OUT_DIR="$BASE/build"
APP_ID="${APP_ID:-org.boundarylab.installer}"
VERSION_NAME="${VERSION_NAME:-1.3.1}"
VERSION_CODE="${VERSION_CODE:-5}"

# ---- 工具链
find_java_home() {
  local c
  # JDK 优先（要 javac 编译器）：环境变量 → tools/jdk-*；tools 里的纯 JRE 只做兜底
  for c in "${JAVA_HOME:-}" "$BASE"/tools/jdk-*/Contents/Home "$BASE"/tools/jdk-*; do
    [[ -n "$c" && -x "$c/bin/java" ]] && { echo "$c"; return 0; }
  done
  command -v java >/dev/null 2>&1 && { dirname "$(dirname "$(command -v java)")"; return 0; }
  return 1
}
JAVA_HOME="$(find_java_home)" || { echo "缺 JDK 17" >&2; exit 2; }
export JAVA_HOME

GRADLE="${GRADLE:-$BASE/tools/gradle-8.11.1/bin/gradle}"
[[ -x "$GRADLE" ]] || { echo "缺 Gradle：$GRADLE" >&2; exit 2; }

ANDROID_HOME="${ANDROID_HOME:-$BASE/tools/android-sdk}"
export ANDROID_HOME ANDROID_SDK_ROOT="$ANDROID_HOME"
[[ -f "$ANDROID_HOME/platforms/android-35/android.jar" ]] || {
  echo "缺 Android SDK platform-35：$ANDROID_HOME" >&2; exit 2
}

[[ -f "$SRC/app/build.gradle.kts" ]] || { echo "缺 A 包工程：$SRC" >&2; exit 2; }

echo "[1/3] gradle :app:assembleDebug"
"$GRADLE" -p "$SRC" --no-daemon --console=plain :app:assembleDebug \
  -PappId="$APP_ID" -PversionName="$VERSION_NAME" -PversionCode="$VERSION_CODE"

APK="$SRC/app/build/outputs/apk/debug/app-debug.apk"
[[ -f "$APK" ]] || { echo "Gradle 没产出 APK" >&2; exit 1; }
ls -lh "$APK" | awk '{print "  未签名: "$5}'

echo "[2/3] 签名（v1/v2/v3）"
mkdir -p "$OUT_DIR"
SIGNER="$BASE/tools/uber-apk-signer.jar"
[[ -f "$SIGNER" ]] || { echo "缺 uber-apk-signer.jar" >&2; exit 2; }
# uber-apk-signer 对"已签名"的包会返回非 0（1 errors），这里不当失败
if ! "$JAVA_HOME/bin/java" -jar "$SIGNER" -a "$APK" --out "$OUT_DIR/installer-signed"; then
  echo "  （签名器跳过已签名的包）"
fi

SIGNED="$(ls -t "$OUT_DIR"/installer-signed/*.apk 2>/dev/null | head -1 || true)"
if [[ -z "$SIGNED" ]]; then
  # Gradle assembleDebug 已用 debug keystore 签过名，uber-apk-signer 会直接 SKIP；
  # 这种情况沿用 Gradle 的签名（后续 apktool 反编译 → 我们的构建链会重新签）。
  echo "  （uber-apk-signer 跳过：Gradle 已用 debug keystore 签名，沿用）"
  SIGNED="$APK"
fi
cp -f "$SIGNED" "$OUT_DIR/installer-1.3.1-base.apk"

echo "[3/3] 校验"
python3 - "$OUT_DIR/installer-1.3.1-base.apk" <<'PY'
import sys, zipfile, os
p = sys.argv[1]
z = zipfile.ZipFile(p)
info = {i.filename: i.file_size for i in z.infolist()}
need = ['AndroidManifest.xml', 'classes.dex', 'resources.arsc', 'assets/installer_config.json']
miss = [n for n in need if n not in info]
print('  条目 %d / 大小 %.2f MB' % (len(info), os.path.getsize(p) / 1048576))
dex_total = sum(v for k, v in info.items() if k.endswith('.dex'))
print('  dex %d B（%d 个） / arsc %d B' % (dex_total, sum(1 for k in info if k.endswith('.dex')),
                                          info.get('resources.arsc', 0)))
print('  配置 %d B' % info.get('assets/installer_config.json', 0))
if miss:
    print('  [FAIL] 缺', miss); sys.exit(1)
if dex_total < 20000:
    print('  [FAIL] dex 太小'); sys.exit(1)
print('  [OK] A 包基座成型')
PY

echo
echo "DONE  $OUT_DIR/installer-1.3.1-base.apk"
echo "SHA256 $(shasum -a 256 "$OUT_DIR/installer-1.3.1-base.apk" | awk '{print $1}')"
