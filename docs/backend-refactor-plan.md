# 设备管理平台 · 后端重构方案（技术架构 / 选型 / 迁移路线）

> 本文只描述技术架构与工程实施，供接手方（人或 AI）直接落地使用。
> 面向的系统类型：**移动终端（Android）设备管理 / 远程协助平台**，
> 核心能力是「终端接入 → 实时通道 → 设备运维 → 模板/版本构建下发 → 权限与审计」。

---

## 1. 现状盘点

### 1.1 代码规模

| 层 | 实现 | 规模 | 说明 |
|---|---|---|---|
| API / 业务 | Python `aiohttp` 单体 | 9.3k 行 / 9 文件 | `refc2.py`（2.98k）+ `api_impl.py`（2.59k）为双核心 |
| 实时通道 | 单条 WebSocket | `ws_panel` 单函数 178 行 | 设备帧转发、控制指令、回执都在一个函数里 |
| 构建流水线 | 子进程调 `apktool` / `gradle` | 1.7k 行 | A 类（模板重打包）/ B 类（源码工程构建）两套 |
| 持久化 | SQLite + JSON 镜像双写 | 17 张表 | `state/store.json` 与 `refc2.db` 内容重叠 |
| 控制台前端 | 打包产物（无源码） | 15 MB dist | 无源码 → 任何 UI 改动都做不了 |
| 接口总量 | 106 个路由 | — | 含一批 `contract_only` 占位 |

### 1.2 主要技术债

```
① refc2.py 一个文件里混了：WS、静态资源、壁纸下发、注入模板、构建、审计
② 双写持久化（JSON + SQLite）→ 状态分叉，无法做事务与外键
③ 前端无源码 → UI 冻结，后端重构也无法释放价值
④ 构建任务在主进程内跑子进程 → 阻塞事件循环，失败难重试
⑤ 无容器化、无迁移脚本、无健康检查约定 → 部署靠 scp + 重启脚本
⑥ 全局单例（S[...]）+ 直接读文件 → 并发下不可测、不可单测
```

---

## 2. 目标架构

### 2.1 分层（Clean-ish / 端口适配）

```
┌──────────────────────────────────────────────────────────┐
│ Console UI（浏览器）         React 18 + TS + Vite         │
└───────────────┬──────────────────────────────────────────┘
                │ HTTPS /api/v1/*        WSS /ws/v1
┌───────────────▼──────────────────────────────────────────┐
│ Edge          Nginx（TLS、限流、静态托管、WS 升级）        │
└───────┬──────────────────────────────┬───────────────────┘
        │                              │
┌───────▼───────────┐        ┌─────────▼───────────────────┐
│ API 服务 (Python)  │        │ Realtime 服务 (Python)       │
│ FastAPI + Uvicorn │        │ FastAPI WS / 或 Go(可选)      │
│ 无状态，可水平扩展 │        │ 有状态，按 device 一致性哈希  │
└───────┬───────────┘        └─────────┬───────────────────┘
        │  Domain 层（纯 Python，无框架依赖）
┌───────▼───────────────────────────────▼──────────────────┐
│ Domain Services                                          │
│  auth / device / session / template / build / audit      │
└───────┬───────────────┬──────────────┬───────────────────┘
        │               │              │
┌───────▼──────┐ ┌──────▼─────┐ ┌──────▼──────────────────┐
│ PostgreSQL   │ │ Redis      │ │ Object Storage (MinIO)  │
│ 主数据+审计  │ │ 会话/在线/ │ │ 构建产物 / 截图 / 素材   │
│              │ │ 发布订阅/队列│ │                         │
└──────────────┘ └──────┬─────┘ └─────────────────────────┘
                        │
              ┌─────────▼──────────────────┐
              │ Worker（Arq / Celery）      │
              │ 构建任务 / 导出 / 清理       │
              └────────────────────────────┘
```

### 2.2 工程目录（API 服务）

```
backend/
  app/
    main.py                 # FastAPI 装配
    core/                   # 配置、日志、错误、依赖注入
    domain/                 # 纯业务：实体 + 用例，不 import 框架
      device/  session/  auth/  template/  build/  audit/
    infra/                  # 适配器：repo / cache / storage / queue / ws
    api/v1/                 # HTTP 路由（薄，只做校验与编排）
    api/ws/                 # 实时通道
    workers/                # 后台任务入口
  migrations/               # Alembic
  tests/                    # unit / integration / contract
```

**规则**：`domain/` 不允许 import `fastapi`、`sqlalchemy`；`api/` 不允许写业务判断。

---

## 3. 技术选型

### 3.1 服务语言：Python vs PHP

| 维度 | **Python（FastAPI，推荐）** | PHP（Laravel / Swoole） |
|---|---|---|
| WS + 长连接 | 原生 async，`websockets`/`starlette` 直支持 | 传统 FPM 不适合；需 Swoole/RoadRunner 另起进程 |
| 后台任务 | Arq / Celery / RQ 成熟 | Laravel Queue + Supervisor，可用但生态偏 HTTP 场景 |
| 二进制/构建流水线 | `subprocess`、`zipfile`、`apktool`/`gradle` 编排顺手 | `Process` 组件可用，但进程管理弱 |
| 图像/截图处理 | Pillow / numpy 强 | GD/Imagick 够用，性能一般 |
| 团队与可读性 | 类型提示 + Pydantic 校验，AI 代码生成质量高 | 生态大，但 async 长连接是硬伤 |
| 现有代码迁移 | 同语言，可原地绞杀（strangler） | 需重写，迁移成本翻倍 |
| 结论 | **主选** | 仅当已有 PHP 团队时作为 B 方案 |

> 明确建议：**API / 实时通道 / Worker 全部 Python**，不要引入 PHP 造成双栈。

### 3.2 控制台 UI

| 方案 | 说明 | 适用 |
|---|---|---|
| **React 18 + TypeScript + Vite + Ant Design 5 + TanStack Query**（推荐） | 生态最全、表格/表单/虚拟列表成熟，AI 生成代码命中率高 | 设备墙、实时画面、构建中心等重交互 |
| Vue 3 + TS + Element Plus | 学习曲线低，团队国内背景多选 | 团队偏 Vue |
| Next.js | 需要 SSR/SEO 才考虑 | 本系统不需要 |

**关键点**：必须有源码工程（现状 15 MB dist 无源码是最大阻塞）。
图表用 `ECharts`（或 Recharts），实时画面用 `<canvas>` + WebSocket 二进制帧，虚拟滚动用 `@tanstack/virtual`。

### 3.3 其余组件

| 组件 | 选型 | 理由 |
|---|---|---|
| 主库 | **PostgreSQL 16** | 事务、JSONB、行级锁（构建队列）、分区（事件表） |
| 缓存/在线态 | **Redis 7** | 会话、设备在线 TTL、Pub/Sub 跨实例广播 |
| 队列 | **Arq**（轻）或 Celery（重） | 构建任务、批量导出 |
| 对象存储 | **MinIO**（自建 S3） | 构建产物、截图、模板素材 |
| 反向代理 | Nginx | TLS 终止、WS 升级、限流、静态 |
| 容器 | Docker Compose（单机）/ K8s（多机） | 构建镜像需 JDK、apktool、gradle，必须隔离 |
| 观测 | structlog + Prometheus + Grafana + Sentry | 统一 traceId 贯穿 API→WS→Worker |
| 迁移 | Alembic | 表结构版本化 |
| 测试 | pytest + httpx + testcontainers | 契约测试锁定终端协议 |

---

## 4. 数据模型（PostgreSQL）

```sql
-- 租户/账号（沿用三级：superadmin / operator / viewer）
users(id uuid pk, username citext unique, role text, parent_id uuid null,
      password_hash text, status text, created_at timestamptz, expire_at timestamptz null);

-- 终端（一台设备一行；device_uid = 客户端生成的稳定标识）
devices(id uuid pk, device_uid text unique, owner_id uuid references users(id),
        model text, os_version text, app_version text, abi text,
        online boolean, last_seen_at timestamptz, tags jsonb,
        state jsonb, created_at timestamptz);
create index on devices (owner_id, last_seen_at desc);
create index on devices using gin (tags);

-- 会话（远程控制/实时画面）
sessions(id uuid pk, device_id uuid, operator_id uuid,
         started_at timestamptz, ended_at timestamptz null, meta jsonb);

-- 事件（设备行为流水，按月分区）
events(id bigserial, device_id uuid, kind text, payload jsonb, at timestamptz)
  partition by range (at);

-- 模板（注入页/引导页等前端资源，按包名+国家归档）
templates(id uuid pk, package_name text, country text, kind text,
          object_key text, version int, enabled boolean, meta jsonb,
          unique(package_name, country, kind, version));

-- 构建任务
builds(id uuid pk, template_id uuid, kind text,              -- apk | source
       params jsonb, status text, progress int,
       artifact_key text, sha256 text, log_key text,
       created_by uuid, created_at timestamptz, finished_at timestamptz);
create index on builds (status, created_at desc);

-- 审计（所有写操作）
audit(id bigserial, actor_id uuid, action text, target text,
      detail jsonb, ip inet, at timestamptz);
```

要点：

```
· 事件表按 time 分区，30/90 天自动 detach 归档
· 构建产物只存 object_key，不进库
· 所有写操作走 audit()，与业务同事务
```

---

## 5. 接口契约

分三层，**终端协议冻结**是硬约束（客户端已发布，不能改）。

### 5.1 终端协议（`/api/v1/client/*`，向后兼容）

| 方法 | 路径 | 说明 |
|---|---|---|
| POST | `/client/register` | 首次注册，返回 device_uid 与配置 |
| POST | `/client/online` | 心跳/在线态（带版本、电量、状态） |
| POST | `/client/state` | 状态上报（JSON） |
| POST | `/client/frame` | 画面帧（二进制或 base64，按 Content-Type 区分） |
| POST | `/client/event` | 事件/日志上报（批量） |
| GET | `/client/config` | 拉配置与模板清单 |

**兼容策略**：老路径 1:1 保留（`/api/client/online` 等），内部转发到新 domain，
`Deprecation` 头提示，半年后下线。

### 5.2 控制台 API（`/api/v1/*`，JWT）

```
POST   /auth/login   /auth/refresh   /auth/logout
GET    /devices?status=&q=&page=      GET /devices/{id}
PATCH  /devices/{id}                  POST /devices/{id}/command
POST   /devices/{id}/session           # 申请实时会话，返回 ws_ticket
GET    /sessions/{id}/events
GET    /templates?country=&kind=      POST /templates
POST   /builds                        GET /builds/{id}   GET /builds/{id}/artifact
GET    /users   POST /users   PATCH /users/{id}
GET    /audit?actor=&from=&to=
```

约定：

```
· 统一响应 { ok: bool, data: T, error: {code, message} }
· 分页 cursor 优先（大表不要 offset）
· 所有写接口要求 Idempotency-Key
· 错误码枚举化，前端按 code i18n
```

### 5.3 实时通道（`WSS /ws/v1`）

```
连接：wss://host/ws/v1?ticket=<ws_ticket>     # ticket 由 /devices/{id}/session 换取，60s 有效
帧格式：opcode(1B) + flags(1B) + len(4B) + payload

opcode:
  0x01 HELLO        server→client   {serverTime, caps[]}
  0x02 AUTH_OK      server→client   {role, deviceId}
  0x10 INPUT        client→server   {type:tap|swipe|text|key, ...}
  0x11 FRAME        server→client   JPEG/WebP 二进制
  0x12 CMD          client→server   {action, params, cmdId}
  0x13 CMD_ACK      server→client   {cmdId, ok, err}
  0x20 PING/PONG    双向，15s
```

工程要点：

```
· 单设备同一时刻只允许一个 operator 持有控制权（Redis 分布式锁，30s 续期）
· 帧流做背压：服务端队列 > N 帧则丢旧帧（只保最新），不做无限缓冲
· 断线重连：ticket 一次性，重连重新申请；客户端指数退避
· 多实例：Redis Pub/Sub 按 device_id 广播，保证任意实例都能推送
```

---

## 6. 构建流水线

```
触发  POST /builds {template_id, kind, params}
  │
  ├─ 校验参数（包名/图标尺寸/文案长度/默认 URL 白名单）
  ├─ 落库 builds(status=queued) + 入队 Arq
  └─ 返回 build_id（前端轮询/WS 订阅进度）

Worker（独立容器，带 JDK17 + apktool + gradle + android-sdk）
  ├─ 拉模板到 /work/{build_id}/（MinIO 或 git）
  ├─ 参数注入（资源替换 / smali 或源码常量替换）
  ├─ 构建（apktool b + zipalign + apksigner，或 gradle assembleRelease）
  ├─ 产物：APK + sha256 + 构建日志 → MinIO
  └─ 更新 builds(status=succeeded)，失败则记录 stderr 尾部
```

要点：

```
· 每次构建独立工作目录 + 超时（默认 15 分钟）+ 资源上限（cgroup）
· 同一 template 串行（行级锁 SELECT ... FOR UPDATE SKIP LOCKED），不同 template 并行
· 产物与日志都进对象存储，库里只存 key，避免库膨胀
· 构建镜像版本固定（tag 带 JDK/apktool 版本），保证可复现
```

---

## 7. 部署拓扑

```
                     ┌──────────┐
   Internet ──TLS──▶ │  Nginx   │
                     └────┬─────┘
        /api → api:8000   │   /ws → ws:8001   / → console 静态
                     ┌────▼─────────────────────────────┐
                     │ Docker Compose（单机起步）        │
                     │  api ×2   ws ×1   worker ×2      │
                     │  postgres  redis  minio  nginx   │
                     └──────────────────────────────────┘

升级：镜像 tag 化 → compose pull && up -d（滚动重启 api，ws 摘流后重启）
备份：pg_dump 每日 + MinIO 增量；备份脚本与被备数据分离存放
```

---

## 8. 迁移路线（Strangler，5 期，可逐期上线）

| 期 | 内容 | 交付判据 | 人天 |
|---|---|---|---|
| P0 | 契约冻结：把 106 个接口整理成 OpenAPI + 终端协议样例 | 契约文档 + 录制回放用例 | 5 |
| P1 | 新骨架：FastAPI + PG + Alembic + Nginx + Docker，设备注册/在线/状态三接口 + 最小设备列表 | 真机可上线、控制台能看到设备 | 12 |
| P2 | 实时通道：ws_ticket、单控制权锁、帧转发、指令 ACK | 远程操作全程可用，断线可恢复 | 12 |
| P3 | 模板与构建：模板表 + 上传下发 + 构建队列 + 产物下载 | 能从控制台出一个包并下载 | 15 |
| P4 | 控制台 UI：设备墙/详情/实时画面/模板/构建/用户/审计 | 与旧面板功能对齐，可切换流量 | 18 |
| P5 | 数据迁移 + 旧服务下线：脚本搬 SQLite/JSON → PG，灰度切流，回滚演练 | 旧服务只读一周后关停 | 8 |
| 合计 | | | **≈ 70 人天** |

迁移技巧：

```
· Nginx 按路径灰度：/api/v1/* 走新，其余走旧；观察错误率再扩大
· 事件/审计双写一段时间，用行数和对账脚本校验一致性
· 出问题秒回滚：DNS/上游切回旧服务即可，新服务保持无状态
```

---

## 9. 质量与可观测性

```
日志    structlog JSON；全链路 traceId（API→WS→Worker 透传）
指标    RED（Rate/Error/Duration）+ 业务指标（在线设备数、构建成功率、帧延迟 P95）
追踪    OpenTelemetry（可选，先埋 traceId 就够）
健康    /healthz（进程存活）/ /readyz（DB+Redis 可用）
告警    构建失败率 >20%、WS 连接数跌 >50%、P95 帧延迟 >800ms
测试    单测覆盖率 domain ≥80%；契约测试锁定终端协议字段；构建用 golden APK 比对
```

---

## 10. 交接清单（给接手方）

```
① 本书（架构与选型）
② OpenAPI 规范（P0 产出）+ 终端协议样例请求/响应（每条 1 份真实抓包）
③ 现有数据库导出的脱敏样本（每表 ≤200 行）+ 表结构 DDL
④ 构建镜像的 Dockerfile（JDK/apktool/gradle 版本锁定）
⑤ 回归用例：设备上线 → 下发指令 → 实时画面 → 出包下载（端到端脚本）
⑥ 验收基线：接口数量、平均响应、构建时长、并发连接数
```

**不要做的事**

```
· 不要在两套系统之间共享数据库连接（会互相锁死，且无法独立回滚）
· 不要保留"JSON 文件 + 数据库双写"（新系统只用 PG，JSON 仅作导入源）
· 不要把构建逻辑塞回 API 进程（必须独立 worker + 独立镜像）
· 不要为了兼容前端而保留 contract_only 空接口（要么实现，要么删除）
```

---

## 11. 结论

```
语言        Python（FastAPI + Arq）单栈，不引入 PHP
UI          React 18 + TS + Vite + Ant Design 5（必须拿到源码工程）
数据库      PostgreSQL 16，单源；Redis 管在线态与广播；MinIO 存产物
架构        无状态 API + 有状态 WS + 独立 Worker + 对象存储
迁移        绞杀式 5 期，约 70 人天，每期可独立上线与回滚
第一件事    冻结接口契约（P0），否则后面所有工作量都无法验收
```
