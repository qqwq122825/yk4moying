package com.zaka.screenagent.flow.motorola

import android.os.PowerManager
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.PopupClicker

/**
 * 摩托罗拉第四步：**电池不受限制**（OneUI：设置 → 电池 → 应用耗电管理 → 不受限制）
 *
 * 打开系统的「电池优化」列表页 → 点自己 → 选「不受限制 / 不优化」。
 * 最后用 PowerManager.isIgnoringBatteryOptimizations 核对。
 */
object Step4 {

    private const val TAG = "Moto-Step4"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开电池优化列表")
        MotorolaNavigator.openBatteryOptimization(service)

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (ignoring(service)) {
                    Log.d(TAG, "电池已不受限制")
                    onDone(true)
                    return
                }
                // ① 系统包级对话框：允许 / Allow / Permitir / Permitir tudo（Button 精确点击）
                // ① 精确点「允许」按钮（避免点到标题「要允许应用一直在后台运行吗？」）
                var hit = PopupClicker.clickButtonExact(service, PopupClicker.ALLOW)
                // ② 列表页兜底：点自己 → 选「不受限制」
                if (!hit && label.isNotBlank()) {
                    MotorolaNavigator.clickText(service, listOf(label))
                    hit = MotorolaNavigator.clickText(service, MotorolaNavigator.unrestrictedTexts) != null
                }
                if (!hit) Log.d(TAG, "电池弹窗节点不可读（不用坐标）")
                if (ticks >= 15) {
                    val ok = ignoring(service)
                    Log.w(TAG, "超时 ignoring=$ok")
                    onDone(ok)
                    return
                }
                MotorolaNavigator.post(2_000L, this)
            }
        }
        MotorolaNavigator.post(2_500L, tick)
    }

    private fun ignoring(service: BoundaryAccessibilityService): Boolean = runCatching {
        val pm = service.getSystemService(PowerManager::class.java)
        pm?.isIgnoringBatteryOptimizations(service.packageName) == true
    }.getOrDefault(false)
}
