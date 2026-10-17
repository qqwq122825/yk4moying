.class public final Lںڍڒڸ/ڂ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/إ;
.implements Lڨڡئٸت/ئ;


# static fields
.field public static final آ:Lںڍڒڸ/ڂ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lںڍڒڸ/ڂ;

    invoke-direct {v0}, Lںڍڒڸ/ڂ;-><init>()V

    sput-object v0, Lںڍڒڸ/ڂ;->آ:Lںڍڒڸ/ڂ;

    return-void
.end method


# virtual methods
.method public final fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p2, p1, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->خ(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    return-object p1
.end method

.method public final getKey()Lڨڡئٸت/ئ;
    .locals 0

    return-object p0
.end method

.method public final minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->ص(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method
