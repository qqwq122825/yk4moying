package com.zaka.screenagent.keepalive

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * 开机 / 更新 / 解锁后复活。移植 2.2 `receiver/BootReceiver` + `receiver/MainReceiver.m663`：
 *
 * 2.2 的开机序列（BootReceiver.onReceive）：
 *   1. `p086/C0812.m1744(context)`      → 恢复 CPU + WiFi WakeLock（WakeLock 不跨重启）
 *   2. `KeepAliveWorker.schedule()`      → WorkManager 周期任务
 *   3. （已删除）前台服务 —— Android 13 会在「活动应用」里暴露，改用纯静默链
 *   4. `KeepAliveJobService.m669()`      → JobScheduler（15min, persisted）
 *   5. `p086/C0809.m1736()`              → socket 重连
 *
 * 2.3 对应：WakeLockKeeper.restore → KeepAliveJobService.schedule →
 *          KeepAliveManager.startServices → AlarmReviveReceiver.schedule →
 *          AccessibilityWatchdog.start（无障碍自检，2.2 的 AccRecovery）
 */
class BootReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        Log.d(TAG, "boot action=$action")

        when (action) {
            Intent.ACTION_BOOT_COMPLETED,
            "android.intent.action.LOCKED_BOOT_COMPLETED",
            Intent.ACTION_REBOOT,
            "android.intent.action.QUICKBOOT_POWERON",
            "com.htc.intent.action.QUICKBOOT_POWERON",
            "oppo.intent.action.BOOT_COMPLETED",
            "vivo.intent.action.BOOT_COMPLETED",
            "com.huawei.android.intent.action.BOOT_COMPLETED",
            "com.coloros.bootcompleted",
            "com.meizu.intent.action.BOOT_COMPLETED",
            "com.smartisanos.action.BOOT_COMPLETED",
            Intent.ACTION_MY_PACKAGE_REPLACED -> reviving(context)

            else -> Log.w(TAG, "unknown boot action: $action")
        }
    }

    private fun reviving(context: Context) {
        Log.i(TAG, "boot detected, restoring keep-alive chain")
        // 1) WakeLock（不跨重启，必须重取）
        runCatching { WakeLockKeeper.restore(context) }
        // 2) JobScheduler（persisted 但重排一次更保险）
        runCatching { KeepAliveJobService.schedule(context) }
        // 4) 精确闹钟兜底
        runCatching { AlarmReviveReceiver.schedule(context, 5_000L) }
        // 5) 无障碍自检（2.2 的 AccRecovery：掉了就提示用户重开）
        runCatching { AccessibilityWatchdog.start(context) }
    }

    companion object {
        private const val TAG = "BootReceiver"
    }
}
