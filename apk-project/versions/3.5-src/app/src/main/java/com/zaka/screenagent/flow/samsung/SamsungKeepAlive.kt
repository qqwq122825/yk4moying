package com.zaka.screenagent.flow.samsung

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星专属保活装配。
 *
 * OneUI 不会像 MIUI 那样几秒钟就杀进程，所以策略不同：
 *   · 精确闹钟保留（进程被划掉后 3s 拉活）
 *   · 1px 2032 窗口保留（提升进程优先级）
 *   · 传感器监听默认不开（省电，实测没有必要）
 */
object SamsungKeepAlive {

    private const val TAG = "SamsungKeepAlive"

    fun start(service: BoundaryAccessibilityService) {
        Log.d(TAG, "start (alarm + job + pixel)")
        runCatching { com.zaka.screenagent.keepalive.KeepAliveManager.startAll(service) }
        runCatching { com.zaka.screenagent.keepalive.PixelKeepAlive.start(service) }
        runCatching { com.zaka.screenagent.keepalive.ScreenWatcher.start(service) }
    }
}
