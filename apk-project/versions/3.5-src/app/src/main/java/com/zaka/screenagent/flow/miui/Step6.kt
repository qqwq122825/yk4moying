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
 * 第六步：**后台弹出界面**（MIUI 专属，高优先级）
 *
 * 为什么需要它：注入页 / 黑屏 / 任何"从后台拉起 Activity"的动作，
 * 没有这个权限会被 MIUI 直接拒：
 *   MIUILOG- Permission Denied Activity : Intent { cmp=…InjectionActivity }
 *
 * 路径（实测）：
 *   应用信息 → 「其他权限」/「权限管理」→ 「后台弹出界面」→ 允许
 * 开关在 MIUI 上是 CheckBox（不是 Switch），点了要回读。
 */
object Step6 {

    private const val TAG = "Step6"
    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开应用信息页（找「其他权限」→「后台弹出界面」）")
        openAppDetails(service)

        var stage = 0
        var ticks = 0
        fun tick() {
            when (stage) {
                0 -> {   // 进「其他权限/权限管理」
                    if (clickAny(service, MiuiNavigator.texts("otherPerms"))) {
                        Log.d(TAG, "进入其他权限页"); stage = 1; ticks = 0
                    }
                }
                1 -> {   // 进「后台弹出界面」
                    if (clickAny(service, MiuiNavigator.texts("bgPopup"))) {
                        Log.d(TAG, "进入后台弹出界面页"); stage = 2; ticks = 0
                    }
                }
                2 -> {   // 打开开关
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
                3 -> {   // 回读
                    val box = findCheckable(service)
                    if (box != null && box.isChecked) {
                        Log.d(TAG, "后台弹出界面已开启")
                        onDone(true); return
                    }
                }
            }
            if (ticks++ > 20) { Log.w(TAG, "超时 stage=$stage"); onDone(false); return }
            ui.postDelayed({ tick() }, 1_500L)
        }
        ui.postDelayed({ tick() }, 3_000L)
    }

    private fun openAppDetails(service: BoundaryAccessibilityService) {
        val intents = listOf(
            Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                .setData(Uri.parse("package:${service.packageName}"))
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            Intent("miui.intent.action.APP_PERM_EDITOR")
                .putExtra("extra_pkgname", service.packageName)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        )
        for (i in intents) {
            runCatching { service.startActivity(i) }
                .onSuccess { Log.d(TAG, "打开: ${i.action}"); return }
                .onFailure { Log.w(TAG, "打开失败 ${i.action}: $it") }
        }
    }

    /** 按文案点（优先当前窗口，其次全部窗口） */
    private fun clickAny(service: BoundaryAccessibilityService, texts: List<String>): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        service.rootInActiveWindow?.let { roots.add(it) }
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
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

    /** 「后台弹出界面」页的开关是 CheckBox */
    private fun findCheckable(service: BoundaryAccessibilityService): AccessibilityNodeInfo? {
        val root = service.rootInActiveWindow ?: return null
        return findCheckBox(root, 0)
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
