.class public final Lحظتۢۋۜآظ/ج;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public ؋:I

.field public final ؠ:Landroid/os/Messenger;

.field public ء:Lآۋۻؾ۹/ة;

.field public final آ:Ljava/util/ArrayDeque;

.field public final أ:Landroid/util/SparseArray;

.field public final synthetic ؤ:Lحظتۢۋۜآظ/ذ;


# direct methods
.method public synthetic constructor <init>(Lحظتۢۋۜآظ/ذ;)V
    .locals 4

    iput-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lحظتۢۋۜآظ/ج;->؋:I

    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lصٝتږۗ/آ;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    new-instance v3, Lحظتۢۋۜآظ/ث;

    invoke-direct {v3, p1, p0}, Lحظتۢۋۜآظ/ث;-><init>(ILjava/lang/Object;)V

    invoke-direct {v1, v2, v3, p1}, Lصٝتږۗ/آ;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;I)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lحظتۢۋۜآظ/ج;->ؠ:Landroid/os/Messenger;

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    const/4 p1, 0x2

    const-string v0, "MessengerIpcClient"

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "Service connected"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object p1, p1, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Lحظتۢۋۜآظ/ة;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p2}, Lحظتۢۋۜآظ/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    const-string p1, "MessengerIpcClient"

    const/4 v0, 0x2

    invoke-static {p1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Service disconnected"

    invoke-static {p1, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object p1, p1, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lحظتۢۋۜآظ/ت;

    invoke-direct {v1, p0, v0}, Lحظتۢۋۜآظ/ت;-><init>(Lحظتۢۋۜآظ/ج;I)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final declared-synchronized ؋(ILjava/lang/String;)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p2, p1, v0}, Lحظتۢۋۜآظ/ج;->ؠ(Ljava/lang/String;ILjava/lang/SecurityException;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized ؠ(Ljava/lang/String;ILjava/lang/SecurityException;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string p2, "MessengerIpcClient"

    const/4 v0, 0x3

    invoke-static {p2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "Disconnected: "

    const-string v2, "MessengerIpcClient"

    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget p2, p0, Lحظتۢۋۜآظ/ج;->؋:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_6

    const/4 v1, 0x1

    const/4 v2, 0x4

    const/4 v3, 0x2

    if-eq p2, v1, :cond_2

    if-eq p2, v3, :cond_2

    if-eq p2, v0, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    iput v2, p0, Lحظتۢۋۜآظ/ج;->؋:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    const-string p2, "MessengerIpcClient"

    invoke-static {p2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_3

    const-string p2, "MessengerIpcClient"

    const-string v0, "Unbinding service"

    invoke-static {p2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iput v2, p0, Lحظتۢۋۜآظ/ج;->؋:I

    iget-object p2, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    invoke-static {}, Lزءؽ۴ڰؠ/ؠ;->؋()Lزءؽ۴ڰؠ/ؠ;

    move-result-object v0

    iget-object p2, p2, Lحظتۢۋۜآظ/ذ;->؋:Landroid/content/Context;

    invoke-virtual {v0, p2, p0}, Lزءؽ۴ڰؠ/ؠ;->ؠ(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    new-instance p2, Lحظتۢۋۜآظ/د;

    invoke-direct {p2, p1, p3}, Lحظتۢۋۜآظ/د;-><init>(Ljava/lang/String;Ljava/lang/SecurityException;)V

    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lحظتۢۋۜآظ/خ;

    invoke-virtual {p3, p2}, Lحظتۢۋۜآظ/خ;->؋(Lحظتۢۋۜآظ/د;)V

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    const/4 p1, 0x0

    :goto_1
    iget-object p3, p0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    move-result p3

    if-ge p1, p3, :cond_5

    iget-object p3, p0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lحظتۢۋۜآظ/خ;

    invoke-virtual {p3, p2}, Lحظتۢۋۜآظ/خ;->؋(Lحظتۢۋۜآظ/د;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    :try_start_3
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized ء()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lحظتۢۋۜآظ/ج;->؋:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MessengerIpcClient"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MessengerIpcClient"

    const-string v1, "Finished handling requests, unbinding"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lحظتۢۋۜآظ/ج;->؋:I

    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    invoke-static {}, Lزءؽ۴ڰؠ/ؠ;->؋()Lزءؽ۴ڰؠ/ؠ;

    move-result-object v1

    iget-object v0, v0, Lحظتۢۋۜآظ/ذ;->؋:Landroid/content/Context;

    invoke-virtual {v1, v0, p0}, Lزءؽ۴ڰؠ/ؠ;->ؠ(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized آ(Lحظتۢۋۜآظ/ح;)Z
    .locals 11

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lحظتۢۋۜآظ/ج;->؋:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v3, :cond_1

    if-eq v0, v2, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object p1, p1, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Lحظتۢۋۜآظ/ت;

    invoke-direct {v0, p0, v1}, Lحظتۢۋۜآظ/ت;-><init>(Lحظتۢۋۜآظ/ج;I)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v3

    :cond_1
    :try_start_2
    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v3

    :cond_2
    :try_start_3
    iget-object v0, p0, Lحظتۢۋۜآظ/ج;->آ:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lحظتۢۋۜآظ/ج;->؋:I

    if-nez p1, :cond_3

    move p1, v3

    goto :goto_0

    :cond_3
    move p1, v1

    :goto_0
    if-eqz p1, :cond_6

    const-string p1, "MessengerIpcClient"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "MessengerIpcClient"

    const-string v0, "Starting bind to GmsCore"

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iput v3, p0, Lحظتۢۋۜآظ/ج;->؋:I

    new-instance v7, Landroid/content/Intent;

    const-string p1, "com.google.android.c2dm.intent.REGISTER"

    invoke-direct {v7, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.google.android.gms"

    invoke-virtual {v7, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {}, Lزءؽ۴ڰؠ/ؠ;->؋()Lزءؽ۴ڰؠ/ؠ;

    move-result-object v4

    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object v5, p1, Lحظتۢۋۜآظ/ذ;->؋:Landroid/content/Context;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x0

    const/4 v9, 0x1

    move-object v8, p0

    invoke-virtual/range {v4 .. v10}, Lزءؽ۴ڰؠ/ؠ;->ء(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/content/ServiceConnection;ILjava/util/concurrent/Executor;)Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "Unable to bind to service"

    invoke-virtual {p0, v1, p1}, Lحظتۢۋۜآظ/ج;->؋(ILjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :cond_5
    :try_start_5
    iget-object p1, p0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object p1, p1, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Lحظتۢۋۜآظ/ت;

    invoke-direct {v0, p0, v3}, Lحظتۢۋۜآظ/ت;-><init>(Lحظتۢۋۜآظ/ج;I)V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1e

    invoke-interface {p1, v0, v4, v5, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "Unable to bind to service"

    invoke-virtual {p0, v0, v1, p1}, Lحظتۢۋۜآظ/ج;->ؠ(Ljava/lang/String;ILjava/lang/SecurityException;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_1
    monitor-exit p0

    return v3

    :cond_6
    :try_start_6
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
