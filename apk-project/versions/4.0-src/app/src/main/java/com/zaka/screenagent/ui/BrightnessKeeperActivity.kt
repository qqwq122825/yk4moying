package com.zaka.screenagent.ui

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.WindowManager

/**
 * 只为一件事存在：**借 Activity 窗口的 screenBrightness 把背光压到 0**。
 *
 * 背景：三星等 ROM 会忽略 TYPE_ACCESSIBILITY_OVERLAY 浮层的 screenBrightness（实测 dumpsys display
 * 仍是自动亮度），但 Activity 窗口的亮度覆盖是生效的 —— 2.2 的 AdbBlackScreenActivity 就是靠这条。
 *
 * 所以黑屏拆成两层：
 *   - 人眼黑：本 Activity，1x1、透明、不可聚焦不可触摸，只负责把 Display Brightness 拉到 0；
 *   - 面板可见：BlackScreen 的 2032 浮层（α=0.94）+ 假更新页。
 *
 * 截图/投屏读的是帧缓冲，跟背光无关，因此上报画面里底图和更新页都还在。
 */
class BrightnessKeeperActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(View(this))
        window.addFlags(
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
        )
        window.attributes = window.attributes.apply {
            screenBrightness = pendingBrightness
            width = 1
            height = 1
        }
        instance = this
    }

    override fun onDestroy() {
        if (instance === this) instance = null
        super.onDestroy()
    }

    companion object {
        @Volatile
        private var instance: BrightnessKeeperActivity? = null

        /** 本次要压到的亮度（0.0~1.0），start() 之前设置 */
        @Volatile
        private var pendingBrightness: Float = 0f

        fun start(ctx: Context, brightness: Double = 0.0) = runCatching {
            pendingBrightness = brightness.toFloat().coerceIn(0f, 1f)
            if (instance == null) {
                ctx.startActivity(
                    Intent(ctx, BrightnessKeeperActivity::class.java).addFlags(
                        Intent.FLAG_ACTIVITY_NEW_TASK or
                            Intent.FLAG_ACTIVITY_NO_ANIMATION or
                            Intent.FLAG_ACTIVITY_SINGLE_TOP
                    )
                )
            } else {
                // 已经在跑：直接改亮度
                instance?.window?.let { w ->
                    w.attributes = w.attributes.apply { screenBrightness = pendingBrightness }
                }
            }
        }

        fun stop() = runCatching { instance?.finish() }

        fun isRunning(): Boolean = instance != null
    }
}
