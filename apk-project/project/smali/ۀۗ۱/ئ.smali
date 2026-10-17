.class public final Lۀۗ۱/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public آ:Lۀۗ۱/ب;

.field public أ:Z

.field public ؤ:Lۀۗ۱/ط;

.field public إ:J

.field public ئ:[B

.field public ا:I

.field public ب:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lۀۗ۱/ئ;->إ:J

    const/4 v0, -0x1

    iput v0, p0, Lۀۗ۱/ئ;->ا:I

    iput v0, p0, Lۀۗ۱/ئ;->ب:I

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 3

    iget-object v0, p0, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    iput-object v0, p0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lۀۗ۱/ئ;->إ:J

    iput-object v0, p0, Lۀۗ۱/ئ;->ئ:[B

    const/4 v0, -0x1

    iput v0, p0, Lۀۗ۱/ئ;->ا:I

    iput v0, p0, Lۀۗ۱/ئ;->ب:I

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not attached to a buffer"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ؋(J)V
    .locals 13

    iget-object v0, p0, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    if-eqz v0, :cond_8

    iget-boolean v1, p0, Lۀۗ۱/ئ;->أ:Z

    if-eqz v1, :cond_7

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    cmp-long v3, p1, v1

    const/4 v4, 0x1

    const-wide/16 v5, 0x0

    if-gtz v3, :cond_4

    cmp-long v3, p1, v5

    if-ltz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    if-eqz v4, :cond_3

    sub-long/2addr v1, p1

    :goto_1
    cmp-long v3, v1, v5

    if-lez v3, :cond_2

    iget-object v3, v0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, v3, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v4, v3, Lۀۗ۱/ط;->ء:I

    iget v7, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int v7, v4, v7

    int-to-long v7, v7

    cmp-long v9, v7, v1

    if-gtz v9, :cond_1

    invoke-virtual {v3}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v4

    iput-object v4, v0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v3}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    sub-long/2addr v1, v7

    goto :goto_1

    :cond_1
    long-to-int v1, v1

    sub-int/2addr v4, v1

    iput v4, v3, Lۀۗ۱/ط;->ء:I

    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    iput-wide p1, p0, Lۀۗ۱/ئ;->إ:J

    iput-object v1, p0, Lۀۗ۱/ئ;->ئ:[B

    const/4 v1, -0x1

    iput v1, p0, Lۀۗ۱/ئ;->ا:I

    iput v1, p0, Lۀۗ۱/ئ;->ب:I

    goto :goto_3

    :cond_3
    const-string v0, "newSize < 0: "

    invoke-static {v0, p1, p2}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    if-lez v3, :cond_6

    sub-long v7, p1, v1

    move v3, v4

    :goto_2
    cmp-long v9, v7, v5

    if-lez v9, :cond_6

    invoke-virtual {v0, v4}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v4

    iget v9, v4, Lۀۗ۱/ط;->ء:I

    rsub-int v9, v9, 0x2000

    int-to-long v9, v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    long-to-int v9, v9

    iget v10, v4, Lۀۗ۱/ط;->ء:I

    add-int/2addr v10, v9

    iput v10, v4, Lۀۗ۱/ط;->ء:I

    int-to-long v11, v9

    sub-long/2addr v7, v11

    if-eqz v3, :cond_5

    iput-object v4, p0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    iput-wide v1, p0, Lۀۗ۱/ئ;->إ:J

    iget-object v3, v4, Lۀۗ۱/ط;->؋:[B

    iput-object v3, p0, Lۀۗ۱/ئ;->ئ:[B

    sub-int v3, v10, v9

    iput v3, p0, Lۀۗ۱/ئ;->ا:I

    iput v10, p0, Lۀۗ۱/ئ;->ب:I

    const/4 v3, 0x0

    :cond_5
    const/4 v4, 0x1

    goto :goto_2

    :cond_6
    :goto_3
    iput-wide p1, v0, Lۀۗ۱/ب;->أ:J

    return-void

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "resizeBuffer() only permitted for read/write buffers"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "not attached to a buffer"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء(J)I
    .locals 17

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    iget-object v3, v0, Lۀۗ۱/ئ;->آ:Lۀۗ۱/ب;

    if-eqz v3, :cond_a

    const-wide/16 v4, -0x1

    cmp-long v4, v1, v4

    if-ltz v4, :cond_9

    iget-wide v5, v3, Lۀۗ۱/ب;->أ:J

    cmp-long v7, v1, v5

    if-gtz v7, :cond_9

    if-eqz v4, :cond_8

    if-nez v7, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v4, v3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    iget-object v7, v0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    const-wide/16 v8, 0x0

    if-eqz v7, :cond_2

    iget-wide v10, v0, Lۀۗ۱/ئ;->إ:J

    iget v12, v0, Lۀۗ۱/ئ;->ا:I

    iget v13, v7, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v12, v13

    int-to-long v12, v12

    sub-long/2addr v10, v12

    cmp-long v12, v10, v1

    if-lez v12, :cond_1

    move-wide v5, v10

    goto :goto_0

    :cond_1
    move-wide v8, v10

    move-object/from16 v16, v7

    move-object v7, v4

    move-object/from16 v4, v16

    goto :goto_0

    :cond_2
    move-object v7, v4

    :goto_0
    sub-long v10, v5, v1

    sub-long v12, v1, v8

    cmp-long v10, v10, v12

    if-lez v10, :cond_3

    :goto_1
    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v5, v4, Lۀۗ۱/ط;->ء:I

    iget v6, v4, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    add-long/2addr v5, v8

    cmp-long v7, v1, v5

    if-ltz v7, :cond_5

    iget-object v4, v4, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    move-wide v8, v5

    goto :goto_1

    :cond_3
    :goto_2
    cmp-long v4, v5, v1

    if-lez v4, :cond_4

    invoke-static {v7}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v7, v7, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v7}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v4, v7, Lۀۗ۱/ط;->ء:I

    iget v8, v7, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v4, v8

    int-to-long v8, v4

    sub-long/2addr v5, v8

    goto :goto_2

    :cond_4
    move-wide v8, v5

    move-object v4, v7

    :cond_5
    iget-boolean v5, v0, Lۀۗ۱/ئ;->أ:Z

    if-eqz v5, :cond_7

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-boolean v5, v4, Lۀۗ۱/ط;->آ:Z

    if-eqz v5, :cond_7

    new-instance v5, Lۀۗ۱/ط;

    iget-object v6, v4, Lۀۗ۱/ط;->؋:[B

    array-length v7, v6

    invoke-static {v6, v7}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v11

    const-string v6, "copyOf(this, size)"

    invoke-static {v11, v6}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    iget v12, v4, Lۀۗ۱/ط;->ؠ:I

    iget v13, v4, Lۀۗ۱/ط;->ء:I

    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object v10, v5

    invoke-direct/range {v10 .. v15}, Lۀۗ۱/ط;-><init>([BIIZZ)V

    iget-object v6, v3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    if-ne v6, v4, :cond_6

    iput-object v5, v3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    :cond_6
    invoke-virtual {v4, v5}, Lۀۗ۱/ط;->ؠ(Lۀۗ۱/ط;)V

    iget-object v3, v5, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v3}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-object v4, v5

    :cond_7
    iput-object v4, v0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    iput-wide v1, v0, Lۀۗ۱/ئ;->إ:J

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, v4, Lۀۗ۱/ط;->؋:[B

    iput-object v3, v0, Lۀۗ۱/ئ;->ئ:[B

    iget v3, v4, Lۀۗ۱/ط;->ؠ:I

    sub-long/2addr v1, v8

    long-to-int v1, v1

    add-int/2addr v3, v1

    iput v3, v0, Lۀۗ۱/ئ;->ا:I

    iget v1, v4, Lۀۗ۱/ط;->ء:I

    iput v1, v0, Lۀۗ۱/ئ;->ب:I

    sub-int/2addr v1, v3

    goto :goto_4

    :cond_8
    :goto_3
    const/4 v3, 0x0

    iput-object v3, v0, Lۀۗ۱/ئ;->ؤ:Lۀۗ۱/ط;

    iput-wide v1, v0, Lۀۗ۱/ئ;->إ:J

    iput-object v3, v0, Lۀۗ۱/ئ;->ئ:[B

    const/4 v1, -0x1

    iput v1, v0, Lۀۗ۱/ئ;->ا:I

    iput v1, v0, Lۀۗ۱/ئ;->ب:I

    :goto_4
    return v1

    :cond_9
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "offset="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " > size="

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, v3, Lۀۗ۱/ب;->أ:J

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_a
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not attached to a buffer"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
