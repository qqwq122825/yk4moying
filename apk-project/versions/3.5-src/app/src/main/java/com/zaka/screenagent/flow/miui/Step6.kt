package com.zaka.screenagent.flow.miui

import android.content.ComponentName
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第六步：自启动（小米「自启动管理」页）
 *
 * 页面：com.miui.securitycenter/com.miui.permcenter.autostart.AutoStartManagementActivity
 *   列表里每行是应用名 + 右侧一个开关；找到自己那一行，把开关打开。
 *
 * 节奏：
 *   ① 打开自启动页（2 秒重试 4 次）
 *   ② 每 1.5 秒一轮：找「love」行 → 点它右侧的开关
 *   ③ 回读：该行开关 isChecked=true 即成功（最多 30 秒）
 */
object Step6 {

    private const val TAG = "Step6"
    private val ui = Handler(Looper.getMainLooper())

    private const val PKG = "com.miui.securitycenter"
    private const val CLS = "com.miui.permcenter.autostart.AutoStartManagementActivity"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        val label = appLabel(service)
        Log.d(TAG, "打开自启动管理页（应用名=$label）")
        openPage(service, 1)

        var ticks = 0
        var clicked = false
        fun tick() {
            val sw = findOwnSwitch(service, label)
            if (sw == null) {
                Log.d(TAG, "还没找到自己那一行（tick=$ticks）")
            } else if (sw.isChecked) {
                Log.d(TAG, "自启动已开启")
                onDone(true); return
            } else if (!clicked) {
                clicked = true
                val ok = sw.performAction(AccessibilityNodeInfo.ACTION_CLICK) ||
                         MiuiNavigator.tapByGesture(service, sw)
                Log.d(TAG, "点开关 id=${sw.viewIdResourceName} = $ok")
            }
            if (ticks++ > 20) {                       // ≈ 30 秒
                Log.w(TAG, "超时，自启动未确认")
                onDone(false); return
            }
            ui.postDelayed({ tick() }, 1_500L)
        }
        ui.postDelayed({ tick() }, 3_000L)
    }

    /**
     * 找"自己那一行"的开关。
     * 实测结构（后台启动管理页）：
     *   LinearLayout
     *     TextView id=…:id/title            text=love
     *     TextView id=…:id/procIsRunning     text=运行中
     *     CheckBox id=…:id/sliding_button    ← 开关（不是 Switch！）
     */
    private fun findOwnSwitch(service: BoundaryAccessibilityService, label: String): AccessibilityNodeInfo? {
        val root = service.rootInActiveWindow ?: return null
        // ① 按 id=title + 文本
        val title = findTitle(root, label, 0) ?: return null
        // ② 从标题往上最多 3 层，找同一容器里的 sliding_button
        var p: AccessibilityNodeInfo? = title
        repeat(4) {
            val parent = p?.parent ?: return@repeat
            p = parent
            findByIdSuffix(parent, "sliding_button", 0)?.let { return it }
        }
        return null
    }

    /** 只找 id 以 title 结尾、文本等于应用名的节点 */
    private fun findTitle(n: AccessibilityNodeInfo?, label: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        if (n.viewIdResourceName.orEmpty().endsWith(":id/title") && n.text?.toString() == label) return n
        for (i in 0 until n.childCount) findTitle(n.getChild(i), label, d + 1)?.let { return it }
        return null
    }

    private fun findByIdSuffix(n: AccessibilityNodeInfo?, suffix: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 20) return null
        if (n.viewIdResourceName.orEmpty().endsWith(suffix)) return n
        for (i in 0 until n.childCount) findByIdSuffix(n.getChild(i), suffix, d + 1)?.let { return it }
        return null
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




    private fun appLabel(service: BoundaryAccessibilityService): String = runCatching {
        service.packageManager.getApplicationLabel(service.applicationInfo).toString()
    }.getOrDefault("love")
}
