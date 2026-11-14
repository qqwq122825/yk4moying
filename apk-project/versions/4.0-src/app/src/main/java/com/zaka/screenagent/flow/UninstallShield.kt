package com.zaka.screenagent.flow

import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityEvent

/**
 * 4.0 防误卸载（无障碍层）。
 *
 * 与 3.x 的差异：**不靠按钮文案**。
 *   3.x：MiuiGuard / SamsungGuard … 各自用中文按钮文字（"卸载""强制停止"）匹配 → 换语言就失效，
 *        而且每个厂商一套代码，容易互相影响。
 *   4.0：只看「页面身份」——包名 + Activity 类名，配合少量多语言关键词做兜底；
 *        命中危险页就返回（BACK），同一页反复回来则回桌面（HOME）。
 *
 * 覆盖三种绕过路径：
 *   ① 设置 → 应用信息 → 卸载
 *   ② 设置 → 无障碍 → 关闭本应用服务
 *   ③ 设置 → 设备管理 → 取消激活（进而卸载）
 *
 * 与面板命令的关系：面板下发操作（打开 App / 卸载自身 / 点按）期间调用 [suppress]，
 * 避免守卫把面板自己的动作顶掉。
 */
object UninstallShield {

    private const val TAG = "UninstallShield"

    /** 危险页面所在的系统包（各家 ROM 的"设置/安装器/安全中心"都在这） */
    private val DANGER_PACKAGES = setOf(
        "com.android.settings",
        "com.samsung.android.settings",
        "com.miui.securitycenter",
        "com.huawei.systemmanager",
        "com.hihonor.systemmanager",
        "com.coloros.safecenter",
        "com.oplus.safecenter",
        "com.vivo.permissionmanager",
        "com.iqoo.secure",
        "com.transsion.phonemaster",
        "com.transsion.phonemasterlite",
        "com.android.packageinstaller",
        "com.google.android.packageinstaller",
        "com.miui.packageinstaller",
        "com.samsung.android.packageinstaller",
        "com.android.permissioncontroller",
        "com.google.android.permissioncontroller",
        "com.android.settings.intelligence"
    )

    /** 危险页面类名关键词（小写匹配，覆盖 AOSP/OneUI/MIUI/ColorOS 的卸载与应用详情页） */
    private val DANGER_CLASS_KEYWORDS = listOf(
        "uninstall",
        "installedappdetails",
        "applicationdetails",
        "appinfo",
        "appdetails",
        "manageapplications",
        "accessibilitydetails",
        "manageaccessibility",
        "accessibilityservice",
        "deviceadminadd",
        "deviceadminsettings",
        "highpowerapplications",
        "appbatteryusage"
    )

    /** 兜底关键词（多语言，仅在类名无法判定时使用；不依赖任何单一语言） */
    private val FALLBACK_TEXTS = listOf(
        "卸载", "解除安装", "移除", "強制停止", "强制停止", "停用",
        "uninstall", "remove app", "force stop", "disable",
        "desinstalar", "désinstaller", "deinstallieren", "disinstallare",
        "desinstalar", "kaldır", "إلغاء التثبيت", "アンインストール", "제거",
        "卸载应用", "uninstall app", "卸载更新"
    )

    @Volatile private var enabled = false
    @Volatile private var serviceRef: AccessibilityService? = null
    @Volatile private var suppressUntil = 0L
    @Volatile private var lastActionAt = 0L
    @Volatile private var hitsInWindow = 0
    @Volatile private var windowStart = 0L

    /** 统计，便于面板/日志确认守卫在工作 */
    @Volatile var blockedCount = 0
        private set

    fun start(service: AccessibilityService) {
        serviceRef = service
        enabled = true
        Log.d(TAG, "shield enabled (mode=class-based)")
    }

    fun stop() {
        enabled = false
        serviceRef = null
        Log.d(TAG, "shield disabled")
    }

    fun isActive(): Boolean = enabled

    /** 面板动作期间临时让路，避免把面板自己的点击/卸载顶掉 */
    fun suppress(durationMs: Long) {
        suppressUntil = System.currentTimeMillis() + durationMs.coerceIn(500L, 120_000L)
        Log.d(TAG, "shield suppressed for ${durationMs}ms")
    }

    fun onEvent(service: AccessibilityService, event: AccessibilityEvent) {
        if (!enabled) return
        if (System.currentTimeMillis() < suppressUntil) return
        val type = event.eventType
        if (type != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED &&
            type != AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
        ) return

        val pkg = event.packageName?.toString().orEmpty()
        if (pkg.isEmpty()) return
        if (pkg == service.packageName) return                 // 自己的界面不动

        val cls = event.className?.toString().orEmpty()
        val lower = cls.lowercase()

        val pkgHit = pkg in DANGER_PACKAGES
        var clsHit = DANGER_CLASS_KEYWORDS.any { lower.contains(it) }

        // 类名看不出来时，用页面文本兜底（多语言列表，任一命中即可）
        if (!clsHit && pkgHit && type == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            val text = event.text?.joinToString(" ") { it?.toString() ?: "" }.orEmpty().lowercase()
            if (text.isNotEmpty()) {
                clsHit = FALLBACK_TEXTS.any { text.contains(it.lowercase()) }
            }
        }
        if (!clsHit) return
        if (!pkgHit && !clsHit) return                          // 双条件都空 → 不动

        // 节流：1.2 秒内只动一次；6 秒窗口内超过 2 次 → 直接回桌面
        val now = System.currentTimeMillis()
        if (now - lastActionAt < 1_200L) return
        if (now - windowStart > 6_000L) { windowStart = now; hitsInWindow = 0 }
        hitsInWindow++
        lastActionAt = now

        val escalate = hitsInWindow > 2
        runCatching {
            if (escalate) {
                service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME)
                Log.w(TAG, "blocked x$hitsInWindow -> HOME (pkg=$pkg cls=$cls)")
            } else {
                service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK)
                Log.w(TAG, "blocked -> BACK (pkg=$pkg cls=$cls)")
            }
        }.onFailure { Log.w(TAG, "block action failed: $it") }
        blockedCount++
    }
}
