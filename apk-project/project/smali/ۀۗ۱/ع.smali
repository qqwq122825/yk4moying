.class public final Lۀۗ۱/ع;
.super Lۀۗ۱/ث;
.source "SourceFile"


# instance fields
.field public final transient ئ:[[B

.field public final transient ا:[I


# direct methods
.method public constructor <init>([[B[I)V
    .locals 1

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    iget-object v0, v0, Lۀۗ۱/ث;->آ:[B

    invoke-direct {p0, v0}, Lۀۗ۱/ث;-><init>([B)V

    iput-object p1, p0, Lۀۗ۱/ع;->ئ:[[B

    iput-object p2, p0, Lۀۗ۱/ع;->ا:[I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lۀۗ۱/ث;

    if-eqz v0, :cond_1

    check-cast p1, Lۀۗ۱/ث;

    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result v0

    invoke-virtual {p0}, Lۀۗ۱/ع;->ء()I

    move-result v1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lۀۗ۱/ع;->ء()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lۀۗ۱/ع;->ا(Lۀۗ۱/ث;I)Z

    move-result p1

    if-eqz p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method public final hashCode()I
    .locals 9

    iget v0, p0, Lۀۗ۱/ث;->أ:I

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    move v4, v2

    :goto_0
    if-ge v2, v1, :cond_2

    add-int v5, v1, v2

    iget-object v6, p0, Lۀۗ۱/ع;->ا:[I

    aget v5, v6, v5

    aget v6, v6, v2

    aget-object v7, v0, v2

    sub-int v4, v6, v4

    add-int/2addr v4, v5

    :goto_1
    if-ge v5, v4, :cond_1

    mul-int/lit8 v3, v3, 0x1f

    aget-byte v8, v7, v5

    add-int/2addr v3, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    move v4, v6

    goto :goto_0

    :cond_2
    iput v3, p0, Lۀۗ۱/ث;->أ:I

    move v0, v3

    :goto_2
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Lۀۗ۱/ث;

    invoke-virtual {p0}, Lۀۗ۱/ع;->ة()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lۀۗ۱/ث;-><init>([B)V

    invoke-virtual {v0}, Lۀۗ۱/ث;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋()Ljava/lang/String;
    .locals 2

    new-instance v0, Lۀۗ۱/ث;

    invoke-virtual {p0}, Lۀۗ۱/ع;->ة()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lۀۗ۱/ث;-><init>([B)V

    invoke-virtual {v0}, Lۀۗ۱/ث;->؋()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ(Ljava/lang/String;)Lۀۗ۱/ث;
    .locals 7

    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    iget-object v0, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v2, v1, :cond_0

    add-int v4, v1, v2

    iget-object v5, p0, Lۀۗ۱/ع;->ا:[I

    aget v4, v5, v4

    aget v5, v5, v2

    aget-object v6, v0, v2

    sub-int v3, v5, v3

    invoke-virtual {p1, v6, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    new-instance v0, Lۀۗ۱/ث;

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-direct {v0, p1}, Lۀۗ۱/ث;-><init>([B)V

    return-object v0
.end method

.method public final ء()I
    .locals 2

    iget-object v0, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lۀۗ۱/ع;->ا:[I

    aget v0, v1, v0

    return v0
.end method

.method public final آ()Ljava/lang/String;
    .locals 2

    new-instance v0, Lۀۗ۱/ث;

    invoke-virtual {p0}, Lۀۗ۱/ع;->ة()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lۀۗ۱/ث;-><init>([B)V

    invoke-virtual {v0}, Lۀۗ۱/ث;->آ()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final أ()[B
    .locals 1

    invoke-virtual {p0}, Lۀۗ۱/ع;->ة()[B

    move-result-object v0

    return-object v0
.end method

.method public final ؤ(I)B
    .locals 9

    iget-object v0, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lۀۗ۱/ع;->ا:[I

    aget v1, v2, v1

    int-to-long v3, v1

    int-to-long v5, p1

    const-wide/16 v7, 0x1

    invoke-static/range {v3 .. v8}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->ٻ(Lۀۗ۱/ع;I)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    add-int/lit8 v3, v1, -0x1

    aget v3, v2, v3

    :goto_0
    array-length v4, v0

    add-int/2addr v4, v1

    aget v2, v2, v4

    aget-object v0, v0, v1

    sub-int/2addr p1, v3

    add-int/2addr p1, v2

    aget-byte p1, v0, p1

    return p1
.end method

.method public final ئ(I[BII)Z
    .locals 7

    const-string v0, "other"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ltz p1, :cond_4

    invoke-virtual {p0}, Lۀۗ۱/ع;->ء()I

    move-result v1

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_4

    if-ltz p3, :cond_4

    array-length v1, p2

    sub-int/2addr v1, p4

    if-le p3, v1, :cond_0

    goto :goto_2

    :cond_0
    add-int/2addr p4, p1

    invoke-static {p0, p1}, Lڗًقڔ/؋;->ٻ(Lۀۗ۱/ع;I)I

    move-result v1

    :goto_0
    if-ge p1, p4, :cond_3

    iget-object v2, p0, Lۀۗ۱/ع;->ا:[I

    if-nez v1, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v1, -0x1

    aget v3, v2, v3

    :goto_1
    aget v4, v2, v1

    sub-int/2addr v4, v3

    iget-object v5, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v6, v5

    add-int/2addr v6, v1

    aget v2, v2, v6

    add-int/2addr v4, v3

    invoke-static {p4, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    sub-int/2addr v4, p1

    sub-int v3, p1, v3

    add-int/2addr v3, v2

    aget-object v2, v5, v1

    invoke-static {v3, p3, v4, v2, p2}, Lڃٷښـ۝ۼ/ؠ;->؋(III[B[B)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    add-int/2addr p3, v4

    add-int/2addr p1, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    :cond_4
    :goto_2
    return v0
.end method

.method public final ا(Lۀۗ۱/ث;I)Z
    .locals 9

    const-string v0, "other"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lۀۗ۱/ع;->ء()I

    move-result v0

    sub-int/2addr v0, p2

    const/4 v1, 0x0

    if-gez v0, :cond_0

    goto :goto_2

    :cond_0
    add-int/2addr p2, v1

    invoke-static {p0, v1}, Lڗًقڔ/؋;->ٻ(Lۀۗ۱/ع;I)I

    move-result v0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, p2, :cond_3

    iget-object v4, p0, Lۀۗ۱/ع;->ا:[I

    if-nez v0, :cond_1

    move v5, v1

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v0, -0x1

    aget v5, v4, v5

    :goto_1
    aget v6, v4, v0

    sub-int/2addr v6, v5

    iget-object v7, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v8, v7

    add-int/2addr v8, v0

    aget v4, v4, v8

    add-int/2addr v6, v5

    invoke-static {p2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    sub-int/2addr v6, v2

    sub-int v5, v2, v5

    add-int/2addr v5, v4

    aget-object v4, v7, v0

    invoke-virtual {p1, v3, v4, v5, v6}, Lۀۗ۱/ث;->ئ(I[BII)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    add-int/2addr v3, v6

    add-int/2addr v2, v6

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x1

    :goto_2
    return v1
.end method

.method public final ب()Lۀۗ۱/ث;
    .locals 2

    new-instance v0, Lۀۗ۱/ث;

    invoke-virtual {p0}, Lۀۗ۱/ع;->ة()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lۀۗ۱/ث;-><init>([B)V

    invoke-virtual {v0}, Lۀۗ۱/ث;->ب()Lۀۗ۱/ث;

    move-result-object v0

    return-object v0
.end method

.method public final ة()[B
    .locals 10

    invoke-virtual {p0}, Lۀۗ۱/ع;->ء()I

    move-result v0

    new-array v0, v0, [B

    iget-object v1, p0, Lۀۗ۱/ع;->ئ:[[B

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v3, v2, :cond_0

    add-int v6, v2, v3

    iget-object v7, p0, Lۀۗ۱/ع;->ا:[I

    aget v6, v7, v6

    aget v7, v7, v3

    aget-object v8, v1, v3

    sub-int v4, v7, v4

    add-int v9, v6, v4

    invoke-static {v5, v6, v9, v8, v0}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    add-int/2addr v5, v4

    add-int/lit8 v3, v3, 0x1

    move v4, v7

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public final ث(Lۀۗ۱/ب;I)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const-string v3, "buffer"

    invoke-static {v1, v3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    add-int v4, v3, v2

    invoke-static {v0, v3}, Lڗًقڔ/؋;->ٻ(Lۀۗ۱/ع;I)I

    move-result v5

    move v6, v3

    :goto_0
    if-ge v6, v4, :cond_2

    iget-object v7, v0, Lۀۗ۱/ع;->ا:[I

    if-nez v5, :cond_0

    move v8, v3

    goto :goto_1

    :cond_0
    add-int/lit8 v8, v5, -0x1

    aget v8, v7, v8

    :goto_1
    aget v9, v7, v5

    sub-int/2addr v9, v8

    iget-object v10, v0, Lۀۗ۱/ع;->ئ:[[B

    array-length v11, v10

    add-int/2addr v11, v5

    aget v7, v7, v11

    add-int/2addr v9, v8

    invoke-static {v4, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    sub-int/2addr v9, v6

    sub-int v8, v6, v8

    add-int v13, v8, v7

    aget-object v12, v10, v5

    new-instance v7, Lۀۗ۱/ط;

    add-int v14, v13, v9

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object v11, v7

    invoke-direct/range {v11 .. v16}, Lۀۗ۱/ط;-><init>([BIIZZ)V

    iget-object v8, v1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v8, :cond_1

    iput-object v7, v7, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v7, v7, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iput-object v7, v1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    goto :goto_2

    :cond_1
    iget-object v8, v8, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v8}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v8, v7}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    :goto_2
    add-int/2addr v6, v9

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    iget-wide v3, v1, Lۀۗ۱/ب;->أ:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, v1, Lۀۗ۱/ب;->أ:J

    return-void
.end method
