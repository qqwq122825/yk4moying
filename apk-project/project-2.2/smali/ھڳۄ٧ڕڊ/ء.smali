.class public final Lھڳۄ٧ڕڊ/ء;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public آ:I

.field public synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Lھٳ۰ڌ؄غڎۦ/ئ;

.field public final synthetic إ:Lھڳۄ٧ڕڊ/أ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lھٳ۰ڌ؄غڎۦ/ئ;Lھڳۄ٧ڕڊ/أ;)V
    .locals 0

    iput-object p2, p0, Lھڳۄ٧ڕڊ/ء;->ؤ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iput-object p3, p0, Lھڳۄ٧ڕڊ/ء;->إ:Lھڳۄ٧ڕڊ/أ;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 3

    new-instance v0, Lھڳۄ٧ڕڊ/ء;

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ء;->ؤ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iget-object v2, p0, Lھڳۄ٧ڕڊ/ء;->إ:Lھڳۄ٧ڕڊ/أ;

    invoke-direct {v0, p2, v1, v2}, Lھڳۄ٧ڕڊ/ء;-><init>(Lڨڡئٸت/أ;Lھٳ۰ڌ؄غڎۦ/ئ;Lھڳۄ٧ڕڊ/أ;)V

    iput-object p1, v0, Lھڳۄ٧ڕڊ/ء;->أ:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lںڍڒڸ/س;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Lھڳۄ٧ڕڊ/ء;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Lھڳۄ٧ڕڊ/ء;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Lھڳۄ٧ڕڊ/ء;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Lھڳۄ٧ڕڊ/ء;->آ:I

    sget-object v2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Lھڳۄ٧ڕڊ/ء;->أ:Ljava/lang/Object;

    check-cast p1, Lںڍڒڸ/س;

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ء;->إ:Lھڳۄ٧ڕڊ/أ;

    iget v4, v1, Lھڳۄ٧ڕڊ/أ;->أ:I

    const/4 v5, -0x3

    if-ne v4, v5, :cond_2

    const/4 v4, -0x2

    :cond_2
    new-instance v5, Lھڳۄ٧ڕڊ/آ;

    const/4 v6, 0x0

    invoke-direct {v5, v1, v6}, Lھڳۄ٧ڕڊ/آ;-><init>(Lھڳۄ٧ڕڊ/أ;Lڨڡئٸت/أ;)V

    const/4 v6, 0x4

    iget-object v7, v1, Lھڳۄ٧ڕڊ/أ;->ؤ:Lڽتٺۊڗ؜/؋;

    invoke-static {v4, v7, v6}, Lںڍڒڸ/ش;->؋(ILڽتٺۊڗ؜/؋;I)Lڽتٺۊڗ؜/ؤ;

    move-result-object v4

    invoke-interface {p1}, Lںڍڒڸ/س;->getCoroutineContext()Lڨڡئٸت/ا;

    move-result-object p1

    iget-object v1, v1, Lھڳۄ٧ڕڊ/أ;->آ:Lڨڡئٸت/ا;

    invoke-static {p1, v1, v3}, Lڗًقڔ/ء;->ح(Lڨڡئٸت/ا;Lڨڡئٸت/ا;Z)Lڨڡئٸت/ا;

    move-result-object p1

    sget-object v1, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    if-eq p1, v1, :cond_3

    sget-object v6, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {p1, v6}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v6

    if-nez v6, :cond_3

    invoke-interface {p1, v1}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    :cond_3
    new-instance v1, Lڽتٺۊڗ؜/ذ;

    invoke-direct {v1, p1, v4}, Lڽتٺۊڗ؜/ذ;-><init>(Lڨڡئٸت/ا;Lڽتٺۊڗ؜/ؤ;)V

    const/4 p1, 0x3

    invoke-virtual {v1, p1, v1, v5}, Lںڍڒڸ/؋;->ي(ILںڍڒڸ/؋;Lڲٱۘۑدٿٰ/خ;)V

    iput v3, p0, Lھڳۄ٧ڕڊ/ء;->آ:I

    iget-object p1, p0, Lھڳۄ٧ڕڊ/ء;->ؤ:Lھٳ۰ڌ؄غڎۦ/ئ;

    invoke-static {p1, v1, v3, p0}, Lسۄھؤۏ۫/؋;->خ(Lھٳ۰ڌ؄غڎۦ/ئ;Lڽتٺۊڗ؜/ب;ZLڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4

    goto :goto_0

    :cond_4
    move-object p1, v2

    :goto_0
    if-ne p1, v0, :cond_5

    return-object v0

    :cond_5
    :goto_1
    return-object v2
.end method
