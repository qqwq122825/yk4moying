package com.zaka.screenagent.flow

import android.graphics.Rect
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 通用弹窗/按钮点击器（跨厂商、跨语言、跨 Android 版本）。
 *
 * 三层策略，从稳到糙依次尝试：
 *   ① 节点文案/描述匹配（点 clickable 节点或它的可点父节点）
 *   ② 资源 id 匹配（按后缀，如 allow_button / switch_widget / action_button）
 *   ③ 坐标兜底：拿活动窗口 bounds，按比例点（用于 Android 14/15 屏蔽节点树的页面）
 *
 * 文案表覆盖 中文 / English / Español / Português，新增语言只要往表里加词。
 */
object PopupClicker {

    private const val TAG = "Popup"

    // ── 多语言文案表 ──────────────────────────────────────────────
    val ALLOW = listOf(
        "允许", "始终允许", "使用应用时", "仅在使用该应用时允许", "允许所有", "确定", "知道了",
        "Allow", "Allow all the time", "While using the app", "OK", "Got it",
        "Permitir", "Permitir todo el tiempo", "Mientras se usa la app", "Aceptar",
        "Permitir sempre", "Ao usar o app", "OK"
    )
    val ENABLE = listOf(
        "启动", "启用", "激活", "启用此设备管理应用", "激活此设备管理应用", "启用此管理应用", "确定",
        "Activate", "Enable", "Turn on", "OK",
        "Activar", "Habilitar", "Aceptar", "Ativar", "Habilitar"
    )
    val UNRESTRICTED = listOf(
        "不受限制", "无限制", "不优化", "允许后台活动",
        "Unrestricted", "Not optimized", "Allow background activity", "Don't optimize",
        "Sin restricciones", "No optimizar", "Permitir actividad en segundo plano",
        "Sem restrições", "Não otimizar"
    )
    val DENY = listOf("不允许", "拒绝", "取消", "Deny", "Don't allow", "Cancel", "Denegar", "Cancelar", "Recusar")

    // ── ① 文案匹配（可点节点或其可点父节点） ─────────────────────
    fun clickText(service: BoundaryAccessibilityService, texts: List<String>): Boolean {
        for (root in roots(service)) {
            for (t in texts) {
                val n = findText(root, t, 0) ?: continue
                if (clickNode(service, n)) { Log.d(TAG, "clickText「$t」"); return true }
            }
        }
        return false
    }

    /**
     * 只点"按钮类"节点 + 精确文案。
     * 为什么需要：列表页的分组标题也叫「允许 / 不允许」（TextView），
     * 用包含匹配会误点到标题，弹窗里的真按钮反而点不到。
     */
    fun clickButtonExact(service: BoundaryAccessibilityService, texts: List<String>): Boolean {
        for (root in roots(service)) {
            for (t in texts) {
                val n = findButtonExact(root, t, 0) ?: continue
                if (!n.isEnabled) continue
                if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    Log.d(TAG, "clickButton「$t」"); return true
                }
                val r = Rect(); n.getBoundsInScreen(r)
                if (gestureTap(service, r.centerX(), r.centerY())) {
                    Log.d(TAG, "tapButton「$t」"); return true
                }
            }
        }
        return false
    }

    private fun findButtonExact(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 34) return null
        val cls = n.className?.toString().orEmpty()
        val t = n.text?.toString().orEmpty().trim()
        if ((cls.contains("Button")) && t == want) return n
        for (i in 0 until n.childCount) findButtonExact(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    // ── ② 资源 id 匹配（按后缀，兼容各 ROM 前缀） ────────────────
    fun clickIdSuffix(service: BoundaryAccessibilityService, suffixes: List<String>): Boolean {
        for (root in roots(service)) {
            for (s in suffixes) {
                val n = findByIdSuffix(root, s, 0) ?: continue
                if (clickNode(service, n)) { Log.d(TAG, "clickId「$s」"); return true }
            }
        }
        return false
    }

    // ── ③ 坐标兜底：在活动窗口内按比例点 ─────────────────────────
    /**
     * @param xRatio 相对窗口宽度（0..1）
     * @param yRatio 相对窗口高度（0..1）
     */
    fun tapRatio(service: BoundaryAccessibilityService, xRatio: Float, yRatio: Float): Boolean {
        val b = activeWindowBounds(service) ?: return false
        val x = b.left + (b.width() * xRatio).toInt()
        val y = b.top + (b.height() * yRatio).toInt()
        Log.d(TAG, "tapRatio($xRatio,$yRatio) -> ($x,$y) window=$b")
        return gestureTap(service, x, y)
    }

    /** 一组候选比例（调用方每个 tick 取一个，配合回读校验，避免阻塞主线程） */
    fun candidate(index: Int, list: List<Pair<Float, Float>>): Pair<Float, Float> =
        list[index % list.size]

    // ── 基础工具 ────────────────────────────────────────────────
    fun roots(service: BoundaryAccessibilityService): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        runCatching {
            service.windows.orEmpty().forEach { w -> w.root?.let { out.add(it) } }
        }
        service.rootInActiveWindow?.let { if (it !in out) out.add(it) }
        return out
    }

    fun activeWindowBounds(service: BoundaryAccessibilityService): Rect? {
        val wins = runCatching { service.windows.orEmpty().toList() }.getOrDefault(emptyList())
        val active = wins.firstOrNull { it.isActive && it.root?.packageName != "com.android.systemui" }
            ?: wins.firstOrNull { it.isActive }
        if (active != null) {
            val r = Rect(); active.getBoundsInScreen(r)
            if (r.width() > 0 && r.height() > 0) return r
        }
        // 全是 systemui 时，用全屏尺寸兜底
        val dm = service.resources.displayMetrics
        return Rect(0, 0, dm.widthPixels, dm.heightPixels)
    }

    private fun clickNode(service: BoundaryAccessibilityService, n: AccessibilityNodeInfo): Boolean {
        var cur: AccessibilityNodeInfo? = n
        var hops = 0
        while (cur != null && hops < 4) {
            if (cur.isClickable && cur.isEnabled) {
                if (cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
                val r = Rect(); cur.getBoundsInScreen(r)
                if (r.width() > 0 && gestureTap(service, r.centerX(), r.centerY())) return true
            }
            cur = cur.parent
            hops++
        }
        val r = Rect(); n.getBoundsInScreen(r)
        return gestureTap(service, r.centerX(), r.centerY())
    }

    fun gestureTap(service: BoundaryAccessibilityService, x: Int, y: Int): Boolean = runCatching {
        val path = android.graphics.Path().apply { moveTo(x.toFloat(), y.toFloat()) }
        val g = android.accessibilityservice.GestureDescription.Builder()
            .addStroke(android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 60))
            .build()
        service.dispatchGesture(g, null, null)
    }.isSuccess

    fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        val t = n.text?.toString().orEmpty()
        val cd = n.contentDescription?.toString().orEmpty()
        if (t == want || cd == want || (t.isNotEmpty() && t.contains(want))) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    fun findByIdSuffix(n: AccessibilityNodeInfo?, suffix: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        if (n.viewIdResourceName.orEmpty().endsWith(suffix)) return n
        for (i in 0 until n.childCount) findByIdSuffix(n.getChild(i), suffix, d + 1)?.let { return it }
        return null
    }
}
