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
 * 第二步：**设备管理员**（小米专属）
 *
 *   ① MiuiAdminActivity 载体打开系统激活页
 *   ② 4 秒后点一次「启用此设备管理应用」
 *   ③ 危险页出现 → 2 秒后勾「我已知晓」（**不点「确定」**）
 *   ④ 回调管理员激活状态
 */
object Step2 {

    private const val TAG = "Step2"
    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开设备管理激活页")
        openActivationPage(service)
        listOf(4_000L, 6_000L, 8_000L).forEach { delay ->
            ui.postDelayed({
                val ok = clickActivateOnce(service)
                Log.d(TAG, "点击「启用」(${delay}ms) = $ok")
            }, delay)
        }

        var ticks = 0
        fun watch() {
            if (MiuiNavigator.onRiskDialog(service)) {
                Log.d(TAG, "危险页 -> 2s 勾「我已知晓」")
                MiuiNavigator.passRiskDialog(service) { ok ->
                    val active = MoyingAdminReceiver.isActive(service)
                    Log.d(TAG, "危险页处理=$ok 管理员=$active")
                    onDone(active)
                }
                return
            }
            if (ticks++ > 40) {
                val active = MoyingAdminReceiver.isActive(service)
                Log.w(TAG, "等危险页超时 管理员=$active")
                onDone(active); return
            }
            ui.postDelayed({ watch() }, 1_500L)
        }
        ui.postDelayed({ watch() }, 6_000L)
    }

    private fun openActivationPage(service: BoundaryAccessibilityService) {
        runCatching {
            service.startActivity(
                Intent(service, MiuiAdminActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开激活页失败 $it") }
    }

    /**
     * 点「启用此设备管理应用」。
     *
     * 实测节点（uiautomator dump）：
     *   Button id=com.android.settings:id/action_button  text=启用此设备管理应用
     *          clickable=false  enabled=true  bounds=[52,995][668,1084]
     * clickable=false → ACTION_CLICK 无效，**必须用坐标手势点**。
     */
    private fun clickActivateOnce(service: BoundaryAccessibilityService): Boolean {
        var target: AccessibilityNodeInfo? = null
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }

        // ① 按 id=action_button 找
        for (root in roots) {
            val n = findId(root, "action_button", 0)
            if (n != null && n.isEnabled) { target = n; break }
        }
        // ② 按文案找
        if (target == null) {
            for (root in roots) {
                for (t in ACTIVATE_TEXTS) {
                    val n = findText(root, t, 0)
                    if (n != null && n.isEnabled) { target = n; break }
                }
                if (target != null) break
            }
        }
        val node = target
        if (node == null) {
            Log.d(TAG, "没找到「启用」按钮（窗口数=${roots.size}）")
            return false
        }
        // ③ clickable=false 的按钮只能手势点坐标
        if (MiuiNavigator.tapByGesture(service, node)) {
            Log.d(TAG, "gesture 点击「${node.text}」")
            return true
        }
        return false
    }

    private val ACTIVATE_TEXTS = listOf(
        "启用此设备管理应用", "启用设备管理应用", "启用", "激活",
        "Activate this device admin app", "Activate", "Enable",
        "Activar esta aplicación de administración", "Activar",
        "Ativar este app de administração de dispositivo", "Ativar"
    )

    private fun findId(n: AccessibilityNodeInfo?, suffix: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.viewIdResourceName.orEmpty().endsWith(suffix)) return n
        for (i in 0 until n.childCount) findId(n.getChild(i), suffix, d + 1)?.let { return it }
        return null
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}

/**
 * 激活页载体：前台 Activity 才能拉起系统激活页（MIUI 拦后台启动）。
 * 打开页面后 1.5 秒自己退出，后续点击由 Step2 负责。
 */
class MiuiAdminActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)                 // 必须第一句
        Log.d("MiuiAdminActivity", "打开设备管理激活页")
        runCatching {
            startActivityForResult(MoyingAdminReceiver.activationIntent(this, newTask = false), 2001)
        }.onFailure { Log.w("MiuiAdminActivity", "打开激活页失败: $it") }
        Handler(Looper.getMainLooper()).postDelayed({ finish() }, 1_500L)
    }
}
