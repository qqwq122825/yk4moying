.class public final Lھٳ۰ڌ؄غڎۦ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/ئ;


# instance fields
.field public final synthetic آ:I

.field public final أ:Ljava/lang/Object;

.field public final ؤ:Ljava/lang/Object;

.field public final إ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ؤ;Lkotlin/jvm/internal/ر;Lھٳ۰ڌ؄غڎۦ/ئ;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lھٳ۰ڌ؄غڎۦ/أ;->آ:I

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/أ;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lھٳ۰ڌ؄غڎۦ/أ;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Lھٳ۰ڌ؄غڎۦ/أ;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/ا;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lھٳ۰ڌ؄غڎۦ/أ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lھٳ۰ڌ؄غڎۦ/أ;->أ:Ljava/lang/Object;

    invoke-static {p2}, Lںڍڒڸ/ش;->ٽ(Lڨڡئٸت/ا;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, Lھٳ۰ڌ؄غڎۦ/أ;->ؤ:Ljava/lang/Object;

    new-instance p2, Lھڳۄ٧ڕڊ/ش;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lھڳۄ٧ڕڊ/ش;-><init>(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)V

    iput-object p2, p0, Lھٳ۰ڌ؄غڎۦ/أ;->إ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 9

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget v1, p0, Lھٳ۰ڌ؄غڎۦ/أ;->آ:I

    iget-object v2, p0, Lھٳ۰ڌ؄غڎۦ/أ;->إ:Ljava/lang/Object;

    iget-object v3, p0, Lھٳ۰ڌ؄غڎۦ/أ;->ؤ:Ljava/lang/Object;

    iget-object v4, p0, Lھٳ۰ڌ؄غڎۦ/أ;->أ:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    instance-of v1, p2, Lھٳ۰ڌ؄غڎۦ/آ;

    if-eqz v1, :cond_0

    move-object v1, p2

    check-cast v1, Lھٳ۰ڌ؄غڎۦ/آ;

    iget v5, v1, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_0

    sub-int/2addr v5, v6

    iput v5, v1, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    goto :goto_0

    :cond_0
    new-instance v1, Lھٳ۰ڌ؄غڎۦ/آ;

    invoke-direct {v1, p0, p2}, Lھٳ۰ڌ؄غڎۦ/آ;-><init>(Lھٳ۰ڌ؄غڎۦ/أ;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object p2, v1, Lھٳ۰ڌ؄غڎۦ/آ;->آ:Ljava/lang/Object;

    sget-object v5, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v6, v1, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    const/4 v7, 0x1

    if-eqz v6, :cond_2

    if-ne v6, v7, :cond_1

    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    check-cast v4, Lھٳ۰ڌ؄غڎۦ/ؤ;

    iget-object p2, v4, Lھٳ۰ڌ؄غڎۦ/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {p2, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast v3, Lkotlin/jvm/internal/ر;

    iget-object v6, v3, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    sget-object v8, Lڗًقڔ/ء;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-eq v6, v8, :cond_3

    iget-object v4, v4, Lھٳ۰ڌ؄غڎۦ/ؤ;->ؤ:Lڲٱۘۑدٿٰ/خ;

    invoke-interface {v4, v6, p2}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_4

    :cond_3
    iput-object p2, v3, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    check-cast v2, Lھٳ۰ڌ؄غڎۦ/ئ;

    iput v7, v1, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    invoke-interface {v2, p1, v1}, Lھٳ۰ڌ؄غڎۦ/ئ;->emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v5, :cond_4

    move-object v0, v5

    :cond_4
    :goto_1
    return-object v0

    :goto_2
    check-cast v4, Lڨڡئٸت/ا;

    check-cast v2, Lڲٱۘۑدٿٰ/خ;

    invoke-static {v4, p1, v3, v2, p2}, Lڃٷښـ۝ۼ/ؠ;->ط(Lڨڡئٸت/ا;Ljava/lang/Object;Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_5

    move-object v0, p1

    :cond_5
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
