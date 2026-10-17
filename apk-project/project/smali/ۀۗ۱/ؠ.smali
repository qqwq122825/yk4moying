.class public final Lۀۗ۱/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static ؋()Lۀۗ۱/ؤ;
    .locals 7

    invoke-static {}, Lۀۗ۱/ؤ;->access$getHead$cp()Lۀۗ۱/ؤ;

    move-result-object v0

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-static {v0}, Lۀۗ۱/ؤ;->access$getNext$p(Lۀۗ۱/ؤ;)Lۀۗ۱/ؤ;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    const/4 v3, 0x0

    if-nez v0, :cond_1

    invoke-static {}, Lۀۗ۱/ؤ;->access$getCondition$cp()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-static {}, Lۀۗ۱/ؤ;->access$getIDLE_TIMEOUT_MILLIS$cp()J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v4, v5, v6}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    invoke-static {}, Lۀۗ۱/ؤ;->access$getHead$cp()Lۀۗ۱/ؤ;

    move-result-object v0

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-static {v0}, Lۀۗ۱/ؤ;->access$getNext$p(Lۀۗ۱/ؤ;)Lۀۗ۱/ؤ;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr v4, v1

    invoke-static {}, Lۀۗ۱/ؤ;->access$getIDLE_TIMEOUT_NANOS$cp()J

    move-result-wide v0

    cmp-long v0, v4, v0

    if-ltz v0, :cond_0

    invoke-static {}, Lۀۗ۱/ؤ;->access$getHead$cp()Lۀۗ۱/ؤ;

    move-result-object v3

    :cond_0
    return-object v3

    :cond_1
    invoke-static {v0, v1, v2}, Lۀۗ۱/ؤ;->access$remainingNanos(Lۀۗ۱/ؤ;J)J

    move-result-wide v1

    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_2

    invoke-static {}, Lۀۗ۱/ؤ;->access$getCondition$cp()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v4}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    return-object v3

    :cond_2
    invoke-static {}, Lۀۗ۱/ؤ;->access$getHead$cp()Lۀۗ۱/ؤ;

    move-result-object v1

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-static {v0}, Lۀۗ۱/ؤ;->access$getNext$p(Lۀۗ۱/ؤ;)Lۀۗ۱/ؤ;

    move-result-object v2

    invoke-static {v1, v2}, Lۀۗ۱/ؤ;->access$setNext$p(Lۀۗ۱/ؤ;Lۀۗ۱/ؤ;)V

    invoke-static {v0, v3}, Lۀۗ۱/ؤ;->access$setNext$p(Lۀۗ۱/ؤ;Lۀۗ۱/ؤ;)V

    return-object v0
.end method
