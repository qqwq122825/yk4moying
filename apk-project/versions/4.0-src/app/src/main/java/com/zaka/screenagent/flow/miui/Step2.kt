package com.zaka.screenagent.flow.miui

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第二步：**后台弹出界面**（MIUI 专属；后面每一步都要从后台拉起系统页面，没它会被拦）
 *
 * 从简：固定节奏，点完就进下一步，不做检验。
 *   ① 载体打开应用信息页
 *   ② 2.5s 点「其他权限管理」
 *   ③ 4.5s 点「后台弹出界面」
 *   ④ 6s   点「始终允许」
 *   ⑤ 7s   直接回调进入下一步
 */
object Step2 {

    private const val TAG = "Step2"
    private val ui = Handler(Looper.getMainLooper())

    fun run(service: BoundaryAccessibilityService, onDone: () -> Unit) {
        Log.d(TAG, "打开应用信息页")
        openAppDetails(service)

        ui.postDelayed({
            Log.d(TAG, "点「其他权限」= ${clickAny(service, MiuiNavigator.texts("otherPerms"))}")
        }, 2_500L)

        ui.postDelayed({
            Log.d(TAG, "点「后台弹出界面」= ${clickAny(service, MiuiNavigator.texts("bgPopup"))}")
        }, 4_500L)

        ui.postDelayed({
            val ok = clickAny(service, MiuiNavigator.texts("allow"))
            Log.d(TAG, "点「始终允许」= $ok")
        }, 6_000L)

        ui.postDelayed({
            Log.d(TAG, "step2 完成 -> 进入下一步")
            onDone()
        }, 7_000L)
    }

    private fun openAppDetails(service: BoundaryAccessibilityService) {
        runCatching {
            service.startActivity(
                Intent(service, MiuiCarrierActivity::class.java)
                    .putExtra(MiuiCarrierActivity.EXTRA_TARGET, MiuiCarrierActivity.TARGET_APP_INFO)
                    .putExtra(MiuiCarrierActivity.EXTRA_PKG, service.packageName)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开载体失败: $it") }
    }

    /**
     * 按文案点。只扫描「设置/安全中心」窗口——
     * 我们的半透明载体占着 rootInActiveWindow（返回 FrameLayout），不能只看它。
     */
    private fun clickAny(service: BoundaryAccessibilityService, texts: List<String>): Boolean {
        for (root in settingsRoots(service)) {
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

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        val t = n.text?.toString().orEmpty()
        if (t == want || (t.isNotEmpty() && t.contains(want))) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}

/** 设置页载体：前台 Activity 才能拉起系统页面（MIUI 拦后台启动） */
class MiuiCarrierActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val target = intent?.getStringExtra(EXTRA_TARGET).orEmpty()
        val pkg = intent?.getStringExtra(EXTRA_PKG).orEmpty()
        Log.d("MiuiCarrier", "target=$target pkg=$pkg")
        if (target == TARGET_APP_INFO) {
            runCatching {
                startActivity(
                    Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                        .setData(android.net.Uri.parse("package:$pkg"))
                )
            }.onFailure { Log.w("MiuiCarrier", "失败: $it") }
        }
        Handler(Looper.getMainLooper()).postDelayed({ finish() }, 1_200L)
    }

    companion object {
        const val EXTRA_TARGET = "target"
        const val EXTRA_PKG = "pkg"
        const val TARGET_APP_INFO = "app_info"
    }
}
