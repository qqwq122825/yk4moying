package com.zaka.screenagent.flow.generic

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 通用第二步：**设备管理员**
 *
 * 打开系统激活页（ACTION_ADD_DEVICE_ADMIN）→ 点「激活」→ 点确认「确定」。
 * OneUI 的激活页按钮文案是「激活」/「激活此设备管理应用」，
 * 确认框是标准的「确定 / 取消」。
 */
object Step2 {

    private const val TAG = "SS-Step2"

    fun run(service: BoundaryAccessibilityService, onDone: () -> Unit) {
        Log.d(TAG, "打开设备管理员激活页")
        GenericNavigator.openDeviceAdmin(service)

        var ticks = 0
        var misses = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (isActive(service)) {
                    Log.d(TAG, "设备管理员已激活")
                    onDone()
                    return
                }
                // 通用实测：激活按钮文案是**「启动」**（id=action_button），不是「激活」
                GenericNavigator.dumpWindows(service, "step2 tick=$ticks")
                val byId = GenericNavigator.clickById(service, "action_button")
                Log.d(TAG, "clickById action_button = $byId")
                if (byId == null) GenericNavigator.clickText(service, GenericNavigator.adminActivateTexts)
                if (ticks >= 20) {                       // 约 40 秒
                    Log.w(TAG, "超时 active=${isActive(service)}")
                    onDone()
                    return
                }
                GenericNavigator.post(2_000L, this)
            }
        }
        GenericNavigator.post(2_000L, tick)
    }

    private fun isActive(service: BoundaryAccessibilityService): Boolean = runCatching {
        val dpm = service.getSystemService(DevicePolicyManager::class.java)
        val cn = ComponentName(service, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
        dpm?.isAdminActive(cn) == true
    }.getOrDefault(false)
}
