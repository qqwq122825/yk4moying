.class public abstract Lڜأِجطّثٮ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static ؠ:Landroid/os/Handler;

.field public static volatile ء:I

.field public static volatile آ:I

.field public static volatile أ:J

.field public static final ؤ:Ljava/io/ByteArrayOutputStream;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lڜأِجطّثٮ/أ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/16 v0, 0x28

    sput v0, Lڜأِجطّثٮ/أ;->ء:I

    const/4 v0, 0x2

    sput v0, Lڜأِجطّثٮ/أ;->آ:I

    const-wide/16 v0, 0x190

    sput-wide v0, Lڜأِجطّثٮ/أ;->أ:J

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/high16 v1, 0x40000

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    sput-object v0, Lڜأِجطّثٮ/أ;->ؤ:Ljava/io/ByteArrayOutputStream;

    return-void
.end method

.method public static ؋()V
    .locals 5

    sget-object v0, Lڜأِجطّثٮ/أ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Lڜأِجطّثٮ/أ;->ؠ()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    sget-wide v1, Lڜأِجطّثٮ/أ;->أ:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    if-eqz v0, :cond_1

    new-instance v3, Lةؽڗںۍټ٘/؋;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public static ؠ()V
    .locals 4

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v0

    invoke-virtual {v0}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "AdbScreenLoop"

    const-string v1, "ADB not connected, skipping frame"

    :goto_0
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {v0}, Lڜأِجطّثٮ/ؠ;->ة()[B

    move-result-object v0

    if-eqz v0, :cond_4

    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_2

    :cond_1
    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget v2, Lڜأِجطّثٮ/أ;->آ:I

    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "AdbScreenLoop"

    const-string v1, "PNG decode failed"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    sget-object v1, Lڜأِجطّثٮ/أ;->ؤ:Ljava/io/ByteArrayOutputStream;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    sget v3, Lڜأِجطّثٮ/أ;->ء:I

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v2, v0}, Lڜٟٱڀ/ؤ;->آ([B)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "AdbScreenLoop"

    const-string v2, "sendScreen failed, binary not connected"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "AdbScreenLoop"

    const-string v2, "captureAndSend error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void

    :cond_4
    :goto_2
    const-string v0, "AdbScreenLoop"

    const-string v1, "Screenshot returned empty"

    goto :goto_0
.end method

.method public static ء(II)V
    .locals 3

    sget-object v0, Lڜأِجطّثٮ/أ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x50

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v1, 0xa

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    sput p0, Lڜأِجطّثٮ/أ;->ء:I

    const/16 p0, 0xc8

    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long p0, p0

    sput-wide p0, Lڜأِجطّثٮ/أ;->أ:J

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Starting ADB stream loop q="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p1, Lڜأِجطّثٮ/أ;->ء:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " interval="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v1, Lڜأِجطّثٮ/أ;->أ:J

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AdbScreenLoop"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p0, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    if-nez p0, :cond_1

    new-instance p0, Landroid/os/HandlerThread;

    invoke-direct {p0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    new-instance p1, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-direct {p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object p1, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-eqz p0, :cond_3

    sget-object p0, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    new-instance p1, Lةؽڗںۍټ٘/؋;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    :goto_0
    return-void
.end method

.method public static آ()V
    .locals 2

    sget-object v0, Lڜأِجطّثٮ/أ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lڜأِجطّثٮ/أ;->ؠ:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    const-string v0, "AdbScreenLoop"

    const-string v1, "Stopped ADB stream loop"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
