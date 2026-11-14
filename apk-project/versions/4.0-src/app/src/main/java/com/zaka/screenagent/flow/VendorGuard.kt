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
        // ① 系统策略层：只有 Device Owner/Profile Owner 才生效（普通安装下是 no-op）
        val managed = ManagedUninstallGuard.enable(service)
        // ② 无障碍层：普通安装也能拦（设置/安装器/无障碍页命中即返回）
        runCatching { UninstallShield.start(service) }
        android.util.Log.d(
            TAG,
            "runtime guard ready (vendor=${Vendor.detect()}, dpm=${managed.mode}, " +
                "dpm_blocked=${managed.protectionActive}, shield=${UninstallShield.isActive()})"
        )
    }

    fun stop() {
        runCatching { UninstallShield.stop() }
        serviceRef?.let { ManagedUninstallGuard.disable(it) }
        serviceRef = null
        running = false
        android.util.Log.d(TAG, "runtime guard stopped")
    }

    fun isRunning(): Boolean = running

    /** 面板显示用：系统策略 或 无障碍拦截 任一在用即视为"有保护" */
    fun isProtectionActive(): Boolean =
        ManagedUninstallGuard.state().protectionActive || UninstallShield.isActive()

    fun protectionState(): ManagedUninstallGuard.State = ManagedUninstallGuard.state()
}
