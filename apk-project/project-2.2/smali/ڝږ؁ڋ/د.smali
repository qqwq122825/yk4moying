.class public abstract Lڝږ؁ڋ/د;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile ؋:I = 0x3

.field public static volatile ؠ:I = 0x28

.field public static final ء:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static final آ:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static volatile أ:J

.field public static volatile ؤ:I

.field public static إ:Landroid/os/Handler;

.field public static final ئ:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-wide/16 v2, 0xc8

    sput-wide v2, Lڝږ؁ڋ/د;->أ:J

    sput v1, Lڝږ؁ڋ/د;->ؤ:I

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lڝږ؁ڋ/د;->ئ:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static ؋([B)V
    .locals 4

    const-string v0, "BmtvScreenCapture"

    const-string v1, "sendScreen FAILED: binaryConnected="

    :try_start_0
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p0, "sendScreen SKIP: orch is null"

    goto :goto_1

    :cond_0
    iget-object v3, v2, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v2, p0}, Lڜٟٱڀ/ؤ;->آ([B)Z

    move-result p0

    if-nez p0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " orchConnected="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    const-string v1, "sendScreenData error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_2
    return-void
.end method

.method public static ؠ(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    int-to-float p1, p1

    new-instance v3, Landroid/graphics/ColorMatrixColorFilter;

    new-instance v4, Landroid/graphics/ColorMatrix;

    const/16 v5, 0x14

    new-array v5, v5, [F

    const/4 v6, 0x0

    const/high16 v7, 0x42200000    # 40.0f

    aput v7, v5, v6

    const/4 v6, 0x1

    const/4 v8, 0x0

    aput v8, v5, v6

    const/4 v6, 0x2

    aput v8, v5, v6

    const/4 v6, 0x3

    aput v8, v5, v6

    const/4 v6, 0x4

    aput p1, v5, v6

    const/4 v6, 0x5

    aput v8, v5, v6

    const/4 v6, 0x6

    aput v7, v5, v6

    const/4 v6, 0x7

    aput v8, v5, v6

    const/16 v6, 0x8

    aput v8, v5, v6

    const/16 v6, 0x9

    aput p1, v5, v6

    const/16 v6, 0xa

    aput v8, v5, v6

    const/16 v6, 0xb

    aput v8, v5, v6

    const/16 v6, 0xc

    aput v7, v5, v6

    const/16 v6, 0xd

    aput v8, v5, v6

    const/16 v6, 0xe

    aput p1, v5, v6

    const/16 p1, 0xf

    aput v8, v5, p1

    const/16 p1, 0x10

    aput v8, v5, p1

    const/16 p1, 0x11

    aput v8, v5, p1

    const/16 p1, 0x12

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v5, p1

    const/16 p1, 0x13

    aput v8, v5, p1

    invoke-direct {v4, v5}, Landroid/graphics/ColorMatrix;-><init>([F)V

    invoke-direct {v3, v4}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1, p0, v8, v8, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object v0
.end method

.method public static ء()V
    .locals 5

    sget-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lڝږ؁ڋ/د;->إ:Landroid/os/Handler;

    if-eqz v0, :cond_1

    sget-wide v0, Lڝږ؁ڋ/د;->أ:J

    sget v2, Lڝږ؁ڋ/د;->ؤ:I

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    sget-wide v0, Lڝږ؁ڋ/د;->أ:J

    sget v2, Lڝږ؁ڋ/د;->ؤ:I

    int-to-long v2, v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    :cond_0
    sget-object v2, Lڝږ؁ڋ/د;->إ:Landroid/os/Handler;

    new-instance v3, Lڝږ؁ڋ/ا;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method public static آ()V
    .locals 3

    sget-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const-string v2, "BmtvScreenCapture"

    if-eqz v1, :cond_0

    const-string v0, "Screenshot loop already running"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v0, "Capture started"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lڝږ؁ڋ/د;->إ:Landroid/os/Handler;

    if-nez v0, :cond_1

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "BmtvCaptureBg"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lڝږ؁ڋ/د;->إ:Landroid/os/Handler;

    :cond_1
    invoke-static {}, Lڝږ؁ڋ/د;->ء()V

    return-void
.end method

.method public static أ()V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lڝږ؁ڋ/د;->إ:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    const-string v0, "BmtvScreenCapture"

    const-string v1, "Capture stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
