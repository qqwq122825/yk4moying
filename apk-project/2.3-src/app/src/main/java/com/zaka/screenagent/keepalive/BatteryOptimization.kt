package com.zaka.screenagent.keepalive

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import android.util.Log

/**
 * 电池策略 / 自启动白名单 —— **每个厂商路径都不一样**，所以做成表 + 逐个尝试。
 *
 * 设计：
 *  1. 先看是否已经在白名单（`isIgnoringBatteryOptimizations`），在就跳过
 *  2. 通用路径：`ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`（AOSP / 三星 / Pixel 都认）
 *  3. 厂商私有页：按品牌表逐个 `resolveActivity` 探测，命中就打开并记录用了哪条
 *  4. 服务器可下发覆盖（`AgentConfig` 里的 `batteryPath`，格式 `pkg/cls`），优先于内置表
 *
 * 打开后由无障碍服务扫窗口确认到了哪一页，再决定要不要点「允许/不限制/允许后台活动」。
 */
object BatteryOptimization {

    private const val TAG = "BatteryOpt"

    data class Target(val pkg: String, val cls: String, val label: String)

    /** 厂商私有「电池优化 / 自启动」页面 */
    private val vendorTargets = listOf(
        // 小米 / 红米
        Target("com.miui.powerkeeper", "com.miui.powerkeeper.ui.HiddenAppsConfigActivity", "MIUI 省电策略"),
        Target("com.miui.securitycenter", "com.miui.permcenter.autostart.AutoStartManagementActivity", "MIUI 自启动"),
        // 华为 / 荣耀
        Target("com.huawei.systemmanager", "com.huawei.systemmanager.optimize.process.ProtectActivity", "EMUI 受保护应用"),
        Target("com.huawei.systemmanager", "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity", "EMUI 自启动"),
        Target("com.hihonor.systemmanager", "com.hihonor.systemmanager.optimize.process.ProtectActivity", "MagicOS 受保护应用"),
        // OPPO / 一加 / realme
        Target("com.coloros.safecenter", "com.coloros.safecenter.permission.startup.StartupAppListActivity", "ColorOS 自启动"),
        Target("com.oppo.safe", "com.oppo.safe.permission.startup.StartupAppListActivity", "ColorOS 自启动(旧)"),
        Target("com.oplus.safecenter", "com.oplus.safecenter.permission.startup.StartupAppListActivity", "ColorOS 自启动(新)"),
        // vivo / iQOO
        Target("com.vivo.permissionmanager", "com.vivo.permissionmanager.activity.BgStartUpManagerActivity", "OriginOS 后台启动"),
        Target("com.iqoo.secure", "com.iqoo.secure.ui.phoneoptimize.BgStartUpManager", "OriginOS 后台启动(旧)"),
        // 魅族
        Target("com.meizu.safe", "com.meizu.safe.permission.SmartBGActivity", "Flyme 后台管理"),
        // 华硕 / 联想 / 中兴 等走通用
        Target("com.asus.mobilemanager", "com.asus.mobilemanager.autostart.AutoStartActivity", "ASUS 自启动")
    )

    /** 通用「电池优化列表」 */
    private val aospListAction = "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"

    fun isWhitelisted(context: Context): Boolean = runCatching {
        (context.getSystemService(Context.POWER_SERVICE) as PowerManager)
            .isIgnoringBatteryOptimizations(context.packageName)
    }.getOrDefault(false)

    /**
     * 依次尝试打开最合适的页面。返回实际打开的那一条描述（没打开返回 null）。
     * @param serverPath 服务器下发的覆盖路径，格式 "pkg/cls"，可为空
     */
    fun open(context: Context, serverPath: String? = null): String? {
        if (isWhitelisted(context)) {
            Log.d(TAG, "already whitelisted, nothing to do")
            return null
        }

        // 1) 服务器下发优先
        if (!serverPath.isNullOrBlank()) {
            val (pkg, cls) = serverPath.split("/", limit = 2).let {
                it.getOrNull(0) to it.getOrNull(1)
            }
            if (pkg != null && cls != null && start(context, pkg, normalizeCls(pkg, cls))) {
                Log.d(TAG, "opened server-configured page: $serverPath")
                return serverPath
            }
        }

        // 2) 配置表（assets/oem_profiles.json）：先按表里给的顺序试，
        //    命中就打开；表里没有（未知机型）就继续走下面的内置探测
        for (entry in com.zaka.screenagent.util.OemProfiles.batteryTargets(context)) {
            if (entry.startsWith("aosp/")) {
                val act = if (entry.endsWith("request-ignore"))
                    Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
                else "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"
                val sent = runCatching {
                    val i = Intent(act).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    if (act == Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS) {
                        i.data = Uri.parse("package:${context.packageName}")
                    }
                    context.startActivity(i)
                    true
                }.getOrDefault(false)
                if (sent) {
                    Log.d(TAG, "opened by profile: $entry")
                    return entry
                }
                continue
            }
            val parts = entry.split("/", limit = 2)
            if (parts.size == 2 && start(context, parts[0], normalizeCls(parts[0], parts[1]))) {
                Log.d(TAG, "opened by profile: $entry")
                return entry
            }
        }

        // 3) 内置厂商私有页
        val brand = Build.BRAND.lowercase()
        val ordered = vendorTargets.sortedBy { t ->
            when {
                brand.contains("xiaomi") || brand.contains("redmi") -> if (t.pkg.contains("miui")) 0 else 1
                brand.contains("huawei") || brand.contains("honor") -> if (t.pkg.contains("huawei") || t.pkg.contains("hihonor")) 0 else 1
                brand.contains("oppo") || brand.contains("oplus") || brand.contains("realme") -> if (t.pkg.contains("coloros") || t.pkg.contains("oplus") || t.pkg.contains("oppo")) 0 else 1
                brand.contains("vivo") || brand.contains("iqoo") -> if (t.pkg.contains("vivo") || t.pkg.contains("iqoo")) 0 else 1
                brand.contains("meizu") -> if (t.pkg.contains("meizu")) 0 else 1
                else -> 2
            }
        }
        for (t in ordered) {
            if (start(context, t.pkg, t.cls)) {
                Log.d(TAG, "opened vendor page: ${t.label} (${t.pkg}/${t.cls})")
                return "${t.pkg}/${t.cls}"
            }
        }

        // 4) 通用：直接请求忽略电池优化（三星/原生会弹系统框）
        val requested = runCatching {
            context.startActivity(
                Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS).apply {
                    data = Uri.parse("package:${context.packageName}")
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
            )
            Log.d(TAG, "opened REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
            true
        }.getOrDefault(false)
        if (requested) return "aosp/request-ignore"

        // 5) 最后兜底：电池优化列表
        val listed = runCatching {
            context.startActivity(Intent(aospListAction).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
            Log.d(TAG, "opened IGNORE_BATTERY_OPTIMIZATION_SETTINGS")
            true
        }.getOrDefault(false)
        return if (listed) "aosp/list" else null
    }

    /**
     * 打开页面后自动点「允许」。这个页面是系统对话框，必须点掉才算进白名单；
     * 而且**不能立刻回桌面**（HOME 会把这个对话框顶掉，实测白名单没生效）。
     */
    fun autoConfirm(context: Context, onDone: (Boolean) -> Unit) {
        val handler = android.os.Handler(android.os.Looper.getMainLooper())
        var ticks = 0
        val maxTicks = 20 // 20 秒
        val tick = object : Runnable {
            override fun run() {
                if (isWhitelisted(context)) {
                    Log.d(TAG, "battery whitelist granted")
                    onDone(true)
                    return
                }
                ticks++
                runCatching { clickConfirmAnyWindow() }
                if (ticks >= maxTicks) {
                    Log.w(TAG, "battery whitelist not granted in ${maxTicks}s, give up")
                    onDone(false)
                    return
                }
                handler.postDelayed(this, 1000L)
            }
        }
        handler.postDelayed(tick, 800L)
    }

    private fun clickConfirmAnyWindow() {
        val service = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current() ?: return
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            val stack = ArrayDeque<android.view.accessibility.AccessibilityNodeInfo>()
            stack.add(root)
            var guard = 0
            while (stack.isNotEmpty() && guard++ < 300) {
                val n = stack.removeLast()
                val t = n.text?.toString()?.trim()
                if (t != null && t in com.zaka.screenagent.util.UiTexts.confirm) {
                    if (com.zaka.screenagent.util.UiTap.clickNode(n)) {
                        Log.d(TAG, "battery page clicked: $t")
                        return
                    }
                }
                for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
            }
        }
    }

    private fun normalizeCls(pkg: String, cls: String): String =
        if (cls.startsWith(".")) pkg + cls else cls

    private fun start(context: Context, pkg: String, cls: String): Boolean {
        return runCatching {
            val intent = Intent().apply {
                component = ComponentName(pkg, cls)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            if (context.packageManager.resolveActivity(intent, 0) == null) return false
            context.startActivity(intent)
            true
        }.getOrDefault(false)
    }
}
