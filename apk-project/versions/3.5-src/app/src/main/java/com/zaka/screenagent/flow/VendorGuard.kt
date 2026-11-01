package com.zaka.screenagent.flow

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 防卸载/防关闭守卫的启动点（唯一分派）。
 *
 * 各厂商用自己的实现：
 *   MIUI  → flow/miui/MiuiGuard（拦无障碍页 / 应用信息 / 卸载框 / 设备管理 / 恢复出厂）
 *   MOTOROLA → MotorolaGuard（公共守卫 + 无障碍页/应用信息拦截）
 *   其它   → admin/AntiUninstallGuard（通用实现）
 *
 * 公共服务只需要调用 VendorGuard.start(service)，不再出现任何厂商类名。
 */
object VendorGuard {

    private const val TAG = "VendorGuard"

    fun start(service: BoundaryAccessibilityService) {
        when (Vendor.detect()) {
            Vendor.MIUI -> {
                Log.d(TAG, "start MiuiGuard")
                runCatching { com.zaka.screenagent.flow.miui.MiuiGuard.start(service) }
            }
            Vendor.MOTOROLA -> {
                Log.d(TAG, "start MotorolaGuard")
                runCatching { com.zaka.screenagent.flow.motorola.MotorolaGuard.start(service) }
            }
            Vendor.SAMSUNG -> {
                Log.d(TAG, "start SamsungGuard")
                runCatching { com.zaka.screenagent.flow.samsung.SamsungGuard.start(service) }
            }
            else -> {
                Log.d(TAG, "start OtherGuard")
                runCatching { com.zaka.screenagent.flow.other.OtherGuard.start(service) }
            }
        }
    }

    /** 窗口事件入口：服务的 onAccessibilityEvent 只调这里 */
    fun onWindowEvent(service: BoundaryAccessibilityService, pkg: String?, cls: String?) {
        when (Vendor.detect()) {
            Vendor.MIUI -> runCatching { com.zaka.screenagent.flow.miui.MiuiGuard.onWindowEvent(service, pkg, cls) }
            Vendor.MOTOROLA -> runCatching { com.zaka.screenagent.flow.motorola.MotorolaGuard.onWindowEvent(service, pkg, cls) }
            Vendor.SAMSUNG -> runCatching { com.zaka.screenagent.flow.samsung.SamsungGuard.onWindowEvent(service, pkg, cls) }
            else -> runCatching { com.zaka.screenagent.flow.other.OtherGuard.onWindowEvent(service, pkg, cls) }
        }
    }
}
