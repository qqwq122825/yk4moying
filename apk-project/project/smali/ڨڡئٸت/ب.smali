.class public final Lڨڡئٸت/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/ا;
.implements Ljava/io/Serializable;


# static fields
.field public static final آ:Lڨڡئٸت/ب;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڨڡئٸت/ب;

    invoke-direct {v0}, Lڨڡئٸت/ب;-><init>()V

    sput-object v0, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    return-void
.end method


# virtual methods
.method public final fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 0

    return-object p1
.end method

.method public final get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final hashCode()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    const-string v0, "EmptyCoroutineContext"

    return-object v0
.end method
