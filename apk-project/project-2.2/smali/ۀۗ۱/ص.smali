.class public final Lۀۗ۱/ص;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ة;


# instance fields
.field public final آ:Lۀۗ۱/غ;

.field public final أ:Lۀۗ۱/ب;

.field public ؤ:Z


# direct methods
.method public constructor <init>(Lۀۗ۱/غ;)V
    .locals 1

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    new-instance p1, Lۀۗ۱/ب;

    invoke-direct {p1}, Lۀۗ۱/ب;-><init>()V

    iput-object p1, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 6

    iget-object v0, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    iget-boolean v1, p0, Lۀۗ۱/ص;->ؤ:Z

    if-nez v1, :cond_3

    :try_start_0
    iget-object v1, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    iget-wide v2, v1, Lۀۗ۱/ب;->أ:J

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    invoke-interface {v0, v1, v2, v3}, Lۀۗ۱/غ;->write(Lۀۗ۱/ب;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    :goto_0
    :try_start_1
    invoke-interface {v0}, Lۀۗ۱/غ;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    if-nez v1, :cond_1

    move-object v1, v0

    :cond_1
    :goto_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    throw v1

    :cond_3
    :goto_2
    return-void
.end method

.method public final flush()V
    .locals 5

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    iget-object v4, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    if-lez v3, :cond_0

    invoke-interface {v4, v0, v1, v2}, Lۀۗ۱/غ;->write(Lۀۗ۱/ب;J)V

    :cond_0
    invoke-interface {v4}, Lۀۗ۱/غ;->flush()V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final isOpen()Z
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    invoke-interface {v0}, Lۀۗ۱/غ;->timeout()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "buffer("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final write(Ljava/nio/ByteBuffer;)I
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->write(Ljava/nio/ByteBuffer;)I

    move-result p1

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final write(Lۀۗ۱/ب;J)V
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1, p2, p3}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؠ()Lۀۗ۱/ب;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    return-object v0
.end method

.method public final آ([BII)Lۀۗ۱/ة;
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1, p2, p3}, Lۀۗ۱/ب;->ى([BII)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final أ(J)Lۀۗ۱/ة;
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1, p2}, Lۀۗ۱/ب;->ٯ(J)Lۀۗ۱/ب;

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ئ()Lۀۗ۱/ة;
    .locals 5

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    iget-object v3, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    invoke-interface {v3, v0, v1, v2}, Lۀۗ۱/غ;->write(Lۀۗ۱/ب;J)V

    :cond_0
    return-object p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ا(I)Lۀۗ۱/ة;
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->ٳ(I)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ة(I)Lۀۗ۱/ة;
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->ٱ(I)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ح(I)Lۀۗ۱/ة;
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->ي(I)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final د(Lۀۗ۱/ؼ;)J
    .locals 6

    const-wide/16 v0, 0x0

    :goto_0
    const-wide/16 v2, 0x2000

    move-object v4, p1

    check-cast v4, Lۀۗ۱/أ;

    iget-object v5, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v4, v5, v2, v3}, Lۀۗ۱/أ;->read(Lۀۗ۱/ب;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    add-long/2addr v0, v2

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method public final ز([B)Lۀۗ۱/ة;
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->و([B)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final س()Lۀۗ۱/ة;
    .locals 8

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    move-wide v1, v3

    goto :goto_0

    :cond_0
    iget-object v5, v0, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v5}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v5, v5, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v5}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v6, v5, Lۀۗ۱/ط;->ء:I

    const/16 v7, 0x2000

    if-ge v6, v7, :cond_1

    iget-boolean v7, v5, Lۀۗ۱/ط;->أ:Z

    if-eqz v7, :cond_1

    iget v5, v5, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v6, v5

    int-to-long v5, v6

    sub-long/2addr v1, v5

    :cond_1
    :goto_0
    cmp-long v3, v1, v3

    if-lez v3, :cond_2

    iget-object v3, p0, Lۀۗ۱/ص;->آ:Lۀۗ۱/غ;

    invoke-interface {v3, v0, v1, v2}, Lۀۗ۱/غ;->write(Lۀۗ۱/ب;J)V

    :cond_2
    return-object p0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ض(Lۀۗ۱/ث;)Lۀۗ۱/ة;
    .locals 1

    const-string v0, "byteString"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->ه(Lۀۗ۱/ث;)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ع(Ljava/lang/String;)Lۀۗ۱/ة;
    .locals 1

    const-string v0, "string"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final غ(J)Lۀۗ۱/ة;
    .locals 1

    iget-boolean v0, p0, Lۀۗ۱/ص;->ؤ:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lۀۗ۱/ص;->أ:Lۀۗ۱/ب;

    invoke-virtual {v0, p1, p2}, Lۀۗ۱/ب;->ٮ(J)Lۀۗ۱/ب;

    invoke-virtual {p0}, Lۀۗ۱/ص;->س()Lۀۗ۱/ة;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
