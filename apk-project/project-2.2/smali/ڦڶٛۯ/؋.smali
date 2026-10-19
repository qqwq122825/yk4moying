.class public final Lڦڶٛۯ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lڲږڠ/؋;


# instance fields
.field public final آ:Lڦڶٛۯ/ؠ;

.field public أ:I

.field public ؤ:I


# direct methods
.method public constructor <init>(Lڦڶٛۯ/ؠ;I)V
    .locals 1

    const-string v0, "list"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    iput p2, p0, Lڦڶٛۯ/؋;->أ:I

    const/4 p1, -0x1

    iput p1, p0, Lڦڶٛۯ/؋;->ؤ:I

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)V
    .locals 2

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lڦڶٛۯ/؋;->أ:I

    iget-object v1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    invoke-virtual {v1, v0, p1}, Lڦڶٛۯ/ؠ;->add(ILjava/lang/Object;)V

    const/4 p1, -0x1

    iput p1, p0, Lڦڶٛۯ/؋;->ؤ:I

    return-void
.end method

.method public final hasNext()Z
    .locals 2

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    iget-object v1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    iget v1, v1, Lڦڶٛۯ/ؠ;->ؤ:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final hasPrevious()Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    iget-object v1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    iget v2, v1, Lڦڶٛۯ/ؠ;->ؤ:I

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lڦڶٛۯ/؋;->أ:I

    iput v0, p0, Lڦڶٛۯ/؋;->ؤ:I

    iget-object v2, v1, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, v1, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, v0

    aget-object v0, v2, v1

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final nextIndex()I
    .locals 1

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    return v0
.end method

.method public final previous()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lڦڶٛۯ/؋;->أ:I

    iput v0, p0, Lڦڶٛۯ/؋;->ؤ:I

    iget-object v1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    iget-object v2, v1, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, v1, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, v0

    aget-object v0, v2, v1

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final previousIndex()I
    .locals 1

    iget v0, p0, Lڦڶٛۯ/؋;->أ:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public final remove()V
    .locals 3

    iget v0, p0, Lڦڶٛۯ/؋;->ؤ:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    iget-object v2, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    invoke-virtual {v2, v0}, Lڦڶٛۯ/ؠ;->ؠ(I)Ljava/lang/Object;

    iget v0, p0, Lڦڶٛۯ/؋;->ؤ:I

    iput v0, p0, Lڦڶٛۯ/؋;->أ:I

    iput v1, p0, Lڦڶٛۯ/؋;->ؤ:I

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call next() or previous() before removing element from the iterator."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final set(Ljava/lang/Object;)V
    .locals 2

    iget v0, p0, Lڦڶٛۯ/؋;->ؤ:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    iget-object v1, p0, Lڦڶٛۯ/؋;->آ:Lڦڶٛۯ/ؠ;

    invoke-virtual {v1, v0, p1}, Lڦڶٛۯ/ؠ;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Call next() or previous() before replacing element from the iterator."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
