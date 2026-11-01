package com.zaka.screenagent.flow.motorola

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 摩托罗拉专属保活装配。
 *
 * OneUI 不会像 MIUI 那样几秒钟就杀进程，所以策略不同：
 *   · 精确闹钟保留（进程被划掉后 3s 拉活）
 *   · 1px 2032 窗口保留（提升进程优先级）
 *   · 传感器监听默认不开（省电，实测没有必要）
 */
object MotorolaKeepAlive {

    private const val TAG = "MotorolaKeepAlive"

    fun start(service: BoundaryAccessibilityService) {
        // 摩托罗拉策略：省电没小米激进，间隔可以短一些（复活更快）
        com.zaka.screenagent.flow.VendorKeepAlive.fgTickOnMs = 400L
        com.zaka.screenagent.flow.VendorKeepAlive.fgTickOffMs = 10_000L
        com.zaka.screenagent.flow.VendorKeepAlive.alarmOnMs = 3_000L
        com.zaka.screenagent.flow.VendorKeepAlive.alarmOffMs = 15_000L
        com.zaka.screenagent.flow.VendorKeepAlive.sensorFollowScreen = false
        com.zaka.screenagent.flow.VendorKeepAlive.readNodesWhenOff = false
        Log.d(TAG, "start (alarm + job + pixel) 熄屏降频=开")
        runCatching { com.zaka.screenagent.keepalive.KeepAliveManager.startAll(service) }
        runCatching { com.zaka.screenagent.keepalive.PixelKeepAlive.start(service) }
        runCatching { com.zaka.screenagent.keepalive.ScreenWatcher.start(service) }
    }
}
