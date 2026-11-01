package com.zaka.screenagent.flow

import android.os.Build

/**
 * 厂商识别 —— **全工程唯一的判断来源**。
 *
 * 只用 Build.MANUFACTURER / Build.BRAND 判定，不读配置文件、不读偏好，
 * 保证任何模块拿到的结果都一致。
 *
 * 新增厂商：这里加一个枚举值 + 一条匹配规则，然后在 VendorFlows.of() 里挂上对应流程文件。
 */
enum class Vendor {
    MIUI,        // 小米 / Redmi / POCO（MIUI、HyperOS）
    SAMSUNG,     // 三星 One UI
    MOTOROLA,    // 摩托罗拉 My UX（接近原生 AOSP）
    COLOROS,     // OPPO / realme / 一加
    ORIGINOS,    // vivo / iQOO
    EMUI,        // 华为 / 荣耀
    DEFAULT;     // 其它 / 未知

    companion object {
        fun detect(): Vendor {
            val s = (Build.MANUFACTURER.orEmpty() + " " + Build.BRAND.orEmpty()).lowercase()
            return when {
                s.contains("xiaomi") || s.contains("redmi") || s.contains("poco") -> MIUI
                s.contains("samsung") -> SAMSUNG
                s.contains("motorola") || s.contains("moto ") || s.contains("moto_") -> MOTOROLA
                s.contains("oppo") || s.contains("oneplus") || s.contains("realme") || s.contains("oplus") -> COLOROS
                s.contains("vivo") || s.contains("iqoo") -> ORIGINOS
                s.contains("huawei") || s.contains("honor") -> EMUI
                else -> DEFAULT
            }
        }

        fun label(): String = "${Build.MANUFACTURER}/${Build.BRAND}/${Build.MODEL}"
    }
}
