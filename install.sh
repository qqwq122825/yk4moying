#!/usr/bin/env bash
# ============================================================
#  一键安装脚本 —— Ubuntu 服务器 (20.04 / 22.04 / 24.04)
#  用法：
#    sudo bash install.sh                 # 默认端口 8793，自动开 HTTPS
#    sudo bash install.sh --port=9000     # 指定端口
#    sudo bash install.sh --no-https      # 不使用 HTTPS
#    sudo bash install.sh --pass=你的口令  # 指定管理员口令（默认随机生成）
# ============================================================
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${APP_DIR}/venv"
CERT_DIR="${APP_DIR}/certs"
SERVICE_NAME="device-suite"

HOST="${HOST:-0.0.0.0}"
PORT="${PORT:-8793}"
ADMIN_USER="admin"
ADMIN_PASS=""
USE_HTTPS=1

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info() { echo -e "${GREEN}[安装]${NC} $*"; }
warn() { echo -e "${YELLOW}[提示]${NC} $*"; }
err()  { echo -e "${RED}[错误]${NC} $*" >&2; exit 1; }

# ---- 参数解析 ----
for arg in "$@"; do
  case "$arg" in
    --port=*)   PORT="${arg#*=}" ;;
    --pass=*)   ADMIN_PASS="${arg#*=}" ;;
    --no-https) USE_HTTPS=0 ;;
    -h|--help)
      echo "用法: sudo bash install.sh [--port=端口] [--pass=口令] [--no-https]"
      exit 0 ;;
    *) err "未知参数: $arg" ;;
  esac
done

[[ "$EUID" -eq 0 ]] || err "请使用 root 运行：sudo bash install.sh"
info "项目目录：$APP_DIR"
info "监听：$HOST:$PORT"

# ---- 1. 系统依赖 ----
info "安装系统依赖 python3 / python3-pip / python3-venv / openssl / curl"
apt-get update -y
apt-get install -y python3 python3-pip python3-venv openssl curl

# ---- 2. 虚拟环境 + Python 依赖 ----
info "创建虚拟环境并安装 Python 依赖 (aiohttp / pycryptodome)"
if [[ ! -x "$VENV_DIR/bin/python" ]]; then
  python3 -m venv "$VENV_DIR"
fi
"$VENV_DIR/bin/pip" install --upgrade pip >/dev/null
"$VENV_DIR/bin/pip" install aiohttp pycryptodome

# ---- 3. 管理员口令 ----
if [[ -z "$ADMIN_PASS" ]]; then
  if [[ -f "$APP_DIR/.env" ]]; then
    ADMIN_PASS="$(grep -m1 '^REFC2_PASS=' "$APP_DIR/.env" | cut -d= -f2- | tr -d '"'"'"' '[:space:]')"
  fi
fi
if [[ -z "$ADMIN_PASS" ]]; then
  ADMIN_PASS="$(head -c 16 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | head -c 16)"
fi
[[ -n "$ADMIN_PASS" ]] || err "口令生成失败"
info "管理员账号：$ADMIN_USER"

# ---- 4. 写入 .env（记录配置，便于后续查看）----
cat > "$APP_DIR/.env" <<EOF
REFC2_PASS=$ADMIN_PASS
REFC2_USER=$ADMIN_USER
REF_HOST=$HOST
REF_PORT=$PORT
EOF
chmod 600 "$APP_DIR/.env"

# ---- 5. HTTPS 证书 ----
EXEC_CMD="$VENV_DIR/bin/python server/refc2.py --host $HOST --port $PORT"
if [[ "$USE_HTTPS" == "1" ]]; then
  mkdir -p "$CERT_DIR"
  if [[ ! -f "$CERT_DIR/cert.pem" || ! -f "$CERT_DIR/key.pem" ]]; then
    info "生成自签证书（有效期 10 年）"
    openssl req -x509 -newkey rsa:2048 -nodes \
      -keyout "$CERT_DIR/key.pem" -out "$CERT_DIR/cert.pem" \
      -days 3650 -subj "/CN=localhost" >/dev/null 2>&1
  fi
  EXEC_CMD="$EXEC_CMD --tls-cert $CERT_DIR/cert.pem --tls-key $CERT_DIR/key.pem"
  info "已启用 HTTPS（自签证书，浏览器首次访问需点「继续访问」）"
else
  warn "已禁用 HTTPS：部分面板的实时通道依赖 HTTPS，正式使用建议开启"
fi

# ---- 6. systemd 服务 ----
info "写入 systemd 服务 $SERVICE_NAME"
cat > "/etc/systemd/system/$SERVICE_NAME.service" <<EOF
[Unit]
Description=Device Suite Server
After=network.target

[Service]
Type=simple
WorkingDirectory=$APP_DIR
Environment=REFC2_USER=$ADMIN_USER
Environment=REFC2_PASS=$ADMIN_PASS
ExecStart=$EXEC_CMD
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable "$SERVICE_NAME" >/dev/null 2>&1
systemctl restart "$SERVICE_NAME"

# ---- 7. 健康检查 ----
sleep 2
SCHEME="http"; [[ "$USE_HTTPS" == "1" ]] && SCHEME="https"
if curl -sk "$SCHEME://127.0.0.1:$PORT/api/health" 2>/dev/null | grep -q '"ok"'; then
  info "服务已启动并通过健康检查"
else
  warn "健康检查未通过，可执行：journalctl -u $SERVICE_NAME -n 50 查看日志"
fi

# ---- 8. 输出访问信息 ----
echo
echo "=========================================================="
echo "  安装完成"
echo "  主控制台：  $SCHEME://<服务器IP>:$PORT/panel/"
echo "  运营面板：  $SCHEME://<服务器IP>:$PORT/"
echo "  账号：      $ADMIN_USER"
echo "  密码：      $ADMIN_PASS"
echo "----------------------------------------------------------"
echo "  查看日志：  journalctl -u $SERVICE_NAME -f"
echo "  停止服务：  systemctl stop $SERVICE_NAME"
echo "  重启服务：  systemctl restart $SERVICE_NAME"
echo "  卸载服务：  systemctl disable --now $SERVICE_NAME"
echo "=========================================================="
