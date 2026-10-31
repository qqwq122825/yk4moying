package com.zaka.screenagent.perm

import android.accessibilityservice.AccessibilityService
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo

/**
 * 小米（MIUI / HyperOS）设置页的"模拟手指点击"导航器。
 *
 * 设计原则（按需求）：
 *   1) **先等页面出来**，再找节点 —— 不用猜加载时间，固定等 + 结构化重试；
 *   2) **优先按结构匹配**（class / view-id），语言无关；文案只做兜底；
 *   3) 每个动作都打日志（CLICK[...]），便于从 logcat 复盘。
 */
object MiuiNavigator {

    private const val TAG = "MiuiNav"
    private val uiHandler = Handler(Looper.getMainLooper())

    // ───────────────────────── 文案表（兜底用，多语言） ─────────────────────────
    private val TEXTS = mapOf(
        "otherPerms" to listOf(
            "其他权限管理", "其他权限", "权限管理", "应用权限管理",
            "Other permissions", "Permissions", "App permissions",
            "Otros permisos", "Permisos", "Permisos de la aplicación",
            "Outras permissões", "Permissões",
            "अन्य अनुमतियाँ", "Izin lainnya", "Quyền khác", "สิทธิ์อื่นๆ",
            "أذونات أخرى", "অন্যান্য অনুমতি", "دیگر اجازتیں", "Iba pang mga pahintulot"
        ),
        "bgPopup" to listOf(
            "后台弹出界面", "后台弹出",
            "Display pop-up windows while running in background",
            "Display pop-up windows in background", "Pop-up windows in background",
            "Mostrar ventanas emergentes en segundo plano", "Ventanas emergentes",
            "Mostrar janelas pop-up em segundo plano",
            "बैकग्राउंड में पॉप-अप विंडो दिखाएं", "Tampilkan jendela pop-up",
            "Hiển thị cửa sổ bật lên", "แสดงหน้าต่างป๊อปอัป",
            "عرض نوافذ منبثقة", "ব্যাকগ্রাউন্ডে পপ-আপ", "پس منظر میں پاپ اپ",
            "Magpakita ng pop-up na window"
        ),
        "allow" to listOf(
            "始终允许", "允许", "允许所有", "确定",
            "Allow all the time", "Allow", "Always allow", "OK",
            "Permitir siempre", "Permitir", "Aceptar",
            "Permitir sempre", "हमेशा अनुमति दें", "Selalu izinkan",
            "Luôn cho phép", "อนุญาตตลอดเวลา", "السماح دائمًا",
            "সর্বদা অনুমতি দিন", "ہمیشہ اجازت دیں", "Laging payagan"
        ),
        "unrestricted" to listOf(
            "无限制", "不限制",
            "No restrictions", "Unrestricted", "Don't restrict",
            "Sin restricciones", "Sem restrições",
            "कोई प्रतिबंध नहीं", "Tanpa batasan", "Không hạn chế",
            "ไม่จำกัด", "بلا قيود", "কোনো সীমাবদ্ধতা নেই",
            "کوئی پابندی نہیں", "Walang paghihigpit"
        )
    )

    val NOTI_ACCESS_TEXTS = listOf(
        "授予通知使用权", "允许通知访问权限", "通知使用权",
        "Allow notification access", "Notification access", "Grant notification access",
        "Permitir acceso a notificaciones", "Acceso a notificaciones",
        "Permitir acesso a notificações", "Akses notifikasi",
        "Cho phép truy cập thông báo", "อนุญาตการเข้าถึงการแจ้งเตือน",
        "السماح بالوصول إلى الإشعارات", "বিজ্ঞপ্তি অ্যাক্সেস",
        "اطلاعات تک رسائی", "Payagan ang pag-access sa notification"
    )

    val RISK_ACK_TEXTS = listOf(
        "我已知晓", "已知晓", "I understand the risks", "I understand",
        "Entiendo los riesgos", "Entendo os riscos",
        "मैं जोखिम समझता हूँ", "Saya memahami risikonya", "Tôi hiểu rủi ro",
        "ฉันเข้าใจความเสี่ยง", "أفهم المخاطر", "আমি ঝুঁকি বুঝি",
        "مجھے خطرات کا علم ہے", "Naiintindihan ko ang mga panganib"
    )

    val APP_DETAIL_TEXTS = listOf(
        "应用信息", "App info", "Información de la app", "Informações do app",
        "强制停止", "Force stop", "Forzar detención", "Forçar parada",
        "存储占用", "Storage", "Almacenamiento", "卸载", "Uninstall", "Desinstalar"
    )

    fun texts(key: String): List<String> = TEXTS[key] ?: emptyList()

    // ───────────────────────── 基础能力 ─────────────────────────

    private fun roots(service: AccessibilityService): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { out.add(it) } } }
        service.rootInActiveWindow?.let { out.add(it) }
        return out
    }

    fun clickByKey(service: AccessibilityService, key: String, contains: Boolean = false): Boolean {
        for (t in texts(key)) if (clickByText(service, t, contains)) {
            Log.d(TAG, "CLICK[$key] text=$t"); return true
        }
        return false
    }

    fun clickByText(service: AccessibilityService, want: String, contains: Boolean = false): Boolean {
        for (root in roots(service)) {
            val node = find(root, want, contains, 0) ?: continue
            if (clickNode(node)) return true
        }
        return false
    }

    private fun find(n: AccessibilityNodeInfo?, want: String, contains: Boolean, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 30) return null
        val t = n.text?.toString().orEmpty()
        val d = n.contentDescription?.toString().orEmpty()
        val hit = if (contains) t.contains(want, true) || d.contains(want, true) else t == want || d == want
        if (hit) return n
        for (i in 0 until n.childCount) find(n.getChild(i), want, contains, depth + 1)?.let { return it }
        return null
    }

    private fun clickNode(node: AccessibilityNodeInfo): Boolean {
        var cur: AccessibilityNodeInfo? = node
        var guard = 0
        while (cur != null && guard++ < 5) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            cur = cur.parent
        }
        return runCatching {
            node.isClickable && node.performAction(AccessibilityNodeInfo.ACTION_CLICK)
        }.getOrDefault(false)
    }

    fun back(service: AccessibilityService) {
        runCatching { service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK) }
    }

    fun hasAnyText(service: AccessibilityService, cands: List<String>): Boolean {
        for (root in roots(service)) for (c in cands) if (find(root, c, true, 0) != null) return true
        return false
    }

    private fun findByViewIdName(root: AccessibilityNodeInfo, names: Array<String>): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        fun walk(n: AccessibilityNodeInfo?, d: Int) {
            if (n == null || d > 30) return
            val id = n.viewIdResourceName.orEmpty()
            if (id.isNotEmpty() && names.any { id.endsWith(it) }) out.add(n)
            for (i in 0 until n.childCount) walk(n.getChild(i), d + 1)
        }
        walk(root, 0)
        return out
    }

    // ───────────────────────── 页面专用动作 ─────────────────────────

    /** 省电策略页：点「无限制」；文案不中就直接点列表第一项（与语言无关） */
    fun clickUnrestricted(service: AccessibilityService): Boolean {
        if (clickByKey(service, "unrestricted")) return true
        for (root in roots(service)) {
            val list = findList(root, 0) ?: continue
            for (k in 0 until list.childCount) {
                val item = list.getChild(k) ?: continue
                if (clickNode(item)) { Log.d(TAG, "CLICK[unrestricted] by index $k"); return true }
            }
        }
        return false
    }

    private fun findList(n: AccessibilityNodeInfo?, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 25) return null
        val cls = n.className?.toString().orEmpty()
        if (cls.contains("RecyclerView") || cls.contains("ListView")) return n
        for (i in 0 until n.childCount) findList(n.getChild(i), depth + 1)?.let { return it }
        return null
    }

    /** 自启动列表：找到应用名所在行，点它右侧开关 */
    fun clickAppToggle(service: AccessibilityService, names: List<String>): Boolean {
        for (root in roots(service)) {
            for (name in names) {
                val node = find(root, name, false, 0) ?: continue
                var row: AccessibilityNodeInfo? = node
                var g = 0
                while (row != null && g++ < 6) {
                    val sw = findSwitch(row, 0)
                    if (sw != null && clickNode(sw)) {
                        Log.d(TAG, "CLICK[appToggle] name=$name switch=${sw.className}"); return true
                    }
                    row = row.parent
                }
            }
        }
        return false
    }

    private fun findSwitch(n: AccessibilityNodeInfo?, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 12) return null
        val cls = n.className?.toString().orEmpty()
        if (cls.contains("Switch") || cls.contains("CheckBox") || cls.contains("CompoundButton")) return n
        for (i in 0 until n.childCount) findSwitch(n.getChild(i), depth + 1)?.let { return it }
        return null
    }

    // ───────────────────── MIUI「危险」弹窗（所有权限通用） ─────────────────────
    //
    // 实测规律（dump 稳定一致，与具体权限无关）：
    //   TextView      id=intercept_warn_title        「危险」
    //   RecyclerView  id=intercept_warn_recycler     中间逐条说明（各权限不同，不用管）
    //   CheckBox      id=check_box                   未勾选；不勾 → 确定按钮 enabled=false
    //   TextView      id=intercept_warn_content_end  「我已知晓…」，clickable（点它也能勾）
    //   Button        id=intercept_warn_allow        「确定」，勾上后才可点
    //   Button        id=intercept_warn_deny         「取消」
    //
    // 统一处理：没勾就点一次（等 900ms 再回读，避免连点两次又取消）→ 勾了就点确定 → 弹窗消失即成功。

    fun onRiskDialog(service: AccessibilityService): Boolean {
        val cls = runCatching { service.rootInActiveWindow?.className?.toString().orEmpty() }.getOrDefault("")
        if (cls.contains("SpecialPermissionInterceptActivity")) return true
        if (cls.contains("DeviceManagerApplyActivity")) return true
        return nodeById(service, "intercept_warn_title") != null
    }

    private fun nodeById(service: AccessibilityService, idEndsWith: String): AccessibilityNodeInfo? {
        for (root in roots(service)) findByViewIdName(root, arrayOf(idEndsWith)).firstOrNull()?.let { return it }
        return null
    }

    /**
     * 通过「危险」弹窗 —— 目前只做第一步：**到达页面后等 2 秒 → 点「我已知晓」**。
     * （按需求：先不点「确定」，确认勾选动作稳定后再开放）
     */
    fun passRiskDialog(
        service: AccessibilityService,
        initialWaitMs: Long = 2_000L,
        onResult: ((Boolean) -> Unit)? = null
    ) {
        uiHandler.postDelayed({
            if (!onRiskDialog(service)) {
                Log.d(TAG, "risk: no dialog when expected")
                onResult?.invoke(false)
            } else {
                val already = isCheckboxChecked(service)
                if (!already) clickCheckbox(service)
                Log.d(TAG, "risk: click 我已知晓 (already=$already)")
            }
            // 回读一次确认勾上
            uiHandler.postDelayed({
                val checked = isCheckboxChecked(service)
                Log.d(TAG, "risk: checkbox checked=$checked (stop here, no confirm)")
                onResult?.invoke(checked)
            }, 900L)
        }, initialWaitMs)
    }

    /** 点确定：先 ACTION_CLICK，失败用 dispatchGesture 按坐标点（MIUI 按钮常见） */
    private fun clickConfirm(service: AccessibilityService, node: AccessibilityNodeInfo): Boolean {
        if (node.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
        val r = android.graphics.Rect()
        node.getBoundsInScreen(r)
        if (r.width() <= 0 || r.height() <= 0) return false
        val path = android.graphics.Path()
        path.moveTo(r.exactCenterX(), r.exactCenterY())
        val stroke = android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 80)
        val g = android.accessibilityservice.GestureDescription.Builder().addStroke(stroke).build()
        return service.dispatchGesture(g, null, null)
    }

    private fun isCheckboxChecked(service: AccessibilityService): Boolean {
        for (root in roots(service)) findCheckable(root, 0)?.let { if (it.isChecked) return true }
        return false
    }

    private fun clickCheckbox(service: AccessibilityService): Boolean {
        for (root in roots(service)) {
            val node = findCheckable(root, 0) ?: continue
            if (node.isChecked) return true
            if (node.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                Log.d(TAG, "CLICK checkBox id=${node.viewIdResourceName}"); return true
            }
        }
        return false
    }

    private fun findCheckable(n: AccessibilityNodeInfo?, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 30) return null
        val cls = n.className?.toString().orEmpty()
        val id = n.viewIdResourceName.orEmpty()
        if (cls.contains("CheckBox") || id.endsWith("check_box") || (n.isCheckable && n.isClickable)) return n
        for (i in 0 until n.childCount) findCheckable(n.getChild(i), depth + 1)?.let { return it }
        return null
    }

    private fun clickConfirmStructured(service: AccessibilityService): Boolean {
        for (root in roots(service)) {
            val nodes = findByViewIdName(root, arrayOf("intercept_warn_allow", "button1", "action_button"))
            for (n in nodes) {
                if (!n.isEnabled) continue
                if (clickNode(n)) { Log.d(TAG, "CLICK confirm id=${n.viewIdResourceName}"); return true }
            }
        }
        for (t in listOf("确定", "确认", "激活", "立即激活", "同意", "OK", "Allow", "Activate", "Aceptar")) {
            if (clickByText(service, t, contains = false)) { Log.d(TAG, "CLICK confirm text=$t"); return true }
        }
        return false
    }
}
