#!/bin/bash
# 安全重启 refc2：等端口释放 → 停旧进程 → 起新进程 → 轮询确认监听（最多重试 3 次）
# 用法：bash server/restart.sh [port]
set -u
cd "$(dirname "$0")/.." || exit 1
PORT="${1:-8794}"
LOG="logs/refc2.out"
mkdir -p logs

port_busy() { ss -ltn 2>/dev/null | grep -q ":$PORT "; }

# 1) 停旧进程并等端口释放
for p in $(pgrep -f "venv/bin/python server/refc2.py" || true); do kill "$p" 2>/dev/null || true; done
for i in $(seq 1 30); do port_busy || break; sleep 1; done
if port_busy; then
  echo "[restart] 端口 $PORT 仍被占用，强制结束"
  for p in $(pgrep -f "venv/bin/python server/refc2.py" || true); do kill -9 "$p" 2>/dev/null || true; done
  sleep 2
fi

# 2) 最多重试 3 次启动
for try in 1 2 3; do
  setsid --fork ./venv/bin/python server/refc2.py --host 127.0.0.1 --port "$PORT" > "$LOG" 2>&1 < /dev/null
  for i in $(seq 1 15); do
    sleep 1
    if port_busy; then
      echo "[restart] OK 第 $try 次启动成功，pid=$(pgrep -f "server/refc2.py --host" | head -1) port=$PORT"
      exit 0
    fi
  done
  echo "[restart] 第 $try 次启动失败，查看 $LOG："
  tail -5 "$LOG" | tr -d '\000'
  sleep 2
done

echo "[restart] 三次都失败，请人工检查 $LOG"
exit 1
