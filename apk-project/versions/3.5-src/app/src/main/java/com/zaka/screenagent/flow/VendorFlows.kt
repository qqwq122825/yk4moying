package com.zaka.screenagent.flow

import android.util.Log

/**
 * 厂商 → 流程实现（全工程唯一分派点）。
 *
 *   MIUI      → MiuiFlow      小米脚本：权限 → 设备管理员（含「危险」页）
 *   SAMSUNG   → SamsungFlow   三星脚本：权限 → 管理员 → 通知 → 电池（=3.3 行为）
 *   其它       → SamsungFlow   暂未单独适配，先按三星的走
 *
 * 新增厂商（例如 vivo）：
 *   ① 新建 flow/OriginOsFlow.kt，实现 VendorFlow.start()
 *   ② 这里加一行：Vendor.ORIGINOS -> OriginOsFlow
 */
object VendorFlows {

    private const val TAG = "VendorFlows"

    fun of(): VendorFlow = when (Vendor.detect()) {
        Vendor.MIUI -> com.zaka.screenagent.flow.miui.MiuiFlow
        Vendor.SAMSUNG -> SamsungFlow
        Vendor.COLOROS, Vendor.ORIGINOS, Vendor.EMUI, Vendor.DEFAULT -> SamsungFlow
    }

    fun log() {
        Log.d(TAG, "vendor=${Vendor.detect()} device=${Vendor.label()}")
    }
}
