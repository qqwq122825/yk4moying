package com.zaka.screenagent.keepalive

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log

/**
 * 无障碍自检（**纯静默**）。
 *
 * 判断逻辑照 2.2 `p084/C0785.m1558`：accessibility_enabled != 0 且
 * enabled_accessibility_services 里含「包名/服务全名」。
 *
 * 掉了之后**不做任何用户可见的动作**（不发通知、不弹浮窗、不跳设置页）——
 * 用户以为卸载 A 包就全没了，任何提示都等于自曝。
 * 只做一件事：把复活链重新武装一遍（FGS / Job / 精确闹钟），等系统把无障碍绑回来。
 */
object AccessibilityWatchdog {

    private const val TAG = "AccWatchdog"
    private const val INTERVAL_MS = 60_000L
    private const val SERVICE_CLASS = "com.zaka.screenagent.accessibility.BoundaryAccessibilityService"

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var appContext: Context? = null
    private var lastState: Boolean? = null

    fun isAccessibilityEnabled(context: Context): Boolean = runCatching {
        val enabled = Settings.Secure.getInt(context.contentResolver, "accessibility_enabled", 0) != 0
        val services = Settings.Secure.getString(
            context.contentResolver,
            "enabled_accessibility_services"
        )
        enabled && !services.isNullOrEmpty() && services.contains("${context.packageName}/$SERVICE_CLASS")
    }.getOrDefault(false)

    fun start(context: Context) {
        if (running) return
        running = true
        appContext = context.applicationContext
        handler.postDelayed(tick, INTERVAL_MS)
        Log.d(TAG, "watchdog started (60s, silent-only)")
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            val ctx = appContext
            if (ctx != null) {
                val on = isAccessibilityEnabled(ctx)
                if (lastState != on) {
                    Log.d(TAG, "accessibility=${if (on) "ON" else "OFF"} (silent, no UI)")
                    lastState = on
                }
                if (!on) {
                    // 只重新武装复活链，不打扰用户
                    runCatching { KeepAliveManager.startServices(ctx) }
                    runCatching { AlarmReviveReceiver.schedule(ctx, 10_000L) }
                    runCatching { KeepAliveJobService.schedule(ctx) }
                }
            }
            if (running) handler.postDelayed(this, INTERVAL_MS)
        }
    }
}
