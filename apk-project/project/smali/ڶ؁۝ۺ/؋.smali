.class public final Lڶ؁۝ۺ/؋;
.super Lڴۄۓڿڟۅڥؾ/؋;
.source "SourceFile"


# virtual methods
.method public final ؋()Ljava/util/Random;
    .locals 2

    invoke-static {}, Ljava/util/concurrent/ThreadLocalRandom;->current()Ljava/util/concurrent/ThreadLocalRandom;

    move-result-object v0

    const-string v1, "current()"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
