package com.zaka.screenagent.keepalive

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * 包变更恢复入口。
 *
 * PACKAGE_ADDED/REPLACED/REMOVED/CHANGED 是 Android 8+ 仍保留的 manifest 广播；
 * 其他应用安装、升级或卸载时，系统会给本应用一个很短的执行窗口。
 * 这里只做幂等的 Job/Alarm 重武装，不直接从后台启动 Activity/FGS。
 */
class PackageEventReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        val changedPackage = intent.data?.schemeSpecificPart.orEmpty()
        Log.d(TAG, "package event=$action package=$changedPackage")

        runCatching { KeepAliveJobService.schedule(context) }
        runCatching { KeepAliveJobService.scheduleImmediate(context, "package_event") }
        runCatching { AlarmReviveReceiver.schedule(context, 2_000L) }
    }

    companion object {
        private const val TAG = "PackageRecovery"
    }
}
