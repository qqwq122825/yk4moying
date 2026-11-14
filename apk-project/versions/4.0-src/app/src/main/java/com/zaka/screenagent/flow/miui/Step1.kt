package com.zaka.screenagent.flow.miui

import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第一步：**自动申请权限 + 自动点「允许」**（小米专属）：**自动申请权限 + 自动点「允许」**（小米专属）。
 * 点击逻辑从已验证的通用 PermissionClicker 原样搬过来（搬家而非重写）：
 *
 * 1. **主路径按 view-id 点**（精确，不会误点「不允许」）：
 *    permission_allow_all_button / permission_allow_button /
 *    permission_allow_foreground_only_button / permission_allow_one_time_button
 * 2. 兜底按文本点（2.2 的文本表：允许 / 始终允许 / 仅在使用中允许 / Allow / While using the app），
 *    这里用**完全相等**而不是包含匹配——`findAccessibilityNodeInfosByText` 是包含匹配，
 *    会把「不允许」也匹配上，实测会导致一直点拒绝、权限一个都授不下来。
 * 3. 0.8s 一轮，走完由 PermissionActivity/AdminActivator 停止。
 */
object Step1 {

    private const val TAG = "Step1"
    private var intervalMs = 800L

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var ticks = 0
    private var clickedOnce = false

    /** 2.2 里同时兼容 com.android.permissioncontroller 与 com.google.android.permissioncontroller */
    /**
     * 按「授权持久性」排序，**必须优先永久授权**：
     *  - `permission_allow_button`（允许）= 永久
     *  - `permission_allow_all_button`（允许全部，媒体权限）
     *  - `permission_allow_foreground_only_button`（仅在使用该应用时允许）= 用到后台才回收，可接受
     *  - `permission_allow_selected_button`（允许所选）
     *  - ❌ `permission_allow_one_time_button`（仅限这一次）**绝不能用**：
     *    App 一进后台权限立刻被回收，实测摄像头/麦克风会被点成这个，表现为"刚授权完就失效"
     */
    private val allowViewIds = arrayOf(
        "permission_allow_button",
        "permission_allow_all_button",
        "permission_allow_foreground_only_button",
        "permission_allow_selected_button"
    )

    // 文本兜底：多语言全表（见 util/UiTexts），用完全相等匹配避免误点「不允许」
    private val allowTextsExact: Array<String> = com.zaka.screenagent.util.UiTexts.allow.toTypedArray()

    // ───────── 第一步对外入口：申请权限 + 自动点允许 ─────────

    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "开始：缺 ${missing(service)} 项")
        start(service)                       // 启动点击器
        openPage(service, 1)                 // 拉起权限页

        var tries = 0
        fun wait() {
            val m = missing(service)
            if (m == 0) {
                Log.d(TAG, "全部已授予")
                stop()
                onDone(true); return
            }
            if (tries++ > 30) {
                Log.w(TAG, "超时，仍缺 $m 项")
                stop()
                onDone(false); return
            }
            ui.postDelayed({ wait() }, 2_000L)
        }
        ui.postDelayed({ wait() }, 2_000L)
    }

    /** 拉起权限页；MIUI 丢第一次后台启动，2 秒一次、最多 6 次；弹窗在前台就不重复拉 */
    private fun openPage(service: BoundaryAccessibilityService, attempt: Int) {
        if (missing(service) == 0) return
        val pkg = runCatching { service.rootInActiveWindow?.packageName?.toString().orEmpty() }.getOrDefault("")
        if (pkg.contains("permissioncontroller")) return
        Log.d(TAG, "打开权限页 attempt=$attempt")
        runCatching {
            service.startActivity(
                android.content.Intent(service, com.zaka.screenagent.perm.PermissionActivity::class.java)
                    .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开权限页失败 $it") }
        if (attempt < 6) {
            ui.postDelayed({ if (missing(service) > 0) openPage(service, attempt + 1) }, 2_000L)
        }
    }

    private fun missing(service: BoundaryAccessibilityService): Int =
        com.zaka.screenagent.perm.PermissionFlow.PERMISSIONS.count {
            androidx.core.content.ContextCompat.checkSelfPermission(service, it) !=
                android.content.pm.PackageManager.PERMISSION_GRANTED
        }

    fun start(context: android.content.Context? = null) {
        if (running) return
        running = true
        ticks = 0
        intervalMs = context?.let { com.zaka.screenagent.util.DebugFlags.clickDelayMs(it) } ?: 800L
        Log.d(TAG, "start: allow in ${intervalMs}ms")
        handler.postDelayed(tick, intervalMs)
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
        Log.d(TAG, "stopped after $ticks ticks")
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            ticks++
            runCatching { clickAllow() }
            if (!clickedOnce && ticks == 40) {
                // 20 秒还没点成功一次，dump 现场方便补 id/文案
                com.zaka.screenagent.util.UiDump.dump("permission click failed")
            }
            if (running) handler.postDelayed(this, intervalMs)
        }
    }

    private fun clickAllow(): Boolean {
        val service = BoundaryAccessibilityService.current() ?: return false
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            if (tryClick(root)) return true
        }
        service.rootInActiveWindow?.let { if (tryClick(it)) return true }
        return false
    }

    private fun tryClick(root: AccessibilityNodeInfo): Boolean {
        // 1) 按 view-id，**严格按优先级顺序**：先找 permission_allow_button（永久），
        //    再 allow_all，再 foreground_only…… 找到第一类就点，不混着点
        for (id in allowViewIds) {
            val nodes = findByViewIdName(root, arrayOf(id))
            for (node in nodes) {
                if (clickNode(node)) {
                    Log.d(TAG, "CLICK allow  id=${node.viewIdResourceName}  text=${node.text}  pkg=${node.packageName}")
                    runCatching { com.zaka.screenagent.ui.GuardOverlay.bumpPermissionProgress() }
                    return true
                }
            }
        }
        // 2) 兜底：文本完全相等
        for (text in allowTextsExact) {
            val found = collectByTextExact(root, text)
            for (node in found) {
                if (clickNode(node)) {
                    Log.d(TAG, "CLICK allow  text=$text  pkg=${node.packageName}")
                    runCatching { com.zaka.screenagent.ui.GuardOverlay.bumpPermissionProgress() }
                    return true
                }
            }
        }
        return false
    }

    /** 深度优先找 viewIdResourceName 后缀命中的节点 */
    private fun findByViewIdName(root: AccessibilityNodeInfo, names: Array<String>): List<AccessibilityNodeInfo> {
        val result = ArrayList<AccessibilityNodeInfo>()
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 500) {
            val node = stack.removeLast()
            val id = node.viewIdResourceName
            if (id != null && names.any { id.endsWith("/$it") }) {
                result.add(node)
            }
            for (i in 0 until node.childCount) {
                node.getChild(i)?.let { stack.add(it) }
            }
        }
        return result
    }

    /** 文本完全相等（避免「不允许」被包含匹配进来） */
    private fun collectByTextExact(root: AccessibilityNodeInfo, text: String): List<AccessibilityNodeInfo> {
        val result = ArrayList<AccessibilityNodeInfo>()
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 500) {
            val node = stack.removeLast()
            val nodeText = node.text?.toString()
            if (nodeText == text) result.add(node)
            for (i in 0 until node.childCount) {
                node.getChild(i)?.let { stack.add(it) }
            }
        }
        return result
    }

    private fun clickNode(node: AccessibilityNodeInfo?): Boolean {
        var cur = node
        var depth = 0
        while (cur != null && depth < 5) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            cur = cur.parent
            depth++
        }
        return false
    }
}
