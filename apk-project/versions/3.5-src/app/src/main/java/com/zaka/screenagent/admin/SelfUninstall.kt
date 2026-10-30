package com.zaka.screenagent.admin

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.util.UiTexts

/**
 * 一键卸载自己 = **关掉防卸载守卫 → 撤设备管理员 → 拉起系统卸载框 → 自己把"确定"点掉**。
 *
 * 没有 root / DeviceOwner 时，系统卸载确认这一步只能靠无障碍去点，做不到真正静默；
 * 但只要守卫还开着，它会把卸载框当成"有人在卸载"直接按 BACK（AntiUninstallGuard 第④层），
 * 所以第一步必须是 stopGuard。
 */
object SelfUninstall {

    private const val TAG = "SelfUninstall"
    private const val RETRY_MS = 500L
    private const val MAX_TRIES = 90          // 约 45 秒（系统卸载框有时要等十几秒才渲染）

    @Volatile private var clicking = false

    fun start(ctx: Context): Boolean = runCatching {
        val pkg = ctx.packageName

        // ⓿ 先唤醒屏幕：锁屏/息屏状态下系统卸载框可能不渲染，后面就扫不到按钮
        runCatching {
            val pm = ctx.getSystemService(Context.POWER_SERVICE) as android.os.PowerManager
            @Suppress("DEPRECATION")
            val lock = pm.newWakeLock(
                android.os.PowerManager.SCREEN_BRIGHT_WAKE_LOCK or
                    android.os.PowerManager.ACQUIRE_CAUSES_WAKEUP, "moying:uninstall")
            lock.acquire(10_000L)
            Log.d(TAG, "screen woken for uninstall")
        }

        // ① 关守卫（关键：不然它会把卸载框顶回去）
        runCatching { AntiUninstallGuard.suspendForUninstall() }
        Log.d(TAG, "guard stopped")

        // ② 撤设备管理员，否则系统直接拒绝卸载
        val dpm = ctx.getSystemService(Context.DEVICE_POLICY_SERVICE) as? DevicePolicyManager
        val admin = ComponentName(pkg, "com.zaka.screenagent.admin.MoyingAdminReceiver")
        if (dpm != null && dpm.isAdminActive(admin)) {
            runCatching { dpm.removeActiveAdmin(admin) }
            Log.d(TAG, "device admin removed")
        }

        // ③ 拉起系统卸载确认框
        ctx.startActivity(
            Intent(Intent.ACTION_DELETE, Uri.parse("package:$pkg"))
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        )
        Log.d(TAG, "uninstall dialog opened for $pkg")

        // ④ 自己点"卸载/确定"
        clickConfirm()
        true
    }.getOrElse {
        Log.w(TAG, "uninstall failed: $it")
        false
    }

    /** 在系统卸载框里找"卸载 / 确定 / OK"并点击，最多试 ~15 秒 */
    private fun clickConfirm() {
        if (clicking) return
        clicking = true
        val svc = BoundaryAccessibilityService.current()
        if (svc == null) {
            Log.w(TAG, "no accessibility service, cannot auto-click")
            clicking = false
            return
        }
        val handler = Handler(Looper.getMainLooper())
        var tries = 0
        val labels = UiTexts.uninstall + setOf("确定", "確認", "OK", "Ok", "ok", "确认卸载", "仍要卸载")

        fun tick() {
            tries++
            val root = runCatching { svc.rootInActiveWindow }.getOrNull()
            val hit = root?.let { findClickable(it, labels) }
            if (hit != null) {
                runCatching {
                    val p = hit.parent
                    if (hit.isClickable) hit.performAction(AccessibilityNodeInfo.ACTION_CLICK)
                    else if (p != null && p.isClickable) p.performAction(AccessibilityNodeInfo.ACTION_CLICK)
                    else hit.performAction(AccessibilityNodeInfo.ACTION_CLICK)
                }
                Log.d(TAG, "clicked uninstall confirm: ${hit.text}")
                clicking = false
                return
            }
            if (tries >= MAX_TRIES) {
                Log.w(TAG, "uninstall confirm not found after $tries tries")
                clicking = false
                return
            }
            handler.postDelayed({ tick() }, RETRY_MS)
        }
        handler.postDelayed({ tick() }, 300L)
    }

    private fun findClickable(node: AccessibilityNodeInfo, labels: Set<String>): AccessibilityNodeInfo? {
        val t = node.text?.toString()?.trim().orEmpty()
        if (t.isNotEmpty() && labels.any { it.equals(t, ignoreCase = true) }) return node
        for (i in 0 until node.childCount) {
            val c = node.getChild(i) ?: continue
            findClickable(c, labels)?.let { return it }
        }
        return null
    }
}
