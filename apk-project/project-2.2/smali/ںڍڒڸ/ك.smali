.class public final Lںڍڒڸ/ك;
.super Lںڍڒڸ/ق;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ط;


# instance fields
.field public final آ:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 4

    invoke-direct {p0}, Lںڍڒڸ/ق;-><init>()V

    iput-object p1, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    sget-object v0, Lھۥٓڍچ/ؠ;->؋:Ljava/lang/reflect/Method;

    :try_start_0
    instance-of v0, p1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    sget-object v0, Lھۥٓڍچ/ؠ;->؋:Ljava/lang/reflect/Method;

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :goto_1
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    instance-of v1, v0, Ljava/util/concurrent/ExecutorService;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    :cond_1
    return-void
.end method

.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/util/concurrent/CancellationException;

    const-string v2, "The task was rejected"

    invoke-direct {v1, v2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    sget-object v0, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {p1, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Lںڍڒڸ/ى;

    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    :cond_0
    sget-object v0, Lںڍڒڸ/غ;->ؠ:Lڿدڮۀڸة/ء;

    invoke-virtual {v0, p1, p2}, Lڿدڮۀڸة/ء;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lںڍڒڸ/ك;

    if-eqz v0, :cond_0

    check-cast p1, Lںڍڒڸ/ك;

    iget-object p1, p1, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ر(JLںڍڒڸ/ئ;)V
    .locals 4

    iget-object v0, p0, Lںڍڒڸ/ك;->آ:Ljava/util/concurrent/Executor;

    instance-of v1, v0, Ljava/util/concurrent/ScheduledExecutorService;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_1

    new-instance v1, Lحظتۢۋۜآظ/ة;

    const/16 v3, 0xe

    invoke-direct {v1, v3, p0, p3}, Lحظتۢۋۜآظ/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, p1, p2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v2
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    new-instance v1, Ljava/util/concurrent/CancellationException;

    const-string v3, "The task was rejected"

    invoke-direct {v1, v3}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    sget-object v0, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    iget-object v3, p3, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-interface {v3, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Lںڍڒڸ/ى;

    if-eqz v0, :cond_1

    invoke-interface {v0, v1}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    new-instance p1, Lںڍڒڸ/أ;

    const/4 p2, 0x0

    invoke-direct {p1, p2, v2}, Lںڍڒڸ/أ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p3, p1}, Lںڍڒڸ/ئ;->د(Lڲٱۘۑدٿٰ/ت;)V

    return-void

    :cond_2
    sget-object v0, Lںڍڒڸ/ص;->ة:Lںڍڒڸ/ص;

    invoke-virtual {v0, p1, p2, p3}, Lںڍڒڸ/ـ;->ر(JLںڍڒڸ/ئ;)V

    return-void
.end method
