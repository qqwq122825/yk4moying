package com.zaka.screenagent.perm

import android.accessibilityservice.AccessibilityService
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo

/**
 * 小米（MIUI/HyperOS）应用信息页的"模拟手点击"导航器。
 *
 * 背景：MIUI 禁止后台启动大部分 Activity，但 **应用信息页可以打开**（实测通过），
 * 打开之后里面的开关就只能靠无障碍节点点击来完成。
 *
 * 语言适配：MIUI 设置项文案随系统语言变化，这里每个目标都给一组候选文案
 * （中 / 英 / 西 / 葡 / 印地 / 印尼 / 越 / 泰 / 阿 / 孟加拉 / 乌尔都 / 他加禄），
 * 用「完全相等优先、包含次之」匹配，避免点到同名其它项。
 */
object MiuiNavigator {

    private const val TAG = "MiuiNav"
    private val main = Handler(Looper.getMainLooper())

    /** 文案表：每个 key 一组多语言候选 */
    private val TEXTS = mapOf(
        "otherPerms" to listOf(
            "其他权限管理", "其他权限", "权限管理", "应用权限管理",
            "Other permissions", "Permissions", "App permissions",
            "Otros permisos", "Permisos", "Permisos de la aplicación",
            "Outras permissões", "Permissões", "Permissões do app",
            "अन्य अनुमतियाँ", "अनुमतियाँ",
            "Izin lainnya", "Izin",
            "Quyền khác", "Quyền",
            "สิทธิ์อื่นๆ", "สิทธิ์",
            "أذونات أخرى", "الأذونات",
            "অন্যান্য অনুমতি", "অনুমতি",
            "دیگر اجازتیں", "اجازتیں",
            "Iba pang mga pahintulot", "Mga pahintulot"
        ),
        "bgPopup" to listOf(
            "后台弹出界面", "后台弹出",
            "Display pop-up windows while running in background",
            "Display pop-up windows in background", "Pop-up windows in background",
            "Mostrar ventanas emergentes en segundo plano", "Ventanas emergentes",
            "Mostrar janelas pop-up em segundo plano", "Janelas pop-up",
            "बैकग्राउंड में पॉप-अप विंडो दिखाएं",
            "Tampilkan jendela pop-up saat berjalan di latar belakang",
            "Hiển thị cửa sổ bật lên khi chạy nền",
            "แสดงหน้าต่างป๊อปอัปขณะทำงานเบื้องหลัง",
            "عرض نوافذ منبثقة أثناء التشغيل في الخلفية",
            "ব্যাকগ্রাউন্ডে পপ-আপ উইন্ডো দেখান",
            "پس منظر میں پاپ اپ ونڈوز دکھائیں",
            "Magpakita ng pop-up na window sa background"
        ),
        "overlay" to listOf(
            "显示悬浮窗", "悬浮窗",
            "Display over other apps", "Display pop-up windows while running in background",
            "Mostrar sobre otras apps", "Mostrar encima de otras aplicaciones",
            "Exibir sobre outros apps",
            "अन्य ऐप्स के ऊपर दिखाएं",
            "Tampilkan di atas aplikasi lain",
            "Hiển thị trên các ứng dụng khác",
            "แสดงทับแอปอื่น",
            "العرض فوق التطبيقات الأخرى",
            "অন্য অ্যাপের উপরে দেখান",
            "دوسرے ایپس کے اوپر دکھائیں",
            "Ipakita sa ibabaw ng iba pang app"
        ),
        "allow" to listOf(
            "始终允许", "允许", "允许所有", "确定",
            "Allow all the time", "Allow", "Always allow", "OK",
            "Permitir siempre", "Permitir", "Permitir todo", "Aceptar",
            "Permitir sempre", "Permitir", "OK",
            "हमेशा अनुमति दें", "अनुमति दें",
            "Selalu izinkan", "Izinkan",
            "Luôn cho phép", "Cho phép",
            "อนุญาตตลอดเวลา", "อนุญาต",
            "السماح دائمًا", "سماح",
            "সর্বদা অনুমতি দিন", "অনুমতি দিন",
            "ہمیشہ اجازت دیں", "اجازت دیں",
            "Laging payagan", "Payagan"
        ),
        "unrestricted" to listOf(
            "无限制", "不限制", "无限制（推荐）",
            "No restrictions", "Unrestricted", "Don't restrict",
            "Sin restricciones", "Sin restricción",
            "Sem restrições",
            "कोई प्रतिबंध नहीं",
            "Tanpa batasan",
            "Không hạn chế",
            "ไม่จำกัด",
            "بلا قيود",
            "কোনো সীমাবদ্ধতা নেই",
            "کوئی پابندی نہیں",
            "Walang paghihigpit"
        )
    )

    fun texts(key: String): List<String> = TEXTS[key] ?: emptyList()

    /** 点击第一个命中的节点（依次尝试多语言候选） */
    fun clickByKey(service: AccessibilityService, key: String, contains: Boolean = false): Boolean {
        for (t in texts(key)) {
            if (clickByText(service, t, contains)) {
                Log.d(TAG, "CLICK[$key] text=$t")
                return true
            }
        }
        return false
    }

    fun clickByText(service: AccessibilityService, want: String, contains: Boolean = false): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }
        for (root in roots) {
            val node = find(root, want, contains, 0) ?: continue
            if (clickNode(node)) return true
        }
        return false
    }

    private fun find(n: AccessibilityNodeInfo?, want: String, contains: Boolean, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 30) return null
        val t = n.text?.toString().orEmpty()
        val d = n.contentDescription?.toString().orEmpty()
        val hit = if (contains) (t.contains(want, true) || d.contains(want, true)) else (t == want || d == want)
        if (hit) return n
        for (i in 0 until n.childCount) {
            find(n.getChild(i), want, contains, depth + 1)?.let { return it }
        }
        return null
    }

    /** 自身不可点时向上找可点父节点（MIUI 设置项常见） */
    private fun clickNode(node: AccessibilityNodeInfo): Boolean {
        var cur: AccessibilityNodeInfo? = node
        var guard = 0
        while (cur != null && guard++ < 5) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            cur = cur.parent
        }
        // 兜底：对文本节点做 ACTION_SELECT / 手势坐标点击
        return runCatching {
            if (node.isClickable) node.performAction(AccessibilityNodeInfo.ACTION_CLICK) else false
        }.getOrDefault(false)
    }

    fun back(service: AccessibilityService) {
        runCatching { service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK) }
    }

    /**
     * 省电策略页（HiddenAppsConfigActivity）：点「无限制」。
     * 多语言兜底之外，再加一条**不依赖文案**的路径：
     * 该页是"后台配置"列表，第 1 项永远是「无限制」，所以直接点列表第一个可点项。
     */
    fun clickUnrestricted(service: AccessibilityService): Boolean {
        // 1) 文案命中（12 语言）
        if (clickByKey(service, "unrestricted")) return true
        // 2) 兜底：列表第一项
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }
        for (root in roots) {
            val list = findList(root, 0) ?: continue
            for (i in 0 until list.childCount) {
                val item = list.getChild(i) ?: continue
                if (clickNode(item)) {
                    Log.d(TAG, "CLICK[unrestricted] by index 0")
                    return true
                }
            }
        }
        return false
    }

    /** 找列表容器（RecyclerView / ListView / 含多个可点子项的 LinearLayout） */
    private fun findList(n: AccessibilityNodeInfo?, depth: Int): AccessibilityNodeInfo? {
        if (n == null || depth > 25) return null
        val cls = n.className?.toString().orEmpty()
        if (cls.contains("RecyclerView") || cls.contains("ListView")) return n
        for (i in 0 until n.childCount) {
            findList(n.getChild(i), depth + 1)?.let { return it }
        }
        return null
    }

    /**
     * 自启动列表（AutoStartManagementActivity）：找到本应用所在行，点它右侧的开关。
     * 应用名按 label 候选匹配（love / 测试 / 面板里注入的名字）。
     */
    fun clickAppToggle(service: AccessibilityService, names: List<String>): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }
        for (root in roots) {
            for (name in names) {
                val node = find(root, name, false, 0) ?: continue
                // 从命中节点往上找"行"，再在行内找 CheckBox/Switch
                var row: AccessibilityNodeInfo? = node
                var g = 0
                while (row != null && g++ < 6) {
                    val sw = findSwitch(row, 0)
                    if (sw != null && clickNode(sw)) {
                        Log.d(TAG, "CLICK[appToggle] name=$name switch=${sw.className}")
                        return true
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
        for (i in 0 until n.childCount) {
            findSwitch(n.getChild(i), depth + 1)?.let { return it }
        }
        return null
    }

    /** 当前窗口里是否出现任一给定文本（用于判断"到底在哪个页面"） */
    fun hasAnyText(service: AccessibilityService, cands: List<String>): Boolean {
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }
        for (root in roots) {
            for (c in cands) {
                if (find(root, c, true, 0) != null) return true
            }
        }
        return false
    }

    /** 是否是「应用信息」页（不是无障碍设置页——两者包名都是 com.android.settings） */
    val APP_DETAIL_TEXTS = listOf(
        "应用信息", "App info", "Información de la app", "Informações do app",
        "强制停止", "Force stop", "Forzar detención", "Forçar parada",
        "存储占用", "Storage", "Almacenamiento", "Armazenamento",
        "卸载", "Uninstall", "Desinstalar", "Desinstalar atualizações"
    )
}
