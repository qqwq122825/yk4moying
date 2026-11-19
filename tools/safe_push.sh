#!/usr/bin/env bash
# 多 AI 协作安全推送：先对齐远端 → 只提交指定路径 → 跑自检 → 冲突则中止
#   bash tools/safe_push.sh "提交信息" path1 path2 ...
set -euo pipefail
MSG="${1:?用法: safe_push.sh \"提交信息\" 路径...}"; shift
cd "$(dirname "$0")/.."

echo "== 1/5 拉取远端"
git fetch -q origin
LOCAL=$(git rev-parse HEAD); REMOTE=$(git rev-parse origin/main)
if [ "$LOCAL" != "$REMOTE" ]; then
  if git merge-base --is-ancestor "$LOCAL" "$REMOTE"; then
    echo "   远端有新提交，快进合并"; git merge --ff-only -q origin/main
  elif git merge-base --is-ancestor "$REMOTE" "$LOCAL"; then
    echo "   本地领先，可推送"
  else
    echo "   !! 分支已分叉，先手动 rebase：git rebase origin/main"; exit 2
  fi
fi

echo "== 2/5 暂存指定路径"
git add -- "$@"

echo "== 3/5 冲突与冲突标记检查"
if git diff --cached --name-only | grep -qE '^(state/(refc2\.db|store\.json))$'; then
  echo "   !! 暂存了运行态数据库（别的 AI/面板会同时写），确认要提交再手动 git commit"
  exit 3
fi
if git diff --cached | grep -nE '^(<<<<<<<|=======$|>>>>>>>)' >/dev/null; then
  echo "   !! 暂存区存在冲突标记，已中止"; exit 4
fi

echo "== 4/5 自检"
python3 selftests/test_uninstall_shield_surface.py | tail -1
python3 selftests/test_keyword_fallback_surface.py | tail -1
python3 selftests/test_v4_startup_surface.py | tail -1

echo "== 5/5 提交并推送"
git commit -q -m "$MSG"
git push -q origin HEAD:main
git fetch -q origin
echo "   完成：$(git rev-parse --short HEAD) / 远端 $(git rev-parse --short origin/main)"
