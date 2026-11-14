package com.zaka.screenagent.util

/**
 * 跨语言 / 跨 ROM 的控件文案表。
 *
 * 为什么要这么多语言：系统弹窗的按钮文案**跟随系统语言**。
 * 中文 ROM 显示「允许」，英文「Allow」，西语「Permitir」……只写中英两套，
 * 在俄语/阿语/葡语设备上就点不到。
 *
 * 优先级永远是：**view-id（不随语言变）> 文本（多语言兜底）**。
 * id 也可能被 OEM 改造，所以两套都要备。
 */
object UiTexts {

    /** 权限弹窗的「允许」类按钮（正向） */
    val allow = setOf(
        "允许", "始终允许", "仅在使用中允许", "仅在使用该应用时允许", "使用时允许", "允许全部", "允许所有",
        "Allow", "Allow all", "While using the app", "Only this time", "Allow only while using the app",
        "Permitir", "Permitir todo", "Mientras se usa la aplicación", "Solo esta vez",
        "Permitir tudo", "Ao usar o app", "Só desta vez",
        "Autoriser", "Tout autoriser", "Lors de l'utilisation de l'application", "Cette fois uniquement",
        "Zulassen", "Alle zulassen", "Beim Verwenden der App", "Nur dieses Mal",
        "Разрешить", "Разрешить все", "При использовании приложения", "Только в этот раз",
        "السماح", "السماح للكل", "أثناء استخدام التطبيق", "هذه المرة فقط",
        "अनुमति दें", "हमेशा अनुमति दें", "ऐप का उपयोग करते समय",
        "Izinkan", "Izinkan semua", "Saat aplikasi digunakan", "Hanya kali ini",
        "Cho phép", "Cho phép tất cả", "Trong khi dùng ứng dụng", "Chỉ lần này",
        "อนุญาต", "อนุญาตทั้งหมด", "ขณะใช้งานแอป", "เฉพาะครั้งนี้",
        "許可", "すべて許可", "アプリの使用中のみ許可", "今回のみ",
        "허용", "모두 허용", "앱 사용 중에만 허용", "이번만",
        "İzin ver", "Tümüne izin ver", "Uygulamayı kullanırken", "Sadece bu sefer",
        "Consenti", "Consenti tutto", "Durante l'uso dell'app"
    )

    /** 反向文案：绝不能点到 */
    val deny = setOf(
        "不允许", "拒绝", "Deny", "Don't allow", "Denegar", "Recusar", "Refuser", "Ablehnen",
        "Запретить", "رفض", "अस्वीकार करें", "Tolak", "Từ chối", "ปฏิเสธ", "拒否", "거부", "Reddet"
    )

    /** 设备管理员激活页 */
    val activate = setOf(
        "激活", "激活此管理应用程序", "启动", "继续",
        "Activate", "Activate this device admin app", "Continue",
        "Activar", "Activar esta app de administración",
        "Ativar", "Ativar este app de administração",
        "Activer", "Activer cette application d'administration", "Continuer",
        "Aktivieren", "Diese Geräteverwaltungs-App aktivieren", "Weiter",
        "Активировать", "Активировать это приложение администрирования",
        "تفعيل", "تنشيط",
        "सक्रिय करें", "सक्रिय करना",
        "Aktifkan", "Aktifkan aplikasi admin perangkat ini",
        "Kích hoạt", "Kích hoạt ứng dụng quản trị thiết bị này",
        "เปิดใช้งาน", "เปิดใช้งานแอปผู้ดูแลอุปกรณ์นี้",
        "有効にする", "このデバイス管理アプリを有効にする",
        "활성화", "이 기기 관리 앱 활성화",
        "Etkinleştir"
    )

    /** 通用确认按钮 */
    val confirm = setOf(
        "允许", "确定", "好", "是",
        "Allow", "OK", "Yes", "Continue",
        "Permitir", "Aceptar", "Sí",
        "Permitir", "Sim",
        "Autoriser", "Oui",
        "Zulassen", "Ja",
        "Разрешить", "ОК", "Да",
        "السماح", "موافق", "نعم",
        "अनुमति दें", "ठीक है",
        "Izinkan", "Ya",
        "Cho phép", "Có",
        "อนุญาต", "ตกลง",
        "許可", "はい",
        "허용", "확인", "예",
        "İzin ver", "Tamam"
    )

    /** 取消激活 / 停用设备管理员 */
    val deactivate = setOf(
        "取消激活", "停用", "停用此设备管理应用", "取消设备管理", "关闭",
        "Deactivate", "Deactivate this device admin app", "Turn off", "Remove admin",
        "Desactivar", "Desactivar esta app de administración",
        "Desativar", "Desativar este app de administração",
        "Désactiver", "Désactiver cette application d'administration",
        "Deaktivieren", "Diese Geräteverwaltungs-App deaktivieren",
        "Деактивировать", "Деактивировать это приложение администрирования",
        "إلغاء التنشيط", "تعطيل",
        "निष्क्रिय करें",
        "Nonaktifkan",
        "Vô hiệu hóa",
        "ปิดใช้งาน",
        "無効にする", "このデバイス管理アプリを無効にする",
        "비활성화", "이 기기 관리 앱 비활성화",
        "Devre dışı bırak"
    )

    /** 恢复出厂设置 */
    val factoryReset = setOf(
        "恢复出厂设置", "重置手机", "清除所有数据", "重置设备",
        "Factory data reset", "Factory reset", "Erase all data", "Reset phone",
        "Restablecer datos de fábrica", "Borrar todos los datos",
        "Redefinir para o padrão de fábrica", "Apagar todos os dados",
        "Réinitialiser les données d'usine", "Effacer toutes les données",
        "Auf Werkseinstellungen zurücksetzen", "Alle Daten löschen",
        "Сброс настроек", "Удалить все данные",
        "إعادة ضبط المصنع",
        "फ़ैक्टरी डेटा रीसेट",
        "Setel ulang data pabrik",
        "Đặt lại dữ liệu gốc",
        "รีเซ็ตข้อมูลจากโรงงาน",
        "工場出荷時にリセット", "すべてのデータを消去",
        "공장 초기화", "모든 데이터 삭제",
        "Fabrika ayarlarına sıfırla"
    )

    /** 卸载按钮（用于识别"我们的应用详情页"） */
    val uninstall = setOf(
        "卸载", "卸載", "Uninstall", "Desinstalar", "Desinstalar", "Désinstaller",
        "Deinstallieren", "Удалить", "إلغاء التثبيت", "अनइंस्टॉल करें", "Copot pemasangan",
        "Gỡ cài đặt", "ถอนการติดตั้ง", "アンインストール", "제거", "Kaldır"
    )

    /** 强制停止按钮 */
    val forceStop = setOf(
        "强制停止", "強制停止", "Force stop", "Forzar detención", "Forçar parada",
        "Forcer l'arrêt", "Beenden erzwingen", "Остановить принудительно",
        "إيقاف إجباري", "ज़बरदस्ती रोकें", "Hentikan paksa", "Buộc dừng",
        "บังคับหยุด", "強制停止", "강제 중지", "Zorla durdur"
    )

    /**
     * 判断一段文字是不是「正向」按钮。
     * 用**完全相等**而不是包含：`findAccessibilityNodeInfosByText("允许")` 会把「不允许」也匹配进来，
     * 实测会导致一直点拒绝、权限一个都授不下来。
     */
    fun isAllowText(text: String?): Boolean {
        val t = text?.trim() ?: return false
        if (t.isEmpty()) return false
        if (deny.contains(t)) return false
        if (allow.contains(t)) return true
        val low = t.lowercase()
        val negative = low.startsWith("don't") || low.startsWith("do not") ||
            low.contains("不允许") || low.contains("deny") || low.contains("ne pas") ||
            low.contains("nicht zulassen")
        if (negative) return false
        return low.contains("allow") || low.contains("允许") || low.contains("permitir") ||
            low.contains("autoriser") || low.contains("zulassen") || low.contains("разрешить") ||
            low.contains("izinkan") || low.contains("cho phép") || low.contains("อนุญาต")
    }
}
