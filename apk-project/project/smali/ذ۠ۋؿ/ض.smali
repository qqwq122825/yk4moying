.class public final Lذ۠ۋؿ/ض;
.super Lصٝتږۗ/آ;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lذ۠ۋؿ/إ;


# direct methods
.method public constructor <init>(Lذ۠ۋؿ/إ;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    const/4 p1, 0x1

    invoke-direct {p0, p2, p1}, Lصٝتږۗ/آ;-><init>(Landroid/os/Looper;I)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 10

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    const/4 v2, 0x0

    const/4 v3, 0x7

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eq v0, v1, :cond_3

    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_0

    if-eq v0, v5, :cond_0

    if-ne v0, v3, :cond_1

    :cond_0
    move v2, v5

    :cond_1
    if-eqz v2, :cond_2

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ۠ۋؿ/ز;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter p1

    :try_start_0
    iput-object v6, p1, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v0, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_1
    iget-object v1, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v1, v1, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_1
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :cond_2
    :goto_0
    return-void

    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    const/4 v7, 0x5

    if-eq v0, v5, :cond_5

    if-eq v0, v3, :cond_5

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1

    :cond_4
    if-ne v0, v7, :cond_6

    :cond_5
    :goto_1
    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->د()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_6
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v8, 0x3

    const/16 v9, 0x8

    if-ne v0, v1, :cond_d

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    new-instance v1, Lحۨٸڮؐێ/؋;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v1, p1}, Lحۨٸڮؐێ/؋;-><init>(I)V

    iput-object v1, v0, Lذ۠ۋؿ/إ;->ر:Lحۨٸڮؐێ/؋;

    iget-boolean p1, v0, Lذ۠ۋؿ/إ;->ز:Z

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->ث()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_2

    :cond_8
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_2

    :cond_9
    :try_start_3
    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->ث()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    move v2, v5

    :catch_0
    :goto_2
    if-eqz v2, :cond_b

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-boolean v0, p1, Lذ۠ۋؿ/إ;->ز:Z

    if-eqz v0, :cond_a

    goto :goto_3

    :cond_a
    invoke-virtual {p1, v6, v8}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    return-void

    :cond_b
    :goto_3
    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-object v0, p1, Lذ۠ۋؿ/إ;->ر:Lحۨٸڮؐێ/؋;

    if-eqz v0, :cond_c

    goto :goto_4

    :cond_c
    new-instance v0, Lحۨٸڮؐێ/؋;

    invoke-direct {v0, v9}, Lحۨٸڮؐێ/؋;-><init>(I)V

    :goto_4
    iget-object p1, p1, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    invoke-interface {p1, v0}, Lذ۠ۋؿ/ؠ;->؋(Lحۨٸڮؐێ/؋;)V

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void

    :cond_d
    if-ne v0, v7, :cond_f

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-object v0, p1, Lذ۠ۋؿ/إ;->ر:Lحۨٸڮؐێ/؋;

    if-eqz v0, :cond_e

    goto :goto_5

    :cond_e
    new-instance v0, Lحۨٸڮؐێ/؋;

    invoke-direct {v0, v9}, Lحۨٸڮؐێ/؋;-><init>(I)V

    :goto_5
    iget-object p1, p1, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    invoke-interface {p1, v0}, Lذ۠ۋؿ/ؠ;->؋(Lحۨٸڮؐێ/؋;)V

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void

    :cond_f
    if-ne v0, v8, :cond_11

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/PendingIntent;

    if-eqz v1, :cond_10

    move-object v6, v0

    check-cast v6, Landroid/app/PendingIntent;

    :cond_10
    new-instance v0, Lحۨٸڮؐێ/؋;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v0, p1, v6}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-object p1, p1, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    invoke-interface {p1, v0}, Lذ۠ۋؿ/ؠ;->؋(Lحۨٸڮؐێ/؋;)V

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void

    :cond_11
    const/4 v1, 0x6

    if-ne v0, v1, :cond_13

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {v0, v6, v7}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ج:Lذ۠ۋؿ/ء;

    if-eqz v0, :cond_12

    iget p1, p1, Landroid/os/Message;->arg2:I

    iget-object v0, v0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/آ;

    invoke-interface {v0, p1}, Lذ٨ۍ/آ;->؋(I)V

    :cond_12
    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object p1, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-static {p1, v7, v5, v6}, Lذ۠ۋؿ/إ;->ذ(Lذ۠ۋؿ/إ;IILandroid/os/IInterface;)Z

    return-void

    :cond_13
    if-ne v0, v4, :cond_15

    iget-object v0, p0, Lذ۠ۋؿ/ض;->؋:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_6

    :cond_14
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Lذ۠ۋؿ/ز;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter v0

    :try_start_4
    iput-object v6, v0, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    iget-object p1, v0, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object p1, p1, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    monitor-enter p1

    :try_start_5
    iget-object v1, v0, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v1, v1, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    return-void

    :catchall_2
    move-exception v0

    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0

    :catchall_3
    move-exception p1

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw p1

    :cond_15
    :goto_6
    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_16

    if-eq v0, v5, :cond_16

    if-ne v0, v3, :cond_17

    :cond_16
    move v2, v5

    :cond_17
    if-eqz v2, :cond_1c

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ۠ۋؿ/ز;

    const-string v0, "Callback proxy "

    monitor-enter p1

    :try_start_7
    iget-object v1, p1, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    iget-boolean v2, p1, Lذ۠ۋؿ/ز;->ؠ:Z

    if-eqz v2, :cond_18

    const-string v2, "GmsClient"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " being reused. This is not safe."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_18
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    if-eqz v1, :cond_1b

    iget-object v0, p1, Lذ۠ۋؿ/ز;->ؤ:Lذ۠ۋؿ/إ;

    iget v1, p1, Lذ۠ۋؿ/ز;->آ:I

    if-nez v1, :cond_19

    invoke-virtual {p1}, Lذ۠ۋؿ/ز;->ؠ()Z

    move-result v1

    if-nez v1, :cond_1b

    invoke-virtual {v0, v6, v5}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    new-instance v0, Lحۨٸڮؐێ/؋;

    invoke-direct {v0, v9, v6}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    goto :goto_8

    :cond_19
    invoke-virtual {v0, v6, v5}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    iget-object v0, p1, Lذ۠ۋؿ/ز;->أ:Landroid/os/Bundle;

    if-eqz v0, :cond_1a

    const-string v2, "pendingIntent"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    goto :goto_7

    :cond_1a
    move-object v0, v6

    :goto_7
    new-instance v2, Lحۨٸڮؐێ/؋;

    invoke-direct {v2, v1, v0}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    move-object v0, v2

    :goto_8
    invoke-virtual {p1, v0}, Lذ۠ۋؿ/ز;->؋(Lحۨٸڮؐێ/؋;)V

    :cond_1b
    monitor-enter p1

    :try_start_8
    iput-boolean v5, p1, Lذ۠ۋؿ/ز;->ؠ:Z

    monitor-exit p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    monitor-enter p1

    :try_start_9
    iput-object v6, p1, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    monitor-exit p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    iget-object v0, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_a
    iget-object v1, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v1, v1, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_4
    move-exception p1

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw p1

    :catchall_5
    move-exception v0

    :try_start_b
    monitor-exit p1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v0

    :catchall_6
    move-exception v0

    :try_start_c
    monitor-exit p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    throw v0

    :catchall_7
    move-exception v0

    :try_start_d
    monitor-exit p1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    throw v0

    :cond_1c
    const-string p1, "Don\'t know how to handle message: "

    invoke-static {p1, v0}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    const-string v1, "GmsClient"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    :cond_1d
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ۠ۋؿ/ز;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter p1

    :try_start_e
    iput-object v6, p1, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    monitor-exit p1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    iget-object v0, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_f
    iget-object v1, p1, Lذ۠ۋؿ/ز;->ء:Lذ۠ۋؿ/إ;

    iget-object v1, v1, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_8
    move-exception p1

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    throw p1

    :catchall_9
    move-exception v0

    :try_start_10
    monitor-exit p1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    throw v0
.end method
