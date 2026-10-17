.class public final Landroidx/lifecycle/FlowLiveDataConversions;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final asFlow(Landroidx/lifecycle/LiveData;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;)",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1;-><init>(Landroidx/lifecycle/LiveData;Lڨڡئٸت/أ;)V

    new-instance p0, Lھٳ۰ڌ؄غڎۦ/ء;

    sget-object v2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    sget-object v3, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    const/4 v4, -0x2

    invoke-direct {p0, v0, v2, v4, v3}, Lھٳ۰ڌ؄غڎۦ/ء;-><init>(Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    sget-object v0, Lڽتٺۊڗ؜/؋;->أ:Lڽتٺۊڗ؜/؋;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p0, v1, v2, v0, v3}, Lڃٷښـ۝ۼ/ؠ;->ا(Lھڳۄ٧ڕڊ/ج;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;I)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p0

    return-object p0
.end method

.method public static final asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;)Landroidx/lifecycle/LiveData;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Landroidx/lifecycle/FlowLiveDataConversions;->asLiveData$default(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;JILjava/lang/Object;)Landroidx/lifecycle/LiveData;

    move-result-object p0

    return-object p0
.end method

.method public static final asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Ljava/time/Duration;Lڨڡئٸت/ا;)Landroidx/lifecycle/LiveData;
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;",
            "Ljava/time/Duration;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0627;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timeout"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Landroidx/lifecycle/Api26Impl;->INSTANCE:Landroidx/lifecycle/Api26Impl;

    invoke-virtual {v0, p1}, Landroidx/lifecycle/Api26Impl;->toMillis(Ljava/time/Duration;)J

    move-result-wide v0

    invoke-static {p0, p2, v0, v1}, Landroidx/lifecycle/FlowLiveDataConversions;->asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;J)Landroidx/lifecycle/LiveData;

    move-result-object p0

    return-object p0
.end method

.method public static final asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;)Landroidx/lifecycle/LiveData;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0627;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Landroidx/lifecycle/FlowLiveDataConversions;->asLiveData$default(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;JILjava/lang/Object;)Landroidx/lifecycle/LiveData;

    move-result-object p0

    return-object p0
.end method

.method public static final asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;J)Landroidx/lifecycle/LiveData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0627;",
            "J)",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/FlowLiveDataConversions$asLiveData$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/FlowLiveDataConversions$asLiveData$1;-><init>(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/أ;)V

    invoke-static {p1, p2, p3, v0}, Landroidx/lifecycle/CoroutineLiveDataKt;->liveData(Lڨڡئٸت/ا;JLڲٱۘۑدٿٰ/خ;)Landroidx/lifecycle/LiveData;

    move-result-object p1

    instance-of p2, p0, Lھٳ۰ڌ؄غڎۦ/ث;

    if-eqz p2, :cond_1

    invoke-static {}, Landroidx/arch/core/executor/ArchTaskExecutor;->getInstance()Landroidx/arch/core/executor/ArchTaskExecutor;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/arch/core/executor/ArchTaskExecutor;->isMainThread()Z

    move-result p2

    check-cast p0, Lھٳ۰ڌ؄غڎۦ/ث;

    invoke-interface {p0}, Lھٳ۰ڌ؄غڎۦ/ث;->getValue()Ljava/lang/Object;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-virtual {p1, p0}, Landroidx/lifecycle/LiveData;->setValue(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p0}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method public static synthetic asLiveData$default(Lھٳ۰ڌ؄غڎۦ/إ;Ljava/time/Duration;Lڨڡئٸت/ا;ILjava/lang/Object;)Landroidx/lifecycle/LiveData;
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    sget-object p2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    :cond_0
    invoke-static {p0, p1, p2}, Landroidx/lifecycle/FlowLiveDataConversions;->asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Ljava/time/Duration;Lڨڡئٸت/ا;)Landroidx/lifecycle/LiveData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic asLiveData$default(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;JILjava/lang/Object;)Landroidx/lifecycle/LiveData;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    sget-object p1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    :cond_0
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_1

    const-wide/16 p2, 0x1388

    :cond_1
    invoke-static {p0, p1, p2, p3}, Landroidx/lifecycle/FlowLiveDataConversions;->asLiveData(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;J)Landroidx/lifecycle/LiveData;

    move-result-object p0

    return-object p0
.end method
