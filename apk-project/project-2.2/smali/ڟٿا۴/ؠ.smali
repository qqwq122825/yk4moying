.class public final Lڟٿا۴/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# instance fields
.field public ؋:J

.field public final synthetic ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;


# direct methods
.method public constructor <init>(Lcom/lite/cloudfinder/hd/HDStreamService;)V
    .locals 2

    iput-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lڟٿا۴/ؠ;->؋:J

    return-void
.end method


# virtual methods
.method public final onImageAvailable(Landroid/media/ImageReader;)V
    .locals 6

    iget-object v0, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iget-boolean v0, v0, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_0
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/media/Image;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lڟٿا۴/ؠ;->؋:J

    sub-long/2addr v0, v2

    iget-object v2, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iget-wide v3, v2, Lcom/lite/cloudfinder/hd/HDStreamService;->ب:J

    cmp-long v0, v0, v3

    if-gez v0, :cond_3

    :try_start_1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/media/Image;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_2
    return-void

    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object v1

    if-nez v1, :cond_5

    iget-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iput-boolean v0, p1, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_4
    iget-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iput-boolean v0, p1, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    return-void

    :cond_5
    :try_start_3
    invoke-virtual {v1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object v2, p1, v0

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v3

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    invoke-virtual {v1}, Landroid/media/Image;->getWidth()I

    move-result v4

    mul-int/2addr v4, v3

    sub-int/2addr p1, v4

    invoke-virtual {v1}, Landroid/media/Image;->getWidth()I

    move-result v4

    div-int v3, p1, v3

    add-int/2addr v4, v3

    invoke-virtual {v1}, Landroid/media/Image;->getHeight()I

    move-result v3

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v3, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    if-lez p1, :cond_6

    invoke-virtual {v1}, Landroid/media/Image;->getWidth()I

    move-result p1

    invoke-virtual {v1}, Landroid/media/Image;->getHeight()I

    move-result v2

    invoke-static {v3, v0, v0, p1, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    move-object v3, p1

    :cond_6
    iget-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    sget-boolean p1, Lڝږ؁ڋ/ح;->؋:Z

    sget-boolean p1, Lڝږ؁ڋ/ح;->؋:Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catch_2
    move p1, v0

    :goto_0
    if-eqz p1, :cond_7

    :try_start_5
    iget-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-static {p1, v3}, Lcom/lite/cloudfinder/hd/HDStreamService;->؋(Lcom/lite/cloudfinder/hd/HDStreamService;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    move-object v3, p1

    :cond_7
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    const/16 v2, 0x4000

    invoke-direct {p1, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget-object v4, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iget v4, v4, Lcom/lite/cloudfinder/hd/HDStreamService;->ئ:I

    invoke-virtual {v3, v2, v4, p1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v2

    if-eqz v2, :cond_8

    const/4 v3, 0x6

    invoke-static {v3, p1}, Lڜٟٱڀ/؋;->؋(B[B)[B

    move-result-object p1

    invoke-virtual {v2, p1}, Lڜٟٱڀ/ؤ;->ء([B)V

    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lڟٿا۴/ؠ;->؋:J
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_3
    move-exception p1

    :try_start_6
    const-string v2, "HDStream"

    const-string v3, "frame error"

    invoke-static {v2, v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v1, :cond_9

    :goto_1
    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_9
    iget-object p1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iput-boolean v0, p1, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    return-void

    :goto_2
    if-eqz v1, :cond_a

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_a
    iget-object v1, p0, Lڟٿا۴/ؠ;->ؠ:Lcom/lite/cloudfinder/hd/HDStreamService;

    iput-boolean v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    throw p1
.end method
