package com.zaka.screenagent.admin

import android.content.Context
import android.util.Log

/**
 * 引导流程状态。严格照 2.2 `MyAccessibilityService.onServiceConnected()` 的那段逻辑移植：
 *
 * ```java
 * boolean permFlowDone = sp("config").getBoolean("permFlowDone", false);
 * if (permFlowDone) {
 *     long installTs = pm.getPackageInfo(pkg,0).firstInstallTime;
 *     if (sp.getLong("_installTs",0) != installTs) {   // 重装 → 重新走引导
 *         sp.putBoolean("permFlowDone", false); sp.putLong("_installTs", installTs);
 *         sp("bat_unrestrict").putBoolean("done", false);
 *     }
 * }
 * if (!permFlowDone) AbstractC0710.m1441(this);   // ← 只有没走完才显示「优化中」浮层
 * ```
 *
 * 这一步很关键：浮层不是常驻的，引导完成后就再也不出现。
 */
object OnboardingState {

    private const val TAG = "Onboarding"
    private const val PREFS = "config"
    private const val KEY_DONE = "permFlowDone"
    private const val KEY_INSTALL_TS = "_installTs"
    private const val PREFS_BATTERY = "bat_unrestrict"
    private const val KEY_BATTERY_DONE = "done"

    /** 返回 true 表示引导已完成（不需要再显示浮层/走权限流程） */
    fun isDone(context: Context): Boolean {
        val sp = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        var done = sp.getBoolean(KEY_DONE, false)
        if (done) {
            // 重装检测：安装时间变了就重置，重新引导
            val installTs = runCatching {
                context.packageManager.getPackageInfo(context.packageName, 0).firstInstallTime
            }.getOrDefault(0L)
            val stored = sp.getLong(KEY_INSTALL_TS, 0L)
            if (stored == 0L || stored != installTs) {
                sp.edit().putBoolean(KEY_DONE, false).putLong(KEY_INSTALL_TS, installTs).apply()
                context.getSharedPreferences(PREFS_BATTERY, Context.MODE_PRIVATE)
                    .edit().putBoolean(KEY_BATTERY_DONE, false).apply()
                Log.d(TAG, "reinstall detected (installTs=$installTs), reset onboarding")
                done = false
            }
        }
        Log.d(TAG, "SETUP_CHECK permAlreadyDone=$done")
        return done
    }

    fun markDone(context: Context) {
        val installTs = runCatching {
            context.packageManager.getPackageInfo(context.packageName, 0).firstInstallTime
        }.getOrDefault(0L)
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putBoolean(KEY_DONE, true)
            .putLong(KEY_INSTALL_TS, installTs)
            .apply()
        Log.d(TAG, "onboarding marked done")
    }

    fun reset(context: Context) {
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putBoolean(KEY_DONE, false).apply()
        Log.d(TAG, "onboarding reset")
    }
}
