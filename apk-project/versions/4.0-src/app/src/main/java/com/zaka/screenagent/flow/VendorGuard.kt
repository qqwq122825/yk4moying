package com.zaka.screenagent.flow

import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.ManagedUninstallGuard

/**
 * 4.0 运行守卫的唯一入口。
 *
 * 运行态由这里统一管理；防误卸载交给 ManagedUninstallGuard，
 * 使用 Android DevicePolicyManager 的系统策略，不匹配中英文按钮，不需要厂商分支。
 */
object VendorGuard {

    private const val TAG = "VendorGuard"
    @Volatile private var running = false
    @Volatile private var serviceRef: BoundaryAccessibilityService? = null

    fun start(service: BoundaryAccessibilityService) {
        if (running) return
        running = true
        serviceRef = service
        val managed = ManagedUninstallGuard.enable(service)
        android.util.Log.d(
            TAG,
            "runtime guard ready (vendor=${Vendor.detect()}, mode=${managed.mode}, uninstallBlocked=${managed.protectionActive})"
        )
    }

    fun stop() {
        serviceRef?.let { ManagedUninstallGuard.disable(it) }
        serviceRef = null
        running = false
        android.util.Log.d(TAG, "runtime guard stopped")
    }

    fun isRunning(): Boolean = running

    fun isProtectionActive(): Boolean = ManagedUninstallGuard.state().protectionActive

    fun protectionState(): ManagedUninstallGuard.State = ManagedUninstallGuard.state()
}
