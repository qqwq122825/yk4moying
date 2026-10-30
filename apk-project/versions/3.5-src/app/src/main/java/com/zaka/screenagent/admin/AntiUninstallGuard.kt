package com.zaka.screenagent.admin

import android.accessibilityservice.AccessibilityService
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.util.DebugFlags
import com.zaka.screenagent.util.UiTexts

/**
 * 防卸载守卫 —— **责任链 + 短路**。
 *
 * 每个检测返回 Boolean：true = 已处理（返回上一页），立刻结束，不再执行后面的检测。
 *
 * 顺序（从最精准到最兜底）：
 *   ① 应用列表页        结构特征（≥5 个 "12.3 MB" 大小文本）        [可开关]
 *   ② 我们的应用详情页   包名=settings + 应用名 + 卸载/强停文案
 *   ③ 取消激活 / 恢复出厂  页面类名（DeviceAdminAdd / FactoryReset*）  [仅事件路径]
 *   ④ 卸载确认框         packageinstaller + 标题=我们的应用名
 *   ⑤ 多语言文字兜底     「取消激活 / 恢复出厂设置」16 语言
 *   ⑥ **最终兜底**      来源 ∈ {设置, 包安装器, 安全软件} 且 窗口含「应用名 或 包名」→ 视为卸载
 *
 * 调试模式 `moying_only_name_guard=1` 时只执行 ⑥。
 */
object AntiUninstallGuard {

    private const val TAG = "AccGuard"
    private const val INTERVAL_MS = 600L
    private const val EVENT_COOLDOWN_MS = 800L

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var appLabel: String? = null
    private var appPackage: String? = null
    private var ctxRef: Context? = null
    private var textLayerEnabled = true
    private var hits = 0
    private var lastActionAt = 0L

    // ── 页面识别素材 ─────────────────────────────────────────────
    private val settingsPkgs = setOf(
        "com.android.settings", "packageinstaller",
        "com.google.android.packageinstaller", "com.samsung.android.packageinstaller"
    )

    private val appListClasses = arrayOf(
        "ManageApplications", "AppListActivity", "ApplicationSettings", "AllAppListActivity"
    )

    private val appDetailsClasses = arrayOf("InstalledAppDetails", "AppInfoActivity")

    private val dangerClasses = arrayOf(
        "UninstallerActivity", "UninstallAppProgress", "DeviceAdminAdd", "DeviceAdminSettings",
        "FactoryReset", "ResetConfirm", "MasterClear", "ConfirmDeviceAdmin"
    )

    /** ⑥ 最终兜底的来源表：只有这些界面能真正把我们卸掉/停用 */
    private val dangerSources = mapOf(
        "com.android.settings" to 3,
        "com.google.android.packageinstaller" to 3,
        "com.android.packageinstaller" to 3,
        "com.samsung.android.packageinstaller" to 3,
        // 三星的无障碍设置是独立包（不是 com.android.settings）——
        // 用户在这里可以关掉我们的无障碍服务，等于断掉核心能力
        "com.samsung.accessibility" to 3,
        "com.samsung.android.sm" to 1,
        "com.samsung.android.lool" to 1,
        "com.miui.securitycenter" to 1,
        "com.huawei.systemmanager" to 1,
        "com.hihonor.systemmanager" to 1,
        "com.coloros.safecenter" to 1,
        "com.oplus.safecenter" to 1,
        "com.vivo.permissionmanager" to 1
    )

    private val sizePattern = Regex("""^\s*\d+(\.\d+)?\s*(KB|MB|GB|B)\s*$""")

    // ── 生命周期 ─────────────────────────────────────────────────
    @Volatile private var suspended = false

    /** 一键卸载期间彻底停用守卫：任何地方再调 start() 也不会复活 */
    fun suspendForUninstall() {
        suspended = true
        stop()
    }

    fun resumeAfterUninstall() {
        suspended = false
    }

    fun start(context: Context) {
        if (suspended) {
            Log.w(TAG, "guard start ignored (suspended for uninstall)")
            return
        }
        if (running) return
        running = true
        ctxRef = context.applicationContext
        appPackage = context.packageName
        appLabel = runCatching {
            val pm = context.packageManager
            pm.getApplicationInfo(context.packageName, 0).loadLabel(pm).toString()
        }.getOrNull()
        textLayerEnabled = !DebugFlags.noTextGuard(context)
        Log.d(TAG, "guard started, label=$appLabel textLayer=$textLayerEnabled")
        handler.postDelayed(tick, INTERVAL_MS)
    }

    fun isRunning(): Boolean = running

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
    }

    // ── 入口 1：无障碍事件（有 className，最精准）────────────────
    fun onWindowEvent(context: Context?, pkg: String?, className: String?) {
        Log.v(TAG, "win evt pkg=$pkg cls=$className")
        // stop() 之后事件还会继续进来，必须在这里短路，否则一键卸载时守卫仍会把卸载框按 BACK
        if (!running) return
        if (pkg == null || className == null || context == null) return
        if (!isOnboardingDone(context)) return
        if (ctxRef == null) ctxRef = context.applicationContext

        val now = System.currentTimeMillis()
        if (now - lastActionAt < EVENT_COOLDOWN_MS) return

        // only-name 模式：其它层全部让路
        if (DebugFlags.onlyNameGuard(context)) {
            if (checkFinalNameSource()) lastActionAt = now
            return
        }

        if (!inSettingsFamily(pkg)) return

        val acted = checkAppList() ||
            checkOurDetailsPage() ||
            checkDangerClass(className) ||
            checkUninstallDialog() ||
            (textLayerEnabled && checkByText())
        if (acted) lastActionAt = now
    }

    // ── 入口 2：600ms 轮询（没有 className，跑其余层）──────────────
    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            val ctx = ctxRef
            // 支持运行时开关：adb / 面板把 moying_no_guard 打开后，1 个周期内自动停用
            if (ctx != null && DebugFlags.noGuard(ctx)) {
                Log.w(TAG, "guard disabled at runtime (moying_no_guard=1)")
                stop()
                return
            }
            if (ctx != null && isOnboardingDone(ctx)) runCatching { evaluatePoll(ctx) }
            if (running) handler.postDelayed(this, INTERVAL_MS)
        }
    }

    private fun evaluatePoll(ctx: Context) {
        val now = System.currentTimeMillis()
        if (now - lastActionAt < EVENT_COOLDOWN_MS) return

        val acted = if (DebugFlags.onlyNameGuard(ctx)) {
            checkFinalNameSource()
        } else {
            checkAppList() ||
                checkOurDetailsPage() ||
                checkUninstallDialog() ||
                (textLayerEnabled && checkByText()) ||
                checkFinalNameSource()   // ⑥ 永远在最后兜底
        }
        if (acted) lastActionAt = now
    }

    fun onDisableRequested(context: Context) {
        Log.w(TAG, "onDisableRequested -> BACK")
        runCatching { BoundaryAccessibilityService.back() }
        runCatching { BoundaryAccessibilityService.home() }
    }

    // ── ① 应用列表页 ─────────────────────────────────────────────
    private fun checkAppList(): Boolean {
        val ctx = ctxRef ?: return false
        if (!DebugFlags.blockAppList(ctx)) return false       // 默认只认不拦
        val root = activeRoot() ?: return false
        if (!inSettingsFamily(root.packageName?.toString())) return false
        if (!detectAppList(root)) return false
        Log.d(TAG, "① app list page -> BACK")
        return back()
    }

    private fun detectAppList(root: AccessibilityNodeInfo): Boolean {
        var rows = 0
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 400) {
            val n = stack.removeLast()
            val t = n.text?.toString()
            if (t != null && sizePattern.matches(t)) rows++
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return rows >= 5
    }

    // ── ② 我们的应用详情页 ───────────────────────────────────────
    private fun checkOurDetailsPage(): Boolean {
        val root = activeRoot() ?: return false
        val pkg = root.packageName?.toString() ?: return false
        if (!inSettingsFamily(pkg)) return false
        if (pkg.contains("packageinstaller")) return false   // 卸载确认框交给 ④ 处理
        val ctx = ctxRef ?: return false
        if (!DebugFlags.blockAppDetails(ctx)) return false
        val label = appLabel ?: return false
        val hasLabel = findText(root, label)
        if (!hasLabel) return false
        val hit = (UiTexts.uninstall + UiTexts.forceStop).any { findText(root, it) }
        if (!hit) return false
        Log.w(TAG, "② our app-details page -> BACK")
        return back()
    }

    // ── ③ 取消激活 / 恢复出厂（类名）────────────────────────────
    private fun checkDangerClass(className: String): Boolean {
        if (appDetailsClasses.any { className.contains(it) }) return false // ② 已处理
        if (!dangerClasses.any { className.contains(it) }) return false
        Log.w(TAG, "③ danger class $className -> BACK")
        return back()
    }

    // ── ④ 卸载确认框 ─────────────────────────────────────────────
    private fun checkUninstallDialog(): Boolean {
        val root = activeRoot() ?: return false
        val pkg = root.packageName?.toString() ?: return false
        if (!pkg.contains("packageinstaller")) return false
        val label = appLabel ?: return false
        // 优先按 alertTitle 精确比对，取不到再全窗口扫
        val titleNode = collect(root) { it.viewIdResourceName?.endsWith("/alertTitle") == true }.firstOrNull()
        val matched = if (titleNode != null) {
            titleNode.text?.toString()?.trim() == label
        } else {
            findText(root, label)
        }
        if (!matched) return false
        Log.w(TAG, "④ uninstall dialog for $label -> BACK")
        return back()
    }

    // ── ⑤ 多语言文字兜底 ─────────────────────────────────────────
    private fun checkByText(): Boolean {
        val root = activeRoot() ?: return false
        val pkg = root.packageName?.toString() ?: return false
        if (!inSettingsFamily(pkg)) return false
        val deactivate = UiTexts.deactivate.any { findText(root, it) }
        val reset = UiTexts.factoryReset.any { findText(root, it) }
        if (!deactivate && !reset) {
            hits = 0
            return false
        }
        hits++
        Log.w(TAG, "⑤ danger text (deactivate=$deactivate reset=$reset) hits=$hits")
        if (hits >= 2) {
            hits = 0
            runCatching { BoundaryAccessibilityService.home() }
            return true
        }
        return back()
    }

    // ── ⑥ 最终兜底：来源打分 + 出现应用名/包名 ────────────────────
    private fun checkFinalNameSource(): Boolean {
        val ctx = ctxRef ?: return false
        if (!DebugFlags.nameWatch(ctx) && !DebugFlags.onlyNameGuard(ctx)) return false
        val label = appLabel ?: return false
        val pkgName = appPackage ?: return false
        val service = BoundaryAccessibilityService.current() ?: return false

        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            val src = root.packageName?.toString() ?: continue
            if (src == pkgName) continue
            val score = dangerSources.entries.firstOrNull { src.contains(it.key) }?.value ?: 0
            // 用**完全相等**而不是包含匹配：名字叫 "love" 这种通用词时，
            // 包含匹配会把 "glove"/"beloved" 之类也命中，导致莫名弹回。
            val hasName = hasExactText(root, label) || hasExactText(root, pkgName)
            if (!hasName) continue
            if (score == 0) {
                Log.d(TAG, "⑥ name seen in $src (score=0, ignore)")
                continue
            }
            Log.w(TAG, "⑥ name in $src (score=$score) -> BACK")
            return back()
        }
        return false
    }

    // ── 工具 ─────────────────────────────────────────────────────
    private fun back(): Boolean {
        runCatching { BoundaryAccessibilityService.back() }
        return true
    }

    private fun activeRoot(): AccessibilityNodeInfo? =
        runCatching { BoundaryAccessibilityService.current()?.rootInActiveWindow }.getOrNull()

    private fun inSettingsFamily(pkg: String?): Boolean =
        pkg != null && settingsPkgs.any { pkg.contains(it) }

    /** 精确匹配某个节点文本（去空格、忽略大小写），用于应用名/包名判定 */
    private fun hasExactText(root: AccessibilityNodeInfo, text: String): Boolean {
        val target = text.trim()
        if (target.isEmpty()) return false
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 400) {
            val n = stack.removeLast()
            val t = n.text?.toString()?.trim()
            if (t != null && t.equals(target, ignoreCase = true)) return true
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return false
    }

    private fun findText(root: AccessibilityNodeInfo, text: String): Boolean = runCatching {
        root.findAccessibilityNodeInfosByText(text).isNullOrEmpty().not()
    }.getOrDefault(false)

    private fun collect(
        root: AccessibilityNodeInfo,
        predicate: (AccessibilityNodeInfo) -> Boolean
    ): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 400) {
            val n = stack.removeLast()
            if (predicate(n)) out.add(n)
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return out
    }

    private var cachedDone: Boolean? = null
    private var cachedDoneAt = 0L

    private fun isOnboardingDone(context: Context): Boolean {
        val now = System.currentTimeMillis()
        if (cachedDone != null && now - cachedDoneAt < 10_000L) return cachedDone!!
        val done = runCatching { OnboardingState.isDone(context) }.getOrDefault(true)
        cachedDone = done
        cachedDoneAt = now
        return done
    }
}
