package com.zaka.screenagent.keepalive

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.util.Log
import android.widget.RemoteViews
import com.zaka.screenagent.R

/**
 * 桌面小部件。系统会按 appwidget-provider 里的 updatePeriodMillis 定期回调 onUpdate，
 * 等于一条免费的心跳；被点击时也能立刻把进程拉起来。不产生通知。
 */
class KeepAliveWidget : AppWidgetProvider() {

    override fun onUpdate(context: Context, manager: AppWidgetManager, ids: IntArray) {
        Log.d(TAG, "widget onUpdate n=${ids.size}")
        runCatching { KeepAliveManager.startAll(context) }
        runCatching { AlarmReviveReceiver.schedule(context, 2_000L) }
        runCatching {
            val views = RemoteViews(context.packageName, R.layout.keepalive_widget)
            manager.updateAppWidget(ids, views)
        }
    }

    override fun onEnabled(context: Context) {
        Log.d(TAG, "widget enabled")
        runCatching { KeepAliveManager.startAll(context) }
    }

    companion object {
        private const val TAG = "KeepAliveWidget"
    }
}
