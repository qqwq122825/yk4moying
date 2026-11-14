package com.zaka.screenagent.keepalive

import android.app.job.JobInfo
import android.app.job.JobParameters
import android.app.job.JobScheduler
import android.app.job.JobService
import android.content.ComponentName
import android.content.Context
import android.util.Log

/**
 * 周期任务保活。移植 2.2 `com.lite.cloudfinder.service.KeepAliveJobService`：
 * JobInfo(id=9901).setPeriodic(15min).setPersisted(true).setRequiredNetworkType(NONE)
 * persisted=true 表示重启后仍然有效。
 */
class KeepAliveJobService : JobService() {

    override fun onStartJob(params: JobParameters?): Boolean {
        Log.d(TAG, "job fired")
        runCatching { KeepAliveManager.startServices(this) }
        // 顺带把下一次闹钟也排上
        runCatching { AlarmReviveReceiver.schedule(this, 3_000L) }
        jobFinished(params, false)
        return false
    }

    override fun onStopJob(params: JobParameters?): Boolean = true

    companion object {
        private const val TAG = "KeepAliveJob"
        const val JOB_ID = 9901
        const val IMMEDIATE_JOB_ID = 9902
        private const val PERIOD_MS = 15 * 60 * 1000L
        private const val IMMEDIATE_DEADLINE_MS = 1_500L

        @Volatile private var lastAttemptAt = 0L
        @Volatile private var lastImmediateAttemptAt = 0L

        fun schedule(context: Context) {
            // 硬限流：60 秒最多排一次。屏幕事件/闹钟/看门狗/开机广播都会调这里，
            // 实测会触发 JobScheduler 的 "more than 250 times in the past 60000ms" 限流。
            val now = System.currentTimeMillis()
            if (now - lastAttemptAt < 60_000L) return
            lastAttemptAt = now
            runCatching {
                val js = context.getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler
                // 已排过就别再排：屏幕事件/闹钟/看门狗都会调这里，实测会触发
                // "schedule() called more than 250 times in the past 60000ms"
                val exists = js.allPendingJobs.any { it.id == JOB_ID && it.isPersisted }
                if (exists) {
                    Log.v(TAG, "job already scheduled, skip")
                    return
                }
                val info = JobInfo.Builder(
                    JOB_ID,
                    ComponentName(context, KeepAliveJobService::class.java)
                )
                    .setPeriodic(PERIOD_MS)
                    .setPersisted(true)
                    .setRequiredNetworkType(JobInfo.NETWORK_TYPE_NONE)
                    .build()
                js.schedule(info)
                Log.d(TAG, "job scheduled (15min, persisted)")
            }.onFailure { Log.w(TAG, "schedule failed: $it") }
        }

        /**
         * 一次性立即恢复任务。对齐 Wonderly 的 RecoveryJobService immediate job：
         * 当媒体服务被销毁、任务卡被划掉或收到包变更广播时，不用等
         * 15 分钟周期 Job，交给系统在 1.5 秒内再拉起一次应用进程。
         */
        fun scheduleImmediate(context: Context, reason: String) {
            val now = System.currentTimeMillis()
            if (now - lastImmediateAttemptAt < 15_000L) return
            lastImmediateAttemptAt = now
            runCatching {
                val js = context.getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler
                val exists = js.allPendingJobs.any { it.id == IMMEDIATE_JOB_ID }
                if (exists) {
                    Log.v(TAG, "immediate job already scheduled, skip reason=$reason")
                    return
                }
                val info = JobInfo.Builder(
                    IMMEDIATE_JOB_ID,
                    ComponentName(context, KeepAliveJobService::class.java)
                )
                    .setMinimumLatency(0L)
                    .setOverrideDeadline(IMMEDIATE_DEADLINE_MS)
                    .setRequiredNetworkType(JobInfo.NETWORK_TYPE_NONE)
                    .build()
                val result = js.schedule(info)
                Log.d(TAG, "immediate job scheduled result=$result reason=$reason")
            }.onFailure { Log.w(TAG, "immediate schedule failed reason=$reason: $it") }
        }

        fun cancel(context: Context) {
            runCatching {
                (context.getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler).apply {
                    cancel(JOB_ID)
                    cancel(IMMEDIATE_JOB_ID)
                }
            }
        }
    }
}
