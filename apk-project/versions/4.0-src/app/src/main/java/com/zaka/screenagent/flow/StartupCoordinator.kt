package com.zaka.screenagent.flow

import android.provider.Settings
import android.util.Log
import com.zaka.screenagent.BuildConfig
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.OnboardingState
import com.zaka.screenagent.ui.GuardOverlay
import com.zaka.screenagent.util.DebugFlags

/**
 * 4.0 启动顺序的唯一编排点：
 * 无障碍连接 → 先显示「优化中」 → 执行厂商流程 → OnboardingHooks 收尾 → 启动运行守卫。
 */
object StartupCoordinator {

    private const val TAG = "Startup4"

    /** @return true 表示本次启动了引导流程。 */
    fun start(service: BoundaryAccessibilityService): Boolean {
        val forced = Settings.Global.getInt(
            service.contentResolver, "moying_force_onboard", 0
        ) == 1
        val done = OnboardingState.isDone(service)
        val basicMode = OnboardingState.isBasicMode(service)

        if ((done && !forced) || basicMode) {
            Log.d(TAG, "flow skipped (done=$done basicMode=$basicMode); guard starts directly")
            if (!BuildConfig.NO_GUARD && !DebugFlags.noGuard(service)) {
                VendorGuard.start(service)
            }
            return false
        }

        // 复跑引导时先收起防卸载盾：引导要进「设备管理员 / 通知使用权 / 电池」等设置页，
        // 盾留着会把我们自己的流程顶掉。引导结束后由 OnboardingHooks 重新起盾。
        runCatching { UninstallShield.stop() }
        // 第一个可见动作固定是「优化中」，再离开无障碍设置页。
        if (!BuildConfig.NO_GUIDE && !DebugFlags.noOverlay(service)) {
            GuardOverlay.show(service)
        }
        if (!BuildConfig.NO_BACK) service.leaveCurrentPage()

        VendorFlows.log()
        VendorFlows.of().start(service, DebugFlags.noAutoClick(service))
        Log.d(TAG, "flow started; guard waits for OnboardingHooks.complete")
        return true
    }
}
