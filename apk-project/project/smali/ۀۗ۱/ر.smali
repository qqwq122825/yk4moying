.class public final Lۀۗ۱/ر;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ؼ;


# instance fields
.field public final آ:Lۀۗ۱/ت;

.field public final أ:Ljava/util/zip/Inflater;

.field public ؤ:I

.field public إ:Z


# direct methods
.method public constructor <init>(Lۀۗ۱/ض;Ljava/util/zip/Inflater;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/ر;->آ:Lۀۗ۱/ت;

    iput-object p2, p0, Lۀۗ۱/ر;->أ:Ljava/util/zip/Inflater;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ر;->إ:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lۀۗ۱/ر;->أ:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ر;->إ:Z

    iget-object v0, p0, Lۀۗ۱/ر;->آ:Lۀۗ۱/ت;

    invoke-interface {v0}, Ljava/nio/channels/Channel;->close()V

    return-void
.end method

.method public final read(Lۀۗ۱/ب;J)J
    .locals 4

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lۀۗ۱/ر;->؋(Lۀۗ۱/ب;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lۀۗ۱/ر;->أ:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lۀۗ۱/ر;->آ:Lۀۗ۱/ت;

    invoke-interface {v0}, Lۀۗ۱/ت;->ج()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    new-instance p1, Ljava/io/EOFException;

    const-string p2, "source exhausted prematurely"

    invoke-direct {p1, p2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    const-wide/16 p1, -0x1

    return-wide p1
.end method

.method public final timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/ر;->آ:Lۀۗ۱/ت;

    invoke-interface {v0}, Lۀۗ۱/ؼ;->timeout()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public final ؋(Lۀۗ۱/ب;J)J
    .locals 7

    iget-object v0, p0, Lۀۗ۱/ر;->أ:Ljava/util/zip/Inflater;

    const-string v1, "sink"

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    const/4 v4, 0x1

    if-ltz v3, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_8

    iget-boolean v5, p0, Lۀۗ۱/ر;->إ:Z

    xor-int/2addr v5, v4

    if-eqz v5, :cond_7

    if-nez v3, :cond_1

    return-wide v1

    :cond_1
    :try_start_0
    invoke-virtual {p1, v4}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v3

    iget v4, v3, Lۀۗ۱/ط;->ء:I

    rsub-int v4, v4, 0x2000

    int-to-long v4, v4

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    long-to-int p2, p2

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result p3
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v4, p0, Lۀۗ۱/ر;->آ:Lۀۗ۱/ت;

    if-nez p3, :cond_2

    goto :goto_1

    :cond_2
    :try_start_1
    invoke-interface {v4}, Lۀۗ۱/ت;->ج()Z

    move-result p3

    if-eqz p3, :cond_3

    goto :goto_1

    :cond_3
    invoke-interface {v4}, Lۀۗ۱/ت;->ؠ()Lۀۗ۱/ب;

    move-result-object p3

    iget-object p3, p3, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {p3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v5, p3, Lۀۗ۱/ط;->ء:I

    iget v6, p3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v6

    iput v5, p0, Lۀۗ۱/ر;->ؤ:I

    iget-object p3, p3, Lۀۗ۱/ط;->؋:[B

    invoke-virtual {v0, p3, v6, v5}, Ljava/util/zip/Inflater;->setInput([BII)V

    :goto_1
    iget-object p3, v3, Lۀۗ۱/ط;->؋:[B

    iget v5, v3, Lۀۗ۱/ط;->ء:I

    invoke-virtual {v0, p3, v5, p2}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result p2

    iget p3, p0, Lۀۗ۱/ر;->ؤ:I

    if-nez p3, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v0

    sub-int/2addr p3, v0

    iget v0, p0, Lۀۗ۱/ر;->ؤ:I

    sub-int/2addr v0, p3

    iput v0, p0, Lۀۗ۱/ر;->ؤ:I

    int-to-long v5, p3

    invoke-interface {v4, v5, v6}, Lۀۗ۱/ت;->skip(J)V

    :goto_2
    if-lez p2, :cond_5

    iget p3, v3, Lۀۗ۱/ط;->ء:I

    add-int/2addr p3, p2

    iput p3, v3, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p1, Lۀۗ۱/ب;->أ:J

    int-to-long p2, p2

    add-long/2addr v0, p2

    iput-wide v0, p1, Lۀۗ۱/ب;->أ:J

    return-wide p2

    :cond_5
    iget p2, v3, Lۀۗ۱/ط;->ؠ:I

    iget p3, v3, Lۀۗ۱/ط;->ء:I

    if-ne p2, p3, :cond_6

    invoke-virtual {v3}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p2

    iput-object p2, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v3}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_6
    return-wide v1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    const-string p1, "byteCount < 0: "

    invoke-static {p1, p2, p3}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
