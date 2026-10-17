.class public abstract Lڨڡئٸت/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/إ;


# instance fields
.field private final key:Lڨڡئٸت/ئ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lڨڡئٸت/ئ;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڨڡئٸت/؋;->key:Lڨڡئٸت/ئ;

    return-void
.end method


# virtual methods
.method public fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            ")TR;"
        }
    .end annotation

    const-string v0, "operation"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2, p1, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->خ(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    return-object p1
.end method

.method public getKey()Lڨڡئٸت/ئ;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;"
        }
    .end annotation

    iget-object v0, p0, Lڨڡئٸت/؋;->key:Lڨڡئٸت/ئ;

    return-object v0
.end method

.method public minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->ص(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method
