#!/bin/bash
# 新建一个版本源码目录（从已有版本复制，源码级分叉）
#   用法：tools/new_version.sh 3.6 3.5     # 从 3.5 复制出 3.6
#         tools/new_version.sh 3.6         # 默认从最新的 3.5 复制
set -e
NEW="${1:?用法: new_version.sh <新版本> [基准版本]}"
BASE="${2:-3.5}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/apk-project/versions/$BASE-src"
DST="$ROOT/apk-project/versions/$NEW-src"
[ -d "$SRC" ] || { echo "基准不存在: $SRC"; exit 1; }
[ -e "$DST" ] && { echo "目标已存在: $DST"; exit 1; }
rsync -a --exclude 'build/' --exclude '.gradle/' "$SRC/" "$DST/"
# versionName / versionCode 默认值改成新版本
VC=$(( $(echo "$NEW" | awk -F. '{print $1*100+$2}') ))
sed -i '' -E "s/prop\(\"versionName\", \"[0-9.]+\"\)/prop(\"versionName\", \"$NEW\")/" "$DST/app/build.gradle.kts"
sed -i '' -E "s/prop\(\"versionCode\", \"[0-9]+\"\)/prop(\"versionCode\", \"$VC\")/" "$DST/app/build.gradle.kts"
echo "已创建 $DST （versionName=$NEW versionCode=$VC）"
echo "构建： gradle -p apk-project/versions/$NEW-src assembleRelease"
