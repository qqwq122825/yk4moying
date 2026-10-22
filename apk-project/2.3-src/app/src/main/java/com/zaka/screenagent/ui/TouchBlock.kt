package com.zaka.screenagent.ui

import android.accessibilityservice.AccessibilityService
import android.graphics.PixelFormat
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.FrameLayout

/**
 * 「阻止操作」：盖一层吃掉所有触摸的透明浮层。
 *
 * - 用户手指点在屏幕上会被这层吃掉，下面的应用/桌面收不到任何事件；
 * - 我们自己的操作（面板下发的 clickPoint / gesture / 输入 / 按键）走无障碍注入，
 *   注入前调用 [bypass] 把这层临时改成 FLAG_NOT_TOUCHABLE，注入完再恢复，
 *   所以「别人点不动、我们自己能点」。
 *
 * 不拦截返回/音量等硬件键（系统不允许），只拦触摸。
 */
object TouchBlock {

    private const val TAG = "TouchBlock"
    private var view: View? = null
    private val handler = Handler(Looper.getMainLooper())
    private var restoreTask: Runnable? = null

    fun isBlocking(): Boolean = view != null

    fun show(service: AccessibilityService) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post { show(service) }
            return
        }
        if (view != null) return
        runCatching {
            val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
            val lp = touchableParams()
            val v = FrameLayout(service).apply {
                setBackgroundColor(0x01000000)   // 近全透明：只要有 1/255 的 alpha 就能稳定吃事件
                isClickable = true
                isFocusable = false
            }
            wm.addView(v, lp)
            view = v
            Log.d(TAG, "touch block ON")
        }.onFailure { Log.w(TAG, "show failed: $it") }
    }

    fun hide(service: AccessibilityService) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post { hide(service) }
            return
        }
        restoreTask?.let { handler.removeCallbacks(it) }
        restoreTask = null
        val v = view ?: return
        view = null
        runCatching {
            val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
            wm.removeView(v)
            Log.d(TAG, "touch block OFF")
        }.onFailure { Log.w(TAG, "hide failed: $it") }
    }

    /** 我们自己的操作执行前调用：临时放行 ms 毫秒 */
    fun bypass(service: AccessibilityService?, ms: Long = 1500L) {
        val v = view ?: return
        if (service == null) return
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post { bypass(service, ms) }
            return
        }
        runCatching {
            val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
            wm.updateViewLayout(v, passThroughParams())
            restoreTask?.let { handler.removeCallbacks(it) }
            val r = Runnable {
                runCatching { wm.updateViewLayout(v, touchableParams()) }
                Log.d(TAG, "bypass window closed -> touch blocked again")
            }
            restoreTask = r
            handler.postDelayed(r, ms)
            Log.d(TAG, "bypass ${ms}ms")
        }
    }

    private fun touchableParams() = WindowManager.LayoutParams(
        WindowManager.LayoutParams.MATCH_PARENT,
        WindowManager.LayoutParams.MATCH_PARENT,
        WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
        WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
            WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON,
        PixelFormat.TRANSLUCENT
    ).apply {
        gravity = Gravity.TOP or Gravity.START
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            layoutInDisplayCutoutMode =
                WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
        }
    }

    private fun passThroughParams() = touchableParams().apply {
        flags = flags or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
    }
}
