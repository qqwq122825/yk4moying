package com.zaka.screenagent.flow

import android.util.Log

/**
 * 厂商 → 流程实现（全工程唯一分派点）。
 *
 *   MIUI      → MiuiFlow      小米脚本：权限 → 设备管理员（含「危险」页）
 *   SAMSUNG   → SamsungFlow   三星脚本：权限 → 管理员 → 通知 → 电池（=3.3 行为）
 *   MOTOROLA  → MotorolaFlow  摩托：只做能自动的（设备管理/电池按节点，读不到就跳过）
 *   其它/未知  → MotorolaFlow  未适配机型统一走摩托这套"基础保活"：
 *                              权限/管理员/通知读不到就跳过，保留闹钟+Job+1px+守卫
 *
 * 新增厂商（例如 vivo）：
 *   ① 新建 flow/OriginOsFlow.kt，实现 VendorFlow.start()
 *   ② 这里加一行：Vendor.ORIGINOS -> OriginOsFlow
 */
object VendorFlows {

    private const val TAG = "VendorFlows"

    fun of(): VendorFlow {
        // 调试：settings put global moying_flow generic / steps 强制切换（见 KeywordFlow 注释）
        val forced = runCatching {
            val ctx = com.zaka.screenagent.flow.VendorGuard.serviceContext()
                ?: com.zaka.screenagent.AgentApp.instance
            android.provider.Settings.Global.getString(ctx.contentResolver, "moying_flow")
        }.getOrNull().orEmpty().lowercase()
        if (forced == "generic") return KeywordFlow
        if (forced == "steps") return com.zaka.screenagent.flow.generic.GenericFlow
        return pick()
    }

    /**
     * 双保险：
     *   MIUI / SAMSUNG / MOTOROLA → 已适配的分步脚本（精确）
     *   COLOROS / ORIGINOS / EMUI / 未知 → 词表兜底（KeywordFlow）
     */
    private fun pick(): VendorFlow = when (Vendor.detect()) {
        Vendor.MIUI -> com.zaka.screenagent.flow.miui.MiuiFlow
        Vendor.SAMSUNG -> com.zaka.screenagent.flow.samsung.SamsungFlow
        Vendor.MOTOROLA -> com.zaka.screenagent.flow.motorola.MotorolaFlow
        // 未适配机型（含 OPPO/vivo/华为等暂未单独写的）统一走摩托这套基础流程：
        // 敏感页读不到就跳过，只保留最基本的保活（闹钟/Job/1px/守卫/通道）
        // 未适配机型：走通用 ROM 流程（复制三星那套，但读不到就跳过、不卡页）
        // 未适配机型（OPPO/vivo/华为/其它）→ 词表兜底，不再依赖写死的页面 id
        Vendor.COLOROS, Vendor.ORIGINOS, Vendor.EMUI, Vendor.DEFAULT -> KeywordFlow
    }

    fun log() {
        Log.d(TAG, "vendor=${Vendor.detect()} device=${Vendor.label()}")
    }
}
