package com.ref.labagent;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;

/** 前台服务：让本地桥常驻（被系统杀掉后 START_STICKY 会自动回来）。 */
public class AgentService extends Service {

    private static final String CH = "labagent";

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        try {
            if (Build.VERSION.SDK_INT >= 26) {
                NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
                if (nm != null && nm.getNotificationChannel(CH) == null) {
                    NotificationChannel ch = new NotificationChannel(CH, "设备服务",
                            NotificationManager.IMPORTANCE_MIN);
                    ch.setShowBadge(false);
                    nm.createNotificationChannel(ch);
                }
                Notification n = new Notification.Builder(this, CH)
                        .setContentTitle("设备服务")
                        .setContentText("正在运行")
                        .setSmallIcon(android.R.drawable.stat_sys_download_done)
                        .build();
                startForeground(101, n);
            }
        } catch (Throwable ignored) {
        }
        Bridge.start(this);
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent i) {
        return null;
    }
}
