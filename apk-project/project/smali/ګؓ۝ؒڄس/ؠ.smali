.class public final Lګؓ۝ؒڄس/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/أ;


# static fields
.field public static final آ:Lګؓ۝ؒڄس/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lګؓ۝ؒڄس/ؠ;

    invoke-direct {v0}, Lګؓ۝ؒڄس/ؠ;-><init>()V

    sput-object v0, Lګؓ۝ؒڄس/ؠ;->آ:Lګؓ۝ؒڄس/ؠ;

    return-void
.end method


# virtual methods
.method public final getContext()Lڨڡئٸت/ا;
    .locals 2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This continuation is already complete"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 1

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This continuation is already complete"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    const-string v0, "This continuation is already complete"

    return-object v0
.end method
