.class public abstract Lڦڶٛۯ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final آ:Lڦڶٛۯ/ؤ;

.field public أ:I

.field public ؤ:I


# direct methods
.method public constructor <init>(Lڦڶٛۯ/ؤ;)V
    .locals 1

    const-string v0, "map"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/أ;->آ:Lڦڶٛۯ/ؤ;

    const/4 p1, -0x1

    iput p1, p0, Lڦڶٛۯ/أ;->ؤ:I

    invoke-virtual {p0}, Lڦڶٛۯ/أ;->؋()V

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 2

    iget v0, p0, Lڦڶٛۯ/أ;->أ:I

    iget-object v1, p0, Lڦڶٛۯ/أ;->آ:Lڦڶٛۯ/ؤ;

    iget v1, v1, Lڦڶٛۯ/ؤ;->ا:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final remove()V
    .locals 3

    iget v0, p0, Lڦڶٛۯ/أ;->ؤ:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lڦڶٛۯ/أ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    iget v2, p0, Lڦڶٛۯ/أ;->ؤ:I

    invoke-virtual {v0, v2}, Lڦڶٛۯ/ؤ;->ا(I)V

    iput v1, p0, Lڦڶٛۯ/أ;->ؤ:I

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call next() before removing element from the iterator."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ؋()V
    .locals 3

    :goto_0
    iget v0, p0, Lڦڶٛۯ/أ;->أ:I

    iget-object v1, p0, Lڦڶٛۯ/أ;->آ:Lڦڶٛۯ/ؤ;

    iget v2, v1, Lڦڶٛۯ/ؤ;->ا:I

    if-ge v0, v2, :cond_0

    iget-object v1, v1, Lڦڶٛۯ/ؤ;->ؤ:[I

    aget v1, v1, v0

    if-gez v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lڦڶٛۯ/أ;->أ:I

    goto :goto_0

    :cond_0
    return-void
.end method
