.class public final Lokhttp3/internal/ws/MessageDeflater;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private final deflatedBytes:Lۀۗ۱/ب;

.field private final deflater:Ljava/util/zip/Deflater;

.field private final deflaterSink:Lۀۗ۱/ج;

.field private final noContextTakeover:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lokhttp3/internal/ws/MessageDeflater;->noContextTakeover:Z

    new-instance p1, Lۀۗ۱/ب;

    invoke-direct {p1}, Lۀۗ۱/ب;-><init>()V

    iput-object p1, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflater:Ljava/util/zip/Deflater;

    new-instance v1, Lۀۗ۱/ج;

    invoke-direct {v1, p1, v0}, Lۀۗ۱/ج;-><init>(Lۀۗ۱/ب;Ljava/util/zip/Deflater;)V

    iput-object v1, p0, Lokhttp3/internal/ws/MessageDeflater;->deflaterSink:Lۀۗ۱/ج;

    return-void
.end method

.method private final endsWith(Lۀۗ۱/ب;Lۀۗ۱/ث;)Z
    .locals 4

    iget-wide v0, p1, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p2}, Lۀۗ۱/ث;->ء()I

    move-result v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1, p2}, Lۀۗ۱/ب;->خ(JLۀۗ۱/ث;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflaterSink:Lۀۗ۱/ج;

    invoke-virtual {v0}, Lۀۗ۱/ج;->close()V

    return-void
.end method

.method public final deflate(Lۀۗ۱/ب;)V
    .locals 5

    const-string v0, "buffer"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    iget-wide v0, v0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lokhttp3/internal/ws/MessageDeflater;->noContextTakeover:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    :cond_1
    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflaterSink:Lۀۗ۱/ج;

    iget-wide v2, p1, Lۀۗ۱/ب;->أ:J

    invoke-virtual {v0, p1, v2, v3}, Lۀۗ۱/ج;->write(Lۀۗ۱/ب;J)V

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflaterSink:Lۀۗ۱/ج;

    invoke-virtual {v0}, Lۀۗ۱/ج;->flush()V

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    invoke-static {}, Lokhttp3/internal/ws/MessageDeflaterKt;->access$getEMPTY_DEFLATE_BLOCK$p()Lۀۗ۱/ث;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lokhttp3/internal/ws/MessageDeflater;->endsWith(Lۀۗ۱/ب;Lۀۗ۱/ث;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    const/4 v3, 0x4

    int-to-long v3, v3

    sub-long/2addr v1, v3

    sget-object v3, Lڃٷښـ۝ۼ/ؠ;->ج:Lۀۗ۱/ئ;

    invoke-virtual {v0, v3}, Lۀۗ۱/ب;->ف(Lۀۗ۱/ئ;)Lۀۗ۱/ئ;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0, v1, v2}, Lۀۗ۱/ئ;->؋(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ا(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {v0, p1}, Lںڍڒڸ/ش;->ا(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1

    :cond_2
    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    invoke-virtual {v0, v1}, Lۀۗ۱/ب;->ي(I)V

    :goto_1
    iget-object v0, p0, Lokhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lۀۗ۱/ب;

    iget-wide v1, v0, Lۀۗ۱/ب;->أ:J

    invoke-virtual {p1, v0, v1, v2}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
