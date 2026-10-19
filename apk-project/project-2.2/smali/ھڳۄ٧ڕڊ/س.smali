.class public final Lھڳۄ٧ڕڊ/س;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/أ;
.implements Lګؓ۝ؒڄس/آ;


# instance fields
.field public final آ:Lڨڡئٸت/أ;

.field public final أ:Lڨڡئٸت/ا;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھڳۄ٧ڕڊ/س;->آ:Lڨڡئٸت/أ;

    iput-object p2, p0, Lھڳۄ٧ڕڊ/س;->أ:Lڨڡئٸت/ا;

    return-void
.end method


# virtual methods
.method public final getCallerFrame()Lګؓ۝ؒڄس/آ;
    .locals 2

    iget-object v0, p0, Lھڳۄ٧ڕڊ/س;->آ:Lڨڡئٸت/أ;

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

    iget-object v0, p0, Lھڳۄ٧ڕڊ/س;->أ:Lڨڡئٸت/ا;

    return-object v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lھڳۄ٧ڕڊ/س;->آ:Lڨڡئٸت/أ;

    invoke-interface {v0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
