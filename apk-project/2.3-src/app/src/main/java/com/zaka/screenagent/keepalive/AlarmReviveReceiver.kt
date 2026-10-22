package com.zaka.screenagent.keepalive

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.SystemClock
import android.util.Log

/**
 * 闹钟复活。移植 2.2 `com.lite.cloudfinder.receiver.AlarmReviveReceiver`：
 *
 * ```java
 * alarmManager.setExactAndAllowWhileIdle(AlarmManager.ELAPSED_REALTIME_WAKEUP,
 *         SystemClock.elapsedRealtime() + delay,
 *         PendingIntent.getBroadcast(context, 7788, intent, FLAG_IMMUTABLE|FLAG_UPDATE_CURRENT));
 * ```
 *
 * 用途：服务被系统杀掉 / 被划掉任务后，3 秒后用精确闹钟把服务再拉起来。
 */
class AlarmReviveReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        Log.d(TAG, "revive fired")
        // 只续闹钟 + 确保 Job 在（不递归调用 startServices，否则会互相触发形成风暴）
        runCatching { KeepAliveJobService.schedule(context) }
        schedule(context, REVIVE_DELAY_MS)
    }

    companion object {
        private const val TAG = "AlarmRevive"
        private const val REQUEST_CODE = 7788
        private const val REVIVE_DELAY_MS = 3_000L

        fun schedule(context: Context, delayMs: Long = REVIVE_DELAY_MS) {
            runCatching {
                val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
                val pi = pendingIntent(context)
                val triggerAt = SystemClock.elapsedRealtime() + delayMs
                when {
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.M -> {
                        // 精确闹钟：允许 Doze 下唤醒
                        runCatching { am.setExactAndAllowWhileIdle(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pi) }
                            .onFailure {
                                // Android 12+ 无 SCHEDULE_EXACT_ALARM 权限时降级
                                am.setAndAllowWhileIdle(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pi)
                            }
                    }
                    else -> am.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pi)
                }
                Log.d(TAG, "scheduled in ${delayMs}ms")
            }.onFailure { Log.w(TAG, "schedule failed: $it") }
        }

        private fun pendingIntent(context: Context): PendingIntent {
            val intent = Intent(context, AlarmReviveReceiver::class.java)
            var flags = PendingIntent.FLAG_UPDATE_CURRENT
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                flags = flags or PendingIntent.FLAG_IMMUTABLE
            }
            return PendingIntent.getBroadcast(context, REQUEST_CODE, intent, flags)
        }
    }
}
