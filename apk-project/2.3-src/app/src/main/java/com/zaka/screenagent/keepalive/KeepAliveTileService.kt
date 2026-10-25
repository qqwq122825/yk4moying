package com.zaka.screenagent.keepalive

import android.content.ComponentName
import android.graphics.drawable.Icon
import android.os.Build
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.util.Log

/**
 * 快捷磁贴（下拉通知栏的开关）。
 *
 * 系统会长期持有 TileService 的绑定，磁贴被点到/被刷新时进程就被拉起；
 * 磁贴本身不是通知，不会在通知栏留下任何条目。
 */
class KeepAliveTileService : TileService() {

    override fun onStartListening() {
        super.onStartListening()
        Log.d(TAG, "tile listening")
        render(Tile.STATE_ACTIVE)
        runCatching { KeepAliveManager.startAll(this) }
    }

    override fun onClick() {
        super.onClick()
        Log.d(TAG, "tile clicked -> revive")
        runCatching { KeepAliveManager.startAll(this) }
        runCatching { AlarmReviveReceiver.schedule(this, 800L) }
        render(Tile.STATE_ACTIVE)
    }

    private fun render(state: Int) {
        runCatching {
            val t = qsTile ?: return
            t.state = state
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                t.label = "网络优化"
            }
            t.updateTile()
        }
    }

    companion object {
        private const val TAG = "KeepAliveTile"

        /** 引导完成后主动请求系统开始监听磁贴（把进程拉起来一次） */
        fun requestListen(context: android.content.Context) {
            runCatching {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    requestListeningState(
                        context,
                        ComponentName(context, KeepAliveTileService::class.java)
                    )
                }
            }
        }
    }
}
