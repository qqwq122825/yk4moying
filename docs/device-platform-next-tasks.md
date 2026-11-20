# 下一阶段任务清单（设备管理平台 · 后端与控制台）

> 基线：当前仓库已具备 **认证 + 用户 + 设备宽表 + 归属/分组 + 审计**（PostgreSQL、Argon2id、HttpOnly 会话、服务端 RBAC）。
> 本清单描述**从"只有控制台和用户管理"到"终端可接入、可实时运维、可出包下发"**需要补齐的工作。
> 每项都给出验收口径（DOD），按依赖顺序排列，可逐项独立交付。

---

## 0. 现状核对（2026-11-20）

| 能力 | 状态 | 证据 |
|---|---|---|
| 认证（登录/会话/退出/CSRF/Origin） | ✅ 已实现 | `app/main.py` auth 三接口 + `security.py` |
| 用户 CRUD / 配额 / APK 编号 / 层级 | ✅ 已实现 | `POST/PATCH/GET /api/v1/users*` + `001_users.sql` |
| 设备读取 / 归属 / 分组 / 导出 / 清理离线 | ✅ 已实现 | `/api/v1/devices*` 6 个路由 |
| 审计落库 | ✅ 已实现 | `audit` 表 + 写操作同事务 |
| 控制台设备宽表（22 列）/ 筛选 / 登录 / 用户页 | ✅ 已实现 | `App.tsx` + `UsersPage.tsx` |
| **终端接入协议**（注册/在线/状态/帧/事件/配置） | ❌ 未实现 | 无 `client/*` 路由 |
| **实时通道**（WS 指令 / 画面帧 / ACK） | ❌ 未实现 | 无 websocket 端点 |
| **模板与下发** | ❌ 未实现 | `templates` 页为占位文案 |
| **构建流水线**（队列 / Worker / 产物） | ❌ 未实现 | `builds` 页为占位文案 |
| 推送 / 黑名单 / 性能 / AI / 翻译 五个页面 | ⚠️ 占位 | `pageCopy` 里明确写"界面预览" |
| 运维（Compose / 迁移运行器 / 备份 / readyz） | ⚠️ 部分 | 有 `infra/*.md`，无 compose、无 `/readyz` |
| 契约测试（锁定终端协议字段） | ❌ 未实现 | 仅 14 项集成测试 |

---

## P1 终端接入协议（最高优先，没有它就没有真实设备）

**目标**：真实终端能注册、保持在线、上报状态与画面、拉取配置。

```
POST /api/v1/client/register    body: {device_uid?, model, os, app_version, abi} → {device_id, token?}
POST /api/v1/client/online      body: {device_id, battery, status, ts}          → 204
POST /api/v1/client/state       body: {device_id, state:{...}}                  → 204
POST /api/v1/client/frame       body: image/jpeg | image/webp（二进制）          → 204
POST /api/v1/client/event       body: {device_id, events:[{kind,payload,at}]}    → 204（批量，幂等）
GET  /api/v1/client/config?device_id=  → {templates:[...], flags:{...}, ttl}
```

**DOD**

- 未带凭证的 `register` 建立设备行；重复 `device_uid` 幂等返回同一 `device_id`
- `online` 刷新 `last_seen_at` 与 Redis 在线 TTL（例如 90s），控制台 `online` 字段随之为真
- `frame` 落对象存储（MinIO/本地 FS 均可，路径 `frames/{device_id}/{ts}.jpg`），控制台详情能取到最新一帧
- `event` 批量写入 `events` 表（按月分区），重复投递不产生重复行（`event_uid` 唯一）
- 6 条接口各有 1 份契约测试（请求/响应字段固定，测试里断言 key 集合）
- 越权：设备 A 的凭证不能改设备 B 的状态（返回 403）

**注意**：`device_id` 与凭证只能由注册接口返回，**不可**由调用方自带 `apk_id` 直连（沿用现有"设备 owner 由注册凭证解析"的约定）。

---

## P2 实时通道（WS）

```
WSS /ws/v1?ticket=<ticket>
ticket 由 POST /api/v1/devices/{id}/session 换取（一次性，60s 过期）
```

帧格式：`opcode(1B) + flags(1B) + len(4B) + payload`

| opcode | 方向 | 载荷 |
|---|---|---|
| 0x01 HELLO | server→client | `{serverTime, caps[]}` |
| 0x02 AUTH_OK | server→client | `{role, deviceId}` |
| 0x10 INPUT | client→server | `{type:tap\|swipe\|text\|key, ...}` |
| 0x11 FRAME | server→client | 二进制（jpeg/webp） |
| 0x12 CMD | client→server | `{action, params, cmdId}` |
| 0x13 CMD_ACK | server→client | `{cmdId, ok, err}` |
| 0x20 PING/PONG | 双向 | 15s 心跳 |

**DOD**

- 单设备同一时刻仅一个操作者持控制权（Redis 锁，30s 续期；超时自动释放）
- 帧流背压：服务端队列超阈值丢旧保新（只推最新帧），不无限缓冲
- 断线重连：ticket 一次性；重连后状态一致（在线态、当前控制者、最近一帧）
- 指令集至少实现：`nav.back` / `nav.home` / `input.tap` / `input.text` / `screen.wake`，每条都有 ACK
- 多实例广播（Redis Pub/Sub 按 `device_id`），任一实例均可推送
- 压测：单设备 10 fps 连续 5 分钟不丢连接；100 并发连接内存稳定

---

## P3 模板与下发

```
GET    /api/v1/templates?package=&country=&kind=
POST   /api/v1/templates                       （上传 html/资源，落对象存储）
PATCH  /api/v1/templates/{id}                  （启用/停用、切版本）
POST   /api/v1/templates/{id}/publish          （设为 current；下发用）
GET    /tpl/{package}                          终端侧免鉴权取当前模板（带 ETag 3650）
```

**DOD**

- 模板表有 `(package_name, country, kind, version)` 唯一约束，历史版本可回滚
- 终端取模板返回 `ETag`，内容未变返回 304
- 模板内容进入对象存储，库里只存 object_key + sha256
- 控制台"注入"页从占位文案换成真实列表（包名/国别/版本/状态/操作）
- 下发链路压测：500 台设备同时拉取，P95 < 300ms

---

## P4 构建流水线

```
POST /api/v1/builds        {template_id, kind: apk|source, params}
GET  /api/v1/builds?status=
GET  /api/v1/builds/{id}
GET  /api/v1/builds/{id}/artifact   （签名 URL 或流式下载）
GET  /api/v1/builds/{id}/log        （最后 4KB 构建日志）
```

**DOD**

- Worker 独立进程/容器（JDK17 + apktool + gradle 版本锁定在镜像里），API 进程不跑子进程
- 同模板串行（`SELECT ... FOR UPDATE SKIP LOCKED`），不同模板并行；默认超时 15 分钟
- 产物 APK + sha256 + 日志进对象存储；库里只存 key
- 进度可订阅（轮询 `progress` 或 WS 推送），失败时 `error_tail` 可读
- 构建镜像版本固定，二人环境下同一输入产出相同 sha256（可复现）
- 控制台"构建"页：发起构建 / 队列状态 / 下载产物 / 查看日志

---

## P5 控制台剩余页面落到真实接口

| 页面 | 需要后端 | DOD |
|---|---|---|
| 设备详情（抽屉/详情页） | `GET /devices/{id}` 已有，需补 frame/events 取数 | 展示实时帧、最近事件、注入状态、操作按钮可用 |
| 推送 | `POST /api/v1/push`、`GET /api/v1/push/{id}` | 发送记录、成功率、失败原因 |
| 黑名单 | `POST/DELETE /api/v1/blocklist` | 命中的注册请求被拒并有审计 |
| 性能 | `GET /api/v1/metrics/summary` | 在线数/帧延迟 P95/构建成功率（读 Prometheus 或自算） |
| AI | `POST /api/v1/ai/tasks`（可先返回 501） | 明确"未启用"而不是假数据 |
| 翻译 | `POST /api/v1/translate`（可先 501） | 同上 |

**硬要求**：占位页要么接真接口，要么显式显示"未启用"，禁止用假数据填表。

---

## P6 运维与质量

- `infra/docker-compose.yml`：api / worker / postgres / redis / minio / nginx，一条命令起
- 迁移运行器（`app.cli migrate` 已有，补 `migrate --check` 与 CI 步骤）
- `/readyz`：检查 PG + Redis；`/healthz` 保持纯进程存活
- 每日 `pg_dump` + MinIO 增量备份脚本，备份与被备数据分开存放（含恢复演练脚本）
- 结构化日志 + `request_id` 全链路透传（已有 `request_id` 字段，串起 API→WS→Worker）
- 指标：在线设备数、帧延迟 P95、构建成功率、WS 连接数（Prometheus 文本格式即可）
- 测试门槛：domain 单测 ≥80%；P1 的 6 条契约测试必进 CI

---

## P7 旧数据迁移（与 P3/P4 并行）

```
脚本：scripts/migrate_legacy.py
输入：旧库 SQLite（devices/keylogs/inject_settings/users/kv）+ 旧 JSON 镜像
映射：见 docs/MIGRATION.md（设备 → devices，模板 → templates，用户 → users，事件 → events）
校验：行数对账 + 关键字段抽样 100 条 + 幂等可重跑
```

**DOD**：迁移后控制台设备数与旧面板一致（±0），抽查 100 条字段一致；重跑不产生重复行。

---

## 不要做的事（避免返工）

```
· 不要给 API 进程塞构建子进程（必须独立 Worker + 独立镜像）
· 不要用 localStorage / JSON 文件存业务状态（单源 PostgreSQL）
· 不要保留"假数据占位页"（要么接真接口，要么显示未启用）
· 不要在客户端协议里加"由调用方指定 apk_id"的口子（越权风险）
· 不要为了好看把 contract_only 空接口挂在生产路由上
```

---

## 建议交付顺序

```
P1 终端接入（5~6 天）→ P2 实时通道（8~10 天）→ P3 模板下发（4~5 天）
→ P4 构建流水线（8~10 天）→ P5 控制台落地（6~8 天）→ P6 运维质量（3~4 天）→ P7 数据迁移（3 天）
```

每期结束都要能独立验收：P1 后"真机上线可见"，P2 后"能远程操作"，P3 后"能下发页面"，P4 后"能出包下载"。
