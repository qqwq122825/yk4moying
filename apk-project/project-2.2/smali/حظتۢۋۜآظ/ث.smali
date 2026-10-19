.class public final synthetic Lحظتۢۋۜآظ/ث;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lحظتۢۋۜآظ/ث;->؋:I

    iput-object p2, p0, Lحظتۢۋۜآظ/ث;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 6

    iget v0, p0, Lحظتۢۋۜآظ/ث;->؋:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    const-string v0, "Received response for unknown request: "

    const-string v3, "MessengerIpcClient"

    iget v4, p1, Landroid/os/Message;->arg1:I

    const/4 v5, 0x3

    invoke-static {v3, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Received response to request: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "MessengerIpcClient"

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v3, p0, Lحظتۢۋۜآظ/ث;->ؠ:Ljava/lang/Object;

    check-cast v3, Lحظتۢۋۜآظ/ج;

    monitor-enter v3

    :try_start_0
    iget-object v5, v3, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lحظتۢۋۜآظ/خ;

    if-nez v5, :cond_1

    const-string p1, "MessengerIpcClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v3

    goto :goto_1

    :cond_1
    iget-object v0, v3, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {v0, v4}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v3}, Lحظتۢۋۜآظ/ج;->ء()V

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "unsupported"

    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "Not supported by GmsCore"

    new-instance v0, Lحظتۢۋۜآظ/د;

    invoke-direct {v0, p1, v1}, Lحظتۢۋۜآظ/د;-><init>(Ljava/lang/String;Ljava/lang/SecurityException;)V

    invoke-virtual {v5, v0}, Lحظتۢۋۜآظ/خ;->؋(Lحظتۢۋۜآظ/د;)V

    goto :goto_1

    :cond_2
    check-cast v5, Lحظتۢۋۜآظ/ح;

    iget v0, v5, Lحظتۢۋۜآظ/ح;->أ:I

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    :pswitch_1
    const-string v0, "ack"

    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {v5, v1}, Lحظتۢۋۜآظ/خ;->ؠ(Landroid/os/Bundle;)V

    goto :goto_1

    :cond_3
    new-instance p1, Lحظتۢۋۜآظ/د;

    const-string v0, "Invalid response to one way request"

    invoke-direct {p1, v0, v1}, Lحظتۢۋۜآظ/د;-><init>(Ljava/lang/String;Ljava/lang/SecurityException;)V

    invoke-virtual {v5, p1}, Lحظتۢۋۜآظ/خ;->؋(Lحظتۢۋۜآظ/د;)V

    goto :goto_1

    :goto_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_4

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_4
    invoke-virtual {v5, p1}, Lحظتۢۋۜآظ/خ;->ؠ(Landroid/os/Bundle;)V

    :goto_1
    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :goto_2
    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_5

    return v2

    :cond_5
    iget-object v0, p0, Lحظتۢۋۜآظ/ث;->ؠ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/ص;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    iget-object p1, v0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    monitor-enter p1

    :try_start_2
    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v1

    :catchall_1
    move-exception v0

    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
