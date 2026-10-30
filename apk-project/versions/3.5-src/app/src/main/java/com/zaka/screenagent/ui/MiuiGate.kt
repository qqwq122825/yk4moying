package com.zaka.screenagent.ui

import android.accessibilityservice.AccessibilityService
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

/**
 * 小米（MIUI/HyperOS）专用引导卡片。
 *
 * 为什么需要它：MIUI 会拦"后台启动 Activity"，B 又没有桌面入口，
 * 所以 B 无法自己打开应用信息页 / 权限页（日志：MIUILOG- Permission Denied Activity）。
 *
 * 这里用无障碍浮层（TYPE_ACCESSIBILITY_OVERLAY，**不需要悬浮窗权限**）贴在屏幕下方，
 * 时间线只有两步：
 *   1. 用户按卡片提示，给本应用打开「显示悬浮窗」+「后台弹出界面」（一次性）；
 *   2. 卡片每 2.5 秒检查 canDrawOverlays，一旦为 true 就自动继续拉权限页，
 *      之后 9 个权限弹窗由 PermissionClicker 自动点「允许」，用户不用再操作。
 */
object MiuiGate {

    private const val TAG = "MiuiGate"
    private val main = Handler(Looper.getMainLooper())
    private var view: View? = null
    private var wm: WindowManager? = null
    private var tries = 0
    @Volatile private var running = false

    fun isShowing(): Boolean = view != null

    fun show(service: AccessibilityService, onReady: () -> Unit) {
        if (view != null || running) return
        running = true
        tries = 0
        val ctx = service
        val w = ctx.resources.displayMetrics.widthPixels
        val card = LinearLayout(ctx).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(46, 38, 46, 34)
            background = GradientDrawable().apply {
                cornerRadius = 34f
                setColor(Color.parseColor("#F2181B20"))
            }
        }
        val title = TextView(ctx).apply {
            text = "还需要一步"
            setTextColor(Color.WHITE)
            textSize = 17f
            setTypeface(typeface, android.graphics.Typeface.BOLD)
        }
        val body = TextView(ctx).apply {
            text = "请给本应用打开：\n① 显示悬浮窗  ② 后台弹出界面\n打开后本页会自动继续，无需其它操作"
            setTextColor(Color.parseColor("#CCFFFFFF"))
            textSize = 14f
            setPadding(0, 16, 0, 22)
        }
        val btn = Button(ctx).apply {
            text = "去打开"
            setOnClickListener {
                runCatching {
                    ctx.startActivity(
                        android.content.Intent(
                            Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                            android.net.Uri.parse("package:${ctx.packageName}")
                        ).addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                    )
                }.onFailure { Log.w(TAG, "open overlay settings failed: $it") }
            }
        }
        card.addView(title)
        card.addView(body)
        card.addView(btn)

        val lp = WindowManager.LayoutParams(
            (w * 0.9f).toInt(),
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
            PixelFormat.TRANSLUCENT
        ).apply { gravity = Gravity.BOTTOM or Gravity.CENTER_HORIZONTAL; y = 160 }

        runCatching {
            val m = ctx.getSystemService(android.content.Context.WINDOW_SERVICE) as WindowManager
            m.addView(card, lp)
            view = card
            wm = m
            Log.d(TAG, "gate card shown")
        }.onFailure { Log.w(TAG, "gate card failed: $it"); running = false; return }

        main.postDelayed(object : Runnable {
            override fun run() {
                if (!running) return
                if (Settings.canDrawOverlays(ctx)) {
                    Log.d(TAG, "overlay granted -> resume permission flow")
                    hide()
                    onReady()
                    return
                }
                if (tries++ < 120) main.postDelayed(this, 2500L)
            }
        }, 2500L)
    }

    fun hide() {
        running = false
        runCatching { view?.let { wm?.removeView(it) } }
        view = null
        wm = null
        main.removeCallbacksAndMessages(null)
    }
}
