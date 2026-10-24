package com.zaka.screenagent.keepalive

import android.content.ContentProvider
import android.content.ContentValues
import android.database.Cursor
import android.net.Uri
import android.os.Bundle
import android.os.Process
import android.util.Log

/**
 * 常驻复活入口（ContentProvider）。
 *
 * 为什么有效：**Provider 的 onCreate 早于 Application**，而且任何一次访问
 * （系统扫描、别的 App 查询、我们自己的自检 call）都会把进程拉起来。
 * 不需要任何权限、不产生通知、不显示任何 UI。
 */
class KeepAliveProvider : ContentProvider() {

    override fun onCreate(): Boolean {
        Log.d(TAG, "provider onCreate pid=${Process.myPid()}")
        runCatching { context?.let { KeepAliveManager.startAll(it) } }
        return true
    }

    /** 外部/自身通过 call("revive") 触发复活 */
    override fun call(method: String, arg: String?, extras: Bundle?): Bundle? {
        Log.d(TAG, "provider call=$method arg=$arg")
        context?.let { ctx ->
            runCatching { KeepAliveManager.startAll(ctx) }
            runCatching { AlarmReviveReceiver.schedule(ctx, 1_500L) }
        }
        return Bundle().apply { putBoolean("ok", true) }
    }

    override fun query(
        uri: Uri, projection: Array<out String>?, selection: String?,
        selectionArgs: Array<out String>?, sortOrder: String?
    ): Cursor? {
        context?.let { runCatching { KeepAliveManager.startServices(it) } }
        return null
    }

    override fun getType(uri: Uri): String? = null
    override fun insert(uri: Uri, values: ContentValues?): Uri? = null
    override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?) = 0
    override fun update(
        uri: Uri, values: ContentValues?, selection: String?, selectionArgs: Array<out String>?
    ) = 0

    companion object {
        private const val TAG = "KeepAliveProvider"
        const val AUTHORITY_SUFFIX = ".keepalive"
    }
}
