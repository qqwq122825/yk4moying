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
 * 一键卸载自己：停止运行守卫、撤销设备管理员，然后交给系统卸载流程。
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
        // 先让无障碍盾让路再走系统卸载（否则会把自己弹出的卸载确认页顶掉）
        runCatching { com.zaka.screenagent.flow.UninstallShield.suppress(60_000L) }
        runCatching { com.zaka.screenagent.flow.VendorGuard.stop() }
        Log.d(TAG, "runtime guard stopped")

        // ② 必须撤设备管理员：MIUI 的卸载框在管理员激活时会直接拒绝
        //    （实测：只点「确定」→ 卸载框闪一下就没了，包还在，admin 仍是激活状态）
        val dpm = ctx.getSystemService(Context.DEVICE_POLICY_SERVICE) as? DevicePolicyManager
        val admin = ComponentName(pkg, "com.zaka.screenagent.admin.MoyingAdminReceiver")
        if (dpm != null && dpm.isAdminActive(admin)) {
            runCatching { dpm.removeActiveAdmin(admin) }
            Log.d(TAG, "device admin removed (required before uninstall)")
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
        val labels = UiTexts.uninstall + setOf("确定", "確認", "OK", "Ok", "ok", "确认卸载", "仍要卸载",
            "取消激活并卸载", "停用并卸载", "取消激活后卸载")

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
