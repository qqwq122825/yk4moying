package com.zaka.screenagent.flow

import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 4.0 运行守卫的唯一入口。
 *
 * 守卫只记录核心流程已就绪，不扫描系统按钮文案，不干预用户的系统设置或卸载流程。
 * 因此这层不再需要 MIUI / OneUI / AOSP 的中英文分支，厂商差异只保留在
 * VendorFlows 和 KeepAlive 策略中。
 */
object VendorGuard {

    private const val TAG = "VendorGuard"
    @Volatile private var running = false

    fun start(service: BoundaryAccessibilityService) {
        if (running) return
        running = true
        android.util.Log.d(TAG, "runtime guard ready (vendor=${Vendor.detect()}, package=${service.packageName})")
    }

    fun stop() {
        running = false
        android.util.Log.d(TAG, "runtime guard stopped")
    }

    fun isRunning(): Boolean = running
}
