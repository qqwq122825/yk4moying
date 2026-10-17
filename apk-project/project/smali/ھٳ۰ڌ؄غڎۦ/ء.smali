.class public final Lھٳ۰ڌ؄غڎۦ/ء;
.super Lھڳۄ٧ڕڊ/أ;
.source "SourceFile"


# instance fields
.field public final إ:Lڲٱۘۑدٿٰ/خ;

.field public final ئ:Lڲٱۘۑدٿٰ/خ;


# direct methods
.method public constructor <init>(Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V
    .locals 0

    invoke-direct {p0, p2, p3, p4}, Lھڳۄ٧ڕڊ/أ;-><init>(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ء;->إ:Lڲٱۘۑدٿٰ/خ;

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ء;->ئ:Lڲٱۘۑدٿٰ/خ;

    return-void
.end method


# virtual methods
.method public final bridge synthetic toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lھٳ۰ڌ؄غڎۦ/ء;->آ()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p2, Lھٳ۰ڌ؄غڎۦ/ؠ;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lھٳ۰ڌ؄غڎۦ/ؠ;

    iget v1, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    goto :goto_0

    :cond_0
    new-instance v0, Lھٳ۰ڌ؄غڎۦ/ؠ;

    invoke-direct {v0, p0, p2}, Lھٳ۰ڌ؄غڎۦ/ؠ;-><init>(Lھٳ۰ڌ؄غڎۦ/ء;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object p2, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->أ:Ljava/lang/Object;

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v2, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    sget-object v3, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v4, :cond_1

    iget-object p1, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->آ:Lڽتٺۊڗ؜/ر;

    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_2

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iput-object p1, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->آ:Lڽتٺۊڗ؜/ر;

    iput v4, v0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    iget-object p2, p0, Lھٳ۰ڌ؄غڎۦ/ء;->إ:Lڲٱۘۑدٿٰ/خ;

    invoke-interface {p2, p1, v0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_3

    goto :goto_1

    :cond_3
    move-object p2, v3

    :goto_1
    if-ne p2, v1, :cond_4

    return-object v1

    :cond_4
    :goto_2
    check-cast p1, Lڽتٺۊڗ؜/ذ;

    invoke-virtual {p1}, Lڽتٺۊڗ؜/ذ;->إ()Z

    move-result p1

    if-eqz p1, :cond_5

    return-object v3

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\'awaitClose { yourCallbackOrListener.cancel() }\' should be used in the end of callbackFlow block.\nOtherwise, a callback/listener may leak in case of external cancellation.\nSee callbackFlow API documentation for the details."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھڳۄ٧ڕڊ/أ;
    .locals 2

    new-instance v0, Lھٳ۰ڌ؄غڎۦ/ء;

    iget-object v1, p0, Lھٳ۰ڌ؄غڎۦ/ء;->ئ:Lڲٱۘۑدٿٰ/خ;

    invoke-direct {v0, v1, p1, p2, p3}, Lھٳ۰ڌ؄غڎۦ/ء;-><init>(Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    return-object v0
.end method

.method public final آ()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "block["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lھٳ۰ڌ؄غڎۦ/ء;->إ:Lڲٱۘۑدٿٰ/خ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "] -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-super {p0}, Lھڳۄ٧ڕڊ/أ;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
