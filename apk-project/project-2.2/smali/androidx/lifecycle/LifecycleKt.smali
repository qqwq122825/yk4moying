.class public final Landroidx/lifecycle/LifecycleKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final getCoroutineScope(Landroidx/lifecycle/Lifecycle;)Landroidx/lifecycle/LifecycleCoroutineScope;
    .locals 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Landroidx/lifecycle/Lifecycle;->getInternalScopeRef()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;

    new-instance v1, Lںڍڒڸ/ٽ;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lںڍڒڸ/ٽ;-><init>(Lںڍڒڸ/ى;)V

    sget-object v3, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    sget-object v3, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    check-cast v3, Lںڏۑڎڔٙ۰/آ;

    iget-object v3, v3, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;

    invoke-virtual {v1, v3}, Lںڍڒڸ/ٵ;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;-><init>(Landroidx/lifecycle/Lifecycle;Lڨڡئٸت/ا;)V

    invoke-virtual {p0}, Landroidx/lifecycle/Lifecycle;->getInternalScopeRef()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v1

    :cond_2
    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v1, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;->register()V

    return-object v0
.end method

.method public static final getEventFlow(Landroidx/lifecycle/Lifecycle;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/Lifecycle;",
            ")",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/LifecycleKt$eventFlow$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/LifecycleKt$eventFlow$1;-><init>(Landroidx/lifecycle/Lifecycle;Lڨڡئٸت/أ;)V

    new-instance p0, Lھٳ۰ڌ؄غڎۦ/ء;

    sget-object v1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    sget-object v2, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    const/4 v3, -0x2

    invoke-direct {p0, v0, v1, v3, v2}, Lھٳ۰ڌ؄غڎۦ/ء;-><init>(Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    sget-object v0, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    sget-object v0, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    check-cast v0, Lںڏۑڎڔٙ۰/آ;

    iget-object v0, v0, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;

    invoke-static {p0, v0}, Lڗًقڔ/ء;->ج(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p0

    return-object p0
.end method
