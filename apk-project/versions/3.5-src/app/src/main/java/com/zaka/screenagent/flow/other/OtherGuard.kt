package com.zaka.screenagent.flow.other

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 其它厂商（OnePlus / OPPO / vivo / 华为 / 原生）的守卫装配。
 *
 * 这些 ROM 没有小米那种"危险页/无障碍页拦截"的强需求，
 * 直接用公共 AntiUninstallGuard（拦应用信息 / 卸载框 / 设备管理）。
 *
 * 结构上仍放在厂商目录里：以后要给某个 ROM 加自己的规则，
 * 只改这里 + VendorGuard 分派，不动公共代码。
 */
object OtherGuard {

    private const val TAG = "OtherGuard"

    fun start(service: BoundaryAccessibilityService) {
        Log.d(TAG, "start (公共 AntiUninstallGuard)")
        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.start(service) }
    }

    fun onWindowEvent(service: BoundaryAccessibilityService, pkg: String?, cls: String?) {
        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.onWindowEvent(service, pkg, cls) }
    }
}
