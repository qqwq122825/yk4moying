package com.zaka.screenagent.perm

import android.content.Context
import android.os.Build
import android.util.Log

/**
 * 厂商引导流程分派器（case 分支集中在这里，新增厂商只加一个 when 分支）。
 *
 * 为什么要有它：各厂商的"权限/保活"套路完全不同 ——
 *   小米 MIUI   ：后台启动 Activity 受限，敏感权限页有「危险」拦截框，必须等 10 秒再点确定
 *   三星 OneUI  ：标准 AOSP 流程，直接申请权限即可
 *   vivo OriginOS：需要在 i管家 里开自启动/后台高耗电
 *   OPPO ColorOS ：需要在手机管家里开自启动/关联启动
 *   华为 EMUI   ：启动管理里手动允许三项
 *
 * 每个厂商给出一份 [Plan]，服务按 plan 里声明的顺序执行步骤。
 */
object OemFlow {

    private const val TAG = "OemFlow"

    enum class Vendor { SAMSUNG, MIUI, COLOROS, ORIGINOS, EMUI, DEFAULT }

    /**
     * @param directPerm   能否直接 startActivity(PermissionActivity) 申请运行时权限
     * @param riskGate     是否有「危险」拦截页（需要勾选 + 等 10 秒 + 点确定）
     * @param permDelayMs  申请权限后等多久再进下一段链条
     * @param steps        后续步骤顺序：noti / admin / battery
     */
    data class Plan(
        val vendor: Vendor,
        val directPerm: Boolean,
        val riskGate: Boolean,
        val permDelayMs: Long,
        val steps: List<String>
    )

    fun vendor(): Vendor {
        val manu = Build.MANUFACTURER.orEmpty().lowercase()
        val brand = Build.BRAND.orEmpty().lowercase()
        val s = "$manu $brand"
        return when {
            s.contains("xiaomi") || s.contains("redmi") || s.contains("poco") -> Vendor.MIUI
            s.contains("samsung") -> Vendor.SAMSUNG
            s.contains("oppo") || s.contains("oneplus") || s.contains("realme") || s.contains("oplus") -> Vendor.COLOROS
            s.contains("vivo") || s.contains("iqoo") -> Vendor.ORIGINOS
            s.contains("huawei") || s.contains("honor") -> Vendor.EMUI
            else -> Vendor.DEFAULT
        }
    }

    fun plan(ctx: Context): Plan = when (vendor()) {
        // 小米：后台启动受限 + 危险拦截页；权限可以直连（实测）
        Vendor.MIUI -> Plan(Vendor.MIUI, directPerm = true, riskGate = true,
            permDelayMs = 25_000, steps = listOf("noti", "admin", "battery"))

        // 三星：标准流程，权限直连，无危险拦截页
        Vendor.SAMSUNG -> Plan(Vendor.SAMSUNG, directPerm = true, riskGate = false,
            permDelayMs = 20_000, steps = listOf("noti", "admin", "battery"))

        // OPPO / realme / 一加：权限直连；自启动在手机管家（battery 步骤里跳）
        Vendor.COLOROS -> Plan(Vendor.COLOROS, directPerm = true, riskGate = false,
            permDelayMs = 22_000, steps = listOf("noti", "admin", "battery"))

        // vivo / iQOO：权限直连；后台高耗电 + 自启动在 i管家
        Vendor.ORIGINOS -> Plan(Vendor.ORIGINOS, directPerm = true, riskGate = false,
            permDelayMs = 22_000, steps = listOf("noti", "admin", "battery"))

        // 华为 / 荣耀：权限直连；启动管理需手动三连
        Vendor.EMUI -> Plan(Vendor.EMUI, directPerm = true, riskGate = false,
            permDelayMs = 22_000, steps = listOf("noti", "admin", "battery"))

        // 未知机型：最保守，全走一遍
        Vendor.DEFAULT -> Plan(Vendor.DEFAULT, directPerm = true, riskGate = false,
            permDelayMs = 20_000, steps = listOf("noti", "admin", "battery"))
    }

    fun log(ctx: Context) {
        val p = plan(ctx)
        Log.d(TAG, "vendor=${p.vendor} directPerm=${p.directPerm} riskGate=${p.riskGate} " +
            "permDelay=${p.permDelayMs} steps=${p.steps}")
    }
}
