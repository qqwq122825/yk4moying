.class public final Lڦڶٛۯ/إ;
.super Lڡپٔۯ/ئ;
.source "SourceFile"


# instance fields
.field public final synthetic آ:I

.field public final أ:Lڦڶٛۯ/ؤ;


# direct methods
.method public constructor <init>(Lڦڶٛۯ/ؤ;I)V
    .locals 2

    iput p2, p0, Lڦڶٛۯ/إ;->آ:I

    const/4 v0, 0x1

    const-string v1, "backing"

    if-eq p2, v0, :cond_0

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lڡپٔۯ/ئ;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    return-void

    :cond_0
    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lڡپٔۯ/ئ;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Ljava/util/Map$Entry;

    const-string v0, "element"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :goto_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 2

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    const-string v1, "elements"

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :goto_0
    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final clear()V
    .locals 2

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->clear()V

    return-void

    :goto_0
    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->clear()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, p1}, Lڦڶٛۯ/إ;->ؠ(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :goto_0
    iget-object v0, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final containsAll(Ljava/util/Collection;)Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->containsAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :pswitch_0
    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->ء(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final isEmpty()Z
    .locals 2

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->isEmpty()Z

    move-result v0

    return v0

    :goto_0
    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->isEmpty()Z

    move-result v0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 3

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڦڶٛۯ/ء;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lڦڶٛۯ/ء;-><init>(Lڦڶٛۯ/ؤ;I)V

    return-object v0

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڦڶٛۯ/ء;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lڦڶٛۯ/ء;-><init>(Lڦڶٛۯ/ؤ;I)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, p1}, Lڦڶٛۯ/إ;->ء(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :goto_0
    iget-object v0, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->ؤ(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_1

    :cond_0
    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->ا(I)V

    :goto_1
    if-ltz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_2

    :cond_1
    const/4 p1, 0x0

    :goto_2
    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 3

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    const-string v2, "elements"

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :goto_0
    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 3

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    const-string v2, "elements"

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->retainAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :goto_0
    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->retainAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋()I
    .locals 2

    iget v0, p0, Lڦڶٛۯ/إ;->آ:I

    iget-object v1, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, v1, Lڦڶٛۯ/ؤ;->ة:I

    return v0

    :goto_0
    iget v0, v1, Lڦڶٛۯ/ؤ;->ة:I

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؠ(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Ljava/util/Map$Entry;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Ljava/util/Map$Entry;

    const-string v0, "element"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->آ(Ljava/util/Map$Entry;)Z

    move-result p1

    return p1
.end method

.method public final ء(Ljava/lang/Object;)Z
    .locals 4

    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Ljava/util/Map$Entry;

    const-string v0, "element"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/إ;->أ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lڦڶٛۯ/ؤ;->ؤ(Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v3, v0, Lڦڶٛۯ/ؤ;->أ:[Ljava/lang/Object;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    aget-object v3, v3, v2

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-static {v3, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v2}, Lڦڶٛۯ/ؤ;->ا(I)V

    const/4 v1, 0x1

    :goto_0
    return v1
.end method
