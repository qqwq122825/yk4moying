# 客户端接入协议 · 使用与验收指南

配套文件：`client-api-v1.yaml`（OpenAPI 3.1，6 条接口，字段级定义）

## 1. 契约测试（实现方必须提供）

每条接口至少 1 个测试，断言 **响应 key 集合固定**（多一个少一个都算破约）：

```python
# tests/contract/test_client_api.py（示例）
def test_register_idempotent(client):
    body = {"device_uid": "abc12345", "model": "X", "os": "Android 13", "app_version": "4.5"}
    r1 = client.post("/api/v1/client/register", json=body)
    r2 = client.post("/api/v1/client/register", json=body)
    assert r1.status_code == r2.status_code == 200
    assert r1.json()["data"]["device_id"] == r2.json()["data"]["device_id"]
    assert set(r1.json()["data"]) == {"device_id", "device_token", "server_time", "config_ttl"}

def test_state_requires_device_token(client):
    assert client.post("/api/v1/client/state", json={"state": {}}).status_code == 401

def test_cannot_write_other_device(client, device_a, device_b):
    r = client.post("/api/v1/client/state", json={"state": {}},
                    headers=device_a.headers, params={"device_id": device_b.id})
    assert r.status_code == 403
```

## 2. curl 走查（人工验收）

```bash
H=https://api.example.com
# ① 注册
curl -s -X POST $H/api/v1/client/register -H 'Content-Type: application/json' \
  -d '{"device_uid":"abc12345","model":"SM-G981V","os":"Android 13","app_version":"4.5"}' | jq

# ② 心跳（用上一步返回的 device_id / device_token）
curl -s -o /dev/null -w '%{http_code}\n' -X POST $H/api/v1/client/online \
  -H 'Content-Type: application/json' -H "X-Device-Id: $DID" -H "X-Device-Token: $DTOK" \
  -d '{"battery":87,"charging":true,"network":"wifi","screen_on":false}'

# ③ 状态
curl -s -X POST $H/api/v1/client/state -H 'Content-Type: application/json' \
  -H "X-Device-Id: $DID" -H "X-Device-Token: $DTOK" \
  -d '{"state":{"accessibility":true,"installed_apps_count":132}}'

# ④ 画面帧
curl -s -o /dev/null -w '%{http_code}\n' -X POST $H/api/v1/client/frame \
  -H 'Content-Type: image/jpeg' -H "X-Idempotency-Key: f-$RANDOM" \
  -H "X-Device-Id: $DID" -H "X-Device-Token: $DTOK" --data-binary @shot.jpg

# ⑤ 事件批量
curl -s -X POST $H/api/v1/client/event -H 'Content-Type: application/json' \
  -H "X-Idempotency-Key: e-$RANDOM" -H "X-Device-Id: $DID" -H "X-Device-Token: $DTOK" \
  -d '{"events":[{"event_uid":"evt_1","kind":"app_foreground","at":"2026-11-20T05:30:12Z","payload":{"package":"pl.mbank"}}]}' | jq

# ⑥ 配置
curl -s -D- $H/api/v1/client/config -H "X-Device-Id: $DID" -H "X-Device-Token: $DTOK" | head -20
```

## 3. 落库映射

| 接口 | 表 | 关键字段 |
|---|---|---|
| register | `devices` | `device_uid` 唯一；`device_token_hash` 只存哈希 |
| online | `devices` + Redis | `online=true`，`last_seen_at`，Redis TTL 90s |
| state | `devices.state` (jsonb) | 整包覆盖，禁止存密码/令牌 |
| frame | 对象存储 + `frames` 索引表 | `object_key`、`sha256`、`ts` |
| event | `events`（按月分区） | `(device_id, event_uid)` 唯一，重复投递只计数 |
| config | 只读 | `templates` 表按 `package/country/kind/current` 取 |

## 4. 安全与限流口径

```
· device_token 只在注册/轮换时明文返回一次，服务端存 Argon2id 或 SHA-256+盐
· X-Device-Id + X-Device-Token 必须成对校验；token 与 device_id 不匹配 → 401
· 设备只能读写自己：任何带 device_id 的写操作都要比对凭证归属 → 否则 403
· 限流：online 60 次/分钟，state 30 次/分钟，frame 3 fps（超出丢弃并返回 429），event 10 批/分钟
· frame/event 的 X-Idempotency-Key 24 小时内复用视为重复，直接返回上次结果
```

## 5. 客户端侧最小实现（伪代码）

```kotlin
// 注册（首次启动）
val reg = http.postJson("$H/api/v1/client/register", mapOf(
    "device_uid" to uid, "model" to Build.MODEL, "os" to "Android ${Build.VERSION.RELEASE}",
    "app_version" to BuildConfig.VERSION_NAME, "abi" to Build.SUPPORTED_ABIS.first()))
store(deviceId = reg.data.device_id, token = reg.data.device_token)

// 心跳（前台每 60s，退后台用 WorkManager 兜底）
loop(60_000) { http.post("$H/api/v1/client/online", headers(did, tok), body(beatJson())) }

// 事件（本地队列，攒 20 条或 30s 批量发，失败指数退避）
queue.onFlush { batch -> http.post("$H/api/v1/client/event", headers(did, tok, idemKey()), body(batch)) }
```

## 6. 验收清单（P1 通过标准）

```
[ ] 6 条接口全部实现，路径与字段和 yaml 一致
[ ] register 幂等：同 device_uid 两次返回同 device_id
[ ] 无 token 访问 → 401；跨设备写 → 403
[ ] online 后控制台 online 字段为真；停 90s 后转假（Redis TTL 生效）
[ ] frame 落对象存储，控制台详情能取最新一帧
[ ] event 重复投递不产生重复行（accepted/duplicated 计数正确）
[ ] config 带 ETag；内容未变返回 304
[ ] 6 条契约测试进 CI；干净库 migrate 后全绿
```
