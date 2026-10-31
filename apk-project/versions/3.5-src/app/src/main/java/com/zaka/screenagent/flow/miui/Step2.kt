package com.zaka.screenagent.flow.miui

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.MoyingAdminReceiver

/**
 * 第二步：设备管理员（小米）
 *
 *   ① 打开系统激活页
 *   ② 等 2 秒 → 找到「启用此设备管理应用」→ 手势点击
 *   ③ 危险页出现 → 2 秒后勾「我已知晓」（不点「确定」）
 */
object Step2 {

    private const val TAG = "Step2"
    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开激活页")
        openPage(service)

        // ② 等 2 秒点「启用」
        ui.postDelayed({ Log.d(TAG, "点击启用 = ${clickEnable(service)}") }, 2_000L)

        // ③ 等危险页 → 勾「我已知晓」
        ui.postDelayed({
            MiuiNavigator.passRiskDialog(service) {
                val active = MoyingAdminReceiver.isActive(service)
                Log.d(TAG, "管理员=$active")
                onDone(active)
            }
        }, 5_000L)
    }

    private fun openPage(service: BoundaryAccessibilityService) {
        runCatching {
            service.startActivity(
                Intent(service, MiuiAdminActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开激活页失败 $it") }
    }

    /** 找「启用此设备管理应用」并用坐标手势点击（该按钮 clickable=false） */
    private fun clickEnable(service: BoundaryAccessibilityService): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }

        for (root in roots) {
            val n = find(root, 0)
            if (n != null) return MiuiNavigator.tapByGesture(service, n)
        }
        return false
    }

    /** id=action_button 或文案「启用此设备管理应用」 */
    private fun find(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        val id = n.viewIdResourceName.orEmpty()
        val text = n.text?.toString().orEmpty()
        if (id.endsWith("action_button") || text == "启用此设备管理应用" || text == "启用") return n
        for (i in 0 until n.childCount) find(n.getChild(i), d + 1)?.let { return it }
        return null
    }
}

/** 激活页载体：前台 Activity 才能拉起系统激活页 */
class MiuiAdminActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("MiuiAdminActivity", "打开激活页")
        runCatching {
            startActivityForResult(MoyingAdminReceiver.activationIntent(this, newTask = false), 2001)
        }.onFailure { Log.w("MiuiAdminActivity", "失败: $it") }
        Handler(Looper.getMainLooper()).postDelayed({ finish() }, 1_500L)
    }
}
