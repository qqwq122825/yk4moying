.class public final Lڡپٔۯ/ب;
.super Lڡپٔۯ/إ;
.source "SourceFile"


# static fields
.field public static final إ:[Ljava/lang/Object;


# instance fields
.field public آ:I

.field public أ:[Ljava/lang/Object;

.field public ؤ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lڡپٔۯ/ب;->إ:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lڡپٔۯ/إ;-><init>()V

    sget-object v0, Lڡپٔۯ/ب;->إ:[Ljava/lang/Object;

    iput-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 7

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->ؠ(II)V

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    if-ne p1, v0, :cond_0

    invoke-virtual {p0, p2}, Lڡپٔۯ/ب;->addLast(Ljava/lang/Object;)V

    return-void

    :cond_0
    const-string v1, "<this>"

    const/4 v2, 0x1

    if-nez p1, :cond_2

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->آ(I)V

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    if-nez p1, :cond_1

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length p1, p1

    :cond_1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lڡپٔۯ/ب;->آ:I

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object p2, v0, p1

    iget p1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr p1, v2

    iput p1, p0, Lڡپٔۯ/ب;->ؤ:I

    return-void

    :cond_2
    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->آ(I)V

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v3, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/lit8 v4, v3, 0x1

    shr-int/2addr v4, v2

    const/4 v5, 0x0

    if-ge p1, v4, :cond_6

    if-nez v0, :cond_3

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    :cond_3
    add-int/lit8 v0, v0, -0x1

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    if-nez p1, :cond_4

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length p1, p1

    :cond_4
    add-int/lit8 p1, p1, -0x1

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    if-lt v0, v1, :cond_5

    aget-object v4, v3, v1

    aput-object v4, v3, p1

    add-int/lit8 v4, v1, 0x1

    add-int/lit8 v5, v0, 0x1

    invoke-static {v3, v3, v1, v4, v5}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_5
    add-int/lit8 v4, v1, -0x1

    array-length v6, v3

    invoke-static {v3, v3, v4, v1, v6}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v3, v1

    sub-int/2addr v3, v2

    aget-object v4, v1, v5

    aput-object v4, v1, v3

    add-int/lit8 v3, v0, 0x1

    invoke-static {v1, v1, v5, v2, v3}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_0
    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object p2, v1, v0

    iput p1, p0, Lڡپٔۯ/ب;->آ:I

    goto :goto_2

    :cond_6
    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v3, p1

    invoke-virtual {p0, v3}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result p1

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    if-ge v0, p1, :cond_7

    add-int/lit8 v3, v0, 0x1

    invoke-static {v1, v1, v3, v0, p1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_7
    invoke-static {v1, v1, v2, v5, p1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, p1

    sub-int/2addr v1, v2

    aget-object v1, p1, v1

    aput-object v1, p1, v5

    add-int/lit8 v1, v0, 0x1

    array-length v3, p1

    sub-int/2addr v3, v2

    invoke-static {p1, p1, v1, v0, v3}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_1
    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object p2, p1, v0

    :goto_2
    iget p1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr p1, v2

    iput p1, p0, Lڡپٔۯ/ب;->ؤ:I

    return-void
.end method

.method public final add(Ljava/lang/Object;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lڡپٔۯ/ب;->addLast(Ljava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addAll(ILjava/util/Collection;)Z
    .locals 8

    const-string v0, "elements"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->ؠ(II)V

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    if-ne p1, v0, :cond_1

    invoke-virtual {p0, p2}, Lڡپٔۯ/ب;->addAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :cond_1
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0, v2}, Lڡپٔۯ/ب;->آ(I)V

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v2, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v2, v0

    invoke-virtual {p0, v2}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v2, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v2, p1

    invoke-virtual {p0, v2}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v2

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    iget v4, p0, Lڡپٔۯ/ب;->ؤ:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    shr-int/2addr v4, v5

    if-ge p1, v4, :cond_6

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    sub-int v0, p1, v3

    if-lt v2, p1, :cond_4

    if-ltz v0, :cond_2

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v1, v1, v0, p1, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v6, v4

    add-int/2addr v0, v6

    sub-int v6, v2, p1

    array-length v7, v4

    sub-int/2addr v7, v0

    if-lt v7, v6, :cond_3

    invoke-static {v4, v4, v0, p1, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_3
    add-int v6, p1, v7

    invoke-static {v4, v4, v0, p1, v6}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v4, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v4, v7

    invoke-static {p1, p1, v1, v4, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_4
    iget-object v4, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v4, v0, p1, v6}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v4, p1

    sub-int/2addr v4, v3

    if-lt v3, v2, :cond_5

    invoke-static {p1, p1, v4, v1, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_5
    invoke-static {p1, p1, v4, v1, v3}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {p1, p1, v1, v3, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_0
    iput v0, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v2, v3

    if-gez v2, :cond_b

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v2, p1

    goto :goto_2

    :cond_6
    add-int p1, v2, v3

    if-ge v2, v0, :cond_9

    add-int/2addr v3, v0

    iget-object v4, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v6, v4

    if-gt v3, v6, :cond_7

    goto :goto_1

    :cond_7
    array-length v6, v4

    if-lt p1, v6, :cond_8

    array-length v1, v4

    sub-int/2addr p1, v1

    :goto_1
    invoke-static {v4, v4, p1, v2, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_2

    :cond_8
    array-length v6, v4

    sub-int/2addr v3, v6

    sub-int v3, v0, v3

    invoke-static {v4, v4, v1, v3, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v0, v0, p1, v2, v3}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_2

    :cond_9
    iget-object v4, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v4, v4, v3, v1, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v4, v0

    if-lt p1, v4, :cond_a

    array-length v1, v0

    sub-int/2addr p1, v1

    array-length v1, v0

    invoke-static {v0, v0, p1, v2, v1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_2

    :cond_a
    array-length v4, v0

    sub-int/2addr v4, v3

    array-length v6, v0

    invoke-static {v0, v0, v1, v4, v6}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, v0

    sub-int/2addr v1, v3

    invoke-static {v0, v0, p1, v2, v1}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :cond_b
    :goto_2
    invoke-virtual {p0, v2, p2}, Lڡپٔۯ/ب;->ء(ILjava/util/Collection;)V

    return v5
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 2

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v0

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->آ(I)V

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lڡپٔۯ/ب;->ء(ILjava/util/Collection;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addLast(Ljava/lang/Object;)V
    .locals 3

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->آ(I)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v1

    aput-object p1, v0, v1

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lڡپٔۯ/ب;->ؤ:I

    return-void
.end method

.method public final clear()V
    .locals 7

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    const-string v2, "<this>"

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ge v1, v0, :cond_0

    iget-object v5, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v5, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5, v1, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v5, p0, Lڡپٔۯ/ب;->آ:I

    array-length v6, v1

    invoke-static {v1, v5, v6, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, v4, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    :cond_1
    :goto_0
    iput v4, p0, Lڡپٔۯ/ب;->آ:I

    iput v4, p0, Lڡپٔۯ/ب;->ؤ:I

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lڡپٔۯ/ب;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result p1

    aget-object p1, v0, p1

    return-object p1
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 4

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    if-ge v1, v0, :cond_1

    :goto_0
    if-ge v1, v0, :cond_5

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :goto_1
    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v1, p1

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-lt v1, v0, :cond_5

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v2, v2

    :goto_2
    if-ge v1, v2, :cond_3

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v3, v3, v1

    invoke-static {p1, v3}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v0, :cond_5

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v1, p1

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    const/4 p1, -0x1

    return p1
.end method

.method public final isEmpty()Z
    .locals 1

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final lastIndexOf(Ljava/lang/Object;)I
    .locals 4

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    const/4 v2, -0x1

    if-ge v1, v0, :cond_1

    add-int/2addr v0, v2

    if-gt v1, v0, :cond_5

    :goto_0
    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_3

    :cond_0
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-le v1, v0, :cond_5

    add-int/2addr v0, v2

    :goto_1
    if-ge v2, v0, :cond_3

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v0, p1

    goto :goto_3

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    add-int/2addr v0, v2

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    if-gt v1, v0, :cond_5

    :goto_2
    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    :goto_3
    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v0, p1

    return v0

    :cond_4
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_5
    return v2
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lڡپٔۯ/ب;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lڡپٔۯ/ب;->ؠ(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 11

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v0, v0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    goto/16 :goto_8

    :cond_1
    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v3, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v3, v0

    invoke-virtual {p0, v3}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v3, p0, Lڡپٔۯ/ب;->آ:I

    const/4 v4, 0x0

    if-ge v3, v0, :cond_4

    move v5, v3

    :goto_1
    if-ge v3, v0, :cond_3

    iget-object v6, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v6, v6, v3

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    xor-int/2addr v7, v2

    if-eqz v7, :cond_2

    iget-object v7, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    const-string v2, "<this>"

    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v5, v0, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_7

    :cond_4
    iget-object v5, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v3

    :goto_3
    if-ge v3, v5, :cond_6

    iget-object v8, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v9, v8, v3

    aput-object v4, v8, v3

    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    xor-int/2addr v8, v2

    if-eqz v8, :cond_5

    iget-object v8, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_4

    :cond_5
    move v7, v2

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    invoke-virtual {p0, v6}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v3

    move v5, v3

    :goto_5
    if-ge v1, v0, :cond_8

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v6, v3, v1

    aput-object v4, v3, v1

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    xor-int/2addr v3, v2

    if-eqz v3, :cond_7

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object v6, v3, v5

    invoke-virtual {p0, v5}, Lڡپٔۯ/ب;->أ(I)I

    move-result v5

    goto :goto_6

    :cond_7
    move v7, v2

    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_8
    move v1, v7

    :goto_7
    if-eqz v1, :cond_a

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v5, p1

    if-gez v5, :cond_9

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v5, p1

    :cond_9
    iput v5, p0, Lڡپٔۯ/ب;->ؤ:I

    :cond_a
    :goto_8
    return v1
.end method

.method public final removeFirst()Ljava/lang/Object;
    .locals 4

    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    aget-object v2, v0, v1

    const/4 v3, 0x0

    aput-object v3, v0, v1

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->أ(I)I

    move-result v0

    iput v0, p0, Lڡپٔۯ/ب;->آ:I

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lڡپٔۯ/ب;->ؤ:I

    return-object v2

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "ArrayDeque is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 11

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v0, v0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    goto/16 :goto_8

    :cond_1
    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v3, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v3, v0

    invoke-virtual {p0, v3}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v3, p0, Lڡپٔۯ/ب;->آ:I

    const/4 v4, 0x0

    if-ge v3, v0, :cond_4

    move v5, v3

    :goto_1
    if-ge v3, v0, :cond_3

    iget-object v6, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v6, v6, v3

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    iget-object v7, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    const-string v2, "<this>"

    invoke-static {p1, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v5, v0, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_7

    :cond_4
    iget-object v5, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v3

    :goto_3
    if-ge v3, v5, :cond_6

    iget-object v8, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v9, v8, v3

    aput-object v4, v8, v3

    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    iget-object v8, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_4

    :cond_5
    move v7, v2

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    invoke-virtual {p0, v6}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v3

    move v5, v3

    :goto_5
    if-ge v1, v0, :cond_8

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v6, v3, v1

    aput-object v4, v3, v1

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object v6, v3, v5

    invoke-virtual {p0, v5}, Lڡپٔۯ/ب;->أ(I)I

    move-result v5

    goto :goto_6

    :cond_7
    move v7, v2

    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_8
    move v1, v7

    :goto_7
    if-eqz v1, :cond_a

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v5, p1

    if-gez v5, :cond_9

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v5, p1

    :cond_9
    iput v5, p0, Lڡپٔۯ/ب;->ؤ:I

    :cond_a
    :goto_8
    return v1
.end method

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result p1

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v1, v0, p1

    aput-object p2, v0, p1

    return-object v1
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5

    const-string v0, "array"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    iget v1, p0, Lڡپٔۯ/ب;->ؤ:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.arrayOfNulls>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, [Ljava/lang/Object;

    :goto_0
    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    iget v1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    const/4 v2, 0x0

    if-ge v1, v0, :cond_1

    iget-object v3, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-static {v3, p1, v2, v1, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v3, p0, Lڡپٔۯ/ب;->آ:I

    array-length v4, v1

    invoke-static {v1, p1, v2, v3, v4}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v3, v1

    iget v4, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v3, v4

    invoke-static {v1, p1, v3, v2, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :cond_2
    :goto_1
    array-length v0, p1

    iget v1, p0, Lڡپٔۯ/ب;->ؤ:I

    if-le v0, v1, :cond_3

    const/4 v0, 0x0

    aput-object v0, p1, v1

    :cond_3
    return-object p1
.end method

.method public final ؋()I
    .locals 1

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    return v0
.end method

.method public final ؠ(I)Ljava/lang/Object;
    .locals 8

    iget v0, p0, Lڡپٔۯ/ب;->ؤ:I

    invoke-static {p1, v0}, Lړجإٖټض/أ;->؋(II)V

    invoke-static {p0}, Lںڍڒڸ/ش;->ظ(Ljava/util/List;)I

    move-result v0

    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    invoke-virtual {p0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    invoke-static {p0}, Lںڍڒڸ/ش;->ظ(Ljava/util/List;)I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result p1

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v2, v0, p1

    aput-object v1, v0, p1

    iget p1, p0, Lڡپٔۯ/ب;->ؤ:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lڡپٔۯ/ب;->ؤ:I

    return-object v2

    :cond_0
    new-instance p1, Ljava/util/NoSuchElementException;

    const-string v0, "ArrayDeque is empty."

    invoke-direct {p1, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    if-nez p1, :cond_2

    invoke-virtual {p0}, Lڡپٔۯ/ب;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_2
    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result v0

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aget-object v3, v2, v0

    iget v4, p0, Lڡپٔۯ/ب;->ؤ:I

    const/4 v5, 0x1

    shr-int/2addr v4, v5

    const/4 v6, 0x0

    if-ge p1, v4, :cond_4

    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    if-lt v0, p1, :cond_3

    add-int/lit8 v4, p1, 0x1

    invoke-static {v2, v2, v4, p1, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_3
    invoke-static {v2, v2, v5, v6, v0}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v0, p1

    sub-int/2addr v0, v5

    aget-object v0, p1, v0

    aput-object v0, p1, v6

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    add-int/lit8 v2, v0, 0x1

    array-length v4, p1

    sub-int/2addr v4, v5

    invoke-static {p1, p1, v2, v0, v4}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_0
    iget-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    iget v0, p0, Lڡپٔۯ/ب;->آ:I

    aput-object v1, p1, v0

    invoke-virtual {p0, v0}, Lڡپٔۯ/ب;->أ(I)I

    move-result p1

    iput p1, p0, Lڡپٔۯ/ب;->آ:I

    goto :goto_2

    :cond_4
    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    invoke-static {p0}, Lںڍڒڸ/ش;->ظ(Ljava/util/List;)I

    move-result v2

    add-int/2addr v2, p1

    invoke-virtual {p0, v2}, Lڡپٔۯ/ب;->ؤ(I)I

    move-result p1

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    add-int/lit8 v4, v0, 0x1

    if-gt v0, p1, :cond_5

    add-int/lit8 v6, p1, 0x1

    invoke-static {v2, v2, v0, v4, v6}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_5
    array-length v7, v2

    invoke-static {v2, v2, v0, v4, v7}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v2, v0

    sub-int/2addr v2, v5

    aget-object v4, v0, v6

    aput-object v4, v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-static {v0, v0, v6, v5, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_1
    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    aput-object v1, v0, p1

    :goto_2
    iget p1, p0, Lڡپٔۯ/ب;->ؤ:I

    sub-int/2addr p1, v5

    iput p1, p0, Lڡپٔۯ/ب;->ؤ:I

    return-object v3
.end method

.method public final ء(ILjava/util/Collection;)V
    .locals 4

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, v1

    :goto_0
    if-ge p1, v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    iget p1, p0, Lڡپٔۯ/ب;->آ:I

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lڡپٔۯ/ب;->؋()I

    move-result p1

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    add-int/2addr p2, p1

    iput p2, p0, Lڡپٔۯ/ب;->ؤ:I

    return-void
.end method

.method public final آ(I)V
    .locals 4

    if-ltz p1, :cond_6

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, v0

    if-gt p1, v1, :cond_0

    return-void

    :cond_0
    sget-object v1, Lڡپٔۯ/ب;->إ:[Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    const/16 v0, 0xa

    if-ge p1, v0, :cond_1

    move p1, v0

    :cond_1
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    return-void

    :cond_2
    array-length v1, v0

    shr-int/lit8 v2, v1, 0x1

    add-int/2addr v1, v2

    sub-int v2, v1, p1

    if-gez v2, :cond_3

    move v1, p1

    :cond_3
    const v2, 0x7ffffff7

    sub-int v3, v1, v2

    if-lez v3, :cond_5

    if-le p1, v2, :cond_4

    const v1, 0x7fffffff

    goto :goto_0

    :cond_4
    move v1, v2

    :cond_5
    :goto_0
    new-array p1, v1, [Ljava/lang/Object;

    iget v1, p0, Lڡپٔۯ/ب;->آ:I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, v0

    iget v2, p0, Lڡپٔۯ/ب;->آ:I

    sub-int/2addr v1, v2

    invoke-static {v0, p1, v1, v3, v2}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iput v3, p0, Lڡپٔۯ/ب;->آ:I

    iput-object p1, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    return-void

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Deque is too big."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final أ(I)I
    .locals 2

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    add-int/lit8 p1, p1, 0x1

    :goto_0
    return p1
.end method

.method public final ؤ(I)I
    .locals 2

    iget-object v0, p0, Lڡپٔۯ/ب;->أ:[Ljava/lang/Object;

    array-length v1, v0

    if-lt p1, v1, :cond_0

    array-length v0, v0

    sub-int/2addr p1, v0

    :cond_0
    return p1
.end method
