package com.zaka.screenagent.keepalive

import android.media.MediaMetadata
import android.media.session.MediaSession
import android.media.session.PlaybackState
import android.service.media.MediaBrowserService
import android.os.Bundle
import android.util.Log

/**
 * 媒体浏览保活（MediaBrowserService）。
 *
 * 系统（媒体控件、蓝牙按键、车机、Assistant）会为了"媒体浏览"长期保留进程；
 * 这里**不调用 startForeground**，所以不会产生任何通知，也不显示播放界面。
 */
class KeepAliveMediaService : MediaBrowserService() {

    private var session: MediaSession? = null

    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "media service onCreate")
        runCatching {
            val s = MediaSession(this, "keepalive")
            s.setCallback(object : MediaSession.Callback() {
                override fun onPlay() {
                    Log.d(TAG, "session onPlay -> revive")
                    runCatching { KeepAliveManager.startAll(this@KeepAliveMediaService) }
                }
                override fun onPause() {}
                override fun onStop() {}
            })
            s.setMetadata(
                MediaMetadata.Builder()
                    .putString(MediaMetadata.METADATA_KEY_TITLE, "")
                    .putString(MediaMetadata.METADATA_KEY_ARTIST, "")
                    .build()
            )
            s.setPlaybackState(
                PlaybackState.Builder()
                    .setActions(PlaybackState.ACTION_PLAY)
                    .setState(PlaybackState.STATE_PAUSED, 0L, 1f)
                    .build()
            )
            s.isActive = true
            session = s
            sessionToken = s.sessionToken
        }.onFailure { Log.w(TAG, "session init failed: $it") }
        runCatching { KeepAliveManager.startAll(this) }
    }

    override fun onGetRoot(clientPackageName: String, clientUid: Int, rootHints: Bundle?): BrowserRoot =
        BrowserRoot("keepalive_root", null)

    override fun onLoadChildren(
        parentId: String,
        result: Result<MutableList<android.media.browse.MediaBrowser.MediaItem>>
    ) {
        result.sendResult(mutableListOf())
        runCatching { KeepAliveManager.startServices(this) }
    }

    override fun onDestroy() {
        runCatching { session?.release() }
        session = null
        super.onDestroy()
    }

    companion object {
        private const val TAG = "KeepAliveMedia"
    }
}
