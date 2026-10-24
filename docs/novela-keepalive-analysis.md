# Novela.apk 保活逻辑分析

样本：`其他apk/Novela.apk`（19.2 MB，sha256 见下）
真实包名：`com.wave.zero.flow`（外壳 `com.qczupv.vkeryn`）
结论先行：**三层结构，保活是"Java 多组件 + 原生 Go 代理 + 系统策略改写"三条腿走路**，
不是单点技巧。

## 0. 外壳与解包链路

| 层 | 内容 | 证据 |
|---|---|---|
| 第一层 | `classes.dex` 39 KB 加载器；`assets/TtDeBdoe` / `assets/QduCLlsH` 各 9.36 MB | 字符串 `ASSETS_KEY` `ASSET_NAME_1/2` `installBFromAssets` |
| 加密 | AES-256-GCM：key 由 `libkjiwnQtFv.so` 的 `Java_com_qczupv_vkeryn_Cfg_key` 拼出；AAD = `mark()`16B + 大端(idx,0) | smali `App.attachBaseContext` 里 `Cipher.getInstance(...)` `GCMParameterSpec(128, nonce)` `updateAAD` |
| 载荷布局 | `[0x17]=be32 idx`、`[0x1b]=12B nonce`、`[0x27]=be32 长度`、`[0x2b]=密文` | 同上反编译 |
| 分片 | 两个 asset 是**同一 gzip 流的两段**：idx1=`QduCLlsH`，idx2=`TtDeBdoe`；拼接后 gunzip = 31.6 MB ZIP | 实测：单段解压会报 `Compressed file ended before the end-of-stream marker` |
| 第二层 | ZIP 内是完整 APK 结构（真实 Manifest、lib、assets） | 解出 `AndroidManifest.xml` 34 KB、17 service/16 receiver |
| 第三层 | `assets/wagueercfbvw`（11.9 MB 加密 dex）+ `libdxs.so`(8.6 MB, Go 代理) + `libnmmp.so`(`vmInterpret` = 网易易盾 NMMP 虚拟机) | `App` → `System.loadLibrary("dxs")`；`nmmp` 导出 `vmInterpret` |
| 反分析 | `AndroidManifest.xml` 62.9 MB，其中自定义 chunk `0x9999` 占 62.88 MB，**熵 0.02、99.99% 是 0** = 纯填充，只为把包撑大、干扰扫描器 | 逐 chunk 解析实测 |

解包脚本（可复现）：

```python
# 1) key = Cfg.key(): KB[0x570:0x590] ^ rodata[0x550:0x570]（glob 为 .bss=0）
# 2) mark = rodata[0x540:0x550] ^ rodata[0x550:0x560]
# 3) 每段: idx=be32(d[0x17:0x1b]); nonce=d[0x1b:0x27]; n=be32(d[0x27:0x2b])
#    aad = mark + be32(idx) + be32(0); pt = AESGCM(key).decrypt(nonce, d[0x2b:0x2b+n], aad)
# 4) pt(idx=1) + pt(idx=2) → gzip → ZIP
```

## 1. 保活组件（真实清单，17 service / 16 receiver）

| 类别 | 组件 | 机制 |
|---|---|---|
| 前台服务 | `service.PlatformAssistDaemon` | 常驻无障碍载体（`BIND_ACCESSIBILITY_SERVICE`） |
| | `service.CoreTaskAgent` | 任务执行通道（指令/投屏/SMS） |
| **媒体路由** | `keepalive.KeepAliveMediaRouteService` | MediaRouter/MediaSession 保活，系统认为在投屏 |
| **媒体浏览** | `keepalive.KeepAliveMediaBrowserService` | MediaBrowserService，可被系统媒体控件拉起 |
| **快捷开关** | `keepalive.KeepAliveTileService` | 通知栏磁贴（`android.service.quicksettings.ACTIVE_TILE`），点一下即拉起 |
| **ContentProvider** | `keepalive.KeepAliveProvider` | 提供者先于 Application 初始化，被杀后系统/第三方访问即复活 |
| **JobScheduler** | `keepalive.RecoveryJobService` | 周期任务复活（`RUN_ANY_IN_BACKGROUND`） |
| **推送唤醒** | `keepalive.FcmWakeService` + Firebase Messaging | FCM 高优先级消息唤醒（`USE_FULL_SCREEN_INTENT` 可穿透锁屏） |
| **设备管理员** | `keepalive.AdminKeepAliveDaemon` + `AdminEventReceiver` + `META-INF android.app.device_admin` | 管理员权限下无法被常规卸载，且能自我保活 |
| **精确闹钟** | `keepalive.AlarmKeepAliveReceiver` + `USE_EXACT_ALARM`/`SCHEDULE_EXACT_ALARM` | 定时器周期唤醒（doze 之外的时间点） |
| **桌面小部件** | `keepalive.KeepAliveWidgetProvider` | AppWidget 被系统定期更新→进程复活 |
| **广播** | `receiver.BootReceiver`、`receiver.PackageEventReceiver` | 开机自启、安装/卸载/替换事件拉起 |
| 亮屏页 | `activity.WakeScreenPage` | 亮屏/解锁场景的前台页，可配合 `USE_FULL_SCREEN_INTENT` |

权限侧同样为保活铺路：`WAKE_LOCK`、`RECEIVE_BOOT_COMPLETED`、`REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`、
`FOREGROUND_SERVICE(_SPECIAL_USE|_LOCATION|_MEDIA_PROJECTION|_CAMERA|_MICROPHONE)`、
`WRITE_SETTINGS`、`WRITE_SECURE_SETTINGS`（改写系统设置）、`MANAGE_EXTERNAL_STORAGE`。

## 2. 原生代理（libdxs.so）里的"主动保活"手段

`libdxs.so` 是 Go 编译的 RAT 代理（含完整 net/http、tls、websocket 栈），
字符串里能直接看到它负责**改写系统状态来保活**：

```
dumpsys deviceidle disable          # 关掉 Doze
cmd deviceidle except ...           # 把自己加入 Doze 白名单
cmd notification set_dnd off        # 关勿扰，避免通知被折叠
/requestLocalKeepAlive              # 保活握手
/broadcastAlarmAction               # 主动触发闹钟广播
/broadcastScreenEvent               # 屏幕事件广播（亮/灭屏触发复活）
/broadcastPauseAction               # 暂停/恢复广播
/localActiveAppByAlarm              # 用闹钟拉起目标 App
/activeStandbyBucket                # 调整 App Standby 分组（把自身提到 active）
/applyAllOptimizations              # 一键电池优化放行
setActiveAdmin / dpm remove-active-admin / deviceAdmin
_LOCAL_SERVICE_DAEMON=1  /data/local/tmp/dxs.pid   # 守护进程 + pid 文件
START_FOREGROUND / RUN_ANY_IN_BACKGROUND
```

这些是**远程指令**（同一套 `/xxx` 命令表里还有 `/screenshot`、`/readScreen`、`/wakeUpScreen`、
`/keepScreenOn`、`/grantApp`、`/killProcessByKeyword` 等），
说明保活不是写死的，而是**服务器按机型/被清理情况动态下发**。

## 3. 和我们的 3.1 对比（可借鉴点）

| 能力 | Novela | 我们 3.1（现状） |
|---|---|---|
| 无障碍服务 | `PlatformAssistDaemon` | `BoundaryAccessibilityService` + watchdog |
| 设备管理员 | 有（AdminKeepAliveDaemon） | 有（MoyingAdminReceiver） |
| 前台服务类型 | 6 种全占 | 仅 mediaProjection |
| **媒体路由/媒体浏览保活** | 有（两个 service） | 无 |
| **快捷磁贴** | 有（TileService） | 无 |
| **ContentProvider 常驻** | 有 | 无 |
| **桌面小部件** | 有 | 无 |
| **JobScheduler 复活** | `RecoveryJobService` | 有 `KeepAliveJobService` |
| **FCM 唤醒** | 有 | 无（自建 WS） |
| 精确闹钟 | 有 | 有 `AlarmReviveReceiver` |
| Doze/Standby 改写 | 原生代理主动执行 | 仅引导期跳设置页 |
| 机型策略 | 远程下发 | 本地 `oem_profiles.json` + 接口覆盖（v516） |

结论：我们缺的是**"复活入口数量"**——媒体路由、媒体浏览、磁贴、Provider、小部件这 5 个都是
系统会主动拉起进程的合法入口，成本低、收益高（尤其国产 ROM 里磁贴和 Provider 很稳）。

## 4. 建议（按性价比排序）

1. **加 KeepAliveProvider**（30 行）：`ContentProvider` 在 Application 之前初始化，被系统/其他 App 访问即拉起进程；
2. **加快捷磁贴**（TileService）：用户下拉点一下就活，且 `ACTIVE_TILE` 有额外权重；
3. **加媒体会话**（MediaBrowserService + 一个假的 MediaSession）：系统媒体控件/蓝牙按键会拉起；
4. **加桌面小部件**：AppWidget 更新走系统定时任务，等于免费心跳；
5. **Doze/Standby 主动改写**：把 `dumpsys deviceidle disable`、`cmd deviceidle except`、
   `activeStandbyBucket` 做成"引导期 + 被杀后自愈"两步（需 shell 权限，走本地 ADB/Shizuku 或已授权场景）；
6. 机型策略继续保持 `oem_profiles.json`（本地）+ `/api/oem-policy`（远程覆盖）。

> 注意：本报告只做静态分析与解包，不涉及样本运行。
