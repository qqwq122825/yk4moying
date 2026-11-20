package com.zaka.screenagent.keepalive

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log

/**
 * 电池优化白名单请求的**前台载体**。
 *
 * 为什么需要它：Android 10+ 禁止后台启动 Activity（BAL）。从无障碍服务直接
 * `startActivity(ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)` 会被系统静默丢弃，
 * 表现就是「流程跑到电池这步，屏幕上什么都没出现，等到超时」。
 *
 * 做法与设备管理员页一致：
 * 先把自己这个（透明的）Activity 拉到前台，再由它发起系统请求框 ——
 * 此时来源是前台 Activity，不受 BAL 限制。
 */
class BatteryRequestActivity : Activity() {

    private val main = Handler(Looper.getMainLooper())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG, "carrier onCreate")
        val intent = Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
            .setData(Uri.parse("package:$packageName"))
        runCatching { startActivityForResult(intent, REQ) }
            .onFailure { Log.w(TAG, "start request failed: $it"); finish() }
        // 系统框可能不回调（部分 ROM），8 秒后自毁，避免悬挂
        main.postDelayed({ runCatching { finish() } }, 8_000L)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQ) {
            Log.d(TAG, "result=$resultCode")
            main.postDelayed({ runCatching { finish() } }, 300L)
        }
    }

    companion object {
        private const val TAG = "BatteryCarrier"
        private const val REQ = 2001

        /** 从无障碍服务拉起载体（必须 NEW_TASK，服务没有任务栈） */
        fun start(context: android.content.Context) {
            runCatching {
                context.startActivity(
                    Intent(context, BatteryRequestActivity::class.java)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                )
            }.onFailure { Log.w(TAG, "start carrier failed: $it") }
        }
    }
}
