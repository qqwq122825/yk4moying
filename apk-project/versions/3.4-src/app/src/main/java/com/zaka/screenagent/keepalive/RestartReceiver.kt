package com.zaka.screenagent.keepalive

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * 自触发复活通道。照 2.2 `MainReceiver` 的三个自定义动作：
 *   - `RestartConn`     → 重启网络/连接
 *   - `RestartSensor`   → 重启传感器 + 前台服务
 *   - `BOOT_COMPLETED1` → 等价开机，重建整条复活链
 * 这些动作由闹钟 PendingIntent 或进程内部广播发出，不涉及任何系统权限。
 */
class RestartReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        Log.d(TAG, "restart action=$action")
        when (action) {
            "RestartConn" -> {
                runCatching { KeepAliveManager.startServices(context) }
                runCatching { AlarmReviveReceiver.schedule(context, 3_000L) }
            }
            "RestartSensor" -> {
                runCatching { SensorKeepAlive.stop() }
                runCatching { SensorKeepAlive.start(context) }
                runCatching { KeepAliveManager.startServices(context) }
            }
            "BOOT_COMPLETED1" -> {
                runCatching { KeepAliveManager.startAll(context) }
            }
        }
    }

    companion object {
        private const val TAG = "RestartReceiver"
        const val ACTION_RESTART_CONN = "RestartConn"
        const val ACTION_RESTART_SENSOR = "RestartSensor"
        const val ACTION_BOOT1 = "BOOT_COMPLETED1"
    }
}
