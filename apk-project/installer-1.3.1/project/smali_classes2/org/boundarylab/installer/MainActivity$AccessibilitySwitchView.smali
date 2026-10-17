.class final Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
.super Landroid/view/View;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/boundarylab/installer/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AccessibilitySwitchView"
.end annotation


# instance fields
.field private final animator:Ljava/lang/Runnable;

.field private forward:Z

.field private progress:F

.field private final thumb:Landroid/graphics/Paint;

.field private final track:Landroid/graphics/Paint;


# direct methods
.method static bridge synthetic -$$Nest$fgetforward(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->forward:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)F
    .locals 0

    iget p0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fputforward(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->forward:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;F)V
    .locals 0

    iput p1, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 413
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 385
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->track:Landroid/graphics/Paint;

    .line 386
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->thumb:Landroid/graphics/Paint;

    .line 387
    const/4 v0, 0x0

    iput v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    .line 388
    iput-boolean v1, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->forward:Z

    .line 389
    new-instance v0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;

    invoke-direct {v0, p0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;-><init>(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->animator:Ljava/lang/Runnable;

    .line 414
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->thumb:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 415
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->setElevation(F)V

    .line 416
    return-void
.end method

.method private static blue(I)I
    .locals 1
    .param p0, "color"    # I

    .line 452
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method private static green(I)I
    .locals 1
    .param p0, "color"    # I

    .line 451
    shr-int/lit8 v0, p0, 0x8

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private static red(I)I
    .locals 1
    .param p0, "color"    # I

    .line 450
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    return v0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 3

    .line 420
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 421
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->animator:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 422
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->animator:Ljava/lang/Runnable;

    const-wide/16 v1, 0x78

    invoke-virtual {p0, v0, v1, v2}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 423
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 427
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->animator:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 428
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 429
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 433
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 434
    const/16 v0, 0xd5

    const/16 v1, 0xe1

    const/16 v2, 0xcb

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    .line 435
    .local v0, "off":I
    const/16 v1, 0x82

    const/16 v2, 0xf6

    const/16 v3, 0x3b

    invoke-static {v3, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    .line 436
    .local v1, "on":I
    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->red(I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->red(I)I

    move-result v3

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->red(I)I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 437
    .local v2, "r":I
    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->green(I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->green(I)I

    move-result v4

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->green(I)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    iget v5, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 438
    .local v3, "g":I
    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->blue(I)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->blue(I)I

    move-result v5

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->blue(I)I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 439
    .local v4, "b":I
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->track:Landroid/graphics/Paint;

    invoke-static {v2, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 440
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    .line 441
    .local v5, "h":F
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->getWidth()I

    move-result v6

    int-to-float v6, v6

    .line 442
    .local v6, "w":F
    const v7, 0x3dcccccd    # 0.1f

    mul-float/2addr v7, v5

    const/high16 v8, 0x40400000    # 3.0f

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 443
    .local v7, "pad":F
    new-instance v8, Landroid/graphics/RectF;

    const/4 v9, 0x0

    invoke-direct {v8, v9, v9, v6, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 444
    .local v8, "pill":Landroid/graphics/RectF;
    const/high16 v9, 0x40000000    # 2.0f

    div-float v10, v5, v9

    div-float v11, v5, v9

    iget-object v12, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->track:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v10, v11, v12}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 445
    mul-float v10, v7, v9

    sub-float v10, v5, v10

    div-float/2addr v10, v9

    .line 446
    .local v10, "radius":F
    add-float v11, v7, v10

    sub-float v12, v6, v5

    iget v13, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->progress:F

    mul-float/2addr v12, v13

    add-float/2addr v11, v12

    .line 447
    .local v11, "cx":F
    div-float v9, v5, v9

    iget-object v12, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->thumb:Landroid/graphics/Paint;

    invoke-virtual {p1, v11, v9, v10, v12}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 448
    return-void
.end method
