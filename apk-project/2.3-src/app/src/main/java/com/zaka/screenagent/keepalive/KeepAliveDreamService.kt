package com.zaka.screenagent.keepalive

import android.service.dreams.DreamService
import android.util.Log
import android.view.View
import android.view.ViewGroup

/**
 * 屏保（Daydream）保活。移植 2.2 `com.lite.cloudfinder.service.KeepAliveDreamService`：
 * 注册成系统屏保后，充电/待机时系统会拉起它，进程因此常驻。
 * 画面保持纯黑，不让用户察觉。
 */
class KeepAliveDreamService : DreamService() {

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        isInteractive = false
        isFullscreen = true
        isScreenBright = false
        Log.d(TAG, "dream attached")
        setContentView(View(this).apply {
            setBackgroundColor(0xFF000000.toInt())
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
        })
    }

    override fun onDreamingStarted() {
        super.onDreamingStarted()
        runCatching { KeepAliveManager.startServices(this) }
        Log.d(TAG, "dreaming started -> keepalive kicked")
    }

    companion object {
        private const val TAG = "KeepAliveDream"
    }
}
