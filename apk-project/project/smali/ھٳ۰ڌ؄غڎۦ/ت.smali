.class public final Lھٳ۰ڌ؄غڎۦ/ت;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/إ;


# instance fields
.field public final آ:Lڲٱۘۑدٿٰ/خ;


# direct methods
.method public constructor <init>(Lڲٱۘۑدٿٰ/خ;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ت;->آ:Lڲٱۘۑدٿٰ/خ;

    return-void
.end method


# virtual methods
.method public final collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 6

    instance-of v0, p2, Lھٳ۰ڌ؄غڎۦ/؋;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lھٳ۰ڌ؄غڎۦ/؋;

    iget v1, v0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    goto :goto_0

    :cond_0
    new-instance v0, Lھٳ۰ڌ؄غڎۦ/؋;

    invoke-direct {v0, p0, p2}, Lھٳ۰ڌ؄غڎۦ/؋;-><init>(Lھٳ۰ڌ؄غڎۦ/ت;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object p2, v0, Lھٳ۰ڌ؄غڎۦ/؋;->أ:Ljava/lang/Object;

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v2, v0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    sget-object v3, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v4, :cond_1

    iget-object p1, v0, Lھٳ۰ڌ؄غڎۦ/؋;->آ:Lھڳۄ٧ڕڊ/خ;

    :try_start_0
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_4

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    new-instance p2, Lھڳۄ٧ڕڊ/خ;

    invoke-interface {v0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v2

    invoke-direct {p2, p1, v2}, Lھڳۄ٧ڕڊ/خ;-><init>(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/ا;)V

    :try_start_1
    iput-object p2, v0, Lھٳ۰ڌ؄غڎۦ/؋;->آ:Lھڳۄ٧ڕڊ/خ;

    iput v4, v0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ت;->آ:Lڲٱۘۑدٿٰ/خ;

    invoke-interface {p1, p2, v0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-ne p1, v1, :cond_3

    goto :goto_1

    :cond_3
    move-object p1, v3

    :goto_1
    if-ne p1, v1, :cond_4

    goto :goto_3

    :cond_4
    move-object p1, p2

    :goto_2
    invoke-virtual {p1}, Lھڳۄ٧ڕڊ/خ;->releaseIntercepted()V

    move-object v1, v3

    :goto_3
    return-object v1

    :catchall_1
    move-exception p1

    move-object v5, p2

    move-object p2, p1

    move-object p1, v5

    :goto_4
    invoke-virtual {p1}, Lھڳۄ٧ڕڊ/خ;->releaseIntercepted()V

    throw p2
.end method
