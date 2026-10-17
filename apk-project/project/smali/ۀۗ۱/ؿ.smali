.class public Lۀۗ۱/ؿ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Companion:Lۀۗ۱/ؾ;

.field public static final NONE:Lۀۗ۱/ؿ;


# instance fields
.field private deadlineNanoTime:J

.field private hasDeadline:Z

.field private timeoutNanos:J


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lۀۗ۱/ؾ;

    invoke-direct {v0}, Lۀۗ۱/ؾ;-><init>()V

    sput-object v0, Lۀۗ۱/ؿ;->Companion:Lۀۗ۱/ؾ;

    new-instance v0, Lۀۗ۱/ؽ;

    invoke-direct {v0}, Lۀۗ۱/ؽ;-><init>()V

    sput-object v0, Lۀۗ۱/ؿ;->NONE:Lۀۗ۱/ؿ;

    return-void
.end method


# virtual methods
.method public final awaitSignal(Ljava/util/concurrent/locks/Condition;)V
    .locals 9

    const-string v0, "condition"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v0

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    if-nez v0, :cond_0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->await()V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    if-eqz v0, :cond_1

    cmp-long v7, v1, v3

    if-eqz v7, :cond_1

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v5

    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v0

    sub-long v1, v0, v5

    :cond_2
    :goto_0
    cmp-long v0, v1, v3

    if-lez v0, :cond_3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v1, v2, v0}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v5

    :cond_3
    cmp-long p1, v3, v1

    if-gez p1, :cond_4

    return-void

    :cond_4
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "timeout"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "interrupted"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clearDeadline()Lۀۗ۱/ؿ;
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lۀۗ۱/ؿ;->hasDeadline:Z

    return-object p0
.end method

.method public clearTimeout()Lۀۗ۱/ؿ;
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lۀۗ۱/ؿ;->timeoutNanos:J

    return-object p0
.end method

.method public final deadline(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;
    .locals 2

    const-string v0, "unit"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    move-result-object p1

    return-object p1

    :cond_1
    const-string p3, "duration <= 0: "

    invoke-static {p3, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public deadlineNanoTime()J
    .locals 2

    iget-boolean v0, p0, Lۀۗ۱/ؿ;->hasDeadline:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lۀۗ۱/ؿ;->deadlineNanoTime:J

    return-wide v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No deadline"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public deadlineNanoTime(J)Lۀۗ۱/ؿ;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ؿ;->hasDeadline:Z

    iput-wide p1, p0, Lۀۗ۱/ؿ;->deadlineNanoTime:J

    return-object p0
.end method

.method public hasDeadline()Z
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ؿ;->hasDeadline:Z

    return v0
.end method

.method public final intersectWith(Lۀۗ۱/ؿ;Lڲٱۘۑدٿٰ/؋;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06c0\u06d7\u06f1/\u063f;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;",
            ")TT;"
        }
    .end annotation

    const-string v0, "other"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v0

    sget-object v2, Lۀۗ۱/ؿ;->Companion:Lۀۗ۱/ؾ;

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v3

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v7, 0x0

    cmp-long v2, v3, v7

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    cmp-long v2, v5, v7

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    cmp-long v2, v3, v5

    if-gez v2, :cond_2

    goto :goto_1

    :cond_2
    :goto_0
    move-wide v3, v5

    :goto_1
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v3, v4, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v3

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v5

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_3
    :try_start_0
    invoke-interface {p2}, Lڲٱۘۑدٿٰ/؋;->invoke()Ljava/lang/Object;

    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {p0, v3, v4}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_4
    return-object p2

    :catchall_0
    move-exception p2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p0, v3, v4}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_5
    throw p2

    :cond_6
    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_7
    :try_start_1
    invoke-interface {p2}, Lڲٱۘۑدٿٰ/؋;->invoke()Ljava/lang/Object;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->clearDeadline()Lۀۗ۱/ؿ;

    :cond_8
    return-object p2

    :catchall_1
    move-exception p2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {p1}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->clearDeadline()Lۀۗ۱/ؿ;

    :cond_9
    throw p2
.end method

.method public throwIfReached()V
    .locals 4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lۀۗ۱/ؿ;->hasDeadline:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lۀۗ۱/ؿ;->deadlineNanoTime:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "deadline reached"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void

    :cond_2
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "interrupted"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;
    .locals 2

    const-string v0, "unit"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lۀۗ۱/ؿ;->timeoutNanos:J

    return-object p0

    :cond_1
    const-string p3, "timeout < 0: "

    invoke-static {p3, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public timeoutNanos()J
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ؿ;->timeoutNanos:J

    return-wide v0
.end method

.method public final waitUntilNotified(Ljava/lang/Object;)V
    .locals 9

    const-string v0, "monitor"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v0

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    if-nez v0, :cond_0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->wait()V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    if-eqz v0, :cond_1

    cmp-long v7, v1, v3

    if-eqz v7, :cond_1

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v5

    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v0

    sub-long v1, v0, v5

    :cond_2
    :goto_0
    cmp-long v0, v1, v3

    if-lez v0, :cond_3

    const-wide/32 v3, 0xf4240

    div-long v7, v1, v3

    mul-long/2addr v3, v7

    sub-long v3, v1, v3

    long-to-int v0, v3

    invoke-virtual {p1, v7, v8, v0}, Ljava/lang/Object;->wait(JI)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v5

    :cond_3
    cmp-long p1, v3, v1

    if-gez p1, :cond_4

    return-void

    :cond_4
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "timeout"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "interrupted"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
