.class public final Lڝږ؁ڋ/ق;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final ؋:[Landroid/graphics/PointF;

.field public final ؠ:[F

.field public final ء:Ljava/util/ArrayList;

.field public final آ:Landroid/graphics/Paint;

.field public final أ:Landroid/graphics/Paint;

.field public final ؤ:Landroid/graphics/Paint;

.field public إ:F

.field public ئ:F

.field public ا:F

.field public ب:F

.field public ة:F

.field public ت:Z

.field public ث:Lڝږ؁ڋ/ف;


# direct methods
.method public constructor <init>(Landroid/view/ContextThemeWrapper;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x9

    new-array v0, p1, [Landroid/graphics/PointF;

    iput-object v0, p0, Lڝږ؁ڋ/ق;->؋:[Landroid/graphics/PointF;

    new-array v0, p1, [F

    iput-object v0, p0, Lڝږ؁ڋ/ق;->ؠ:[F

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    iget-object v1, p0, Lڝږ؁ڋ/ق;->؋:[Landroid/graphics/PointF;

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lڝږ؁ڋ/ق;->آ:Landroid/graphics/Paint;

    const-string v1, "#99FFFFFF"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lڝږ؁ڋ/ق;->أ:Landroid/graphics/Paint;

    const-string v1, "#FFFFFF"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lڝږ؁ڋ/ق;->ؤ:Landroid/graphics/Paint;

    const-string v0, "#CCFFFFFF"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x41000000    # 8.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    return-void
.end method


# virtual methods
.method public getPatternString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    if-lez v1, :cond_0

    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    const/16 v2, 0x9

    iget-object v3, p0, Lڝږ؁ڋ/ق;->؋:[Landroid/graphics/PointF;

    if-ge v0, v2, :cond_3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v2, p0, Lڝږ؁ڋ/ق;->ؠ:[F

    aget v2, v2, v0

    const/4 v4, 0x0

    cmpl-float v4, v2, v4

    if-lez v4, :cond_0

    goto :goto_1

    :cond_0
    iget v2, p0, Lڝږ؁ڋ/ق;->ئ:F

    goto :goto_1

    :cond_1
    iget v2, p0, Lڝږ؁ڋ/ق;->إ:F

    :goto_1
    aget-object v3, v3, v0

    iget v4, v3, Landroid/graphics/PointF;->x:F

    iget v3, v3, Landroid/graphics/PointF;->y:F

    if-eqz v1, :cond_2

    iget-object v1, p0, Lڝږ؁ڋ/ق;->أ:Landroid/graphics/Paint;

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lڝږ؁ڋ/ق;->آ:Landroid/graphics/Paint;

    :goto_2
    invoke-virtual {p1, v4, v3, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, p0, Lڝږ؁ڋ/ق;->ؤ:Landroid/graphics/Paint;

    const/4 v10, 0x1

    const/4 v4, 0x2

    if-lt v0, v4, :cond_4

    move v0, v10

    :goto_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_4

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v4, v3, v4

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v5, v3, v5

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v7, v4, Landroid/graphics/PointF;->y:F

    iget v8, v5, Landroid/graphics/PointF;->x:F

    iget v9, v5, Landroid/graphics/PointF;->y:F

    move-object v4, p1

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_4
    iget-boolean v0, p0, Lڝږ؁ڋ/ق;->ت:Z

    if-eqz v0, :cond_5

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v10

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aget-object v0, v3, v0

    iget v5, v0, Landroid/graphics/PointF;->x:F

    iget v6, v0, Landroid/graphics/PointF;->y:F

    iget v7, p0, Lڝږ؁ڋ/ق;->ب:F

    iget v8, p0, Lڝږ؁ڋ/ق;->ة:F

    move-object v4, p1

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_5
    return-void
.end method

.method public final onSizeChanged(IIII)V
    .locals 7

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p3

    int-to-float p3, p3

    const p4, 0x3f1eb852    # 0.62f

    mul-float/2addr p3, p4

    const/high16 p4, 0x40000000    # 2.0f

    div-float v0, p3, p4

    int-to-float p1, p1

    sub-float/2addr p1, p3

    div-float/2addr p1, p4

    int-to-float p2, p2

    sub-float/2addr p2, p3

    div-float/2addr p2, p4

    const/4 p3, 0x0

    move p4, p3

    :goto_0
    const/4 v1, 0x3

    if-ge p4, v1, :cond_1

    move v2, p3

    :goto_1
    if-ge v2, v1, :cond_0

    mul-int/lit8 v3, p4, 0x3

    add-int/2addr v3, v2

    iget-object v4, p0, Lڝږ؁ڋ/ق;->؋:[Landroid/graphics/PointF;

    aget-object v4, v4, v3

    int-to-float v5, v2

    mul-float/2addr v5, v0

    add-float/2addr v5, p1

    int-to-float v6, p4

    mul-float/2addr v6, v0

    add-float/2addr v6, p2

    invoke-virtual {v4, v5, v6}, Landroid/graphics/PointF;->set(FF)V

    iget-object v4, p0, Lڝږ؁ڋ/ق;->ؠ:[F

    const/4 v5, 0x0

    aput v5, v4, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_1
    const p1, 0x3df5c28f    # 0.12f

    mul-float/2addr p1, v0

    iput p1, p0, Lڝږ؁ڋ/ق;->إ:F

    const p1, 0x3e3851ec    # 0.18f

    mul-float/2addr p1, v0

    iput p1, p0, Lڝږ؁ڋ/ق;->ئ:F

    const p1, 0x3ecccccd    # 0.4f

    mul-float/2addr v0, p1

    iput v0, p0, Lڝږ؁ڋ/ق;->ا:F

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    const/4 v5, 0x1

    if-eqz v2, :cond_7

    const/4 v6, 0x2

    if-eq v2, v5, :cond_1

    if-eq v2, v6, :cond_0

    const/4 v0, 0x3

    if-eq v2, v0, :cond_1

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-boolean p1, p0, Lڝږ؁ڋ/ق;->ت:Z

    if-nez p1, :cond_9

    return v3

    :cond_1
    iget-boolean p1, p0, Lڝږ؁ڋ/ق;->ت:Z

    if-nez p1, :cond_2

    return v3

    :cond_2
    iput-boolean v3, p0, Lڝږ؁ڋ/ق;->ت:Z

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p1, v6, :cond_6

    iget-object p1, p0, Lڝږ؁ڋ/ق;->ث:Lڝږ؁ڋ/ف;

    if-eqz p1, :cond_6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    check-cast p1, Lڙڧا/ء;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move v2, v3

    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_4

    if-lez v2, :cond_3

    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v5

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[PATTERN] Submitted: "

    const-string v4, " (length="

    invoke-static {v2, v1, v4}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "LockOverlay"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/ظ;

    iget-object v0, v0, Lڝږ؁ڋ/ظ;->أ:Lژة۪ڦضۆۿۡ/ح;

    if-eqz v0, :cond_5

    const-string v0, "pattern"

    invoke-static {v0, v1}, Lژة۪ڦضۆۿۡ/ح;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    iget-object v0, p1, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Lڝږ؁ڋ/ظ;

    iget-object v0, v0, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v2, 0x18

    invoke-direct {v1, v2, p1}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-wide/16 v6, 0x1f4

    invoke-virtual {v0, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_6
    new-instance p1, Lڝږ؁ڋ/ؾ;

    invoke-direct {p1, p0, v3}, Lڝږ؁ڋ/ؾ;-><init>(Lڝږ؁ڋ/ق;I)V

    const-wide/16 v0, 0x12c

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    :cond_7
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    iput-boolean v3, p0, Lڝږ؁ڋ/ق;->ت:Z

    :goto_1
    const/16 p1, 0x9

    if-ge v3, p1, :cond_8

    iget-object p1, p0, Lڝږ؁ڋ/ق;->ؠ:[F

    const/4 v2, 0x0

    aput v2, p1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iput-boolean v5, p0, Lڝږ؁ڋ/ق;->ت:Z

    :cond_9
    invoke-virtual {p0, v0, v1}, Lڝږ؁ڋ/ق;->؋(FF)V

    iput v0, p0, Lڝږ؁ڋ/ق;->ب:F

    iput v1, p0, Lڝږ؁ڋ/ق;->ة:F

    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return v5
.end method

.method public setOnDotSelected(Lڝږ؁ڋ/ـ;)V
    .locals 0

    return-void
.end method

.method public setOnPatternComplete(Lڝږ؁ڋ/ف;)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ق;->ث:Lڝږ؁ڋ/ف;

    return-void
.end method

.method public final ؋(FF)V
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/16 v2, 0x9

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    iget-object v3, p0, Lڝږ؁ڋ/ق;->؋:[Landroid/graphics/PointF;

    aget-object v3, v3, v1

    iget v4, v3, Landroid/graphics/PointF;->x:F

    sub-float v4, p1, v4

    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float v3, p2, v3

    mul-float/2addr v4, v4

    mul-float/2addr v3, v3

    add-float/2addr v3, v4

    iget v4, p0, Lڝږ؁ڋ/ق;->ا:F

    mul-float/2addr v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x2

    new-array p1, p1, [F

    iget p2, p0, Lڝږ؁ڋ/ق;->إ:F

    aput p2, p1, v0

    iget p2, p0, Lڝږ؁ڋ/ق;->ئ:F

    const/4 v2, 0x1

    aput p2, p1, v2

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v2, 0x96

    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p2, Lڝږ؁ڋ/ؿ;

    invoke-direct {p2, p0, v1, v0}, Lڝږ؁ڋ/ؿ;-><init>(Lڝږ؁ڋ/ق;II)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_2

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    return-void
.end method
