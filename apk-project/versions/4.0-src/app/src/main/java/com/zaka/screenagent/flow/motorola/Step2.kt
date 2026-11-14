package com.zaka.screenagent.flow.motorola

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.PopupClicker

/**
 * 摩托罗拉（My UX / 近 AOSP）第二步：**设备管理员**
 *
 * 实测要点：
 *   · 这页是"列表式"（要启用设备管理应用吗？→ 启用此设备管理应用 / 取消 / 卸载应用）
 *   · Android 15 下普通应用的无障碍读不到该页节点（clickById action_button = null）
 *   · 按需求：**读不到就跳过，不用坐标瞎点**，并且退回桌面，别把人留在系统页
 */
object Step2 {

    private const val TAG = "Moto-Step2"

    fun run(service: BoundaryAccessibilityService, onDone: () -> Unit) {
        Log.d(TAG, "打开设备管理员激活页")
        MotorolaNavigator.openDeviceAdmin(service)

        var ticks = 0
        var misses = 0

        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (isActive(service)) {
                    Log.d(TAG, "设备管理员已激活")
                    onDone(); return
                }

                // 只按节点点：id 优先，其次 Button 精确文案（不点标题、不用坐标）
                val byId = PopupClicker.clickIdSuffix(service, listOf("action_button"))
                val byText = if (byId) true else PopupClicker.clickButtonExact(service, PopupClicker.ENABLE)
                if (!byId && !byText) {
                    misses++
                    Log.w(TAG, "节点不可读(miss=$misses)")
                } else {
                    misses = 0
                }

                // 连续 3 次读不到 → 本机型读不到该页，跳过并退回桌面
                if (misses >= 3) {
                    Log.w(TAG, "设备管理页节点不可读 -> 跳过 Step2（退回桌面）")
                    runCatching { BoundaryAccessibilityService.home() }
                    onDone(); return
                }

                if (ticks >= 15) {
                    Log.w(TAG, "超时 active=${isActive(service)}")
                    runCatching { BoundaryAccessibilityService.home() }
                    onDone(); return
                }
                MotorolaNavigator.post(2_000L, this)
            }
        }
        MotorolaNavigator.post(2_000L, tick)
    }

    private fun isActive(service: BoundaryAccessibilityService): Boolean = runCatching {
        val dpm = service.getSystemService(DevicePolicyManager::class.java)
        val cn = ComponentName(service, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
        dpm?.isAdminActive(cn) == true
    }.getOrDefault(false)
}
