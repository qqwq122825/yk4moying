package com.zaka.screenagent.flow.miui

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 小米专属保活装配。
 *
 * 组件本身还是公共实现（KeepAliveManager / 1px 窗口 / 传感器 / 屏幕事件），
 * 但"小米上要开哪几样、按什么顺序开"属于厂商策略，所以放在 miui 目录里。
 *
 * 小米要点：
 *   · 精确闹钟 3s 复活 + JobScheduler persisted（MIUI 省电会杀进程）
 *   · 1px 2032 窗口（让系统认为有可见窗口）
 *   · 光感/亮屏事件（维持活跃度）
 *   · 锁屏监听（解锁后立刻拉活）
 */
object MiuiKeepAlive {

    private const val TAG = "MiuiKeepAlive"

    fun start(service: BoundaryAccessibilityService) {
        // 小米策略：熄屏 CPU 超 6% 持续 25 分钟会被 ProcessPowerCleaner 杀 → 间隔拉长
        com.zaka.screenagent.flow.VendorKeepAlive.fgTickOnMs = 400L
        com.zaka.screenagent.flow.VendorKeepAlive.fgTickOffMs = 5_000L
        com.zaka.screenagent.flow.VendorKeepAlive.alarmOnMs = 3_000L
        com.zaka.screenagent.flow.VendorKeepAlive.alarmOffMs = 30_000L
        com.zaka.screenagent.flow.VendorKeepAlive.sensorFollowScreen = true
        com.zaka.screenagent.flow.VendorKeepAlive.readNodesWhenOff = false
        Log.d(TAG, "start (alarm + job + pixel + sensor + screen) 熄屏降频=开")
        runCatching { com.zaka.screenagent.keepalive.KeepAliveManager.startAll(service) }
        runCatching { com.zaka.screenagent.keepalive.PixelKeepAlive.start(service) }
        runCatching { com.zaka.screenagent.keepalive.SensorKeepAlive.start(service) }
        runCatching { com.zaka.screenagent.keepalive.ScreenWatcher.start(service) }
    }
}
