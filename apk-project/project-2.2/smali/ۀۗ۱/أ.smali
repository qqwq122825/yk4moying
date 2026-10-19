.class public final Lۀۗ۱/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ؼ;


# instance fields
.field public final synthetic آ:I

.field public final أ:Ljava/lang/Object;

.field public final ؤ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lۀۗ۱/ؿ;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lۀۗ۱/أ;->آ:I

    const-string v0, "timeout"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lۀۗ۱/ؤ;Lۀۗ۱/ؼ;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lۀۗ۱/أ;->آ:I

    iput-object p1, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 3

    iget v0, p0, Lۀۗ۱/أ;->آ:I

    iget-object v1, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    check-cast v1, Lۀۗ۱/ؤ;

    iget-object v0, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    check-cast v0, Lۀۗ۱/ؼ;

    invoke-virtual {v1}, Lۀۗ۱/ؤ;->enter()V

    :try_start_0
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Lۀۗ۱/ؤ;->exit()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lۀۗ۱/ؤ;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v1}, Lۀۗ۱/ؤ;->exit()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v0}, Lۀۗ۱/ؤ;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    :goto_0
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    invoke-virtual {v1}, Lۀۗ۱/ؤ;->exit()Z

    throw v0

    :goto_2
    check-cast v1, Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final read(Lۀۗ۱/ب;J)J
    .locals 5

    iget v0, p0, Lۀۗ۱/أ;->آ:I

    iget-object v1, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    iget-object v2, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    const-string v3, "sink"

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    invoke-static {p1, v3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lۀۗ۱/ؤ;

    check-cast v1, Lۀۗ۱/ؼ;

    invoke-virtual {v2}, Lۀۗ۱/ؤ;->enter()V

    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lۀۗ۱/ؼ;->read(Lۀۗ۱/ب;J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2}, Lۀۗ۱/ؤ;->exit()Z

    move-result p3

    if-nez p3, :cond_0

    return-wide p1

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Lۀۗ۱/ؤ;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    invoke-virtual {v2}, Lۀۗ۱/ؤ;->exit()Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2, p1}, Lۀۗ۱/ؤ;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :goto_0
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    invoke-virtual {v2}, Lۀۗ۱/ؤ;->exit()Z

    throw p1

    :goto_2
    invoke-static {p1, v3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    cmp-long v0, p2, v3

    if-nez v0, :cond_2

    goto :goto_4

    :cond_2
    const/4 v3, 0x1

    if-ltz v0, :cond_3

    move v0, v3

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    :goto_3
    if-eqz v0, :cond_7

    :try_start_2
    check-cast v1, Lۀۗ۱/ؿ;

    invoke-virtual {v1}, Lۀۗ۱/ؿ;->throwIfReached()V

    invoke-virtual {p1, v3}, Lۀۗ۱/ب;->ن(I)Lۀۗ۱/ط;

    move-result-object v0

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    rsub-int v1, v1, 0x2000

    int-to-long v3, v1

    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    long-to-int p2, p2

    check-cast v2, Ljava/io/InputStream;

    iget-object p3, v0, Lۀۗ۱/ط;->؋:[B

    iget v1, v0, Lۀۗ۱/ط;->ء:I

    invoke-virtual {v2, p3, v1, p2}, Ljava/io/InputStream;->read([BII)I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_5

    iget p2, v0, Lۀۗ۱/ط;->ؠ:I

    iget p3, v0, Lۀۗ۱/ط;->ء:I

    if-ne p2, p3, :cond_4

    invoke-virtual {v0}, Lۀۗ۱/ط;->؋()Lۀۗ۱/ط;

    move-result-object p2

    iput-object p2, p1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    invoke-static {v0}, Lۀۗ۱/ظ;->؋(Lۀۗ۱/ط;)V

    :cond_4
    const-wide/16 v3, -0x1

    goto :goto_4

    :cond_5
    iget p3, v0, Lۀۗ۱/ط;->ء:I

    add-int/2addr p3, p2

    iput p3, v0, Lۀۗ۱/ط;->ء:I

    iget-wide v0, p1, Lۀۗ۱/ب;->أ:J

    int-to-long v3, p2

    add-long/2addr v0, v3

    iput-wide v0, p1, Lۀۗ۱/ب;->أ:J
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_4
    return-wide v3

    :catch_1
    move-exception p1

    invoke-static {p1}, Lڃٷښـ۝ۼ/ؠ;->ج(Ljava/lang/AssertionError;)Z

    move-result p2

    if-eqz p2, :cond_6

    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_6
    throw p1

    :cond_7
    const-string p1, "byteCount < 0: "

    invoke-static {p1, p2, p3}, Landroidx/activity/result/؋;->أ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget v0, p0, Lۀۗ۱/أ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    check-cast v0, Lۀۗ۱/ؤ;

    return-object v0

    :goto_0
    iget-object v0, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    check-cast v0, Lۀۗ۱/ؿ;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    iget v0, p0, Lۀۗ۱/أ;->آ:I

    const/16 v1, 0x29

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "AsyncTimeout.source("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lۀۗ۱/أ;->ؤ:Ljava/lang/Object;

    check-cast v2, Lۀۗ۱/ؼ;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "source("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lۀۗ۱/أ;->أ:Ljava/lang/Object;

    check-cast v2, Ljava/io/InputStream;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
