.class public final Lڦڶٛۯ/ئ;
.super Ljava/util/AbstractCollection;
.source "SourceFile"

# interfaces
.implements Ljava/util/Collection;
.implements Lڲږڠ/؋;


# instance fields
.field public final آ:Lڦڶٛۯ/ؤ;


# direct methods
.method public constructor <init>(Lڦڶٛۯ/ؤ;)V
    .locals 1

    const-string v0, "backing"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)Z
    .locals 0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public final clear()V
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->containsValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final isEmpty()Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 3

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lڦڶٛۯ/ء;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lڦڶٛۯ/ء;-><init>(Lڦڶٛۯ/ؤ;I)V

    return-object v1
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 3

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    iget v1, v0, Lڦڶٛۯ/ؤ;->ا:I

    :cond_0
    const/4 v2, -0x1

    add-int/2addr v1, v2

    if-ltz v1, :cond_1

    iget-object v2, v0, Lڦڶٛۯ/ؤ;->ؤ:[I

    aget v2, v2, v1

    if-ltz v2, :cond_0

    iget-object v2, v0, Lڦڶٛۯ/ؤ;->أ:[Ljava/lang/Object;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    aget-object v2, v2, v1

    invoke-static {v2, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    :cond_1
    if-gez v2, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v2}, Lڦڶٛۯ/ؤ;->ا(I)V

    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->retainAll(Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public final size()I
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ئ;->آ:Lڦڶٛۯ/ؤ;

    iget v0, v0, Lڦڶٛۯ/ؤ;->ة:I

    return v0
.end method
