.class public abstract Lګؓ۝ؒڄس/ء;
.super Lګؓ۝ؒڄس/؋;
.source "SourceFile"


# instance fields
.field private final _context:Lڨڡئٸت/ا;

.field private transient intercepted:Lڨڡئٸت/أ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    return-void
.end method

.method public constructor <init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V
    .locals 0

    invoke-direct {p0, p1}, Lګؓ۝ؒڄس/؋;-><init>(Lڨڡئٸت/أ;)V

    iput-object p2, p0, Lګؓ۝ؒڄس/ء;->_context:Lڨڡئٸت/ا;

    return-void
.end method


# virtual methods
.method public getContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lګؓ۝ؒڄس/ء;->_context:Lڨڡئٸت/ا;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final intercepted()Lڨڡئٸت/أ;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;"
        }
    .end annotation

    iget-object v0, p0, Lګؓ۝ؒڄس/ء;->intercepted:Lڨڡئٸت/أ;

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lګؓ۝ؒڄس/ء;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    sget v1, Lڨڡئٸت/ؤ;->؋:I

    sget-object v1, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {v0, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Lڨڡئٸت/ؤ;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lڨڡئٸت/ؤ;->interceptContinuation(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, p0

    :cond_1
    iput-object v0, p0, Lګؓ۝ؒڄس/ء;->intercepted:Lڨڡئٸت/أ;

    :cond_2
    return-object v0
.end method

.method public releaseIntercepted()V
    .locals 3

    iget-object v0, p0, Lګؓ۝ؒڄس/ء;->intercepted:Lڨڡئٸت/أ;

    if-eqz v0, :cond_0

    if-eq v0, p0, :cond_0

    invoke-virtual {p0}, Lګؓ۝ؒڄس/ء;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    sget v2, Lڨڡئٸت/ؤ;->؋:I

    sget-object v2, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {v1, v2}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    check-cast v1, Lڨڡئٸت/ؤ;

    invoke-interface {v1, v0}, Lڨڡئٸت/ؤ;->releaseInterceptedContinuation(Lڨڡئٸت/أ;)V

    :cond_0
    sget-object v0, Lګؓ۝ؒڄس/ؠ;->آ:Lګؓ۝ؒڄس/ؠ;

    iput-object v0, p0, Lګؓ۝ؒڄس/ء;->intercepted:Lڨڡئٸت/أ;

    return-void
.end method
