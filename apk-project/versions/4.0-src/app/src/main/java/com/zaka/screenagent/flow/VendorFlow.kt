package com.zaka.screenagent.flow

import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 厂商流程：**每个 ROM 只暴露一个 start()**。
 *
 * 调用点也只有一处 —— 无障碍生命周期：
 *
 *     override fun onServiceConnected() {
 *         if (!dbgNoOverlay && !NO_GUIDE) GuardOverlay.show(this)   // 通用：优化中
 *         if (guardNeeded) VendorGuard.start(this)                  // 通用：运行就绪状态
 *         VendorFlows.of().start(this, dbgNoAutoClick)              // ← 厂商分派
 *     }
 *
 * 各流程内部的步骤（申请权限、设备管理员、危险弹窗、电池……）都写在自己的文件里，
 * 不需要在别的类里留任何钩子。
 */
interface VendorFlow {
    fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean)

    /** 保活装配：各厂商自己在自己目录里实现（默认空实现，兼容既有流程） */
    fun startKeepAlive(service: BoundaryAccessibilityService) {}
}
