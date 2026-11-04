#!/usr/bin/env bash
# 把现成的模板 APK 解成 apktool 源码工程（服务器"源码构建"用）。
# 用法： bash tools/make_src_project.sh <模板apk> <输出目录>
set -euo pipefail
APK="${1:?模板 apk 路径}"
OUT="${2:?输出目录，例如 materials/src/v3.5}"
JAR="$(dirname "$0")/apktool.jar"
[ -f "$JAR" ] || { echo "缺 apktool.jar: $JAR" >&2; exit 1; }
mkdir -p "$(dirname "$OUT")"
rm -rf "$OUT"
java -jar "$JAR" d -f -o "$OUT" "$APK"
echo "已生成源码工程：$OUT"
du -sh "$OUT"
