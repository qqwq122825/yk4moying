.class public final Lھڳۄ٧ڕڊ/خ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/ئ;


# instance fields
.field public final آ:Lھٳ۰ڌ؄غڎۦ/ئ;

.field public final أ:Lڨڡئٸت/ا;

.field public final ؤ:I

.field public إ:Lڨڡئٸت/ا;

.field public ئ:Lڨڡئٸت/أ;


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/ا;)V
    .locals 2

    sget-object v0, Lھڳۄ٧ڕڊ/ح;->آ:Lھڳۄ٧ڕڊ/ح;

    sget-object v1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    invoke-direct {p0, v0, v1}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    iput-object p1, p0, Lھڳۄ٧ڕڊ/خ;->آ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iput-object p2, p0, Lھڳۄ٧ڕڊ/خ;->أ:Lڨڡئٸت/ا;

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    sget-object v0, Lڨڡئٸت/ء;->ب:Lڨڡئٸت/ء;

    invoke-interface {p2, p1, v0}, Lڨڡئٸت/ا;->fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iput p1, p0, Lھڳۄ٧ڕڊ/خ;->ؤ:I

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lھڳۄ٧ڕڊ/خ;->؋(Lڨڡئٸت/أ;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, v0, :cond_0

    const-string v1, "frame"

    invoke-static {p2, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    if-ne p1, v0, :cond_1

    return-object p1

    :cond_1
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1

    :catchall_0
    move-exception p1

    new-instance v0, Lھڳۄ٧ڕڊ/ت;

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Lھڳۄ٧ڕڊ/ت;-><init>(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    iput-object v0, p0, Lھڳۄ٧ڕڊ/خ;->إ:Lڨڡئٸت/ا;

    throw p1
.end method

.method public final getCallerFrame()Lګؓ۝ؒڄس/آ;
    .locals 2

    iget-object v0, p0, Lھڳۄ٧ڕڊ/خ;->ئ:Lڨڡئٸت/أ;

    instance-of v1, v0, Lګؓ۝ؒڄس/آ;

    if-eqz v1, :cond_0

    check-cast v0, Lګؓ۝ؒڄس/آ;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lھڳۄ٧ڕڊ/خ;->إ:Lڨڡئٸت/ا;

    if-nez v0, :cond_0

    sget-object v0, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    :cond_0
    return-object v0
.end method

.method public final getStackTraceElement()Ljava/lang/StackTraceElement;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    invoke-static {p1}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lھڳۄ٧ڕڊ/ت;

    invoke-virtual {p0}, Lھڳۄ٧ڕڊ/خ;->getContext()Lڨڡئٸت/ا;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lھڳۄ٧ڕڊ/ت;-><init>(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    iput-object v1, p0, Lھڳۄ٧ڕڊ/خ;->إ:Lڨڡئٸت/ا;

    :cond_0
    iget-object v0, p0, Lھڳۄ٧ڕڊ/خ;->ئ:Lڨڡئٸت/أ;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    :cond_1
    sget-object p1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    return-object p1
.end method

.method public final releaseIntercepted()V
    .locals 0

    invoke-super {p0}, Lګؓ۝ؒڄس/ء;->releaseIntercepted()V

    return-void
.end method

.method public final ؋(Lڨڡئٸت/أ;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    invoke-interface {p1}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    invoke-static {v0}, Lڗًقڔ/ء;->ب(Lڨڡئٸت/ا;)V

    iget-object v1, p0, Lھڳۄ٧ڕڊ/خ;->إ:Lڨڡئٸت/ا;

    if-eq v1, v0, :cond_2

    instance-of v2, v1, Lھڳۄ٧ڕڊ/ت;

    if-nez v2, :cond_1

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lھڳۄ٧ڕڊ/ر;

    invoke-direct {v2, p0}, Lھڳۄ٧ڕڊ/ر;-><init>(Lھڳۄ٧ڕڊ/خ;)V

    invoke-interface {v0, v1, v2}, Lڨڡئٸت/ا;->fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget v2, p0, Lھڳۄ٧ڕڊ/خ;->ؤ:I

    if-ne v1, v2, :cond_0

    iput-object v0, p0, Lھڳۄ٧ڕڊ/خ;->إ:Lڨڡئٸت/ا;

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Flow invariant is violated:\n\t\tFlow was collected in "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lھڳۄ٧ڕڊ/خ;->أ:Lڨڡئٸت/ا;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\n\t\tbut emission happened in "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ".\n\t\tPlease refer to \'flow\' documentation or use \'flowOn\' instead"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    check-cast v1, Lھڳۄ٧ڕڊ/ت;

    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "\n            Flow exception transparency is violated:\n                Previous \'emit\' call has thrown exception "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Lھڳۄ٧ڕڊ/ت;->آ:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", but then emission attempt of value \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "\' has been detected.\n                Emissions from \'catch\' blocks are prohibited in order to avoid unspecified behaviour, \'Flow.catch\' operator can be used instead.\n                For a more detailed explanation, please refer to Flow documentation.\n            "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lڗًقڔ/؋;->چ(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    iput-object p1, p0, Lھڳۄ٧ڕڊ/خ;->ئ:Lڨڡئٸت/أ;

    sget-object p1, Lھڳۄ٧ڕڊ/ذ;->؋:Lڲٱۘۑدٿٰ/د;

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.flow.FlowCollector<kotlin.Any?>"

    iget-object v1, p0, Lھڳۄ٧ڕڊ/خ;->آ:Lھٳ۰ڌ؄غڎۦ/ئ;

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1, v1, p2, p0}, Lڲٱۘۑدٿٰ/د;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    invoke-static {p1, p2}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    const/4 p2, 0x0

    iput-object p2, p0, Lھڳۄ٧ڕڊ/خ;->ئ:Lڨڡئٸت/أ;

    :cond_3
    return-object p1
.end method
