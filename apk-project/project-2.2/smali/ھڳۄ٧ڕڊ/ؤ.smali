.class public final Lھڳۄ٧ڕڊ/ؤ;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public آ:I

.field public synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Lھڳۄ٧ڕڊ/إ;


# direct methods
.method public constructor <init>(Lھڳۄ٧ڕڊ/إ;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ؤ;->ؤ:Lھڳۄ٧ڕڊ/إ;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 2

    new-instance v0, Lھڳۄ٧ڕڊ/ؤ;

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ؤ;->ؤ:Lھڳۄ٧ڕڊ/إ;

    invoke-direct {v0, v1, p2}, Lھڳۄ٧ڕڊ/ؤ;-><init>(Lھڳۄ٧ڕڊ/إ;Lڨڡئٸت/أ;)V

    iput-object p1, v0, Lھڳۄ٧ڕڊ/ؤ;->أ:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lھٳ۰ڌ؄غڎۦ/ئ;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Lھڳۄ٧ڕڊ/ؤ;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Lھڳۄ٧ڕڊ/ؤ;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Lھڳۄ٧ڕڊ/ؤ;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Lھڳۄ٧ڕڊ/ؤ;->آ:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Lھڳۄ٧ڕڊ/ؤ;->أ:Ljava/lang/Object;

    check-cast p1, Lھٳ۰ڌ؄غڎۦ/ئ;

    iput v2, p0, Lھڳۄ٧ڕڊ/ؤ;->آ:I

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ؤ;->ؤ:Lھڳۄ٧ڕڊ/إ;

    invoke-virtual {v1, p1, p0}, Lھڳۄ٧ڕڊ/إ;->آ(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    :cond_2
    :goto_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
