package com.zaka.screenagent.flow.miui

import android.content.ComponentName
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第五步：自启动（小米「自启动管理」页）
 *
 * 页面：com.miui.securitycenter/com.miui.permcenter.autostart.AutoStartManagementActivity
 *   列表里每行是应用名 + 右侧一个开关；找到自己那一行，把开关打开。
 *
 * 节奏：
 *   ① 打开自启动页（2 秒重试 4 次）
 *   ② 每 1.5 秒一轮：找「love」行 → 点它右侧的开关
 *   ③ 回读：该行开关 isChecked=true 即成功（最多 30 秒）
 */
object Step5 {

    private const val TAG = "Step5"
    private val ui = Handler(Looper.getMainLooper())

    private const val PKG = "com.miui.securitycenter"
    private const val CLS = "com.miui.permcenter.autostart.AutoStartManagementActivity"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开自启动管理页")
        openPage(service, 1)

        var ticks = 0
        var clicked = false
        fun tick() {
            val row = findRow(service, appLabel(service))
            if (row != null && row.first.isChecked) {
                Log.d(TAG, "自启动已开启")
                onDone(true); return
            }
            if (!clicked && row != null) {
                clicked = true
                Log.d(TAG, "点自己那一行 -> ${MiuiNavigator.tapByGesture(service, row.second)}")
            }
            if (ticks++ > 20) {                       // ≈ 30 秒
                Log.w(TAG, "超时，自启动未确认")
                onDone(false); return
            }
            ui.postDelayed({ tick() }, 1_500L)
        }
        ui.postDelayed({ tick() }, 3_000L)
    }

    private fun openPage(service: BoundaryAccessibilityService, attempt: Int) {
        runCatching {
            service.startActivity(
                Intent().setComponent(ComponentName(PKG, CLS)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure {
            Log.w(TAG, "打开失败 attempt=$attempt: $it")
            // 兜底：从安全中心主页进
            runCatching {
                service.startActivity(
                    Intent().setComponent(ComponentName(PKG, "com.miui.securitycenter.MainActivity"))
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
            }
        }
        if (attempt < 4) ui.postDelayed({ if (!onAutoStartPage(service)) openPage(service, attempt + 1) }, 2_000L)
    }

    private fun onAutoStartPage(service: BoundaryAccessibilityService): Boolean {
        val cls = runCatching { service.rootInActiveWindow?.className?.toString().orEmpty() }.getOrDefault("")
        return cls.contains("AutoStart")
    }

    /** 找到自己那一行：返回 (该行开关, 可点的行节点) */
    private fun findRow(service: BoundaryAccessibilityService, label: String): Pair<AccessibilityNodeInfo, AccessibilityNodeInfo>? {
        val root = service.rootInActiveWindow ?: return null
        val title = findText(root, label, 0) ?: return null
        // 从标题往上找 3 层，找同一行里的开关
        var p: AccessibilityNodeInfo? = title
        repeat(3) {
            val parent = p?.parent ?: return@repeat
            p = parent
            val sw = findSwitch(parent, 0)
            if (sw != null) return sw to (parent)
        }
        return null
    }

    private fun findSwitch(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 20) return null
        if (n.className?.toString()?.contains("Switch") == true) return n
        for (i in 0 until n.childCount) findSwitch(n.getChild(i), d + 1)?.let { return it }
        return null
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    private fun appLabel(service: BoundaryAccessibilityService): String = runCatching {
        service.packageManager.getApplicationLabel(service.applicationInfo).toString()
    }.getOrDefault("love")
}
