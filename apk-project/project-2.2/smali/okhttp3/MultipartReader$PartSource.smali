.class final Lokhttp3/MultipartReader$PartSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ؼ;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/MultipartReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "PartSource"
.end annotation


# instance fields
.field final synthetic this$0:Lokhttp3/MultipartReader;

.field private final timeout:Lۀۗ۱/ؿ;


# direct methods
.method public constructor <init>(Lokhttp3/MultipartReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lۀۗ۱/ؿ;

    invoke-direct {p1}, Lۀۗ۱/ؿ;-><init>()V

    iput-object p1, p0, Lokhttp3/MultipartReader$PartSource;->timeout:Lۀۗ۱/ؿ;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    iget-object v0, p0, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    invoke-static {v0}, Lokhttp3/MultipartReader;->access$getCurrentPart$p(Lokhttp3/MultipartReader;)Lokhttp3/MultipartReader$PartSource;

    move-result-object v0

    invoke-static {v0, p0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lokhttp3/MultipartReader;->access$setCurrentPart$p(Lokhttp3/MultipartReader;Lokhttp3/MultipartReader$PartSource;)V

    :cond_0
    return-void
.end method

.method public read(Lۀۗ۱/ب;J)J
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-wide/from16 v2, p2

    const-string v4, "sink"

    invoke-static {v0, v4}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-ltz v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    if-eqz v6, :cond_e

    iget-object v6, v1, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    invoke-static {v6}, Lokhttp3/MultipartReader;->access$getCurrentPart$p(Lokhttp3/MultipartReader;)Lokhttp3/MultipartReader$PartSource;

    move-result-object v6

    invoke-static {v6, v1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    iget-object v6, v1, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    invoke-static {v6}, Lokhttp3/MultipartReader;->access$getSource$p(Lokhttp3/MultipartReader;)Lۀۗ۱/ت;

    move-result-object v6

    invoke-interface {v6}, Lۀۗ۱/ؼ;->timeout()Lۀۗ۱/ؿ;

    move-result-object v6

    iget-object v7, v1, Lokhttp3/MultipartReader$PartSource;->timeout:Lۀۗ۱/ؿ;

    iget-object v8, v1, Lokhttp3/MultipartReader$PartSource;->this$0:Lokhttp3/MultipartReader;

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v9

    sget-object v11, Lۀۗ۱/ؿ;->Companion:Lۀۗ۱/ؾ;

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v12

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v14

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    cmp-long v11, v12, v4

    if-nez v11, :cond_1

    goto :goto_1

    :cond_1
    cmp-long v4, v14, v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    cmp-long v4, v12, v14

    if-gez v4, :cond_3

    goto :goto_2

    :cond_3
    :goto_1
    move-wide v12, v14

    :goto_2
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v12, v13, v4}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v11

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v13

    move-wide v15, v11

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v11

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    invoke-virtual {v6, v11, v12}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    goto :goto_3

    :cond_4
    move-wide v15, v11

    :goto_3
    :try_start_0
    invoke-static {v8, v2, v3}, Lokhttp3/MultipartReader;->access$currentPartBytesRemaining(Lokhttp3/MultipartReader;J)J

    move-result-wide v2

    const-wide/16 v11, 0x0

    cmp-long v5, v2, v11

    if-nez v5, :cond_5

    const-wide/16 v2, -0x1

    goto :goto_4

    :cond_5
    invoke-static {v8}, Lokhttp3/MultipartReader;->access$getSource$p(Lokhttp3/MultipartReader;)Lۀۗ۱/ت;

    move-result-object v5

    invoke-interface {v5, v0, v2, v3}, Lۀۗ۱/ؼ;->read(Lۀۗ۱/ب;J)J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_4
    invoke-virtual {v6, v9, v10, v4}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_6

    move-wide v4, v15

    invoke-virtual {v6, v4, v5}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_6
    return-wide v2

    :catchall_0
    move-exception v0

    move-wide v4, v15

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v9, v10, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v6, v4, v5}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_7
    throw v0

    :cond_8
    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v11

    invoke-virtual {v6, v11, v12}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    :cond_9
    :try_start_1
    invoke-static {v8, v2, v3}, Lokhttp3/MultipartReader;->access$currentPartBytesRemaining(Lokhttp3/MultipartReader;J)J

    move-result-wide v2

    const-wide/16 v11, 0x0

    cmp-long v5, v2, v11

    if-nez v5, :cond_a

    const-wide/16 v2, -0x1

    goto :goto_5

    :cond_a
    invoke-static {v8}, Lokhttp3/MultipartReader;->access$getSource$p(Lokhttp3/MultipartReader;)Lۀۗ۱/ت;

    move-result-object v5

    invoke-interface {v5, v0, v2, v3}, Lۀۗ۱/ؼ;->read(Lۀۗ۱/ب;J)J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_5
    invoke-virtual {v6, v9, v10, v4}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->clearDeadline()Lۀۗ۱/ؿ;

    :cond_b
    return-wide v2

    :catchall_1
    move-exception v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v9, v10, v2}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    invoke-virtual {v7}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-virtual {v6}, Lۀۗ۱/ؿ;->clearDeadline()Lۀۗ۱/ؿ;

    :cond_c
    throw v0

    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    const-string v0, "byteCount < 0: "

    invoke-static {v0, v2, v3}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lokhttp3/MultipartReader$PartSource;->timeout:Lۀۗ۱/ؿ;

    return-object v0
.end method
