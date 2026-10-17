#!/usr/bin/env bash
# 一键重建 com.lite.cloudfinder（apktool 工程 -> 可安装 APK -> 等价校验）
#
#   ./build.sh              # 构建 + 签名 + 产物健全性检查
#   ./build.sh --verify     # 额外跑原始包 vs 重建包的等价比对
#   SKIP_SIGN=1 ./build.sh  # 只要 unsigned
#   PROJECT_DIR=/path/to/apktool_out ./build.sh   # 编别的 apktool 工程
#
# 设计要点（对应"每次构建只有 10KB"的坑）：
#   1. 构建失败立刻退出，绝不把半成品当结果；
#   2. 产物必须通过尺寸 / dex / 原生库 / 资源表 / 清单 五项检查；
#   3. 任何一步失败都会删掉本次半成品，避免旧的小包被误当新包。
set -euo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="${PROJECT_DIR:-$BASE/project}"   # 可用 PROJECT_DIR 指向别的 apktool 工程
TOOLS="$BASE/tools"
OUT_DIR="$BASE/build"
UNSIGNED="$OUT_DIR/cloudfinder-unsigned.apk"
SIGNED_DIR="$OUT_DIR/signed"
REFERENCE="$BASE/reference/a0dcf711.apk"
APKTOOL="$TOOLS/apktool.jar"
SIGNER="$TOOLS/uber-apk-signer.jar"
DO_VERIFY=0
[[ "${1:-}" == "--verify" ]] && DO_VERIFY=1

# ---------------------------------------------------------------- java 发现
find_java() {
  local cand
  for cand in \
    "$BASE/tools"/jdk-*/Contents/Home/bin/java \
    "$BASE/tools"/jdk-*/bin/java \
    "${JAVA_HOME:-}/bin/java" \
    "$HOME/Library/Java/JavaVirtualMachines"/*/Contents/Home/bin/java \
    /opt/homebrew/opt/openjdk@17/bin/java \
    /usr/local/opt/openjdk@17/bin/java ; do
    [[ -x "$cand" ]] && { echo "$cand"; return 0; }
  done
  local on_path
  on_path="$(command -v java || true)"
  if [[ -n "$on_path" ]] && "$on_path" -version >/dev/null 2>&1; then
    echo "$on_path"; return 0
  fi
  return 1
}

JAVA="$(find_java || true)"
if [[ -z "$JAVA" ]]; then
  cat >&2 <<'EOF'
缺少 Java 运行时（apktool / 签名器都要用 JRE 17）。
  macOS 最快做法：
    curl -L -o /tmp/jre17.tar.gz https://mirrors.tuna.tsinghua.edu.cn/Adoptium/17/jre/aarch64/mac/OpenJDK17U-jre_aarch64_mac_hotspot_17.0.20.1_1.tar.gz
    tar xzf /tmp/jre17.tar.gz -C tools/
  或 brew install openjdk@17
EOF
  exit 2
fi
export JAVA_HOME="$(cd "$(dirname "$JAVA")/.." && pwd)"
export PATH="$(dirname "$JAVA"):$PATH"

[[ -f "$PROJECT/apktool.yml" ]] || { echo "工程不完整：缺 $PROJECT/apktool.yml" >&2; exit 2; }
[[ -f "$APKTOOL" ]]           || { echo "缺 apktool：$APKTOOL" >&2; exit 2; }

# ---------------------------------------------------------------- 产物闸门
check_apk() {
  python3 - "$1" <<'PY'
import sys, zipfile
p = sys.argv[1]
need_min = 3 * 1024 * 1024          # 真包 9MB+ ; 10KB 空壳在这里被拦下
errs = []
try:
    z = zipfile.ZipFile(p)
except Exception as e:
    print('  [FAIL] 不是合法 ZIP: %s' % e); sys.exit(1)
names = {i.filename: i.file_size for i in z.infolist()}
size = sum(names.values())
if size < need_min:
    errs.append('解压后总体积 %d 字节 < %d（典型的空壳/半成品 APK）' % (size, need_min))
dex = names.get('classes.dex', 0)
if dex < 1024 * 1024:
    errs.append('classes.dex 只有 %d 字节（真包 5.7MB+）' % dex)
if 'resources.arsc' not in names:
    errs.append('缺 resources.arsc')
if names.get('resources.arsc', 0) < 100 * 1024:
    errs.append('resources.arsc 只有 %d 字节' % names.get('resources.arsc', 0))
if 'AndroidManifest.xml' not in names:
    errs.append('缺 AndroidManifest.xml')
libs = [n for n in names if n.startswith('lib/') and n.endswith('.so')]
if len(libs) < 4:
    errs.append('原生库只有 %d 个（应含 arm64-v8a / armeabi-v7a 的 libadb.so、libnative-guard.so）' % len(libs))
print('  条目 %d / 解压 %.1f MB / dex %.1f MB / arsc %.2f MB / so %d' %
      (len(names), size / 1048576, dex / 1048576, names.get('resources.arsc', 0) / 1048576, len(libs)))
if errs:
    for e in errs: print('  [FAIL] ' + e)
    sys.exit(1)
print('  [OK] 产物健全性检查通过')
PY
}

cleanup_partial() { rm -f "$UNSIGNED" "$SIGNED_DIR"/*.apk 2>/dev/null || true; }

mkdir -p "$OUT_DIR" "$SIGNED_DIR"
cleanup_partial

echo "[1/3] apktool b：smali + res -> APK"
if ! "$JAVA" -jar "$APKTOOL" b -f -o "$UNSIGNED" "$PROJECT"; then
  cleanup_partial
  echo "构建失败：apktool 未产出 APK" >&2
  exit 1
fi
[[ -f "$UNSIGNED" ]] || { echo "构建失败：apktool 报告成功但没有输出文件" >&2; exit 1; }
ls -lh "$UNSIGNED" | awk '{print "  未签名: "$5}'
check_apk "$UNSIGNED"

if [[ "${SKIP_SIGN:-0}" == "1" ]]; then
  echo "SKIP_SIGN=1，跳过签名"; exit 0
fi

echo "[2/3] uber-apk-signer：zipalign + v1/v2/v3 签名"
if ! "$JAVA" -jar "$SIGNER" -a "$UNSIGNED" --out "$SIGNED_DIR"; then
  echo "签名失败" >&2; exit 1
fi
SIGNED="$(ls -t "$SIGNED_DIR"/*.apk 2>/dev/null | head -1)"
[[ -n "$SIGNED" ]] || { echo "签名失败：没有产出 apk" >&2; exit 1; }
ls -lh "$SIGNED" | awk '{print "  已签名: "$5}'
check_apk "$SIGNED"

if [[ "$DO_VERIFY" == "1" ]]; then
  echo "[3/3] 等价比对（原始包 vs 重建包）"
  if [[ -f "$REFERENCE" ]]; then
    python3 "$BASE/analysis/scripts/verify_rebuild.py" "$REFERENCE" "$SIGNED" | tail -8
  else
    echo "  跳过：缺 reference/a0dcf711.apk"
  fi
else
  echo "[3/3] 跳过等价比对（加 --verify 开启，需要 reference/a0dcf711.apk）"
fi

echo
echo "DONE  $SIGNED"
echo "SHA256 $(shasum -a 256 "$SIGNED" | awk '{print $1}')"
