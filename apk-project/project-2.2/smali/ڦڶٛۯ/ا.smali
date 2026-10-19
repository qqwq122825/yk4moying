.class public final Lڦڶٛۯ/ا;
.super Lڡپٔۯ/ئ;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final أ:Lڦڶٛۯ/ا;


# instance fields
.field public final آ:Lڦڶٛۯ/ؤ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lڦڶٛۯ/ا;

    sget-object v1, Lڦڶٛۯ/ؤ;->خ:Lڦڶٛۯ/ؤ;

    sget-object v1, Lڦڶٛۯ/ؤ;->خ:Lڦڶٛۯ/ؤ;

    invoke-direct {v0, v1}, Lڦڶٛۯ/ا;-><init>(Lڦڶٛۯ/ؤ;)V

    sput-object v0, Lڦڶٛۯ/ا;->أ:Lڦڶٛۯ/ا;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    new-instance v0, Lڦڶٛۯ/ؤ;

    invoke-direct {v0}, Lڦڶٛۯ/ؤ;-><init>()V

    invoke-direct {p0, v0}, Lڦڶٛۯ/ا;-><init>(Lڦڶٛۯ/ؤ;)V

    return-void
.end method

.method public constructor <init>(Lڦڶٛۯ/ؤ;)V
    .locals 1

    const-string v0, "backing"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lڡپٔۯ/ئ;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->؋(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public final clear()V
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final isEmpty()Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 3

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lڦڶٛۯ/ء;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lڦڶٛۯ/ء;-><init>(Lڦڶٛۯ/ؤ;I)V

    return-object v1
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->ؤ(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؤ;->ا(I)V

    :goto_0
    if-ltz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 1

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    invoke-virtual {v0}, Lڦڶٛۯ/ؤ;->ؠ()V

    invoke-super {p0, p1}, Ljava/util/AbstractCollection;->retainAll(Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public final ؋()I
    .locals 1

    iget-object v0, p0, Lڦڶٛۯ/ا;->آ:Lڦڶٛۯ/ؤ;

    iget v0, v0, Lڦڶٛۯ/ؤ;->ة:I

    return v0
.end method
