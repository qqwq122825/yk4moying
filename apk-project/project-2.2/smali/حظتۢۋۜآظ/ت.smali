.class public final synthetic Lحظتۢۋۜآظ/ت;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lحظتۢۋۜآظ/ج;


# direct methods
.method public synthetic constructor <init>(Lحظتۢۋۜآظ/ج;I)V
    .locals 0

    iput p2, p0, Lحظتۢۋۜآظ/ت;->آ:I

    iput-object p1, p0, Lحظتۢۋۜآظ/ت;->أ:Lحظتۢۋۜآظ/ج;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    iget v0, p0, Lحظتۢۋۜآظ/ت;->آ:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    iget-object v0, p0, Lحظتۢۋۜآظ/ت;->أ:Lحظتۢۋۜآظ/ج;

    monitor-enter v0

    :try_start_0
    iget v2, v0, Lحظتۢۋۜآظ/ج;->؋:I

    if-ne v2, v1, :cond_0

    const-string v2, "Timed out while binding"

    invoke-virtual {v0, v1, v2}, Lحظتۢۋۜآظ/ج;->؋(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :goto_0
    :pswitch_1
    iget-object v0, p0, Lحظتۢۋۜآظ/ت;->أ:Lحظتۢۋۜآظ/ج;

    monitor-enter v0

    :try_start_1
    iget v3, v0, Lحظتۢۋۜآظ/ج;->؋:I

    if-eq v3, v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v3, v0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Lحظتۢۋۜآظ/ج;->ء()V

    :goto_1
    monitor-exit v0

    return-void

    :cond_2
    iget-object v3, v0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lحظتۢۋۜآظ/خ;

    iget-object v4, v0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    iget v5, v3, Lحظتۢۋۜآظ/خ;->؋:I

    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v4, v0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object v4, v4, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v5, Lحظتۢۋۜآظ/ة;

    invoke-direct {v5, v1, v0, v3}, Lحظتۢۋۜآظ/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v7, 0x1e

    invoke-interface {v4, v5, v7, v8, v6}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-string v4, "MessengerIpcClient"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Sending "

    const-string v6, "MessengerIpcClient"

    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iget-object v4, v0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object v5, v0, Lحظتۢۋۜآظ/ج;->ؠ:Landroid/os/Messenger;

    iget v6, v3, Lحظتۢۋۜآظ/خ;->ء:I

    iget-object v4, v4, Lحظتۢۋۜآظ/ذ;->؋:Landroid/content/Context;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v7

    iput v6, v7, Landroid/os/Message;->what:I

    iget v6, v3, Lحظتۢۋۜآظ/خ;->؋:I

    iput v6, v7, Landroid/os/Message;->arg1:I

    iput-object v5, v7, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    move-object v6, v3

    check-cast v6, Lحظتۢۋۜآظ/ح;

    iget v6, v6, Lحظتۢۋۜآظ/ح;->أ:I

    packed-switch v6, :pswitch_data_1

    const/4 v6, 0x0

    goto :goto_2

    :pswitch_2
    move v6, v1

    :goto_2
    const-string v8, "oneWay"

    invoke-virtual {v5, v8, v6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "pkg"

    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v3, Lحظتۢۋۜآظ/خ;->آ:Landroid/os/Bundle;

    const-string v4, "data"

    invoke-virtual {v5, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {v7, v5}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    :try_start_2
    iget-object v3, v0, Lحظتۢۋۜآظ/ج;->ء:Lآۋۻؾ۹/ة;

    iget-object v4, v3, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v4, Landroid/os/Messenger;

    if-eqz v4, :cond_4

    invoke-virtual {v4, v7}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    goto/16 :goto_0

    :cond_4
    iget-object v3, v3, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast v3, Lحظتۢۋۜآظ/إ;

    if-eqz v3, :cond_5

    iget-object v3, v3, Lحظتۢۋۜآظ/إ;->آ:Landroid/os/Messenger;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v7}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    goto/16 :goto_0

    :cond_5
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Both messengers are null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lحظتۢۋۜآظ/ج;->؋(ILjava/lang/String;)V

    goto/16 :goto_0

    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    :goto_3
    iget-object v0, p0, Lحظتۢۋۜآظ/ت;->أ:Lحظتۢۋۜآظ/ج;

    const-string v1, "Service disconnected"

    invoke-virtual {v0, v2, v1}, Lحظتۢۋۜآظ/ج;->؋(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
    .end packed-switch
.end method
