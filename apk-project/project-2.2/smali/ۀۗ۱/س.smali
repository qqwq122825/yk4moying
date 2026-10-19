.class public final Lۀۗ۱/س;
.super Lڡپٔۯ/ؤ;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# instance fields
.field public final آ:[Lۀۗ۱/ث;

.field public final أ:[I


# direct methods
.method public constructor <init>([Lۀۗ۱/ث;[I)V
    .locals 0

    invoke-direct {p0}, Lڡپٔۯ/ؤ;-><init>()V

    iput-object p1, p0, Lۀۗ۱/س;->آ:[Lۀۗ۱/ث;

    iput-object p2, p0, Lۀۗ۱/س;->أ:[I

    return-void
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lۀۗ۱/ث;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Lۀۗ۱/ث;

    invoke-super {p0, p1}, Lڡپٔۯ/ؠ;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/س;->آ:[Lۀۗ۱/ث;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .locals 1

    instance-of v0, p1, Lۀۗ۱/ث;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Lۀۗ۱/ث;

    invoke-super {p0, p1}, Lڡپٔۯ/ؤ;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .locals 1

    instance-of v0, p1, Lۀۗ۱/ث;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Lۀۗ۱/ث;

    invoke-super {p0, p1}, Lڡپٔۯ/ؤ;->lastIndexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final ؋()I
    .locals 1

    iget-object v0, p0, Lۀۗ۱/س;->آ:[Lۀۗ۱/ث;

    array-length v0, v0

    return v0
.end method
