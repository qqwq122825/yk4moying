.class public final Lۀۗ۱/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ت;
.implements Lۀۗ۱/ة;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# instance fields
.field public آ:Lۀۗ۱/ط;

.field public أ:J


# virtual methods
.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lۀۗ۱/ب;->ء()Lۀۗ۱/ب;

    move-result-object v0

    return-object v0
.end method

.method public final close()V
    .locals 0

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_1

    :cond_0
    :goto_0
    const/4 v2, 0x1

    goto/16 :goto_4

    :cond_1
    instance-of v3, v1, Lۀۗ۱/ب;

    if-nez v3, :cond_2

    :goto_1
    const/4 v2, 0x0

    goto/16 :goto_4

    :cond_2
    iget-wide v5, v0, Lۀۗ۱/ب;->أ:J

    check-cast v1, Lۀۗ۱/ب;

    iget-wide v7, v1, Lۀۗ۱/ب;->أ:J

    cmp-long v3, v5, v7

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-nez v3, :cond_4

    goto :goto_0

    :cond_4
    iget-object v3, v0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v1, v1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v5, v3, Lۀۗ۱/ط;->ؠ:I

    iget v6, v1, Lۀۗ۱/ط;->ؠ:I

    move-wide v9, v7

    :goto_2
    iget-wide v11, v0, Lۀۗ۱/ب;->أ:J

    cmp-long v11, v9, v11

    if-gez v11, :cond_0

    iget v11, v3, Lۀۗ۱/ط;->ء:I

    sub-int/2addr v11, v5

    iget v12, v1, Lۀۗ۱/ط;->ء:I

    sub-int/2addr v12, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    int-to-long v11, v11

    move-wide v13, v7

    :goto_3
    cmp-long v15, v13, v11

    if-gez v15, :cond_6

    add-int/lit8 v15, v5, 0x1

    iget-object v2, v3, Lۀۗ۱/ط;->؋:[B

    aget-byte v2, v2, v5

    add-int/lit8 v5, v6, 0x1

    iget-object v4, v1, Lۀۗ۱/ط;->؋:[B

    aget-byte v4, v4, v6

    if-eq v2, v4, :cond_5

    goto :goto_1

    :cond_5
    const-wide/16 v16, 0x1

    add-long v13, v13, v16

    move v6, v5

    move v5, v15

    goto :goto_3

    :cond_6
    iget v2, v3, Lۀۗ۱/ط;->ء:I

    if-ne v5, v2, :cond_7

    iget-object v2, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v3, v2, Lۀۗ۱/ط;->ؠ:I

    move v5, v3

    move-object v3, v2

    :cond_7
    iget v2, v1, Lۀۗ۱/ط;->ء:I

    if-ne v6, v2, :cond_8

    iget-object v1, v1, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v2, v1, Lۀۗ۱/ط;->ؠ:I

    move v6, v2

    :cond_8
    add-long/2addr v9, v11

    goto :goto_2

    :goto_4
    return v2
.end method

.method public final flush()V
    .locals 0

    return-void
.end method

.method public final hashCode()I
    .locals 5

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    iget v3, v0, Lۀۗ۱/ط;->ء:I

    :goto_0
    if-ge v2, v3, :cond_2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v4, v4, v2

    add-int/2addr v1, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-ne v0, v2, :cond_1

    move v0, v1

    :goto_1
    return v0
.end method

.method public final isOpen()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final peek()Lۀۗ۱/ض;
    .locals 1

    new-instance v0, Lۀۗ۱/ش;

    invoke-direct {v0, p0}, Lۀۗ۱/ش;-><init>(Lۀۗ۱/ت;)V

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->أ(Lۀۗ۱/ؼ;)Lۀۗ۱/ض;

    move-result-object v0

    return-object v0
.end method

.method public final read(Ljava/nio/ByteBuffer;)I
    .locals 6

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v1

    iget v2, v0, Lۀۗ۱/ط;->ء:I

    iget v3, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, v0, Lۀۗ۱/ط;->؋:[B

    iget v3, v0, Lۀۗ۱/ط;->ؠ:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    iget p1, v0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr p1, v1

    iput p1, v0, Lۀۗ۱/ط;->ؠ:I

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    iget v2, v0, Lۀۗ۱/ط;->ء:I

    if-ne p1, v2, :cond_1

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p1

    iput-object p1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_1
    return v1
.end method

.method public final read([BII)I
    .locals 7

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    iget v1, v0, Lۀۗ۱/ط;->ء:I

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    add-int v2, v1, p3

    iget-object v3, v0, Lۀۗ۱/ط;->؋:[B

    invoke-static {p2, v1, v2, v3, p1}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    iget p1, v0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr p1, p3

    iput p1, v0, Lۀۗ۱/ط;->ؠ:I

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v3, p3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lۀۗ۱/ب;->أ:J

    iget p2, v0, Lۀۗ۱/ط;->ء:I

    if-ne p1, p2, :cond_1

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p1

    iput-object p1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_1
    move p1, p3

    :goto_0
    return p1
.end method

.method public final read(Lۀۗ۱/ب;J)J
    .locals 4

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_3

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_1

    const-wide/16 p1, -0x1

    goto :goto_1

    :cond_1
    cmp-long v0, p2, v2

    if-lez v0, :cond_2

    move-wide p2, v2

    :cond_2
    invoke-virtual {p1, p0, p2, p3}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    move-wide p1, p2

    :goto_1
    return-wide p1

    :cond_3
    const-string p1, "byteCount < 0: "

    invoke-static {p1, p2, p3}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final readByte()B
    .locals 8

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    iget v2, v0, Lۀۗ۱/ط;->ء:I

    add-int/lit8 v3, v1, 0x1

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v1, v4, v1

    iget-wide v4, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lۀۗ۱/ب;->أ:J

    if-ne v3, v2, :cond_0

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v2

    iput-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_0

    :cond_0
    iput v3, v0, Lۀۗ۱/ط;->ؠ:I

    :goto_0
    return v1

    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final readFully([B)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-virtual {p0, p1, v0, v1}, Lۀۗ۱/ب;->read([BII)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_1
    return-void
.end method

.method public final readInt()I
    .locals 8

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    sub-int v5, v4, v1

    int-to-long v5, v5

    cmp-long v5, v5, v2

    if-gez v5, :cond_0

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v1, 0x1

    iget-object v6, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v1, v6, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v7, v5, 0x1

    aget-byte v5, v6, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v1, v5

    add-int/lit8 v5, v7, 0x1

    aget-byte v7, v6, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v1, v7

    add-int/lit8 v7, v5, 0x1

    aget-byte v5, v6, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v1, v5

    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v5, v2

    iput-wide v5, p0, Lۀۗ۱/ب;->أ:J

    if-ne v7, v4, :cond_1

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v2

    iput-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_0

    :cond_1
    iput v7, v0, Lۀۗ۱/ط;->ؠ:I

    :goto_0
    move v0, v1

    :goto_1
    return v0

    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final readLong()J
    .locals 14

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x8

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    sub-int v5, v4, v1

    int-to-long v5, v5

    cmp-long v5, v5, v2

    const/16 v6, 0x20

    if-gez v5, :cond_0

    invoke-virtual {p0}, Lۀۗ۱/ب;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    shl-long/2addr v0, v6

    invoke-virtual {p0}, Lۀۗ۱/ب;->readInt()I

    move-result v4

    int-to-long v4, v4

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v1, 0x1

    iget-object v7, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v1, v7, v1

    int-to-long v8, v1

    const-wide/16 v10, 0xff

    and-long/2addr v8, v10

    const/16 v1, 0x38

    shl-long/2addr v8, v1

    add-int/lit8 v1, v5, 0x1

    aget-byte v5, v7, v5

    int-to-long v12, v5

    and-long/2addr v12, v10

    const/16 v5, 0x30

    shl-long/2addr v12, v5

    or-long/2addr v8, v12

    add-int/lit8 v5, v1, 0x1

    aget-byte v1, v7, v1

    int-to-long v12, v1

    and-long/2addr v12, v10

    const/16 v1, 0x28

    shl-long/2addr v12, v1

    or-long/2addr v8, v12

    add-int/lit8 v1, v5, 0x1

    aget-byte v5, v7, v5

    int-to-long v12, v5

    and-long/2addr v12, v10

    shl-long v5, v12, v6

    or-long/2addr v5, v8

    add-int/lit8 v8, v1, 0x1

    aget-byte v1, v7, v1

    int-to-long v12, v1

    and-long/2addr v12, v10

    const/16 v1, 0x18

    shl-long/2addr v12, v1

    or-long/2addr v5, v12

    add-int/lit8 v1, v8, 0x1

    aget-byte v8, v7, v8

    int-to-long v8, v8

    and-long/2addr v8, v10

    const/16 v12, 0x10

    shl-long/2addr v8, v12

    or-long/2addr v5, v8

    add-int/lit8 v8, v1, 0x1

    aget-byte v1, v7, v1

    int-to-long v12, v1

    and-long/2addr v12, v10

    const/16 v1, 0x8

    shl-long/2addr v12, v1

    or-long/2addr v5, v12

    add-int/lit8 v1, v8, 0x1

    aget-byte v7, v7, v8

    int-to-long v7, v7

    and-long/2addr v7, v10

    or-long/2addr v5, v7

    iget-wide v7, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v7, v2

    iput-wide v7, p0, Lۀۗ۱/ب;->أ:J

    if-ne v1, v4, :cond_1

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v1

    iput-object v1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_0

    :cond_1
    iput v1, v0, Lۀۗ۱/ط;->ؠ:I

    :goto_0
    move-wide v0, v5

    :goto_1
    return-wide v0

    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final readShort()S
    .locals 8

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    sub-int v5, v4, v1

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v1, 0x1

    iget-object v6, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v1, v6, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v7, v5, 0x1

    aget-byte v5, v6, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v1, v5

    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v5, v2

    iput-wide v5, p0, Lۀۗ۱/ب;->أ:J

    if-ne v7, v4, :cond_1

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v2

    iput-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_0

    :cond_1
    iput v7, v0, Lۀۗ۱/ط;->ؠ:I

    :goto_0
    int-to-short v0, v1

    :goto_1
    return v0

    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final skip(J)V
    .locals 6

    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-eqz v0, :cond_1

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr p1, v4

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr v2, v1

    iput v2, v0, Lۀۗ۱/ط;->ؠ:I

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    if-ne v2, v1, :cond_0

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v1

    iput-object v1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_2
    return-void
.end method

.method public final timeout()Lۀۗ۱/ؿ;
    .locals 1

    sget-object v0, Lۀۗ۱/ؿ;->NONE:Lۀۗ۱/ؿ;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->م(I)Lۀۗ۱/ث;

    move-result-object v0

    invoke-virtual {v0}, Lۀۗ۱/ث;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "size > Int.MAX_VALUE: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final write(Ljava/nio/ByteBuffer;)I
    .locals 6

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    move v1, v0

    :goto_0
    if-lez v1, :cond_0

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v2

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget-object v4, v2, Lۀۗ۱/ط;->؋:[B

    iget v5, v2, Lۀۗ۱/ط;->ء:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr v1, v3

    iget v4, v2, Lۀۗ۱/ط;->ء:I

    add-int/2addr v4, v3

    iput v4, v2, Lۀۗ۱/ط;->ء:I

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lۀۗ۱/ب;->أ:J

    return v0
.end method

.method public final write(Lۀۗ۱/ب;J)V
    .locals 9

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, p0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_f

    iget-wide v3, p1, Lۀۗ۱/ب;->أ:J

    const-wide/16 v5, 0x0

    move-wide v7, p2

    invoke-static/range {v3 .. v8}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    :goto_1
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-lez v2, :cond_e

    iget-object v2, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v2, v2, Lۀۗ۱/ط;->ء:I

    iget-object v3, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v3, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    cmp-long v2, p2, v2

    if-gez v2, :cond_7

    iget-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-eqz v2, :cond_1

    iget-object v2, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    goto :goto_2

    :cond_1
    const/4 v2, 0x0

    :goto_2
    if-eqz v2, :cond_3

    iget-boolean v3, v2, Lۀۗ۱/ط;->أ:Z

    if-eqz v3, :cond_3

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    int-to-long v3, v3

    add-long/2addr v3, p2

    iget-boolean v5, v2, Lۀۗ۱/ط;->آ:Z

    if-eqz v5, :cond_2

    move v5, v1

    goto :goto_3

    :cond_2
    iget v5, v2, Lۀۗ۱/ط;->ؠ:I

    :goto_3
    int-to-long v5, v5

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x2000

    cmp-long v3, v3, v5

    if-gtz v3, :cond_3

    iget-object v0, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    long-to-int v1, p2

    invoke-virtual {v0, v2, v1}, Lۀۗ۱/ط;->آ(Lۀۗ۱/ط;I)V

    iget-wide v0, p1, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v0, p2

    iput-wide v0, p1, Lۀۗ۱/ب;->أ:J

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lۀۗ۱/ب;->أ:J

    goto/16 :goto_a

    :cond_3
    iget-object v2, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    long-to-int v3, p2

    if-lez v3, :cond_4

    iget v4, v2, Lۀۗ۱/ط;->ء:I

    iget v5, v2, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v4, v5

    if-gt v3, v4, :cond_4

    move v4, v0

    goto :goto_4

    :cond_4
    move v4, v1

    :goto_4
    if-eqz v4, :cond_6

    const/16 v4, 0x400

    if-lt v3, v4, :cond_5

    invoke-virtual {v2}, Lۀۗ۱/ط;->ء()Lۀۗ۱/ط;

    move-result-object v4

    goto :goto_5

    :cond_5
    invoke-static {}, Lۀۗ۱/ظ;->ؠ()Lۀۗ۱/ط;

    move-result-object v4

    iget v5, v2, Lۀۗ۱/ط;->ؠ:I

    add-int v6, v5, v3

    iget-object v7, v2, Lۀۗ۱/ط;->؋:[B

    iget-object v8, v4, Lۀۗ۱/ط;->؋:[B

    invoke-static {v1, v5, v6, v7, v8}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    :goto_5
    iget v5, v4, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr v5, v3

    iput v5, v4, Lۀۗ۱/ط;->ء:I

    iget v5, v2, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr v5, v3

    iput v5, v2, Lۀۗ۱/ط;->ؠ:I

    iget-object v2, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v2, v4}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    iput-object v4, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    goto :goto_6

    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "byteCount out of range"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    :goto_6
    iget-object v2, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    iget v4, v2, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    invoke-virtual {v2}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v5

    iput-object v5, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    iget-object v5, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v5, :cond_8

    iput-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    iput-object v2, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v2, v2, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_9

    :cond_8
    iget-object v5, v5, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v5}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v5, v2}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    iget-object v5, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    if-eq v5, v2, :cond_9

    move v6, v0

    goto :goto_7

    :cond_9
    move v6, v1

    :goto_7
    if-eqz v6, :cond_d

    invoke-static {v5}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-boolean v5, v5, Lۀۗ۱/ط;->أ:Z

    if-nez v5, :cond_a

    goto :goto_9

    :cond_a
    iget v5, v2, Lۀۗ۱/ط;->ء:I

    iget v6, v2, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v6

    iget-object v6, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v6}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v6, v6, Lۀۗ۱/ط;->ء:I

    rsub-int v6, v6, 0x2000

    iget-object v7, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v7}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-boolean v7, v7, Lۀۗ۱/ط;->آ:Z

    if-eqz v7, :cond_b

    move v7, v1

    goto :goto_8

    :cond_b
    iget-object v7, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v7}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v7, v7, Lۀۗ۱/ط;->ؠ:I

    :goto_8
    add-int/2addr v6, v7

    if-le v5, v6, :cond_c

    goto :goto_9

    :cond_c
    iget-object v6, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v6}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v2, v6, v5}, Lۀۗ۱/ط;->آ(Lۀۗ۱/ط;I)V

    invoke-virtual {v2}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    invoke-static {v2}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :goto_9
    iget-wide v5, p1, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v5, v3

    iput-wide v5, p1, Lۀۗ۱/ب;->أ:J

    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    add-long/2addr v5, v3

    iput-wide v5, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr p2, v3

    goto/16 :goto_1

    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "cannot compact"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_e
    :goto_a
    return-void

    :cond_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "source == this"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؋()V
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->skip(J)V

    return-void
.end method

.method public final ؠ()Lۀۗ۱/ب;
    .locals 0

    return-object p0
.end method

.method public final ء()Lۀۗ۱/ب;
    .locals 6

    new-instance v0, Lۀۗ۱/ب;

    invoke-direct {v0}, Lۀۗ۱/ب;-><init>()V

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lۀۗ۱/ط;->ء()Lۀۗ۱/ط;

    move-result-object v2

    iput-object v2, v0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    iput-object v2, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v2, v2, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iget-object v3, v1, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    :goto_0
    if-eq v3, v1, :cond_1

    iget-object v4, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v3}, Lۀۗ۱/ط;->ء()Lۀۗ۱/ط;

    move-result-object v5

    invoke-virtual {v4, v5}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    iget-object v3, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    iput-wide v1, v0, Lۀۗ۱/ب;->أ:J

    :goto_1
    return-object v0
.end method

.method public final bridge synthetic آ([BII)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lۀۗ۱/ب;->ى([BII)V

    return-object p0
.end method

.method public final bridge synthetic أ(J)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ب;->ٯ(J)Lۀۗ۱/ب;

    return-object p0
.end method

.method public final ؤ()Lۀۗ۱/ث;
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->إ(J)Lۀۗ۱/ث;

    move-result-object v0

    return-object v0
.end method

.method public final إ(J)Lۀۗ۱/ث;
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v0, v0, p1

    if-ltz v0, :cond_2

    const-wide/16 v0, 0x1000

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    long-to-int v0, p1

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->م(I)Lۀۗ۱/ث;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ب;->skip(J)V

    goto :goto_1

    :cond_1
    new-instance v0, Lۀۗ۱/ث;

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ب;->ق(J)[B

    move-result-object p1

    invoke-direct {v0, p1}, Lۀۗ۱/ث;-><init>([B)V

    :goto_1
    return-object v0

    :cond_2
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_3
    const-string v0, "byteCount: "

    invoke-static {v0, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ئ()Lۀۗ۱/ة;
    .locals 0

    return-object p0
.end method

.method public final bridge synthetic ا(I)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ٳ(I)V

    return-object p0
.end method

.method public final ب(J)Z
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    cmp-long p1, v0, p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final bridge synthetic ة(I)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ٱ(I)V

    return-object p0
.end method

.method public final ت()Ljava/lang/String;
    .locals 2

    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->ص(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ث()[B
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->ق(J)[B

    move-result-object v0

    return-object v0
.end method

.method public final ج()Z
    .locals 4

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final bridge synthetic ح(I)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ي(I)V

    return-object p0
.end method

.method public final خ(JLۀۗ۱/ث;)Z
    .locals 7

    const-string v0, "bytes"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p3}, Lۀۗ۱/ث;->ء()I

    move-result v0

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    const/4 v2, 0x0

    if-ltz v1, :cond_3

    if-ltz v0, :cond_3

    iget-wide v3, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v3, p1

    int-to-long v5, v0

    cmp-long v1, v3, v5

    if-ltz v1, :cond_3

    invoke-virtual {p3}, Lۀۗ۱/ث;->ء()I

    move-result v1

    sub-int/2addr v1, v2

    if-ge v1, v0, :cond_0

    goto :goto_1

    :cond_0
    move v1, v2

    :goto_0
    if-ge v1, v0, :cond_2

    int-to-long v3, v1

    add-long/2addr v3, p1

    invoke-virtual {p0, v3, v4}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v3

    add-int v4, v2, v1

    invoke-virtual {p3, v4}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v4

    if-eq v3, v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x1

    :cond_3
    :goto_1
    return v2
.end method

.method public final د(Lۀۗ۱/ؼ;)J
    .locals 6

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    :goto_0
    const-wide/16 v2, 0x2000

    invoke-interface {p1, p0, v2, v3}, Lۀۗ۱/ؼ;->read(Lۀۗ۱/ب;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    add-long/2addr v0, v2

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method public final ذ(Lۀۗ۱/س;)I
    .locals 3

    const-string v0, "options"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lہد٣ً؃ل/؋;->ء(Lۀۗ۱/ب;Lۀۗ۱/س;Z)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lۀۗ۱/س;->آ:[Lۀۗ۱/ث;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {p0, v1, v2}, Lۀۗ۱/ب;->skip(J)V

    :goto_0
    return v0
.end method

.method public final ر(JLۀۗ۱/ب;J)V
    .locals 7

    const-string v0, "out"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    move-wide v3, p1

    move-wide v5, p4

    invoke-static/range {v1 .. v6}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-nez v2, :cond_0

    goto :goto_3

    :cond_0
    iget-wide v2, p3, Lۀۗ۱/ب;->أ:J

    add-long/2addr v2, p4

    iput-wide v2, p3, Lۀۗ۱/ب;->أ:J

    iget-object v2, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    :goto_0
    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    iget v4, v2, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    cmp-long v5, p1, v3

    if-ltz v5, :cond_1

    sub-long/2addr p1, v3

    iget-object v2, v2, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_0

    :cond_1
    :goto_1
    cmp-long v3, p4, v0

    if-lez v3, :cond_3

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lۀۗ۱/ط;->ء()Lۀۗ۱/ط;

    move-result-object v3

    iget v4, v3, Lۀۗ۱/ط;->ؠ:I

    long-to-int p1, p1

    add-int/2addr v4, p1

    iput v4, v3, Lۀۗ۱/ط;->ؠ:I

    long-to-int p1, p4

    add-int/2addr v4, p1

    iget p1, v3, Lۀۗ۱/ط;->ء:I

    invoke-static {v4, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, v3, Lۀۗ۱/ط;->ء:I

    iget-object p1, p3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez p1, :cond_2

    iput-object v3, v3, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v3, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iput-object v3, p3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    goto :goto_2

    :cond_2
    iget-object p1, p1, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {p1, v3}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    :goto_2
    iget p1, v3, Lۀۗ۱/ط;->ء:I

    iget p2, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr p1, p2

    int-to-long p1, p1

    sub-long/2addr p4, p1

    iget-object v2, v2, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    move-wide p1, v0

    goto :goto_1

    :cond_3
    :goto_3
    return-void
.end method

.method public final bridge synthetic ز([B)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->و([B)V

    return-object p0
.end method

.method public final س()Lۀۗ۱/ة;
    .locals 0

    return-object p0
.end method

.method public final ش()J
    .locals 15

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    const-wide/16 v4, -0x7

    move v1, v0

    move v6, v1

    move v7, v6

    :cond_0
    iget-object v8, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v8}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v9, v8, Lۀۗ۱/ط;->ؠ:I

    iget v10, v8, Lۀۗ۱/ط;->ء:I

    :goto_0
    if-ge v9, v10, :cond_6

    iget-object v11, v8, Lۀۗ۱/ط;->؋:[B

    aget-byte v11, v11, v9

    const/16 v12, 0x30

    if-lt v11, v12, :cond_4

    const/16 v12, 0x39

    if-gt v11, v12, :cond_4

    rsub-int/lit8 v12, v11, 0x30

    const-wide v13, -0xcccccccccccccccL

    cmp-long v13, v2, v13

    if-ltz v13, :cond_2

    if-nez v13, :cond_1

    int-to-long v13, v12

    cmp-long v13, v13, v4

    if-gez v13, :cond_1

    goto :goto_1

    :cond_1
    const-wide/16 v13, 0xa

    mul-long/2addr v2, v13

    int-to-long v11, v12

    add-long/2addr v2, v11

    goto :goto_2

    :cond_2
    :goto_1
    new-instance v0, Lۀۗ۱/ب;

    invoke-direct {v0}, Lۀۗ۱/ب;-><init>()V

    invoke-virtual {v0, v2, v3}, Lۀۗ۱/ب;->ٮ(J)Lۀۗ۱/ب;

    invoke-virtual {v0, v11}, Lۀۗ۱/ب;->ي(I)V

    if-nez v6, :cond_3

    invoke-virtual {v0}, Lۀۗ۱/ب;->readByte()B

    :cond_3
    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-virtual {v0}, Lۀۗ۱/ب;->ل()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Number too large: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    const/16 v12, 0x2d

    if-ne v11, v12, :cond_5

    if-nez v1, :cond_5

    const-wide/16 v11, 0x1

    sub-long/2addr v4, v11

    const/4 v6, 0x1

    :goto_2
    add-int/lit8 v9, v9, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    const/4 v7, 0x1

    :cond_6
    if-ne v9, v10, :cond_7

    invoke-virtual {v8}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v9

    iput-object v9, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v8}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_3

    :cond_7
    iput v9, v8, Lۀۗ۱/ط;->ؠ:I

    :goto_3
    if-nez v7, :cond_8

    iget-object v8, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v8, :cond_0

    :cond_8
    iget-wide v4, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v7, v1

    sub-long/2addr v4, v7

    iput-wide v4, p0, Lۀۗ۱/ب;->أ:J

    const/4 v7, 0x2

    if-eqz v6, :cond_9

    move v8, v7

    goto :goto_4

    :cond_9
    const/4 v8, 0x1

    :goto_4
    if-ge v1, v8, :cond_c

    const-wide/16 v1, 0x0

    cmp-long v1, v4, v1

    if-eqz v1, :cond_b

    if-eqz v6, :cond_a

    const-string v1, "Expected a digit"

    goto :goto_5

    :cond_a
    const-string v1, "Expected a digit or \'-\'"

    :goto_5
    new-instance v2, Ljava/lang/NumberFormatException;

    const-string v3, " but was 0x"

    invoke-static {v1, v3}, Landroidx/activity/result/؋;->ت(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-wide/16 v3, 0x0

    invoke-virtual {p0, v3, v4}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v3

    new-array v4, v7, [C

    sget-object v5, Lڗًقڔ/؋;->ك:[C

    shr-int/lit8 v6, v3, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-char v6, v5, v6

    aput-char v6, v4, v0

    and-int/lit8 v0, v3, 0xf

    aget-char v0, v5, v0

    const/4 v3, 0x1

    aput-char v0, v4, v3

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_b
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_c
    if-eqz v6, :cond_d

    goto :goto_6

    :cond_d
    neg-long v2, v2

    :goto_6
    return-wide v2

    :cond_e
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final ص(J)Ljava/lang/String;
    .locals 11

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v2, p1, v0

    const-wide/16 v3, 0x1

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    add-long v0, p1, v3

    :goto_1
    const/16 v6, 0xa

    const-wide/16 v7, 0x0

    move-object v5, p0

    move-wide v9, v0

    invoke-virtual/range {v5 .. v10}, Lۀۗ۱/ب;->ؿ(BJJ)J

    move-result-wide v5

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-eqz v2, :cond_2

    invoke-static {p0, v5, v6}, Lہد٣ً؃ل/؋;->ؠ(Lۀۗ۱/ب;J)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_2
    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v2, v0, v5

    if-gez v2, :cond_3

    sub-long v2, v0, v3

    invoke-virtual {p0, v2, v3}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_3

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_3

    invoke-static {p0, v0, v1}, Lہد٣ً؃ل/؋;->ؠ(Lۀۗ۱/ب;J)Ljava/lang/String;

    move-result-object p1

    :goto_2
    return-object p1

    :cond_3
    new-instance v6, Lۀۗ۱/ب;

    invoke-direct {v6}, Lۀۗ۱/ب;-><init>()V

    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lۀۗ۱/ب;->أ:J

    const/16 v0, 0x20

    int-to-long v7, v0

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    move-object v0, p0

    move-object v3, v6

    invoke-virtual/range {v0 .. v5}, Lۀۗ۱/ب;->ر(JLۀۗ۱/ب;J)V

    new-instance v0, Ljava/io/EOFException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\\n not found: limit="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " content="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lۀۗ۱/ب;->ؤ()Lۀۗ۱/ث;

    move-result-object p1

    invoke-virtual {p1}, Lۀۗ۱/ث;->آ()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x2026

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const-string v0, "limit < 0: "

    invoke-static {v0, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final bridge synthetic ض(Lۀۗ۱/ث;)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ه(Lۀۗ۱/ث;)V

    return-object p0
.end method

.method public final ط(Lۀۗ۱/ب;J)V
    .locals 3

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v2, v0, p2

    if-ltz v2, :cond_0

    invoke-virtual {p1, p0, p2, p3}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    return-void

    :cond_0
    invoke-virtual {p1, p0, v0, v1}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public final ظ(J)V
    .locals 2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    cmp-long p1, v0, p1

    if-ltz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public final bridge synthetic ع(Ljava/lang/String;)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    return-object p0
.end method

.method public final bridge synthetic غ(J)Lۀۗ۱/ة;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ب;->ٮ(J)Lۀۗ۱/ب;

    return-object p0
.end method

.method public final ػ()J
    .locals 14

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    move v1, v0

    move v4, v1

    move-wide v5, v2

    :cond_0
    iget-object v7, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v7}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v8, v7, Lۀۗ۱/ط;->ؠ:I

    iget v9, v7, Lۀۗ۱/ط;->ء:I

    :goto_0
    if-ge v8, v9, :cond_6

    iget-object v10, v7, Lۀۗ۱/ط;->؋:[B

    aget-byte v10, v10, v8

    const/16 v11, 0x30

    if-lt v10, v11, :cond_1

    const/16 v11, 0x39

    if-gt v10, v11, :cond_1

    add-int/lit8 v11, v10, -0x30

    goto :goto_2

    :cond_1
    const/16 v11, 0x61

    if-lt v10, v11, :cond_2

    const/16 v11, 0x66

    if-gt v10, v11, :cond_2

    add-int/lit8 v11, v10, -0x61

    goto :goto_1

    :cond_2
    const/16 v11, 0x41

    if-lt v10, v11, :cond_4

    const/16 v11, 0x46

    if-gt v10, v11, :cond_4

    add-int/lit8 v11, v10, -0x41

    :goto_1
    add-int/lit8 v11, v11, 0xa

    :goto_2
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    and-long/2addr v12, v5

    cmp-long v12, v12, v2

    if-nez v12, :cond_3

    const/4 v10, 0x4

    shl-long/2addr v5, v10

    int-to-long v10, v11

    or-long/2addr v5, v10

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    new-instance v0, Lۀۗ۱/ب;

    invoke-direct {v0}, Lۀۗ۱/ب;-><init>()V

    invoke-virtual {v0, v5, v6}, Lۀۗ۱/ب;->ٯ(J)Lۀۗ۱/ب;

    invoke-virtual {v0, v10}, Lۀۗ۱/ب;->ي(I)V

    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-virtual {v0}, Lۀۗ۱/ب;->ل()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Number too large: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    const/4 v4, 0x1

    if-eqz v1, :cond_5

    goto :goto_3

    :cond_5
    new-instance v1, Ljava/lang/NumberFormatException;

    const/4 v2, 0x2

    new-array v2, v2, [C

    sget-object v3, Lڗًقڔ/؋;->ك:[C

    shr-int/lit8 v5, v10, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v5, v3, v5

    aput-char v5, v2, v0

    and-int/lit8 v0, v10, 0xf

    aget-char v0, v3, v0

    aput-char v0, v2, v4

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>([C)V

    const-string v2, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6
    :goto_3
    if-ne v8, v9, :cond_7

    invoke-virtual {v7}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v8

    iput-object v8, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v7}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    goto :goto_4

    :cond_7
    iput v8, v7, Lۀۗ۱/ط;->ؠ:I

    :goto_4
    if-nez v4, :cond_8

    iget-object v7, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v7, :cond_0

    :cond_8
    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v0, v1

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    return-wide v5

    :cond_9
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public final ؼ(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2

    const-string v0, "charset"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p0, v0, v1, p1}, Lۀۗ۱/ب;->ك(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final ؽ()Lۀۗ۱/ا;
    .locals 2

    new-instance v0, Lۀۗ۱/ا;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lۀۗ۱/ا;-><init>(Lۀۗ۱/ت;I)V

    return-object v0
.end method

.method public final ؾ(J)B
    .locals 7

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-eqz v0, :cond_3

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    sub-long v3, v1, p1

    cmp-long v3, v3, p1

    if-gez v3, :cond_1

    :goto_0
    cmp-long v3, v1, p1

    if-lez v3, :cond_0

    iget-object v0, v0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v1, v3

    goto :goto_0

    :cond_0
    iget v3, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v3, v3

    add-long/2addr v3, p1

    sub-long/2addr v3, v1

    long-to-int p1, v3

    iget-object p2, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte p1, p2, p1

    goto :goto_2

    :cond_1
    const-wide/16 v1, 0x0

    :goto_1
    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v5, v3

    add-long/2addr v5, v1

    cmp-long v3, v5, p1

    if-gtz v3, :cond_2

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v5

    goto :goto_1

    :cond_2
    int-to-long v3, v4

    add-long/2addr v3, p1

    sub-long/2addr v3, v1

    long-to-int p1, v3

    iget-object p2, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte p1, p2, p1

    :goto_2
    return p1

    :cond_3
    const/4 p1, 0x0

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    throw p1
.end method

.method public final ؿ(BJJ)J
    .locals 9

    const-wide/16 v0, 0x0

    cmp-long v2, v0, p2

    const/4 v3, 0x0

    if-gtz v2, :cond_0

    cmp-long v2, p2, p4

    if-gtz v2, :cond_0

    const/4 v3, 0x1

    :cond_0
    if-eqz v3, :cond_c

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v4, p4, v2

    if-lez v4, :cond_1

    move-wide p4, v2

    :cond_1
    cmp-long v4, p2, p4

    const-wide/16 v5, -0x1

    if-nez v4, :cond_2

    goto/16 :goto_6

    :cond_2
    iget-object v4, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v4, :cond_3

    goto/16 :goto_6

    :cond_3
    sub-long v7, v2, p2

    cmp-long v7, v7, p2

    if-gez v7, :cond_7

    :goto_0
    cmp-long v0, v2, p2

    if-lez v0, :cond_4

    iget-object v4, v4, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v0, v4, Lۀۗ۱/ط;->ء:I

    iget v1, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr v2, v0

    goto :goto_0

    :cond_4
    :goto_1
    cmp-long v0, v2, p4

    if-gez v0, :cond_b

    iget v0, v4, Lۀۗ۱/ط;->ء:I

    int-to-long v0, v0

    iget v7, v4, Lۀۗ۱/ط;->ؠ:I

    int-to-long v7, v7

    add-long/2addr v7, p4

    sub-long/2addr v7, v2

    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iget v1, v4, Lۀۗ۱/ط;->ؠ:I

    int-to-long v7, v1

    add-long/2addr v7, p2

    sub-long/2addr v7, v2

    long-to-int p2, v7

    :goto_2
    if-ge p2, v0, :cond_6

    iget-object p3, v4, Lۀۗ۱/ط;->؋:[B

    aget-byte p3, p3, p2

    if-ne p3, p1, :cond_5

    iget p1, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr p2, p1

    int-to-long p1, p2

    add-long v5, p1, v2

    goto :goto_6

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_6
    iget p2, v4, Lۀۗ۱/ط;->ء:I

    iget p3, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v2, p2

    iget-object v4, v4, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide p2, v2

    goto :goto_1

    :cond_7
    :goto_3
    iget v2, v4, Lۀۗ۱/ط;->ء:I

    iget v3, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v2, v0

    cmp-long v7, v2, p2

    if-gtz v7, :cond_8

    iget-object v4, v4, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v0, v2

    goto :goto_3

    :cond_8
    :goto_4
    cmp-long v2, v0, p4

    if-gez v2, :cond_b

    iget v2, v4, Lۀۗ۱/ط;->ء:I

    int-to-long v2, v2

    iget v7, v4, Lۀۗ۱/ط;->ؠ:I

    int-to-long v7, v7

    add-long/2addr v7, p4

    sub-long/2addr v7, v0

    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    iget v3, v4, Lۀۗ۱/ط;->ؠ:I

    int-to-long v7, v3

    add-long/2addr v7, p2

    sub-long/2addr v7, v0

    long-to-int p2, v7

    :goto_5
    if-ge p2, v2, :cond_a

    iget-object p3, v4, Lۀۗ۱/ط;->؋:[B

    aget-byte p3, p3, p2

    if-ne p3, p1, :cond_9

    iget p1, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr p2, p1

    int-to-long p1, p2

    add-long v5, p1, v0

    goto :goto_6

    :cond_9
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_a
    iget p2, v4, Lۀۗ۱/ط;->ء:I

    iget p3, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    iget-object v4, v4, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide p2, v0

    goto :goto_4

    :cond_b
    :goto_6
    return-wide v5

    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "size="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " fromIndex="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, " toIndex="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ـ(Lۀۗ۱/ث;)J
    .locals 11

    const-string v0, "targetBytes"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v0, :cond_0

    goto/16 :goto_e

    :cond_0
    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    sub-long v5, v1, v3

    cmp-long v5, v5, v3

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x2

    if-gez v5, :cond_9

    :goto_0
    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    iget-object v0, v0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v5, v0, Lۀۗ۱/ط;->ء:I

    iget v9, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v9

    int-to-long v9, v5

    sub-long/2addr v1, v9

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result v5

    if-ne v5, v8, :cond_4

    invoke-virtual {p1, v7}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v5

    invoke-virtual {p1, v6}, Lۀۗ۱/ث;->ؤ(I)B

    move-result p1

    :goto_1
    iget-wide v6, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v6, v1, v6

    if-gez v6, :cond_11

    iget v6, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v6, v6

    add-long/2addr v6, v3

    sub-long/2addr v6, v1

    long-to-int v3, v6

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    :goto_2
    if-ge v3, v4, :cond_3

    iget-object v6, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v6, v6, v3

    if-eq v6, v5, :cond_5

    if-ne v6, p1, :cond_2

    goto :goto_6

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v3

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lۀۗ۱/ث;->أ()[B

    move-result-object p1

    :goto_3
    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v5, v1, v5

    if-gez v5, :cond_11

    iget v5, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v5, v5

    add-long/2addr v5, v3

    sub-long/2addr v5, v1

    long-to-int v3, v5

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    :goto_4
    if-ge v3, v4, :cond_8

    iget-object v5, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v5, v5, v3

    array-length v6, p1

    move v8, v7

    :goto_5
    if-ge v8, v6, :cond_7

    aget-byte v9, p1, v8

    if-ne v5, v9, :cond_6

    :cond_5
    :goto_6
    iget p1, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, p1

    int-to-long v3, v3

    add-long/2addr v3, v1

    goto/16 :goto_f

    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_8
    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v3

    goto :goto_3

    :cond_9
    move-wide v1, v3

    :goto_7
    iget v5, v0, Lۀۗ۱/ط;->ء:I

    iget v9, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v9

    int-to-long v9, v5

    add-long/2addr v9, v1

    cmp-long v5, v9, v3

    if-gtz v5, :cond_a

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v9

    goto :goto_7

    :cond_a
    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result v5

    if-ne v5, v8, :cond_d

    invoke-virtual {p1, v7}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v5

    invoke-virtual {p1, v6}, Lۀۗ۱/ث;->ؤ(I)B

    move-result p1

    :goto_8
    iget-wide v6, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v6, v1, v6

    if-gez v6, :cond_11

    iget v6, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v6, v6

    add-long/2addr v6, v3

    sub-long/2addr v6, v1

    long-to-int v3, v6

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    :goto_9
    if-ge v3, v4, :cond_c

    iget-object v6, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v6, v6, v3

    if-eq v6, v5, :cond_5

    if-ne v6, p1, :cond_b

    goto :goto_d

    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_c
    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v3

    goto :goto_8

    :cond_d
    invoke-virtual {p1}, Lۀۗ۱/ث;->أ()[B

    move-result-object p1

    :goto_a
    iget-wide v5, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v5, v1, v5

    if-gez v5, :cond_11

    iget v5, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v5, v5

    add-long/2addr v5, v3

    sub-long/2addr v5, v1

    long-to-int v3, v5

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    :goto_b
    if-ge v3, v4, :cond_10

    iget-object v5, v0, Lۀۗ۱/ط;->؋:[B

    aget-byte v5, v5, v3

    array-length v6, p1

    move v8, v7

    :goto_c
    if-ge v8, v6, :cond_f

    aget-byte v9, p1, v8

    if-ne v5, v9, :cond_e

    :goto_d
    goto/16 :goto_6

    :cond_e
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_10
    iget v3, v0, Lۀۗ۱/ط;->ء:I

    iget v4, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v1, v3

    goto :goto_a

    :cond_11
    :goto_e
    const-wide/16 v3, -0x1

    :goto_f
    return-wide v3
.end method

.method public final ف(Lۀۗ۱/ئ;)Lۀۗ۱/ئ;
    .locals 2

    const-string v0, "unsafeCursor"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lہد٣ً؃ل/؋;->؋:[B

    sget-object v0, Lڃٷښـ۝ۼ/ؠ;->ج:Lۀۗ۱/ئ;

    if-ne p1, v0, :cond_0

    new-instance p1, Lۀۗ۱/ئ;

    invoke-direct {p1}, Lۀۗ۱/ئ;-><init>()V

    :cond_0
    iget-object v0, p1, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    const/4 v1, 0x1

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    iput-object p0, p1, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    iput-boolean v1, p1, Lۀۗ۱/ئ;->أ:Z

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "already attached to a buffer"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ق(J)[B
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v0, v0, p1

    if-ltz v0, :cond_1

    long-to-int p1, p1

    new-array p1, p1, [B

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->readFully([B)V

    return-object p1

    :cond_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_2
    const-string v0, "byteCount: "

    invoke-static {v0, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ك(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6

    const-string v0, "charset"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p1, v1

    if-gtz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_5

    iget-wide v1, p0, Lۀۗ۱/ب;->أ:J

    cmp-long v1, v1, p1

    if-ltz v1, :cond_4

    if-nez v0, :cond_1

    const-string p1, ""

    return-object p1

    :cond_1
    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ؠ:I

    int-to-long v2, v1

    add-long/2addr v2, p1

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lۀۗ۱/ب;->ق(J)[B

    move-result-object p1

    invoke-direct {v0, p1, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    :cond_2
    new-instance v2, Ljava/lang/String;

    long-to-int v3, p1

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    invoke-direct {v2, v4, v1, v3, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    iget p3, v0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr p3, v3

    iput p3, v0, Lۀۗ۱/ط;->ؠ:I

    iget-wide v3, p0, Lۀۗ۱/ب;->أ:J

    sub-long/2addr v3, p1

    iput-wide v3, p0, Lۀۗ۱/ب;->أ:J

    iget p1, v0, Lۀۗ۱/ط;->ء:I

    if-ne p3, p1, :cond_3

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p1

    iput-object p1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_3
    return-object v2

    :cond_4
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_5
    const-string p3, "byteCount: "

    invoke-static {p3, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ل()Ljava/lang/String;
    .locals 3

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    sget-object v2, Lڹےف/؋;->؋:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ب;->ك(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final م(I)Lۀۗ۱/ث;
    .locals 8

    if-nez p1, :cond_0

    sget-object p1, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    goto :goto_2

    :cond_0
    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    int-to-long v4, p1

    invoke-static/range {v0 .. v5}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    iget-object v0, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, p1, :cond_2

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v4, v0, Lۀۗ۱/ط;->ء:I

    iget v5, v0, Lۀۗ۱/ط;->ؠ:I

    if-eq v4, v5, :cond_1

    sub-int/2addr v4, v5

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    const-string v0, "s.limit == s.pos"

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :cond_2
    new-array v0, v3, [[B

    mul-int/lit8 v2, v3, 0x2

    new-array v2, v2, [I

    iget-object v4, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    move-object v5, v4

    move v4, v1

    :goto_1
    if-ge v1, p1, :cond_3

    invoke-static {v5}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v6, v5, Lۀۗ۱/ط;->؋:[B

    aput-object v6, v0, v4

    iget v6, v5, Lۀۗ۱/ط;->ء:I

    iget v7, v5, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v6, v7

    add-int/2addr v1, v6

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result v6

    aput v6, v2, v4

    add-int v6, v4, v3

    iget v7, v5, Lۀۗ۱/ط;->ؠ:I

    aput v7, v2, v6

    const/4 v6, 0x1

    iput-boolean v6, v5, Lۀۗ۱/ط;->آ:Z

    add-int/2addr v4, v6

    iget-object v5, v5, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_1

    :cond_3
    new-instance p1, Lۀۗ۱/ع;

    invoke-direct {p1, v0, v2}, Lۀۗ۱/ع;-><init>([[B[I)V

    :goto_2
    return-object p1
.end method

.method public final ن(I)Lۀۗ۱/ط;
    .locals 3

    const/16 v0, 0x2000

    const/4 v1, 0x1

    if-lt p1, v1, :cond_0

    if-gt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_4

    iget-object v1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-nez v1, :cond_1

    invoke-static {}, Lۀۗ۱/ظ;->ؠ()Lۀۗ۱/ط;

    move-result-object p1

    iput-object p1, p0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    iput-object p1, p1, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object p1, p1, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    goto :goto_2

    :cond_1
    iget-object v1, v1, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v2, v1, Lۀۗ۱/ط;->ء:I

    add-int/2addr v2, p1

    if-gt v2, v0, :cond_3

    iget-boolean p1, v1, Lۀۗ۱/ط;->أ:Z

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    move-object p1, v1

    goto :goto_2

    :cond_3
    :goto_1
    invoke-static {}, Lۀۗ۱/ظ;->ؠ()Lۀۗ۱/ط;

    move-result-object p1

    invoke-virtual {v1, p1}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    :goto_2
    return-object p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "unexpected capacity"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ه(Lۀۗ۱/ث;)V
    .locals 1

    const-string v0, "byteString"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result v0

    invoke-virtual {p1, p0, v0}, Lۀۗ۱/ث;->ث(Lۀۗ۱/ب;I)V

    return-void
.end method

.method public final و([B)V
    .locals 2

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lۀۗ۱/ب;->ى([BII)V

    return-void
.end method

.method public final ى([BII)V
    .locals 9

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v7, p3

    move-wide v5, v7

    invoke-static/range {v1 .. v6}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    add-int/2addr p3, p2

    :goto_0
    if-ge p2, p3, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v0

    sub-int v1, p3, p2

    iget v2, v0, Lۀۗ۱/ط;->ء:I

    rsub-int v2, v2, 0x2000

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget v2, v0, Lۀۗ۱/ط;->ء:I

    add-int v3, p2, v1

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    invoke-static {v2, p2, v3, p1, v4}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    iget p2, v0, Lۀۗ۱/ط;->ء:I

    add-int/2addr p2, v1

    iput p2, v0, Lۀۗ۱/ط;->ء:I

    move p2, v3

    goto :goto_0

    :cond_0
    iget-wide p1, p0, Lۀۗ۱/ب;->أ:J

    add-long/2addr p1, v7

    iput-wide p1, p0, Lۀۗ۱/ب;->أ:J

    return-void
.end method

.method public final ي(I)V
    .locals 4

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v0

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lۀۗ۱/ط;->ء:I

    int-to-byte p1, p1

    iget-object v0, v0, Lۀۗ۱/ط;->؋:[B

    aput-byte p1, v0, v1

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lۀۗ۱/ب;->أ:J

    return-void
.end method

.method public final ٮ(J)Lۀۗ۱/ب;
    .locals 13

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    const/16 p1, 0x30

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ي(I)V

    goto/16 :goto_3

    :cond_0
    const/4 v3, 0x1

    if-gez v2, :cond_2

    neg-long p1, p1

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    const-string p1, "-9223372036854775808"

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    const-wide/32 v4, 0x5f5e100

    cmp-long v4, p1, v4

    const/16 v5, 0xa

    if-gez v4, :cond_a

    const-wide/16 v6, 0x2710

    cmp-long v4, p1, v6

    if-gez v4, :cond_6

    const-wide/16 v6, 0x64

    cmp-long v4, p1, v6

    if-gez v4, :cond_4

    const-wide/16 v6, 0xa

    cmp-long v4, p1, v6

    if-gez v4, :cond_3

    goto/16 :goto_1

    :cond_3
    const/4 v3, 0x2

    goto/16 :goto_1

    :cond_4
    const-wide/16 v3, 0x3e8

    cmp-long v3, p1, v3

    if-gez v3, :cond_5

    const/4 v3, 0x3

    goto/16 :goto_1

    :cond_5
    const/4 v3, 0x4

    goto/16 :goto_1

    :cond_6
    const-wide/32 v3, 0xf4240

    cmp-long v3, p1, v3

    if-gez v3, :cond_8

    const-wide/32 v3, 0x186a0

    cmp-long v3, p1, v3

    if-gez v3, :cond_7

    const/4 v3, 0x5

    goto/16 :goto_1

    :cond_7
    const/4 v3, 0x6

    goto/16 :goto_1

    :cond_8
    const-wide/32 v3, 0x989680

    cmp-long v3, p1, v3

    if-gez v3, :cond_9

    const/4 v3, 0x7

    goto/16 :goto_1

    :cond_9
    const/16 v3, 0x8

    goto/16 :goto_1

    :cond_a
    const-wide v3, 0xe8d4a51000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_e

    const-wide v3, 0x2540be400L

    cmp-long v3, p1, v3

    if-gez v3, :cond_c

    const-wide/32 v3, 0x3b9aca00

    cmp-long v3, p1, v3

    if-gez v3, :cond_b

    const/16 v3, 0x9

    goto :goto_1

    :cond_b
    move v3, v5

    goto :goto_1

    :cond_c
    const-wide v3, 0x174876e800L

    cmp-long v3, p1, v3

    if-gez v3, :cond_d

    const/16 v3, 0xb

    goto :goto_1

    :cond_d
    const/16 v3, 0xc

    goto :goto_1

    :cond_e
    const-wide v3, 0x38d7ea4c68000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_11

    const-wide v3, 0x9184e72a000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_f

    const/16 v3, 0xd

    goto :goto_1

    :cond_f
    const-wide v3, 0x5af3107a4000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_10

    const/16 v3, 0xe

    goto :goto_1

    :cond_10
    const/16 v3, 0xf

    goto :goto_1

    :cond_11
    const-wide v3, 0x16345785d8a0000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_13

    const-wide v3, 0x2386f26fc10000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_12

    const/16 v3, 0x10

    goto :goto_1

    :cond_12
    const/16 v3, 0x11

    goto :goto_1

    :cond_13
    const-wide v3, 0xde0b6b3a7640000L

    cmp-long v3, p1, v3

    if-gez v3, :cond_14

    const/16 v3, 0x12

    goto :goto_1

    :cond_14
    const/16 v3, 0x13

    :goto_1
    if-eqz v2, :cond_15

    add-int/lit8 v3, v3, 0x1

    :cond_15
    invoke-virtual {p0, v3}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v4

    iget v6, v4, Lۀۗ۱/ط;->ء:I

    add-int/2addr v6, v3

    :goto_2
    cmp-long v7, p1, v0

    iget-object v8, v4, Lۀۗ۱/ط;->؋:[B

    if-eqz v7, :cond_16

    int-to-long v9, v5

    rem-long v11, p1, v9

    long-to-int v7, v11

    add-int/lit8 v6, v6, -0x1

    sget-object v11, Lہد٣ً؃ل/؋;->؋:[B

    aget-byte v7, v11, v7

    aput-byte v7, v8, v6

    div-long/2addr p1, v9

    goto :goto_2

    :cond_16
    if-eqz v2, :cond_17

    add-int/lit8 v6, v6, -0x1

    const/16 p1, 0x2d

    aput-byte p1, v8, v6

    :cond_17
    iget p1, v4, Lۀۗ۱/ط;->ء:I

    add-int/2addr p1, v3

    iput p1, v4, Lۀۗ۱/ط;->ء:I

    iget-wide p1, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v0, v3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lۀۗ۱/ب;->أ:J

    :goto_3
    return-object p0
.end method

.method public final ٯ(J)Lۀۗ۱/ب;
    .locals 12

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    const/16 p1, 0x30

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ي(I)V

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    ushr-long v1, p1, v0

    or-long/2addr v1, p1

    const/4 v3, 0x2

    ushr-long v4, v1, v3

    or-long/2addr v1, v4

    const/4 v4, 0x4

    ushr-long v5, v1, v4

    or-long/2addr v1, v5

    const/16 v5, 0x8

    ushr-long v6, v1, v5

    or-long/2addr v1, v6

    const/16 v6, 0x10

    ushr-long v7, v1, v6

    or-long/2addr v1, v7

    const/16 v7, 0x20

    ushr-long v8, v1, v7

    or-long/2addr v1, v8

    ushr-long v8, v1, v0

    const-wide v10, 0x5555555555555555L    # 1.1945305291614955E103

    and-long/2addr v8, v10

    sub-long/2addr v1, v8

    ushr-long v8, v1, v3

    const-wide v10, 0x3333333333333333L    # 4.667261458395856E-62

    and-long/2addr v8, v10

    and-long/2addr v1, v10

    add-long/2addr v8, v1

    ushr-long v1, v8, v4

    add-long/2addr v1, v8

    const-wide v8, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    and-long/2addr v1, v8

    ushr-long v8, v1, v5

    add-long/2addr v1, v8

    ushr-long v5, v1, v6

    add-long/2addr v1, v5

    const-wide/16 v5, 0x3f

    and-long v8, v1, v5

    ushr-long/2addr v1, v7

    and-long/2addr v1, v5

    add-long/2addr v8, v1

    const/4 v1, 0x3

    int-to-long v1, v1

    add-long/2addr v8, v1

    int-to-long v1, v4

    div-long/2addr v8, v1

    long-to-int v1, v8

    invoke-virtual {p0, v1}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v2

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    add-int v5, v3, v1

    sub-int/2addr v5, v0

    :goto_0
    if-lt v5, v3, :cond_1

    sget-object v0, Lہد٣ً؃ل/؋;->؋:[B

    const-wide/16 v6, 0xf

    and-long/2addr v6, p1

    long-to-int v6, v6

    aget-byte v0, v0, v6

    iget-object v6, v2, Lۀۗ۱/ط;->؋:[B

    aput-byte v0, v6, v5

    ushr-long/2addr p1, v4

    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    :cond_1
    iget p1, v2, Lۀۗ۱/ط;->ء:I

    add-int/2addr p1, v1

    iput p1, v2, Lۀۗ۱/ط;->ء:I

    iget-wide p1, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v0, v1

    add-long/2addr p1, v0

    iput-wide p1, p0, Lۀۗ۱/ب;->أ:J

    :goto_1
    return-object p0
.end method

.method public final ٱ(I)V
    .locals 5

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v0

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v3, p1, 0x18

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    aput-byte v3, v4, v1

    add-int/lit8 v1, v2, 0x1

    ushr-int/lit8 v3, p1, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v4, v2

    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v3, p1, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v4, v1

    add-int/lit8 v1, v2, 0x1

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    aput-byte p1, v4, v2

    iput v1, v0, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lۀۗ۱/ب;->أ:J

    return-void
.end method

.method public final ٲ(J)V
    .locals 10

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v1

    iget v2, v1, Lۀۗ۱/ط;->ء:I

    add-int/lit8 v3, v2, 0x1

    const/16 v4, 0x38

    ushr-long v4, p1, v4

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    iget-object v5, v1, Lۀۗ۱/ط;->؋:[B

    aput-byte v4, v5, v2

    add-int/lit8 v2, v3, 0x1

    const/16 v4, 0x30

    ushr-long v8, p1, v4

    and-long/2addr v8, v6

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v5, v3

    add-int/lit8 v3, v2, 0x1

    const/16 v4, 0x28

    ushr-long v8, p1, v4

    and-long/2addr v8, v6

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v5, v2

    add-int/lit8 v2, v3, 0x1

    const/16 v4, 0x20

    ushr-long v8, p1, v4

    and-long/2addr v8, v6

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v5, v3

    add-int/lit8 v3, v2, 0x1

    const/16 v4, 0x18

    ushr-long v8, p1, v4

    and-long/2addr v8, v6

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v5, v2

    add-int/lit8 v2, v3, 0x1

    const/16 v4, 0x10

    ushr-long v8, p1, v4

    and-long/2addr v8, v6

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v5, v3

    add-int/lit8 v3, v2, 0x1

    ushr-long v8, p1, v0

    and-long/2addr v8, v6

    long-to-int v0, v8

    int-to-byte v0, v0

    aput-byte v0, v5, v2

    add-int/lit8 v0, v3, 0x1

    and-long/2addr p1, v6

    long-to-int p1, p1

    int-to-byte p1, p1

    aput-byte p1, v5, v3

    iput v0, v1, Lۀۗ۱/ط;->ء:I

    iget-wide p1, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v0, 0x8

    add-long/2addr p1, v0

    iput-wide p1, p0, Lۀۗ۱/ب;->أ:J

    return-void
.end method

.method public final ٳ(I)V
    .locals 5

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v0

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v3, p1, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    aput-byte v3, v4, v1

    add-int/lit8 v1, v2, 0x1

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    aput-byte p1, v4, v2

    iput v1, v0, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lۀۗ۱/ب;->أ:J

    return-void
.end method

.method public final ٴ(Ljava/lang/String;IILjava/nio/charset/Charset;)Lۀۗ۱/ب;
    .locals 3

    const-string v0, "string"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p4, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_6

    if-lt p3, p2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    if-eqz v2, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gt p3, v2, :cond_2

    goto :goto_2

    :cond_2
    move v0, v1

    :goto_2
    if-eqz v0, :cond_4

    sget-object v0, Lڹےف/؋;->؋:Ljava/nio/charset/Charset;

    invoke-static {p4, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0, p1, p2, p3}, Lۀۗ۱/ب;->ٶ(Ljava/lang/String;II)V

    return-object p0

    :cond_3
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p2, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    invoke-static {p1, p2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const-string p2, "this as java.lang.String).getBytes(charset)"

    invoke-static {p1, p2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    array-length p2, p1

    invoke-virtual {p0, p1, v1, p2}, Lۀۗ۱/ب;->ى([BII)V

    return-object p0

    :cond_4
    const-string p2, "endIndex > string.length: "

    const-string p4, " > "

    invoke-static {p2, p3, p4}, Landroidx/activity/result/؋;->ة(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "endIndex < beginIndex: "

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " < "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_6
    const-string p1, "beginIndex < 0: "

    invoke-static {p1, p2}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ٵ(Ljava/lang/String;)V
    .locals 2

    const-string v0, "string"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lۀۗ۱/ب;->ٶ(Ljava/lang/String;II)V

    return-void
.end method

.method public final ٶ(Ljava/lang/String;II)V
    .locals 11

    const-string v0, "string"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ltz p2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    if-eqz v2, :cond_f

    if-lt p3, p2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_1
    if-eqz v2, :cond_e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gt p3, v2, :cond_2

    move v2, v1

    goto :goto_2

    :cond_2
    move v2, v0

    :goto_2
    if-eqz v2, :cond_d

    :goto_3
    if-ge p2, p3, :cond_c

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x80

    if-ge v2, v3, :cond_4

    invoke-virtual {p0, v1}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v4

    iget v5, v4, Lۀۗ۱/ط;->ء:I

    sub-int/2addr v5, p2

    rsub-int v6, v5, 0x2000

    invoke-static {p3, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    add-int/lit8 v7, p2, 0x1

    add-int/2addr p2, v5

    int-to-byte v2, v2

    iget-object v8, v4, Lۀۗ۱/ط;->؋:[B

    aput-byte v2, v8, p2

    :goto_4
    move p2, v7

    if-ge p2, v6, :cond_3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ge v2, v3, :cond_3

    add-int/lit8 v7, p2, 0x1

    add-int/2addr p2, v5

    int-to-byte v2, v2

    aput-byte v2, v8, p2

    goto :goto_4

    :cond_3
    add-int/2addr v5, p2

    iget v2, v4, Lۀۗ۱/ط;->ء:I

    sub-int/2addr v5, v2

    add-int/2addr v2, v5

    iput v2, v4, Lۀۗ۱/ط;->ء:I

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    int-to-long v4, v5

    add-long/2addr v2, v4

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    goto :goto_3

    :cond_4
    const/16 v4, 0x800

    if-ge v2, v4, :cond_5

    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v5

    iget v6, v5, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v7, v2, 0x6

    or-int/lit16 v7, v7, 0xc0

    int-to-byte v7, v7

    iget-object v8, v5, Lۀۗ۱/ط;->؋:[B

    aput-byte v7, v8, v6

    add-int/lit8 v7, v6, 0x1

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v8, v7

    add-int/2addr v6, v4

    iput v6, v5, Lۀۗ۱/ط;->ء:I

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v4, 0x2

    goto/16 :goto_9

    :cond_5
    const v4, 0xd800

    const/16 v5, 0x3f

    if-lt v2, v4, :cond_b

    const v4, 0xdfff

    if-le v2, v4, :cond_6

    goto :goto_8

    :cond_6
    add-int/lit8 v4, p2, 0x1

    if-ge v4, p3, :cond_7

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    goto :goto_5

    :cond_7
    move v6, v0

    :goto_5
    const v7, 0xdbff

    if-gt v2, v7, :cond_a

    const v7, 0xdc00

    if-gt v7, v6, :cond_8

    const v7, 0xe000

    if-ge v6, v7, :cond_8

    move v7, v1

    goto :goto_6

    :cond_8
    move v7, v0

    :goto_6
    if-nez v7, :cond_9

    goto :goto_7

    :cond_9
    and-int/lit16 v2, v2, 0x3ff

    shl-int/lit8 v2, v2, 0xa

    and-int/lit16 v4, v6, 0x3ff

    or-int/2addr v2, v4

    const/high16 v4, 0x10000

    add-int/2addr v2, v4

    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v6

    iget v7, v6, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v8, v2, 0x12

    or-int/lit16 v8, v8, 0xf0

    int-to-byte v8, v8

    iget-object v9, v6, Lۀۗ۱/ط;->؋:[B

    aput-byte v8, v9, v7

    add-int/lit8 v8, v7, 0x1

    shr-int/lit8 v10, v2, 0xc

    and-int/2addr v10, v5

    or-int/2addr v10, v3

    int-to-byte v10, v10

    aput-byte v10, v9, v8

    add-int/lit8 v8, v7, 0x2

    shr-int/lit8 v10, v2, 0x6

    and-int/2addr v10, v5

    or-int/2addr v10, v3

    int-to-byte v10, v10

    aput-byte v10, v9, v8

    add-int/lit8 v8, v7, 0x3

    and-int/2addr v2, v5

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v9, v8

    add-int/2addr v7, v4

    iput v7, v6, Lۀۗ۱/ط;->ء:I

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v4, 0x4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    add-int/lit8 p2, p2, 0x2

    goto/16 :goto_3

    :cond_a
    :goto_7
    invoke-virtual {p0, v5}, Lۀۗ۱/ب;->ي(I)V

    move p2, v4

    goto/16 :goto_3

    :cond_b
    :goto_8
    const/4 v4, 0x3

    invoke-virtual {p0, v4}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v6

    iget v7, v6, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v8, v2, 0xc

    or-int/lit16 v8, v8, 0xe0

    int-to-byte v8, v8

    iget-object v9, v6, Lۀۗ۱/ط;->؋:[B

    aput-byte v8, v9, v7

    add-int/lit8 v8, v7, 0x1

    shr-int/lit8 v10, v2, 0x6

    and-int/2addr v5, v10

    or-int/2addr v5, v3

    int-to-byte v5, v5

    aput-byte v5, v9, v8

    add-int/lit8 v5, v7, 0x2

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v9, v5

    add-int/2addr v7, v4

    iput v7, v6, Lۀۗ۱/ط;->ء:I

    iget-wide v2, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v4, 0x3

    :goto_9
    add-long/2addr v2, v4

    iput-wide v2, p0, Lۀۗ۱/ب;->أ:J

    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_3

    :cond_c
    return-void

    :cond_d
    const-string p2, "endIndex > string.length: "

    const-string v0, " > "

    invoke-static {p2, p3, v0}, Landroidx/activity/result/؋;->ة(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_e
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "endIndex < beginIndex: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " < "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_f
    const-string p1, "beginIndex < 0: "

    invoke-static {p1, p2}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ٷ(I)V
    .locals 11

    const/16 v0, 0x80

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Lۀۗ۱/ب;->ي(I)V

    goto/16 :goto_2

    :cond_0
    const/4 v1, 0x2

    const/16 v2, 0x800

    const/16 v3, 0x3f

    if-ge p1, v2, :cond_1

    invoke-virtual {p0, v1}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v2

    iget v4, v2, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v5, p1, 0x6

    or-int/lit16 v5, v5, 0xc0

    int-to-byte v5, v5

    iget-object v6, v2, Lۀۗ۱/ط;->؋:[B

    aput-byte v5, v6, v4

    add-int/lit8 v5, v4, 0x1

    and-int/2addr p1, v3

    or-int/2addr p1, v0

    int-to-byte p1, p1

    aput-byte p1, v6, v5

    add-int/2addr v4, v1

    iput v4, v2, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x2

    goto/16 :goto_1

    :cond_1
    const/4 v2, 0x1

    const v4, 0xd800

    const/4 v5, 0x0

    if-gt v4, p1, :cond_2

    const v4, 0xe000

    if-ge p1, v4, :cond_2

    move v4, v2

    goto :goto_0

    :cond_2
    move v4, v5

    :goto_0
    if-eqz v4, :cond_3

    invoke-virtual {p0, v3}, Lۀۗ۱/ب;->ي(I)V

    goto :goto_2

    :cond_3
    const/high16 v4, 0x10000

    const/4 v6, 0x3

    if-ge p1, v4, :cond_4

    invoke-virtual {p0, v6}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v1

    iget v2, v1, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v4, p1, 0xc

    or-int/lit16 v4, v4, 0xe0

    int-to-byte v4, v4

    iget-object v5, v1, Lۀۗ۱/ط;->؋:[B

    aput-byte v4, v5, v2

    add-int/lit8 v4, v2, 0x1

    shr-int/lit8 v7, p1, 0x6

    and-int/2addr v7, v3

    or-int/2addr v7, v0

    int-to-byte v7, v7

    aput-byte v7, v5, v4

    add-int/lit8 v4, v2, 0x2

    and-int/2addr p1, v3

    or-int/2addr p1, v0

    int-to-byte p1, p1

    aput-byte p1, v5, v4

    add-int/2addr v2, v6

    iput v2, v1, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x3

    goto :goto_1

    :cond_4
    const v4, 0x10ffff

    const/4 v7, 0x4

    if-gt p1, v4, :cond_5

    invoke-virtual {p0, v7}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v1

    iget v2, v1, Lۀۗ۱/ط;->ء:I

    shr-int/lit8 v4, p1, 0x12

    or-int/lit16 v4, v4, 0xf0

    int-to-byte v4, v4

    iget-object v5, v1, Lۀۗ۱/ط;->؋:[B

    aput-byte v4, v5, v2

    add-int/lit8 v4, v2, 0x1

    shr-int/lit8 v6, p1, 0xc

    and-int/2addr v6, v3

    or-int/2addr v6, v0

    int-to-byte v6, v6

    aput-byte v6, v5, v4

    add-int/lit8 v4, v2, 0x2

    shr-int/lit8 v6, p1, 0x6

    and-int/2addr v6, v3

    or-int/2addr v6, v0

    int-to-byte v6, v6

    aput-byte v6, v5, v4

    add-int/lit8 v4, v2, 0x3

    and-int/2addr p1, v3

    or-int/2addr p1, v0

    int-to-byte p1, p1

    aput-byte p1, v5, v4

    add-int/2addr v2, v7

    iput v2, v1, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x4

    :goto_1
    add-long/2addr v0, v2

    iput-wide v0, p0, Lۀۗ۱/ب;->أ:J

    :goto_2
    return-void

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected code point: 0x"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_9

    const/16 v4, 0x8

    new-array v8, v4, [C

    sget-object v9, Lڗًقڔ/؋;->ك:[C

    shr-int/lit8 v10, p1, 0x1c

    and-int/lit8 v10, v10, 0xf

    aget-char v10, v9, v10

    aput-char v10, v8, v5

    shr-int/lit8 v10, p1, 0x18

    and-int/lit8 v10, v10, 0xf

    aget-char v10, v9, v10

    aput-char v10, v8, v2

    shr-int/lit8 v2, p1, 0x14

    and-int/lit8 v2, v2, 0xf

    aget-char v2, v9, v2

    aput-char v2, v8, v1

    shr-int/lit8 v1, p1, 0x10

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v9, v1

    aput-char v1, v8, v6

    shr-int/lit8 v1, p1, 0xc

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v9, v1

    aput-char v1, v8, v7

    shr-int/lit8 v1, p1, 0x8

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v9, v1

    const/4 v2, 0x5

    aput-char v1, v8, v2

    shr-int/lit8 v1, p1, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v9, v1

    const/4 v2, 0x6

    aput-char v1, v8, v2

    and-int/lit8 p1, p1, 0xf

    aget-char p1, v9, p1

    const/4 v1, 0x7

    aput-char p1, v8, v1

    :goto_3
    if-ge v5, v4, :cond_6

    aget-char p1, v8, v5

    const/16 v1, 0x30

    if-ne p1, v1, :cond_6

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_6
    const-string p1, "startIndex: "

    if-ltz v5, :cond_8

    if-gt v5, v4, :cond_7

    new-instance p1, Ljava/lang/String;

    rsub-int/lit8 v1, v5, 0x8

    invoke-direct {p1, v8, v5, v1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_4

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, " > endIndex: 8"

    invoke-static {p1, v5, v1}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, ", endIndex: 8, size: 8"

    invoke-static {p1, v5, v1}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    const-string p1, "0"

    :goto_4
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
