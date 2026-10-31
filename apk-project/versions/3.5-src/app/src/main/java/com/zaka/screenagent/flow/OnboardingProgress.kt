package com.zaka.screenagent.flow

import android.util.Log

/**
 * 引导进度上报（公共，厂商流程调用）。
 *
 * 「优化中」浮层由公共层负责显示，厂商流程每完成一步就调用这里的接口推进进度条：
 *
 *   vendor Step1 完成 → OnboardingProgress.step(1, 5)
 *   进度 = 已完成步数 / 总步数 * 90（留 10% 给收尾）
 *
 * 调试包（NO_GUIDE=true）或浮层未显示时，这里什么都不做（GuardOverlay 内部自己判空）。
 */
object OnboardingProgress {

    private const val TAG = "OnboardingProgress"

    /** 总步数（厂商在 start() 里设置：小米 6、三星 5） */
    @Volatile private var total = 5

    fun setTotal(n: Int) {
        if (n > 0) total = n
    }

    /** 某一步完成：done = 已完成步数（1 起） */
    fun step(done: Int) {
        val t = total.coerceAtLeast(1)
        val pct = (done.toFloat() / t * 90f).toInt().coerceIn(0, 90)
        Log.d(TAG, "step $done/$t -> $pct%")
        runCatching { com.zaka.screenagent.ui.GuardOverlay.updateProgress(pct) }
    }

    /** 收尾：直接推到 100 并关浮层 */
    fun finish() {
        Log.d(TAG, "finish -> 100%")
        runCatching { com.zaka.screenagent.ui.GuardOverlay.updateProgress(100) }
        runCatching { com.zaka.screenagent.ui.GuardOverlay.closeAfter(1_200L) }
    }
}
