.class public abstract Lګؓ۝ؒڄس/ئ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/internal/إ;


# instance fields
.field private final arity:I


# direct methods
.method public constructor <init>(ILڨڡئٸت/أ;)V
    .locals 0

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    iput p1, p0, Lګؓ۝ؒڄس/ئ;->arity:I

    return-void
.end method


# virtual methods
.method public getArity()I
    .locals 1

    iget v0, p0, Lګؓ۝ؒڄس/ئ;->arity:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lګؓ۝ؒڄس/؋;->getCompletion()Lڨڡئٸت/أ;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lkotlin/jvm/internal/س;->؋(Lkotlin/jvm/internal/إ;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "renderLambdaToString(this)"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lګؓ۝ؒڄس/؋;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
