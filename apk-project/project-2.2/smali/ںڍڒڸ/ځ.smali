.class public final Lںڍڒڸ/ځ;
.super Lھۥٓڍچ/ر;
.source "SourceFile"


# instance fields
.field private volatile threadLocalIsSet:Z

.field public final ئ:Ljava/lang/ThreadLocal;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V
    .locals 2

    sget-object v0, Lںڍڒڸ/ڂ;->آ:Lںڍڒڸ/ڂ;

    invoke-interface {p2, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-interface {p2, v0}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    invoke-direct {p0, p1, v0}, Lھۥٓڍچ/ر;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    invoke-interface {p1}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    sget-object v0, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {p1, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    instance-of p1, p1, Lںڍڒڸ/ر;

    if-nez p1, :cond_1

    const/4 p1, 0x0

    invoke-static {p2, p1}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p2, p1}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    invoke-virtual {p0, p2, p1}, Lںڍڒڸ/ځ;->ٯ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final ت(Ljava/lang/Object;)V
    .locals 5

    iget-boolean v0, p0, Lںڍڒڸ/ځ;->threadLocalIsSet:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڡُؑڨ/آ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lڡُؑڨ/آ;->آ:Ljava/lang/Object;

    check-cast v1, Lڨڡئٸت/ا;

    iget-object v0, v0, Lڡُؑڨ/آ;->أ:Ljava/lang/Object;

    invoke-static {v1, v0}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    :cond_1
    invoke-static {p1}, Lڗًقڔ/؋;->ٵ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    invoke-interface {v0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lںڍڒڸ/ش;->خ:Lئٱنۃؖۊڄئ/آ;

    if-eq v3, v4, :cond_2

    invoke-static {v0, v1, v3}, Lڗًقڔ/ء;->ؿ(Lڨڡئٸت/أ;Lڨڡئٸت/ا;Ljava/lang/Object;)Lںڍڒڸ/ځ;

    move-result-object v2

    :cond_2
    :try_start_0
    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    invoke-interface {v0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    invoke-static {v1, v3}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_4
    return-void

    :catchall_0
    move-exception p1

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    invoke-static {v1, v3}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_6
    throw p1
.end method

.method public final ٮ()Z
    .locals 3

    iget-boolean v0, p0, Lںڍڒڸ/ځ;->threadLocalIsSet:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    xor-int/2addr v0, v1

    return v0
.end method

.method public final ٯ(Lڨڡئٸت/ا;Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lںڍڒڸ/ځ;->threadLocalIsSet:Z

    iget-object v0, p0, Lںڍڒڸ/ځ;->ئ:Ljava/lang/ThreadLocal;

    new-instance v1, Lڡُؑڨ/آ;

    invoke-direct {v1, p1, p2}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void
.end method
