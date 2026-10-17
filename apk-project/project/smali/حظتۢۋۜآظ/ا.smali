.class public final synthetic Lحظتۢۋۜآظ/ا;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final أ:Ljava/lang/Object;

.field public final ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;I)V
    .locals 0

    iput p4, p0, Lحظتۢۋۜآظ/ا;->آ:I

    iput-object p1, p0, Lحظتۢۋۜآظ/ا;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lحظتۢۋۜآظ/ا;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Lحظتۢۋۜآظ/ا;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    iget v0, p0, Lحظتۢۋۜآظ/ا;->آ:I

    iget-object v1, p0, Lحظتۢۋۜآظ/ا;->إ:Ljava/lang/Object;

    iget-object v2, p0, Lحظتۢۋۜآظ/ا;->أ:Ljava/lang/Object;

    iget-object v3, p0, Lحظتۢۋۜآظ/ا;->ؤ:Ljava/lang/Object;

    const/4 v4, 0x5

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    check-cast v3, Landroid/view/View;

    if-eqz v3, :cond_0

    check-cast v1, Lـ۰صںڱیؕ/آ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_0
    return-void

    :pswitch_1
    check-cast v1, Lذ٨ۍ/ؽ;

    iget v0, v1, Lذ٨ۍ/ؽ;->ؠ:I

    if-lez v0, :cond_2

    move-object v0, v2

    check-cast v0, Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    iget-object v9, v1, Lذ٨ۍ/ؽ;->ء:Landroid/os/Bundle;

    if-eqz v9, :cond_1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v9, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    :cond_1
    invoke-virtual {v0, v8}, Lcom/google/android/gms/common/api/internal/LifecycleCallback;->ء(Landroid/os/Bundle;)V

    :cond_2
    iget v0, v1, Lذ٨ۍ/ؽ;->ؠ:I

    if-lt v0, v7, :cond_3

    move-object v0, v2

    check-cast v0, Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/LifecycleCallback;->ؤ()V

    :cond_3
    iget v0, v1, Lذ٨ۍ/ؽ;->ؠ:I

    if-lt v0, v6, :cond_4

    move-object v0, v2

    check-cast v0, Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/LifecycleCallback;->آ()V

    :cond_4
    iget v0, v1, Lذ٨ۍ/ؽ;->ؠ:I

    if-lt v0, v5, :cond_5

    move-object v0, v2

    check-cast v0, Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/LifecycleCallback;->إ()V

    :cond_5
    iget v0, v1, Lذ٨ۍ/ؽ;->ؠ:I

    if-lt v0, v4, :cond_6

    check-cast v2, Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_6
    return-void

    :pswitch_2
    check-cast v1, Lذ٨ۍ/ؼ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_3
    check-cast v3, Lحظتۢۋۜآظ/؋;

    const-string v0, "google.message_id"

    iget-object v4, v3, Lحظتۢۋۜآظ/؋;->آ:Landroid/content/Intent;

    invoke-virtual {v4, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    const-string v0, "message_id"

    invoke-virtual {v4, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_8

    invoke-static {v8}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    goto :goto_0

    :cond_8
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v5, "google.message_id"

    iget-object v6, v3, Lحظتۢۋۜآظ/؋;->آ:Landroid/content/Intent;

    invoke-virtual {v6, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_9

    const-string v5, "message_id"

    invoke-virtual {v6, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_9
    const-string v6, "google.message_id"

    invoke-virtual {v0, v6, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v3, Lحظتۢۋۜآظ/؋;->آ:Landroid/content/Intent;

    const-string v5, "google.product_id"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v6

    const/4 v9, 0x0

    if-eqz v6, :cond_a

    invoke-virtual {v3, v5, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :cond_a
    if-eqz v8, :cond_b

    const-string v3, "google.product_id"

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0, v3, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_b
    check-cast v2, Landroid/content/Context;

    const-string v3, "supports_message_handled"

    invoke-virtual {v0, v3, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-static {v2}, Lحظتۢۋۜآظ/ذ;->؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;

    move-result-object v2

    new-instance v3, Lحظتۢۋۜآظ/ح;

    monitor-enter v2

    :try_start_0
    iget v5, v2, Lحظتۢۋۜآظ/ذ;->آ:I

    add-int/lit8 v6, v5, 0x1

    iput v6, v2, Lحظتۢۋۜآظ/ذ;->آ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    invoke-direct {v3, v5, v7, v0, v9}, Lحظتۢۋۜآظ/ح;-><init>(IILandroid/os/Bundle;I)V

    invoke-virtual {v2, v3}, Lحظتۢۋۜآظ/ذ;->ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    :goto_0
    check-cast v1, Ljava/util/concurrent/CountDownLatch;

    sget-object v2, Lحظتۢۋۜآظ/ئ;->آ:Lحظتۢۋۜآظ/ئ;

    new-instance v3, Lئٱنۃؖۊڄئ/آ;

    invoke-direct {v3, v4, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v2, v3}, Lؾپۑ۟ڂڷ/ح;->؋(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :goto_1
    check-cast v2, Landroid/widget/LinearLayout;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    check-cast v1, Ljava/lang/Runnable;

    if-eqz v1, :cond_c

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
