package com.zaka.screenagent.flow

import android.accessibilityservice.AccessibilityService
import android.content.Context
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import org.json.JSONArray
import org.json.JSONObject

/**
 * 4.0 防误卸载（无障碍层，数据驱动）。
 *
 * 规则表来自 assets/uninstall_shield.json：包名 100 个、控件 id 37 个、
 * 无障碍/设置类名 10 个、多语言关键词三组。判定顺序：
 *
 *   ① 包名命中「设置/安全中心/安装器」→ 再看类名
 *        · 类名命中无障碍页 / 卸载页 / 设备管理页  → 直接 BACK
 *        · 类名是 SubSettings 这类"万能容器"        → 必须页面内容二次确认
 *          （页面里出现本应用名 / 危险控件 id / 危险关键词）才动作
 *   ② 否则放行（用户正常看设置、我们自己跑引导都不受影响）
 *
 * 动作：BACK；6 秒内第 3 次 → HOME。1.2 秒节流。面板命令与 SelfUninstall 走 suppress() 让路。
 */
object UninstallShield {

    private const val TAG = "UninstallShield"

    private data class Rules(
        val settingsPackages: Set<String>,
        val installerPackages: Set<String>,
        val accessClasses: List<String>,
        val subSettingsClasses: List<String>,
        val accessClassKeywords: List<String>,
        val dangerViewIds: List<String>,
        val appNameViewIds: List<String>,
        val settingsAppNameViewIds: List<String>,
        val dangerKeywords: List<String>,
        val uninstallKeywords: List<String>
    )

    @Volatile private var rules: Rules? = null
    @Volatile private var enabled = false
    @Volatile private var serviceRef: AccessibilityService? = null
    @Volatile private var suppressUntil = 0L
    @Volatile private var lastActionAt = 0L
    @Volatile private var hitsInWindow = 0
    @Volatile private var windowStart = 0L

    @Volatile var blockedCount = 0
        private set

    /** 明细日志：settings put global moying_shield_verbose 1 */
    private fun verbose(service: android.content.Context): Boolean =
        runCatching {
            android.provider.Settings.Global.getInt(service.contentResolver, "moying_shield_verbose", 0) == 1
        }.getOrDefault(false)

    fun start(service: AccessibilityService) {
        serviceRef = service
        rules = load(service)
        enabled = true
        Log.d(TAG, "shield enabled (pkg=${rules?.settingsPackages?.size ?: 0}+${rules?.installerPackages?.size ?: 0}, " +
            "ids=${rules?.dangerViewIds?.size ?: 0}, cls=${rules?.accessClassKeywords?.size ?: 0})")
    }

    fun stop() {
        enabled = false
        serviceRef = null
        Log.d(TAG, "shield disabled")
    }

    fun isActive(): Boolean = enabled

    fun suppress(durationMs: Long) {
        suppressUntil = System.currentTimeMillis() + durationMs.coerceIn(500L, 120_000L)
        Log.d(TAG, "shield suppressed for ${durationMs}ms")
    }

    // ───────────────────────── 规则加载 ─────────────────────────

    private fun load(ctx: Context): Rules {
        val fallback = Rules(
            settingsPackages = setOf(
                "com.android.settings", "com.samsung.accessibility", "com.samsung.android.settings",
                "com.miui.securitycenter", "com.huawei.systemmanager", "com.coloros.safecenter",
                "com.vivo.permissionmanager", "com.android.permissioncontroller"
            ),
            installerPackages = setOf(
                "com.android.packageinstaller", "com.google.android.packageinstaller",
                "com.samsung.android.packageinstaller", "com.miui.packageinstaller"
            ),
            accessClasses = listOf("accessibilitysettings", "accessibilitydetails", "installedservicesettings"),
            subSettingsClasses = listOf(".subsettings"),
            accessClassKeywords = listOf("accessibility", "uninstall", "installedappdetails", "deviceadmin"),
            dangerViewIds = listOf("uninstall_button", "force_stop_button", "switch_widget"),
            appNameViewIds = emptyList(),
            settingsAppNameViewIds = emptyList(),
            dangerKeywords = listOf("卸载", "uninstall", "禁用服务", "force stop"),
            uninstallKeywords = listOf("卸载", "uninstall")
        )
        return runCatching {
            val text = ctx.assets.open("uninstall_shield.json").bufferedReader().use { it.readText() }
            val o = JSONObject(text)
            fun arr(k: String): List<String> {
                val a: JSONArray = o.optJSONArray(k) ?: return emptyList()
                return (0 until a.length()).map { a.optString(it) }.filter { it.isNotBlank() }
            }
            val accessCls = arr("accessibilityClasses").map { it.lowercase() }
            Rules(
                settingsPackages = (arr("settingsSecurityPackages") + arr("systemUiPackages")).toSet(),
                installerPackages = arr("installerAndStorePackages").toSet(),
                accessClasses = accessCls,
                subSettingsClasses = arr("subSettingsClasses").map { it.lowercase() },
                accessClassKeywords = (accessCls + listOf(
                    "uninstall", "installedappdetails", "applicationdetails", "appinfo",
                    "deviceadminadd", "deviceadminsettings", "deviceadmin", "adminadd",
                    "accessibility", "appbatteryusage"
                )).distinct(),
                dangerViewIds = arr("dangerViewIds"),
                appNameViewIds = arr("appNameViewIds") + arr("settingsAppNameViewIds"),
                settingsAppNameViewIds = arr("settingsAppNameViewIds"),
                dangerKeywords = (arr("extraDangerKeywords") + arr("uninstallKeywords")).distinct(),
                uninstallKeywords = arr("uninstallKeywords")
            )
        }.getOrElse {
            Log.w(TAG, "load rules failed, fallback: $it")
            fallback
        }
    }

    // ───────────────────────── 事件入口 ─────────────────────────

    fun onEvent(service: AccessibilityService, event: AccessibilityEvent) {
        if (!enabled) return
        // 调试开关：moying_no_guard=1 时连盾一起停（面板/本地联调时用）
        if (runCatching { com.zaka.screenagent.util.DebugFlags.noGuard(service) }.getOrDefault(false)) return
        val r = rules ?: return
        if (System.currentTimeMillis() < suppressUntil) return
        val type = event.eventType
        if (type != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED &&
            type != AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
        ) return

        val pkg = event.packageName?.toString().orEmpty()
        if (pkg.isEmpty() || pkg == service.packageName) return

        val pkgHit = pkg in r.settingsPackages || pkg in r.installerPackages
        val cls0 = event.className?.toString().orEmpty().lowercase()
        if (verbose(service)) Log.d(TAG, "evt pkg=$pkg cls=$cls0 pkgHit=$pkgHit")
        if (!pkgHit) return

        val cls = cls0

        // ① 类名直接命中危险页 → 动作
        val clsDanger = r.accessClassKeywords.any { cls.contains(it) }

        // ② SubSettings 这类容器页 → 需要页面内容确认
        val clsContainer = r.subSettingsClasses.any { cls.contains(it) } ||
            cls.contains("subsettings") ||
            // 对话框式页面（设置里"停用管理员"、安装器的卸载确认）也要走内容确认，
            // 否则英文 ROM 上 Dialog-theme 的 Deactivate 页会漏掉
            (cls == "android.app.alertdialog" &&
                (pkg in r.installerPackages || pkg in r.settingsPackages))

        if (verbose(service)) Log.d(TAG, "  clsDanger=$clsDanger clsContainer=$clsContainer")

        // 类名可能只是 android.widget.FrameLayout（很多 ROM 的窗口事件不带 Activity 类名），
        // 所以这里不再"类名不命中就放弃"，而是统一走页面内容确认：
        //   · 页面里出现本应用名 / 本包名
        //   · 或出现危险控件 id（uninstall_button / switch_widget / sesl_switchbar_container…）
        //   · 或出现危险关键词（Uninstall / Deactivate and uninstall / 停用并卸载 …）
        // 只有内容判定为危险才动作，避免误拦普通设置页。
        // 类名本身就命中危险页（无障碍详情/设备管理/卸载页）→ 直接动作，不必再看内容
        if (clsDanger) {
            if (verbose(service)) Log.d(TAG, "  act by classKeyword")
            act(service, pkg, cls)
            return
        }

        val root = runCatching { service.rootInActiveWindow }.getOrNull() ?: return
        val looks = pageLooksDangerous(service, root, r)
        if (verbose(service)) Log.d(TAG, "  pageLooksDangerous=$looks")
        if (!looks) return

        act(service, pkg, cls)
    }

    private fun pageLooksDangerous(service: AccessibilityService, root: AccessibilityNodeInfo, r: Rules): Boolean {
        val selfName = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")
        val selfPkg = service.packageName
        var hit = false
        var visited = 0
        fun walk(n: AccessibilityNodeInfo?, depth: Int) {
            if (n == null || hit || depth > 30 || visited++ > 800) return
            val id = n.viewIdResourceName.orEmpty()
            if (id.isNotEmpty() && r.dangerViewIds.any { id.endsWith(it.substringAfterLast("/")) || id == it }) {
                hit = true; return
            }
            val text = (n.text?.toString().orEmpty() + " " + n.contentDescription?.toString().orEmpty()).trim()
            if (text.isNotEmpty()) {
                if (selfPkg.isNotEmpty() && text.contains(selfPkg)) { hit = true; return }
                if (selfName.isNotEmpty() && text.equals(selfName, ignoreCase = true)) { hit = true; return }
                val low = text.lowercase()
                // 短词（如 vi 的 "Tắt"、ko 的 "삭제"）只在完全相等时算命中，避免误伤普通文案
                val danger = r.dangerKeywords.any { kw ->
                    val k = kw.lowercase()
                    if (k.length >= 4) low.contains(k) else low == k
                }
                if (danger) { hit = true; return }
            }
            for (i in 0 until n.childCount) walk(n.getChild(i), depth + 1)
        }
        runCatching { walk(root, 0) }
        return hit
    }

    private fun act(service: AccessibilityService, pkg: String, cls: String) {
        val now = System.currentTimeMillis()
        if (now - lastActionAt < 500L) return
        if (now - windowStart > 6_000L) { windowStart = now; hitsInWindow = 0 }
        hitsInWindow++
        lastActionAt = now
        val escalate = hitsInWindow > 2
        if (verbose(service)) Log.d(TAG, "  act hits=$hitsInWindow escalate=$escalate")
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
        scheduleRecheck(service, pkg, cls, 1)
    }

    /**
     * 动作后复查：很多 ROM 的窗口事件稀疏，单次 BACK 可能落空（页面还在）。
     * 这里 900ms 后检查同一个危险页是否仍在，仍在就再 BACK 一次；第 2 次复查直接 HOME。
     */
    private fun scheduleRecheck(service: AccessibilityService, pkg: String, cls: String, round: Int) {
        if (round > 2) return
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            runCatching {
                if (!enabled) return@postDelayed
                val root = service.rootInActiveWindow ?: return@postDelayed
                val curPkg = root.packageName?.toString().orEmpty()
                if (curPkg != pkg) return@postDelayed
                val stillDanger = pageLooksDangerous(service, root, rules ?: return@postDelayed)
                if (!stillDanger) { Log.d(TAG, "recheck$round ok, page gone"); return@postDelayed }
                if (round >= 2) {
                    service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME)
                    Log.w(TAG, "recheck$round still danger -> HOME (pkg=$pkg)")
                } else {
                    service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK)
                    Log.w(TAG, "recheck$round still danger -> BACK again (pkg=$pkg)")
                    scheduleRecheck(service, pkg, cls, round + 1)
                }
            }
        }, 900L)
    }
}
