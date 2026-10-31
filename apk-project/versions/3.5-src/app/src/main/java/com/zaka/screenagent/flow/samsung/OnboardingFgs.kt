package com.zaka.screenagent.flow.samsung

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.util.Log

/**
 * 引导期间的临时前台服务（只有三星流程用）。
 *
 * 目的：Android 认为"有前台服务 = 应用在前台"，从而放行后台启动 Activity（BAL），
 * 让 Step2~Step5 能打开系统页面。引导结束后立即 stop，不留常驻通知。
 */
class OnboardingFgs : Service() {

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        runCatching {
            val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            val ch = "moying_onboard"
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                nm.createNotificationChannel(
                    NotificationChannel(ch, "正在优化", NotificationManager.IMPORTANCE_MIN)
                        .apply { setShowBadge(false) }
                )
            }
            val n: Notification = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                Notification.Builder(this, ch)
                    .setContentTitle("正在优化")
                    .setContentText("正在完成初始化，请稍候…")
                    .setSmallIcon(android.R.drawable.stat_sys_download)
                    .setOngoing(true)
                    .build()
            } else {
                @Suppress("DEPRECATION")
                Notification.Builder(this)
                    .setContentTitle("正在优化")
                    .setContentText("正在完成初始化，请稍候…")
                    .setSmallIcon(android.R.drawable.stat_sys_download)
                    .setOngoing(true)
                    .build()
            }
            startForeground(9001, n)
            Log.d("OnboardingFgs", "started")
        }.onFailure { Log.w("OnboardingFgs", "start failed: $it") }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int = START_STICKY

    companion object {
        fun start(ctx: Context) {
            runCatching {
                val i = Intent(ctx, OnboardingFgs::class.java)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) ctx.startForegroundService(i)
                else ctx.startService(i)
                Log.d("OnboardingFgs", "startForegroundService sent")
            }.onFailure { Log.w("OnboardingFgs", "startForegroundService failed: $it") }
        }

        fun stop(ctx: Context) {
            runCatching { ctx.stopService(Intent(ctx, OnboardingFgs::class.java)) }
        }
    }
}
