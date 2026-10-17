.class final Lorg/boundarylab/installer/MainActivity$ProgressRingView;
.super Landroid/view/View;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/boundarylab/installer/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProgressRingView"
.end annotation


# instance fields
.field private final arc:Landroid/graphics/Paint;

.field private progress:I

.field private final text:Landroid/graphics/Paint;

.field private final track:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .line 601
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 595
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    .line 596
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    .line 597
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    .line 598
    const/4 v0, 0x0

    iput v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->progress:I

    .line 602
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 603
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 604
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    const/16 v2, 0xe4

    const/16 v3, 0xeb

    const/16 v4, 0xdf

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 605
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 606
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 607
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    const/16 v2, 0x6e

    const/16 v3, 0xcd

    const/16 v4, 0x22

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 608
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    const/16 v2, 0xe

    const/16 v3, 0x12

    const/16 v4, 0xc

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 609
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 610
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 611
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 620
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 621
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3d8f5c29    # 0.07f

    mul-float/2addr v0, v1

    const/high16 v1, 0x41900000    # 18.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 622
    .local v0, "stroke":F
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 623
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 624
    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, v0, v1

    const/high16 v3, 0x41000000    # 8.0f

    add-float/2addr v2, v3

    .line 625
    .local v2, "pad":F
    new-instance v3, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v2

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v2

    invoke-direct {v3, v2, v2, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object v7, v3

    .line 626
    .local v7, "oval":Landroid/graphics/RectF;
    const/4 v10, 0x0

    iget-object v11, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->track:Landroid/graphics/Paint;

    const/4 v8, 0x0

    const/high16 v9, 0x43b40000    # 360.0f

    move-object v6, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v6, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 627
    iget p1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->progress:I

    int-to-float p1, p1

    const v3, 0x40666666    # 3.6f

    mul-float v9, p1, v3

    iget-object v11, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->arc:Landroid/graphics/Paint;

    const/high16 v8, -0x3d4c0000    # -90.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 628
    iget-object p1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3e6147ae    # 0.22f

    mul-float/2addr v3, v4

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 629
    iget-object p1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    .line 630
    .local p1, "fm":Landroid/graphics/Paint$FontMetrics;
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v1

    iget v4, p1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iget v5, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v4, v5

    div-float/2addr v4, v1

    sub-float/2addr v3, v4

    .line 631
    .local v3, "y":F
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->progress:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v1

    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->text:Landroid/graphics/Paint;

    invoke-virtual {v6, v4, v5, v3, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 632
    return-void
.end method

.method setProgress(I)V
    .locals 2
    .param p1, "value"    # I

    .line 614
    const/16 v0, 0x64

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->progress:I

    .line 615
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->invalidate()V

    .line 616
    return-void
.end method
