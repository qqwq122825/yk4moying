.class public final Lڦڶٛۯ/ؠ;
.super Lڡپٔۯ/إ;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;


# static fields
.field public static final ب:Lڦڶٛۯ/ؠ;


# instance fields
.field public آ:[Ljava/lang/Object;

.field public final أ:I

.field public ؤ:I

.field public إ:Z

.field public final ئ:Lڦڶٛۯ/ؠ;

.field public final ا:Lڦڶٛۯ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lڦڶٛۯ/ؠ;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lڦڶٛۯ/ؠ;-><init>(I)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lڦڶٛۯ/ؠ;->إ:Z

    sput-object v0, Lڦڶٛۯ/ؠ;->ب:Lڦڶٛۯ/ؠ;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lڦڶٛۯ/ؠ;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 7

    invoke-static {p1}, Lںڍڒڸ/ش;->آ(I)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lڦڶٛۯ/ؠ;-><init>([Ljava/lang/Object;IIZLڦڶٛۯ/ؠ;Lڦڶٛۯ/ؠ;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;IIZLڦڶٛۯ/ؠ;Lڦڶٛۯ/ؠ;)V
    .locals 0

    invoke-direct {p0}, Lڡپٔۯ/إ;-><init>()V

    iput-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iput p2, p0, Lڦڶٛۯ/ؠ;->أ:I

    iput p3, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iput-boolean p4, p0, Lڦڶٛۯ/ؠ;->إ:Z

    iput-object p5, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    iput-object p6, p0, Lڦڶٛۯ/ؠ;->ا:Lڦڶٛۯ/ؠ;

    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 1

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->ؠ(II)V

    iget v0, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0, p2}, Lڦڶٛۯ/ؠ;->آ(ILjava/lang/Object;)V

    return-void
.end method

.method public final add(Ljava/lang/Object;)Z
    .locals 2

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->أ:I

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0, p1}, Lڦڶٛۯ/ؠ;->آ(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addAll(ILjava/util/Collection;)Z
    .locals 2

    const-string v0, "elements"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->ؠ(II)V

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, p2, v0}, Lڦڶٛۯ/ؠ;->ء(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 3

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    iget v2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr v1, v2

    invoke-virtual {p0, v1, p1, v0}, Lڦڶٛۯ/ؠ;->ء(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final clear()V
    .locals 2

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->أ:I

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-virtual {p0, v0, v1}, Lڦڶٛۯ/ؠ;->ئ(II)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-eq p1, p0, :cond_4

    instance-of v1, p1, Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    check-cast p1, Ljava/util/List;

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v3, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-eq v3, v4, :cond_0

    goto :goto_1

    :cond_0
    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_2

    iget v5, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v5, v4

    aget-object v5, v1, v5

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    :goto_1
    move p1, v2

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    move p1, v0

    :goto_2
    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    move v0, v2

    :cond_4
    :goto_3
    return v0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, p1

    aget-object p1, v0, v1

    return-object p1
.end method

.method public final hashCode()I
    .locals 6

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v1, :cond_1

    iget v5, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v5, v4

    aget-object v5, v0, v5

    mul-int/lit8 v2, v2, 0x1f

    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    goto :goto_1

    :cond_0
    move v5, v3

    :goto_1
    add-int/2addr v2, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 3

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v2, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final isEmpty()Z
    .locals 1

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 2

    new-instance v0, Lڦڶٛۯ/؋;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lڦڶٛۯ/؋;-><init>(Lڦڶٛۯ/ؠ;I)V

    return-object v0
.end method

.method public final lastIndexOf(Ljava/lang/Object;)I
    .locals 3

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v2, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final listIterator()Ljava/util/ListIterator;
    .locals 2

    new-instance v0, Lڦڶٛۯ/؋;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lڦڶٛۯ/؋;-><init>(Lڦڶٛۯ/ؠ;I)V

    return-object v0
.end method

.method public final listIterator(I)Ljava/util/ListIterator;
    .locals 1

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->ؠ(II)V

    new-instance v0, Lڦڶٛۯ/؋;

    invoke-direct {v0, p0, p1}, Lڦڶٛۯ/؋;-><init>(Lڦڶٛۯ/ؠ;I)V

    return-object v0
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 0

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    invoke-virtual {p0, p1}, Lڦڶٛۯ/ؠ;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    invoke-virtual {p0, p1}, Lڦڶٛۯ/ؠ;->ؠ(I)Ljava/lang/Object;

    :cond_0
    if-ltz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 3

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, p1, v2}, Lڦڶٛۯ/ؠ;->ا(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 3

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, p1, v2}, Lڦڶٛۯ/ؠ;->ا(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, p1

    aget-object p1, v0, v1

    aput-object p2, v0, v1

    return-object p1
.end method

.method public final subList(II)Ljava/util/List;
    .locals 8

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, p2, v0}, Lړجإٖټض/أ;->ء(III)V

    new-instance v0, Lڦڶٛۯ/ؠ;

    iget-object v2, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int v3, v1, p1

    sub-int v4, p2, p1

    iget-boolean v5, p0, Lڦڶٛۯ/ؠ;->إ:Z

    iget-object p1, p0, Lڦڶٛۯ/ؠ;->ا:Lڦڶٛۯ/ؠ;

    if-nez p1, :cond_0

    move-object v7, p0

    goto :goto_0

    :cond_0
    move-object v7, p1

    :goto_0
    move-object v1, v0

    move-object v6, p0

    invoke-direct/range {v1 .. v7}, Lڦڶٛۯ/ؠ;-><init>([Ljava/lang/Object;IIZLڦڶٛۯ/ؠ;Lڦڶٛۯ/ؠ;)V

    return-object v0
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iget v2, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v1, v2

    const-string v3, "<this>"

    invoke-static {v0, v3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v3, v0

    invoke-static {v1, v3}, Lڗًقڔ/؋;->ذ(II)V

    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "copyOfRange(this, fromIndex, toIndex)"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4

    const-string v0, "destination"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iget v2, p0, Lڦڶٛۯ/ؠ;->أ:I

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {v0, v2, v1, p1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    const-string v0, "copyOfRange(array, offse\u2026h, destination.javaClass)"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    :cond_0
    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    const/4 v3, 0x0

    add-int/2addr v1, v2

    invoke-static {v0, p1, v3, v2, v1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    array-length v0, p1

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    if-le v0, v1, :cond_1

    const/4 v0, 0x0

    aput-object v0, p1, v1

    :cond_1
    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    new-instance v2, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, v1, 0x3

    add-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    if-lez v3, :cond_0

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget v4, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v4, v3

    aget-object v4, v0, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const-string v0, "]"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sb.toString()"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final ؋()I
    .locals 1

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return v0
.end method

.method public final ؠ(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lڦڶٛۯ/ؠ;->أ()V

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    iget v0, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lڦڶٛۯ/ؠ;->إ(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final ء(ILjava/util/Collection;I)V
    .locals 4

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lڦڶٛۯ/ؠ;->ء(ILjava/util/Collection;I)V

    iget-object p1, v0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iput-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr p1, p3

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    goto :goto_1

    :cond_0
    invoke-virtual {p0, p1, p3}, Lڦڶٛۯ/ؠ;->ؤ(II)V

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int v2, p1, v0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public final آ(ILjava/lang/Object;)V
    .locals 2

    const/4 v0, 0x1

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1, p2}, Lڦڶٛۯ/ؠ;->آ(ILjava/lang/Object;)V

    iget-object p1, v1, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iput-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr p1, v0

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, v0}, Lڦڶٛۯ/ؠ;->ؤ(II)V

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    aput-object p2, v0, p1

    :goto_0
    return-void
.end method

.method public final أ()V
    .locals 1

    iget-boolean v0, p0, Lڦڶٛۯ/ؠ;->إ:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->ا:Lڦڶٛۯ/ؠ;

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lڦڶٛۯ/ؠ;->إ:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-nez v0, :cond_2

    return-void

    :cond_2
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final ؤ(II)V
    .locals 5

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-nez v1, :cond_5

    if-ltz v0, :cond_4

    iget-object v1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    array-length v2, v1

    if-le v0, v2, :cond_3

    array-length v2, v1

    shr-int/lit8 v3, v2, 0x1

    add-int/2addr v2, v3

    sub-int v3, v2, v0

    if-gez v3, :cond_0

    move v2, v0

    :cond_0
    const v3, 0x7ffffff7

    sub-int v4, v2, v3

    if-lez v4, :cond_2

    if-le v0, v3, :cond_1

    const v2, 0x7fffffff

    goto :goto_0

    :cond_1
    move v2, v3

    :cond_2
    :goto_0
    const-string v0, "<this>"

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "copyOf(this, newSize)"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    :cond_3
    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v1, p0, Lڦڶٛۯ/ؠ;->أ:I

    iget v2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr v1, v2

    add-int v2, p1, p2

    invoke-static {v0, v0, v2, p1, v1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr p1, p2

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return-void

    :cond_4
    new-instance p1, Ljava/lang/OutOfMemoryError;

    invoke-direct {p1}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public final إ(I)Ljava/lang/Object;
    .locals 5

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lڦڶٛۯ/ؠ;->إ(I)Ljava/lang/Object;

    move-result-object p1

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return-object p1

    :cond_0
    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    aget-object v1, v0, p1

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    iget v4, p0, Lڦڶٛۯ/ؠ;->أ:I

    add-int/2addr v3, v4

    invoke-static {v0, v0, p1, v2, v3}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    const-string v0, "<this>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    aput-object v0, p1, v4

    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return-object v1
.end method

.method public final ئ(II)V
    .locals 3

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lڦڶٛۯ/ؠ;->ئ(II)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int v1, p1, p2

    iget v2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    invoke-static {v0, v0, p1, v1, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    sub-int v1, v0, p2

    invoke-static {p1, v1, v0}, Lںڍڒڸ/ش;->ٳ([Ljava/lang/Object;II)V

    :goto_0
    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    sub-int/2addr p1, p2

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return-void
.end method

.method public final ا(IILjava/util/Collection;Z)I
    .locals 5

    iget-object v0, p0, Lڦڶٛۯ/ؠ;->ئ:Lڦڶٛۯ/ؠ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lڦڶٛۯ/ؠ;->ا(IILjava/util/Collection;Z)I

    move-result p1

    iget p2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    sub-int/2addr p2, p1

    iput p2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return p1

    :cond_0
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v0, p2, :cond_2

    iget-object v2, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int v3, p1, v0

    aget-object v2, v2, v3

    invoke-interface {p3, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-ne v2, p4, :cond_1

    iget-object v2, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int/lit8 v4, v1, 0x1

    add-int/2addr v1, p1

    add-int/lit8 v0, v0, 0x1

    aget-object v3, v2, v3

    aput-object v3, v2, v1

    move v1, v4

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    sub-int p3, p2, v1

    iget-object p4, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    add-int/2addr p2, p1

    iget v0, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    add-int/2addr p1, v1

    invoke-static {p4, p4, p1, p2, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڦڶٛۯ/ؠ;->آ:[Ljava/lang/Object;

    iget p2, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    sub-int p4, p2, p3

    invoke-static {p1, p4, p2}, Lںڍڒڸ/ش;->ٳ([Ljava/lang/Object;II)V

    iget p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    sub-int/2addr p1, p3

    iput p1, p0, Lڦڶٛۯ/ؠ;->ؤ:I

    return p3
.end method
