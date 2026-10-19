.class public final Lھڳۄ٧ڕڊ/ب;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public آ:I

.field public final synthetic أ:[Lھٳ۰ڌ؄غڎۦ/إ;

.field public final synthetic ؤ:I

.field public final synthetic إ:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic ئ:Lڽتٺۊڗ؜/ب;


# direct methods
.method public constructor <init>([Lھٳ۰ڌ؄غڎۦ/إ;ILjava/util/concurrent/atomic/AtomicInteger;Lڽتٺۊڗ؜/ب;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ب;->أ:[Lھٳ۰ڌ؄غڎۦ/إ;

    iput p2, p0, Lھڳۄ٧ڕڊ/ب;->ؤ:I

    iput-object p3, p0, Lھڳۄ٧ڕڊ/ب;->إ:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p4, p0, Lھڳۄ٧ڕڊ/ب;->ئ:Lڽتٺۊڗ؜/ب;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 6

    new-instance p1, Lھڳۄ٧ڕڊ/ب;

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ب;->أ:[Lھٳ۰ڌ؄غڎۦ/إ;

    iget v2, p0, Lھڳۄ٧ڕڊ/ب;->ؤ:I

    iget-object v3, p0, Lھڳۄ٧ڕڊ/ب;->إ:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v4, p0, Lھڳۄ٧ڕڊ/ب;->ئ:Lڽتٺۊڗ؜/ب;

    move-object v0, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lھڳۄ٧ڕڊ/ب;-><init>([Lھٳ۰ڌ؄غڎۦ/إ;ILjava/util/concurrent/atomic/AtomicInteger;Lڽتٺۊڗ؜/ب;Lڨڡئٸت/أ;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lںڍڒڸ/س;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Lھڳۄ٧ڕڊ/ب;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Lھڳۄ٧ڕڊ/ب;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Lھڳۄ٧ڕڊ/ب;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Lھڳۄ٧ڕڊ/ب;->آ:I

    const/4 v2, 0x0

    iget-object v3, p0, Lھڳۄ٧ڕڊ/ب;->إ:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v4, p0, Lھڳۄ٧ڕڊ/ب;->ئ:Lڽتٺۊڗ؜/ب;

    const/4 v5, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v5, :cond_0

    :try_start_0
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    :try_start_1
    iget-object p1, p0, Lھڳۄ٧ڕڊ/ب;->أ:[Lھٳ۰ڌ؄غڎۦ/إ;

    iget v1, p0, Lھڳۄ٧ڕڊ/ب;->ؤ:I

    aget-object p1, p1, v1

    new-instance v6, Lھڳۄ٧ڕڊ/ا;

    invoke-direct {v6, v4, v1}, Lھڳۄ٧ڕڊ/ا;-><init>(Lڽتٺۊڗ؜/ب;I)V

    iput v5, p0, Lھڳۄ٧ڕڊ/ب;->آ:I

    invoke-interface {p1, v6, p0}, Lھٳ۰ڌ؄غڎۦ/إ;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne p1, v0, :cond_2

    return-object v0

    :cond_2
    :goto_0
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p1

    if-nez p1, :cond_3

    invoke-interface {v4, v2}, Lڽتٺۊڗ؜/ش;->ؠ(Ljava/lang/Throwable;)Z

    :cond_3
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {v4, v2}, Lڽتٺۊڗ؜/ش;->ؠ(Ljava/lang/Throwable;)Z

    :cond_4
    throw p1
.end method
