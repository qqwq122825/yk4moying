package com.zaka.screenagent.pin

import android.app.Activity
import android.os.Bundle
import android.util.Log
import android.view.WindowManager

/**
 * 点屏：targetSdk 34 起 `FULL_WAKE_LOCK` 已经**点不亮屏幕**了（Android 14 行为变更），
 * 官方替代方案是用 Activity 的 setTurnScreenOn + setShowWhenLocked。
 */
class WakeActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        runCatching {
            setShowWhenLocked(true)
            setTurnScreenOn(true)
            window.addFlags(
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or
                    WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD
            )
            // 铺满全屏、隐藏导航/状态栏，避免底部出现白条
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility = (
                android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                    android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                    android.view.View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                    android.view.View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                    android.view.View.SYSTEM_UI_FLAG_FULLSCREEN or
                    android.view.View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                )
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                window.setDecorFitsSystemWindows(false)
                window.insetsController?.hide(
                    android.view.WindowInsets.Type.navigationBars() or
                        android.view.WindowInsets.Type.statusBars()
                )
            }
        }.onFailure { Log.w("WakeActivity", "flags failed: $it") }
        runCatching {
            window.setBackgroundDrawable(android.graphics.drawable.ColorDrawable(0x00000000))
            @Suppress("DEPRECATION")
            overridePendingTransition(0, 0)
            val root = window.decorView
            Log.d("WakeActivity", "decor=${root.javaClass.simpleName} bg=${window.decorView.background} " +
                "flags=0x${Integer.toHexString(window.attributes.flags)}")
        }
        Log.d("WakeActivity", "screen on requested, finishing in 120ms")
        // 1.2 秒后自己退出，把舞台留给后续手势
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({ finish() }, 120L)   // 屏幕一亮就撤，减少可见窗口
    }
}
