.class public final Lۀۗ۱/ج;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/غ;


# instance fields
.field public final آ:Lۀۗ۱/ة;

.field public final أ:Ljava/util/zip/Deflater;

.field public ؤ:Z


# direct methods
.method public constructor <init>(Lۀۗ۱/ب;Ljava/util/zip/Deflater;)V
    .locals 0

    invoke-static {p1}, Lڃٷښـ۝ۼ/ؠ;->آ(Lۀۗ۱/غ;)Lۀۗ۱/ص;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    iput-object p2, p0, Lۀۗ۱/ج;->أ:Ljava/util/zip/Deflater;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    iget-object v0, p0, Lۀۗ۱/ج;->أ:Ljava/util/zip/Deflater;

    iget-boolean v1, p0, Lۀۗ۱/ج;->ؤ:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lۀۗ۱/ج;->؋(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    if-nez v1, :cond_1

    move-object v1, v0

    :cond_1
    :goto_1
    :try_start_2
    iget-object v0, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    invoke-interface {v0}, Lۀۗ۱/غ;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    if-nez v1, :cond_2

    move-object v1, v0

    :cond_2
    :goto_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ج;->ؤ:Z

    if-nez v1, :cond_3

    return-void

    :cond_3
    throw v1
.end method

.method public final flush()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lۀۗ۱/ج;->؋(Z)V

    iget-object v0, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    invoke-interface {v0}, Lۀۗ۱/ة;->flush()V

    return-void
.end method

.method public final timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    invoke-interface {v0}, Lۀۗ۱/غ;->timeout()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeflaterSink("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final write(Lۀۗ۱/ب;J)V
    .locals 7

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v1, p1, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    move-wide v5, p2

    invoke-static/range {v1 .. v6}, Lڃٷښـ۝ۼ/ؠ;->إ(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    iget-object v0, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    iget-object v3, p0, Lۀۗ۱/ج;->أ:Ljava/util/zip/Deflater;

    iget-object v4, v0, Lۀۗ۱/ط;->؋:[B

    invoke-virtual {v3, v4, v2, v1}, Ljava/util/zip/Deflater;->setInput([BII)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lۀۗ۱/ج;->؋(Z)V

    iget-wide v2, p1, Lۀۗ۱/ب;->أ:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p1, Lۀۗ۱/ب;->أ:J

    iget v2, v0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr v2, v1

    iput v2, v0, Lۀۗ۱/ط;->ؠ:I

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    if-ne v2, v1, :cond_0

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object v1

    iput-object v1, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_0
    sub-long/2addr p2, v4

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final ؋(Z)V
    .locals 8

    iget-object v0, p0, Lۀۗ۱/ج;->آ:Lۀۗ۱/ة;

    invoke-interface {v0}, Lۀۗ۱/ة;->ؠ()Lۀۗ۱/ب;

    move-result-object v1

    :cond_0
    :goto_0
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v2

    iget-object v3, p0, Lۀۗ۱/ج;->أ:Ljava/util/zip/Deflater;

    iget-object v4, v2, Lۀۗ۱/ط;->؋:[B

    if-eqz p1, :cond_1

    :try_start_0
    iget v5, v2, Lۀۗ۱/ط;->ء:I

    rsub-int v6, v5, 0x2000

    const/4 v7, 0x2

    invoke-virtual {v3, v4, v5, v6, v7}, Ljava/util/zip/Deflater;->deflate([BIII)I

    move-result v4

    goto :goto_1

    :cond_1
    iget v5, v2, Lۀۗ۱/ط;->ء:I

    rsub-int v6, v5, 0x2000

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    if-lez v4, :cond_2

    iget v3, v2, Lۀۗ۱/ط;->ء:I

    add-int/2addr v3, v4

    iput v3, v2, Lۀۗ۱/ط;->ء:I

    iget-wide v2, v1, Lۀۗ۱/ب;->أ:J

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, v1, Lۀۗ۱/ب;->أ:J

    invoke-interface {v0}, Lۀۗ۱/ة;->س()Lۀۗ۱/ة;

    goto :goto_0

    :cond_2
    invoke-virtual {v3}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v3

    if-eqz v3, :cond_0

    iget p1, v2, Lۀۗ۱/ط;->ؠ:I

    iget v0, v2, Lۀۗ۱/ط;->ء:I

    if-ne p1, v0, :cond_3

    invoke-virtual {v2}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p1

    iput-object p1, v1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v2}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_3
    return-void

    :catch_0
    move-exception p1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Deflater already closed"

    invoke-direct {v0, v1, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
