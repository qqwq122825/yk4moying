.class public Lcom/google/android/material/carousel/CarouselLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
.source "SourceFile"

# interfaces
.implements Lنٍصے/ؠ;
.implements Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;


# instance fields
.field public ؋:I

.field public ؠ:I

.field public ء:I

.field public final آ:Lنٍصے/ؤ;

.field public أ:Lڃٷښـ۝ۼ/ؠ;

.field public ؤ:Lنٍصے/ث;

.field public إ:Lنٍصے/ت;

.field public ئ:I

.field public ا:Ljava/util/HashMap;

.field public ب:Lنٍصے/ا;

.field public final ة:Lنٍصے/ء;

.field public ت:I

.field public ث:I

.field public ج:I


# direct methods
.method public constructor <init>()V
    .locals 3

    new-instance v0, Lنٍصے/ج;

    invoke-direct {v0}, Lنٍصے/ج;-><init>()V

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;-><init>()V

    new-instance v1, Lنٍصے/ؤ;

    invoke-direct {v1}, Lنٍصے/ؤ;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->آ:Lنٍصے/ؤ;

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    new-instance v2, Lنٍصے/ء;

    invoke-direct {v2, v1, p0}, Lنٍصے/ء;-><init>(ILcom/google/android/material/carousel/CarouselLayoutManager;)V

    iput-object v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة:Lنٍصے/ء;

    const/4 v2, -0x1

    iput v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث:I

    iput v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج:I

    iput-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ:Lڃٷښـ۝ۼ/ؠ;

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    invoke-virtual {p0, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->setOrientation(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnknownNullness"
        }
    .end annotation

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;-><init>()V

    new-instance p3, Lنٍصے/ؤ;

    invoke-direct {p3}, Lنٍصے/ؤ;-><init>()V

    iput-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->آ:Lنٍصے/ؤ;

    const/4 p3, 0x0

    iput p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    new-instance p4, Lنٍصے/ء;

    const/4 v0, 0x1

    invoke-direct {p4, v0, p0}, Lنٍصے/ء;-><init>(ILcom/google/android/material/carousel/CarouselLayoutManager;)V

    iput-object p4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة:Lنٍصے/ء;

    const/4 p4, -0x1

    iput p4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث:I

    iput p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج:I

    new-instance p4, Lنٍصے/ج;

    invoke-direct {p4}, Lنٍصے/ج;-><init>()V

    iput-object p4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ:Lڃٷښـ۝ۼ/ؠ;

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    if-eqz p2, :cond_0

    sget-object p4, Lؾٿټڷ/؋;->ؠ:[I

    invoke-virtual {p1, p2, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, p3, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج:I

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    invoke-virtual {p1, p3, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->setOrientation(I)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_0
    return-void
.end method

.method public static ب(FLآۋۻؾ۹/ة;)F
    .locals 3

    iget-object v0, p1, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lنٍصے/ة;

    iget v1, v0, Lنٍصے/ة;->آ:F

    iget-object p1, p1, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast p1, Lنٍصے/ة;

    iget v2, p1, Lنٍصے/ة;->آ:F

    iget v0, v0, Lنٍصے/ة;->ؠ:F

    iget p1, p1, Lنٍصے/ة;->ؠ:F

    invoke-static {v1, v2, v0, p1, p0}, Lؿ١ڔظۇٟؗٞ/؋;->؋(FFFFF)F

    move-result p0

    return p0
.end method

.method public static ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;
    .locals 13

    const/4 v0, -0x1

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    const v2, -0x800001

    const/4 v3, 0x0

    move v6, v0

    move v7, v6

    move v8, v7

    move v9, v8

    move v4, v2

    move v5, v3

    move v2, v1

    move v3, v2

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_5

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lنٍصے/ة;

    if-eqz p2, :cond_0

    iget v10, v10, Lنٍصے/ة;->ؠ:F

    goto :goto_1

    :cond_0
    iget v10, v10, Lنٍصے/ة;->؋:F

    :goto_1
    sub-float v11, v10, p0

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpg-float v12, v10, p0

    if-gtz v12, :cond_1

    cmpg-float v12, v11, v1

    if-gtz v12, :cond_1

    move v6, v5

    move v1, v11

    :cond_1
    cmpl-float v12, v10, p0

    if-lez v12, :cond_2

    cmpg-float v12, v11, v2

    if-gtz v12, :cond_2

    move v8, v5

    move v2, v11

    :cond_2
    cmpg-float v11, v10, v3

    if-gtz v11, :cond_3

    move v7, v5

    move v3, v10

    :cond_3
    cmpl-float v11, v10, v4

    if-lez v11, :cond_4

    move v9, v5

    move v4, v10

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    if-ne v6, v0, :cond_6

    move v6, v7

    :cond_6
    if-ne v8, v0, :cond_7

    move v8, v9

    :cond_7
    new-instance p0, Lآۋۻؾ۹/ة;

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lنٍصے/ة;

    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lنٍصے/ة;

    invoke-direct {p0, p2, p1}, Lآۋۻؾ۹/ة;-><init>(Lنٍصے/ة;Lنٍصے/ة;)V

    return-object p0
.end method


# virtual methods
.method public final canScrollHorizontally()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    return v0
.end method

.method public final canScrollVertically()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final computeHorizontalScrollExtent(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 2

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    iget-object v0, v0, Lنٍصے/ث;->؋:Lنٍصے/ت;

    iget v0, v0, Lنٍصے/ت;->؋:F

    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->computeHorizontalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final computeHorizontalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 0

    iget p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    return p1
.end method

.method public final computeHorizontalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1

    iget p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    sub-int/2addr p1, v0

    return p1
.end method

.method public final computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة(ILنٍصے/ت;)I

    move-result p1

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/graphics/PointF;

    int-to-float p1, p1

    invoke-direct {v0, p1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0

    :cond_1
    new-instance v0, Landroid/graphics/PointF;

    int-to-float p1, p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public final computeVerticalScrollExtent(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 2

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    iget-object v0, v0, Lنٍصے/ث;->؋:Lنٍصے/ت;

    iget v0, v0, Lنٍصے/ت;->؋:F

    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->computeVerticalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final computeVerticalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 0

    iget p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    return p1
.end method

.method public final computeVerticalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1

    iget p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    sub-int/2addr p1, v0

    return p1
.end method

.method public final generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .locals 2

    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public final getDecoratedBoundsWithMargins(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 4

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedBoundsWithMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    int-to-float p1, p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object v0, v0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب(FLآۋۻؾ۹/ة;)F

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, p1

    div-float/2addr v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, p1

    div-float/2addr v2, v1

    :goto_1
    iget p1, p2, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    add-float/2addr p1, v0

    float-to-int p1, p1

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    add-float/2addr v1, v2

    float-to-int v1, v1

    iget v3, p2, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float/2addr v3, v0

    float-to-int v0, v3

    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, v2

    float-to-int v2, v3

    invoke-virtual {p2, p1, v1, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final measureChildWithMargins(Landroid/view/View;II)V
    .locals 0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة:Lنٍصے/ء;

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    iget-object p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة:Lنٍصے/ء;

    invoke-virtual {p1, p2}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final onFocusSearchFailed(Landroid/view/View;ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)Landroid/view/View;
    .locals 5

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p4

    const/4 v0, 0x0

    if-nez p4, :cond_0

    return-object v0

    :cond_0
    iget-object p4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    iget p4, p4, Lنٍصے/ا;->؋:I

    const/4 v1, -0x1

    const/high16 v2, -0x80000000

    const/4 v3, 0x1

    if-eq p2, v3, :cond_7

    const/4 v4, 0x2

    if-eq p2, v4, :cond_6

    const/16 v4, 0x11

    if-eq p2, v4, :cond_4

    const/16 v4, 0x21

    if-eq p2, v4, :cond_3

    const/16 v4, 0x42

    if-eq p2, v4, :cond_2

    const/16 v4, 0x82

    if-eq p2, v4, :cond_1

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v4, "Unknown focus request:"

    invoke-direct {p4, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p4, "CarouselLayoutManager"

    invoke-static {p4, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    if-ne p4, v3, :cond_5

    goto :goto_1

    :cond_2
    if-nez p4, :cond_5

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p2

    if-eqz p2, :cond_6

    goto :goto_2

    :cond_3
    if-ne p4, v3, :cond_5

    goto :goto_2

    :cond_4
    if-nez p4, :cond_5

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p2

    if-eqz p2, :cond_7

    goto :goto_1

    :cond_5
    :goto_0
    move p2, v2

    goto :goto_3

    :cond_6
    :goto_1
    move p2, v3

    goto :goto_3

    :cond_7
    :goto_2
    move p2, v1

    :goto_3
    if-ne p2, v2, :cond_8

    return-object v0

    :cond_8
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    const/4 p4, 0x0

    if-ne p2, v1, :cond_d

    if-nez p1, :cond_9

    return-object v0

    :cond_9
    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    sub-int/2addr p1, v3

    if-ltz p1, :cond_b

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result p2

    if-lt p1, p2, :cond_a

    goto :goto_4

    :cond_a
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ(I)F

    move-result p2

    invoke-virtual {p0, p3, p2, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ذ(Landroidx/recyclerview/widget/RecyclerView$Recycler;FI)Lنٍصے/أ;

    move-result-object p1

    iget-object p2, p1, Lنٍصے/أ;->؋:Landroid/view/View;

    invoke-virtual {p0, p2, p4, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋(Landroid/view/View;ILنٍصے/أ;)V

    :cond_b
    :goto_4
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p1

    if-eqz p1, :cond_c

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p1

    add-int/lit8 p4, p1, -0x1

    :cond_c
    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    goto :goto_7

    :cond_d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result p2

    sub-int/2addr p2, v3

    if-ne p1, p2, :cond_e

    return-object v0

    :cond_e
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p1

    sub-int/2addr p1, v3

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    add-int/2addr p1, v3

    if-ltz p1, :cond_10

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result p2

    if-lt p1, p2, :cond_f

    goto :goto_5

    :cond_f
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ(I)F

    move-result p2

    invoke-virtual {p0, p3, p2, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ذ(Landroidx/recyclerview/widget/RecyclerView$Recycler;FI)Lنٍصے/أ;

    move-result-object p1

    iget-object p2, p1, Lنٍصے/أ;->؋:Landroid/view/View;

    invoke-virtual {p0, p2, v1, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋(Landroid/view/View;ILنٍصے/أ;)V

    :cond_10
    :goto_5
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p1

    if-eqz p1, :cond_11

    goto :goto_6

    :cond_11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p1

    add-int/lit8 p4, p1, -0x1

    :goto_6
    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    :goto_7
    return-object p1
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    :cond_0
    return-void
.end method

.method public final onItemsAdded(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onItemsAdded(Landroidx/recyclerview/widget/RecyclerView;II)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result p1

    iget p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت:I

    if-eq p1, p2, :cond_2

    iget-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ:Lڃٷښـ۝ۼ/ؠ;

    invoke-virtual {p3, p0, p2}, Lڃٷښـ۝ۼ/ؠ;->ز(Lنٍصے/ؠ;I)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    :cond_1
    iput p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت:I

    :cond_2
    :goto_0
    return-void
.end method

.method public final onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result p1

    iget p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت:I

    if-eq p1, p2, :cond_2

    iget-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ:Lڃٷښـ۝ۼ/ؠ;

    invoke-virtual {p3, p0, p2}, Lڃٷښـ۝ۼ/ؠ;->ز(Lنٍصے/ؠ;I)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    :cond_1
    iput p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت:I

    :cond_2
    :goto_0
    return-void
.end method

.method public final onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 16

    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_1a

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result v1

    int-to-float v1, v1

    const/4 v3, 0x0

    cmpg-float v1, v1, v3

    if-gtz v1, :cond_0

    goto/16 :goto_11

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v1

    iget-object v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    const/4 v4, 0x1

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_0

    :cond_1
    move v3, v2

    :goto_0
    if-eqz v3, :cond_2

    invoke-virtual/range {p0 .. p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ر(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    :cond_2
    iget-object v5, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v6

    const/4 v7, -0x1

    if-eqz v6, :cond_3

    iget-object v5, v5, Lنٍصے/ث;->ء:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v8, v7

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lنٍصے/ت;

    goto :goto_1

    :cond_3
    iget-object v5, v5, Lنٍصے/ث;->ؠ:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v8, v7

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lنٍصے/ت;

    :goto_1
    if-eqz v6, :cond_4

    invoke-virtual {v5}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v8

    goto :goto_2

    :cond_4
    invoke-virtual {v5}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v8

    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingStart()I

    move-result v9

    if-eqz v6, :cond_5

    move v6, v4

    goto :goto_3

    :cond_5
    move v6, v7

    :goto_3
    mul-int/2addr v9, v6

    int-to-float v6, v9

    iget v8, v8, Lنٍصے/ة;->؋:F

    iget v5, v5, Lنٍصے/ت;->؋:F

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v5, v9

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v9

    if-eqz v9, :cond_6

    add-float/2addr v8, v5

    goto :goto_4

    :cond_6
    sub-float/2addr v8, v5

    :goto_4
    iget-object v5, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v5}, Lنٍصے/ا;->ؤ()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v6, v5

    sub-float/2addr v6, v8

    float-to-int v5, v6

    iget-object v6, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v8

    if-eqz v8, :cond_7

    iget-object v6, v6, Lنٍصے/ث;->ؠ:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    add-int/2addr v9, v7

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lنٍصے/ت;

    goto :goto_5

    :cond_7
    iget-object v6, v6, Lنٍصے/ث;->ء:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    add-int/2addr v9, v7

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lنٍصے/ت;

    :goto_5
    if-eqz v8, :cond_8

    invoke-virtual {v6}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v9

    goto :goto_6

    :cond_8
    invoke-virtual {v6}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v9

    :goto_6
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v10

    add-int/2addr v10, v7

    int-to-float v10, v10

    iget v6, v6, Lنٍصے/ت;->؋:F

    mul-float/2addr v10, v6

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingEnd()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v10, v6

    if-eqz v8, :cond_9

    const/high16 v6, -0x40800000    # -1.0f

    goto :goto_7

    :cond_9
    const/high16 v6, 0x3f800000    # 1.0f

    :goto_7
    mul-float/2addr v10, v6

    iget v6, v9, Lنٍصے/ة;->؋:F

    iget-object v11, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v11}, Lنٍصے/ا;->ؤ()I

    move-result v11

    int-to-float v11, v11

    sub-float/2addr v6, v11

    iget-object v11, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v11}, Lنٍصے/ا;->ء()I

    move-result v11

    int-to-float v11, v11

    iget v9, v9, Lنٍصے/ة;->؋:F

    sub-float/2addr v11, v9

    sub-float/2addr v10, v6

    add-float/2addr v10, v11

    float-to-int v6, v10

    if-eqz v8, :cond_a

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    goto :goto_8

    :cond_a
    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    :goto_8
    if-eqz v1, :cond_b

    move v8, v6

    goto :goto_9

    :cond_b
    move v8, v5

    :goto_9
    iput v8, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    if-eqz v1, :cond_c

    move v6, v5

    :cond_c
    iput v6, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    if-eqz v3, :cond_17

    iput v5, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget-object v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v3

    iget v5, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    iget v6, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v8

    iget-object v9, v1, Lنٍصے/ث;->؋:Lنٍصے/ت;

    iget v9, v9, Lنٍصے/ت;->؋:F

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    move v11, v2

    move v12, v11

    :goto_a
    if-ge v11, v3, :cond_11

    if-eqz v8, :cond_d

    sub-int v13, v3, v11

    sub-int/2addr v13, v4

    goto :goto_b

    :cond_d
    move v13, v11

    :goto_b
    int-to-float v14, v13

    mul-float/2addr v14, v9

    if-eqz v8, :cond_e

    move v15, v7

    goto :goto_c

    :cond_e
    move v15, v4

    :goto_c
    int-to-float v15, v15

    mul-float/2addr v14, v15

    int-to-float v15, v6

    iget v7, v1, Lنٍصے/ث;->إ:F

    sub-float/2addr v15, v7

    cmpl-float v7, v14, v15

    iget-object v14, v1, Lنٍصے/ث;->ء:Ljava/util/List;

    if-gtz v7, :cond_f

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v7

    sub-int v7, v3, v7

    if-lt v11, v7, :cond_10

    :cond_f
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v13

    sub-int/2addr v13, v4

    invoke-static {v12, v2, v13}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result v13

    invoke-interface {v14, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lنٍصے/ت;

    invoke-virtual {v10, v7, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v12, v12, 0x1

    :cond_10
    add-int/lit8 v11, v11, 0x1

    const/4 v7, -0x1

    goto :goto_a

    :cond_11
    add-int/lit8 v6, v3, -0x1

    move v7, v2

    :goto_d
    if-ltz v6, :cond_16

    if-eqz v8, :cond_12

    sub-int v11, v3, v6

    sub-int/2addr v11, v4

    goto :goto_e

    :cond_12
    move v11, v6

    :goto_e
    int-to-float v12, v11

    mul-float/2addr v12, v9

    if-eqz v8, :cond_13

    const/4 v13, -0x1

    goto :goto_f

    :cond_13
    move v13, v4

    :goto_f
    int-to-float v13, v13

    mul-float/2addr v12, v13

    int-to-float v13, v5

    iget v14, v1, Lنٍصے/ث;->ؤ:F

    add-float/2addr v13, v14

    cmpg-float v12, v12, v13

    iget-object v13, v1, Lنٍصے/ث;->ؠ:Ljava/util/List;

    if-ltz v12, :cond_14

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v12

    if-ge v6, v12, :cond_15

    :cond_14
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v12

    sub-int/2addr v12, v4

    invoke-static {v7, v2, v12}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result v12

    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lنٍصے/ت;

    invoke-virtual {v10, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    :cond_15
    add-int/lit8 v6, v6, -0x1

    goto :goto_d

    :cond_16
    iput-object v10, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا:Ljava/util/HashMap;

    iget v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_17

    invoke-virtual {v0, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة(ILنٍصے/ت;)I

    move-result v1

    iput v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    :cond_17
    iget v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    iget v4, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    add-int/lit8 v5, v1, 0x0

    if-ge v5, v3, :cond_18

    sub-int/2addr v3, v1

    goto :goto_10

    :cond_18
    if-le v5, v4, :cond_19

    sub-int v3, v4, v1

    goto :goto_10

    :cond_19
    move v3, v2

    :goto_10
    add-int/2addr v3, v1

    iput v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    invoke-static {v1, v2, v3}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result v1

    iput v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    iget-object v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual {v0, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->س(Lنٍصے/ث;)V

    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    invoke-virtual/range {p0 .. p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v1

    iput v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت:I

    return-void

    :cond_1a
    :goto_11
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->removeAndRecycleAllViews(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    iput v2, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    return-void
.end method

.method public final onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iput v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    :goto_0
    return-void
.end method

.method public final requestChildRectangleOnScreen(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z
    .locals 3

    iget-object p3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    const/4 p4, 0x0

    if-nez p3, :cond_0

    return p4

    :cond_0
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p3

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p5

    invoke-virtual {p0, p5}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object p5

    invoke-virtual {p0, p3, p5}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت(ILنٍصے/ت;)I

    move-result p3

    if-nez p3, :cond_1

    return p4

    :cond_1
    iget p5, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    iget v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    add-int v2, p5, p3

    if-ge v2, v0, :cond_2

    sub-int p3, v0, p5

    goto :goto_0

    :cond_2
    if-le v2, v1, :cond_3

    sub-int p3, v1, p5

    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    add-int/2addr p5, p3

    int-to-float p3, p5

    int-to-float p5, v0

    int-to-float v0, v1

    invoke-virtual {v2, p3, p5, v0}, Lنٍصے/ث;->؋(FFF)Lنٍصے/ت;

    move-result-object p3

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p2

    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ت(ILنٍصے/ت;)I

    move-result p2

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {p1, p2, p4}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    goto :goto_1

    :cond_4
    invoke-virtual {p1, p4, p2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public final scrollBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 10

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    if-nez p1, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-nez v0, :cond_1

    invoke-virtual {p0, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ر(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    :cond_1
    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    iget v3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    add-int v4, v0, p1

    if-ge v4, v2, :cond_2

    sub-int p1, v2, v0

    goto :goto_0

    :cond_2
    if-le v4, v3, :cond_3

    sub-int p1, v3, v0

    :cond_3
    :goto_0
    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual {p0, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->س(Lنٍصے/ث;)V

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v0, v0, Lنٍصے/ت;->؋:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ(I)F

    move-result v2

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    invoke-virtual {v4}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v4

    goto :goto_1

    :cond_4
    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    invoke-virtual {v4}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v4

    :goto_1
    iget v4, v4, Lنٍصے/ة;->ؠ:F

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    move v6, v1

    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v7

    if-ge v6, v7, :cond_6

    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {p0, v2, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result v8

    iget-object v9, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object v9, v9, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-static {v8, v9, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;

    move-result-object v9

    invoke-virtual {p0, v7, v8, v9}, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ(Landroid/view/View;FLآۋۻؾ۹/ة;)F

    move-result v8

    invoke-super {p0, v7, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedBoundsWithMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v9, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v9, v0, v8, v3, v7}, Lنٍصے/ا;->ا(FFLandroid/graphics/Rect;Landroid/view/View;)V

    sub-float v8, v4, v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    if-eqz v7, :cond_5

    cmpg-float v9, v8, v5

    if-gez v9, :cond_5

    invoke-virtual {p0, v7}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v5

    iput v5, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث:I

    move v5, v8

    :cond_5
    iget-object v7, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v7, v7, Lنٍصے/ت;->؋:F

    invoke-virtual {p0, v2, v7}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result v2

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_6
    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    return p1

    :cond_7
    :goto_3
    return v1
.end method

.method public final scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->scrollBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final scrollToPosition(I)V
    .locals 2

    iput p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث:I

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة(ILنٍصے/ت;)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p1, v1, v0}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    iget-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->س(Lنٍصے/ث;)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->requestLayout()V

    return-void
.end method

.method public final scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->scrollBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final setOrientation(I)V
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid orientation:"

    invoke-static {v1, p1}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    if-eqz v1, :cond_2

    iget v1, v1, Lنٍصے/ا;->؋:I

    if-eq p1, v1, :cond_5

    :cond_2
    if-eqz p1, :cond_4

    if-ne p1, v0, :cond_3

    new-instance p1, Lنٍصے/إ;

    invoke-direct {p1, p0}, Lنٍصے/إ;-><init>(Lcom/google/android/material/carousel/CarouselLayoutManager;)V

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "invalid orientation"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Lنٍصے/ئ;

    invoke-direct {p1, p0}, Lنٍصے/ئ;-><init>(Lcom/google/android/material/carousel/CarouselLayoutManager;)V

    :goto_1
    iput-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ز()V

    :cond_5
    return-void
.end method

.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;I)V
    .locals 0

    new-instance p2, Lنٍصے/آ;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lنٍصے/آ;-><init>(Lcom/google/android/material/carousel/CarouselLayoutManager;Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    return-void
.end method

.method public final ؋(Landroid/view/View;ILنٍصے/أ;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v0, v0, Lنٍصے/ت;->؋:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->addView(Landroid/view/View;I)V

    iget p2, p3, Lنٍصے/أ;->ؠ:F

    sub-float p3, p2, v0

    float-to-int p3, p3

    add-float/2addr p2, v0

    float-to-int p2, p2

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v0, p1, p3, p2}, Lنٍصے/ا;->ئ(Landroid/view/View;II)V

    return-void
.end method

.method public final ؠ(FF)F
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v0

    if-eqz v0, :cond_0

    sub-float/2addr p1, p2

    goto :goto_0

    :cond_0
    add-float/2addr p1, p2

    :goto_0
    return p1
.end method

.method public final ء(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 5

    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ(I)F

    move-result v0

    :goto_0
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-ge p1, v1, :cond_2

    invoke-virtual {p0, p2, v0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ذ(Landroidx/recyclerview/widget/RecyclerView$Recycler;FI)Lنٍصے/أ;

    move-result-object v1

    iget v2, v1, Lنٍصے/أ;->ؠ:F

    iget-object v3, v1, Lنٍصے/أ;->ء:Lآۋۻؾ۹/ة;

    invoke-virtual {p0, v2, v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->خ(FLآۋۻؾ۹/ة;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_2

    :cond_0
    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v4, v4, Lنٍصے/ت;->؋:F

    invoke-virtual {p0, v0, v4}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result v0

    invoke-virtual {p0, v2, v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->د(FLآۋۻؾ۹/ة;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v2, v1, Lنٍصے/أ;->؋:Landroid/view/View;

    const/4 v3, -0x1

    invoke-virtual {p0, v2, v3, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋(Landroid/view/View;ILنٍصے/أ;)V

    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    return-void
.end method

.method public final آ(Landroidx/recyclerview/widget/RecyclerView$Recycler;I)V
    .locals 6

    invoke-virtual {p0, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ(I)F

    move-result v0

    :goto_0
    if-ltz p2, :cond_3

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ذ(Landroidx/recyclerview/widget/RecyclerView$Recycler;FI)Lنٍصے/أ;

    move-result-object v1

    iget v2, v1, Lنٍصے/أ;->ؠ:F

    iget-object v3, v1, Lنٍصے/أ;->ء:Lآۋۻؾ۹/ة;

    invoke-virtual {p0, v2, v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->د(FLآۋۻؾ۹/ة;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_3

    :cond_0
    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v4, v4, Lنٍصے/ت;->؋:F

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v5

    if-eqz v5, :cond_1

    add-float/2addr v0, v4

    goto :goto_1

    :cond_1
    sub-float/2addr v0, v4

    :goto_1
    invoke-virtual {p0, v2, v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->خ(FLآۋۻؾ۹/ة;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    iget-object v2, v1, Lنٍصے/أ;->؋:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋(Landroid/view/View;ILنٍصے/أ;)V

    :goto_2
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_3
    :goto_3
    return-void
.end method

.method public final أ(Landroid/view/View;FLآۋۻؾ۹/ة;)F
    .locals 4

    iget-object v0, p3, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lنٍصے/ة;

    iget v1, v0, Lنٍصے/ة;->ؠ:F

    iget-object v2, p3, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast v2, Lنٍصے/ة;

    iget v3, v2, Lنٍصے/ة;->ؠ:F

    iget v0, v0, Lنٍصے/ة;->؋:F

    iget v2, v2, Lنٍصے/ة;->؋:F

    invoke-static {v1, v3, v0, v2, p2}, Lؿ١ڔظۇٟؗٞ/؋;->؋(FFFFF)F

    move-result v0

    iget-object v1, p3, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lنٍصے/ة;

    iget-object v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    invoke-virtual {v2}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v2

    if-eq v1, v2, :cond_0

    iget-object v1, p3, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v1, Lنٍصے/ة;

    iget-object v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    invoke-virtual {v2}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v2

    if-ne v1, v2, :cond_1

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    iget-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v1, p1}, Lنٍصے/ا;->؋(Landroidx/recyclerview/widget/RecyclerView$LayoutParams;)F

    move-result p1

    iget-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v1, v1, Lنٍصے/ت;->؋:F

    div-float/2addr p1, v1

    iget-object p3, p3, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast p3, Lنٍصے/ة;

    iget v1, p3, Lنٍصے/ة;->؋:F

    sub-float/2addr p2, v1

    iget p3, p3, Lنٍصے/ة;->ء:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p3

    add-float/2addr v1, p1

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    :cond_1
    return v0
.end method

.method public final ؤ(I)F
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    invoke-virtual {v0}, Lنٍصے/ا;->ؤ()I

    move-result v0

    iget v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v1, v1, Lنٍصے/ت;->؋:F

    int-to-float p1, p1

    mul-float/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result p1

    return p1
.end method

.method public final إ(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 5

    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-super {p0, v0, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedBoundsWithMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    :goto_1
    int-to-float v3, v3

    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object v4, v4, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-static {v3, v4, v2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/google/android/material/carousel/CarouselLayoutManager;->د(FLآۋۻؾ۹/ة;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    goto :goto_0

    :cond_1
    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    if-ltz v0, :cond_3

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-super {p0, v0, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedBoundsWithMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    goto :goto_3

    :cond_2
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    :goto_3
    int-to-float v3, v3

    iget-object v4, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object v4, v4, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-static {v3, v4, v2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/google/android/material/carousel/CarouselLayoutManager;->خ(FLآۋۻؾ۹/ة;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    goto :goto_2

    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->آ(Landroidx/recyclerview/widget/RecyclerView$Recycler;I)V

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ:I

    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    goto :goto_4

    :cond_4
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->آ(Landroidx/recyclerview/widget/RecyclerView$Recycler;I)V

    add-int/2addr v1, v2

    invoke-virtual {p0, v1, p1, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    :goto_4
    return-void
.end method

.method public final ئ()I
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v0

    return v0
.end method

.method public final ا(I)Lنٍصے/ت;
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p1, v2, v1}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lنٍصے/ت;

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    iget-object p1, p1, Lنٍصے/ث;->؋:Lنٍصے/ت;

    return-object p1
.end method

.method public final ة(ILنٍصے/ت;)I
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v2

    iget v2, v2, Lنٍصے/ة;->؋:F

    sub-float/2addr v0, v2

    int-to-float p1, p1

    iget p2, p2, Lنٍصے/ت;->؋:F

    mul-float/2addr p1, p2

    sub-float/2addr v0, p1

    div-float/2addr p2, v1

    sub-float/2addr v0, p2

    float-to-int p1, v0

    return p1

    :cond_0
    int-to-float p1, p1

    iget v0, p2, Lنٍصے/ت;->؋:F

    mul-float/2addr p1, v0

    invoke-virtual {p2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v0

    iget v0, v0, Lنٍصے/ة;->؋:F

    sub-float/2addr p1, v0

    iget p2, p2, Lنٍصے/ت;->؋:F

    div-float/2addr p2, v1

    add-float/2addr p2, p1

    float-to-int p1, p2

    return p1
.end method

.method public final ت(ILنٍصے/ت;)I
    .locals 6

    iget v0, p2, Lنٍصے/ت;->آ:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p2, Lنٍصے/ت;->ؠ:Ljava/util/List;

    iget v2, p2, Lنٍصے/ت;->ء:I

    invoke-interface {v1, v2, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const v1, 0x7fffffff

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lنٍصے/ة;

    int-to-float v3, p1

    iget v4, p2, Lنٍصے/ت;->؋:F

    mul-float/2addr v3, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float/2addr v4, v3

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result v3

    int-to-float v3, v3

    iget v2, v2, Lنٍصے/ة;->؋:F

    sub-float/2addr v3, v2

    sub-float/2addr v3, v4

    float-to-int v2, v3

    goto :goto_1

    :cond_1
    iget v2, v2, Lنٍصے/ة;->؋:F

    sub-float/2addr v4, v2

    float-to-int v2, v4

    :goto_1
    iget v3, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    sub-int/2addr v2, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-le v3, v4, :cond_0

    move v1, v2

    goto :goto_0

    :cond_2
    return v1
.end method

.method public final ج()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب:Lنٍصے/ا;

    iget v0, v0, Lنٍصے/ا;->؋:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ح()Z
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final خ(FLآۋۻؾ۹/ة;)Z
    .locals 1

    invoke-static {p1, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب(FLآۋۻؾ۹/ة;)F

    move-result p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v0

    if-eqz v0, :cond_0

    add-float/2addr p1, p2

    goto :goto_0

    :cond_0
    sub-float/2addr p1, p2

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_2

    :goto_1
    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    const/4 p1, 0x0

    :goto_2
    return p1
.end method

.method public final د(FLآۋۻؾ۹/ة;)Z
    .locals 1

    invoke-static {p1, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ب(FLآۋۻؾ۹/ة;)F

    move-result p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method public final ذ(Landroidx/recyclerview/widget/RecyclerView$Recycler;FI)Lنٍصے/أ;
    .locals 2

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p3, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget v0, v0, Lنٍصے/ت;->؋:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0, p2, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ(FF)F

    move-result p2

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object v0, v0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-static {p2, v0, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ث(FLjava/util/List;Z)Lآۋۻؾ۹/ة;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ(Landroid/view/View;FLآۋۻؾ۹/ة;)F

    move-result v0

    new-instance v1, Lنٍصے/أ;

    invoke-direct {v1, p1, p2, v0, p3}, Lنٍصے/أ;-><init>(Landroid/view/View;FFLآۋۻؾ۹/ة;)V

    return-object v1
.end method

.method public final ر(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V
    .locals 27

    move-object/from16 v0, p0

    const/4 v1, 0x0

    move-object/from16 v2, p1

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2, v1, v1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    iget-object v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->أ:Lڃٷښـ۝ۼ/ؠ;

    invoke-virtual {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->د(Lنٍصے/ؠ;Landroid/view/View;)Lنٍصے/ت;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ئ()I

    move-result v3

    int-to-float v3, v3

    new-instance v12, Lنٍصے/ب;

    iget v6, v2, Lنٍصے/ت;->؋:F

    invoke-direct {v12, v6, v3}, Lنٍصے/ب;-><init>(FF)V

    invoke-virtual {v2}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v6

    iget v6, v6, Lنٍصے/ة;->ؠ:F

    sub-float/2addr v3, v6

    invoke-virtual {v2}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v6

    iget v6, v6, Lنٍصے/ة;->آ:F

    div-float/2addr v6, v4

    sub-float/2addr v3, v6

    iget-object v13, v2, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v5

    move v14, v6

    :goto_0
    if-ltz v14, :cond_1

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Lنٍصے/ة;

    iget v9, v15, Lنٍصے/ة;->آ:F

    div-float v6, v9, v4

    add-float v7, v6, v3

    iget v6, v2, Lنٍصے/ت;->ء:I

    if-lt v14, v6, :cond_0

    iget v6, v2, Lنٍصے/ت;->آ:I

    if-gt v14, v6, :cond_0

    move v10, v5

    goto :goto_1

    :cond_0
    move v10, v1

    :goto_1
    iget v8, v15, Lنٍصے/ة;->ء:F

    iget-boolean v11, v15, Lنٍصے/ة;->أ:Z

    move-object v6, v12

    invoke-virtual/range {v6 .. v11}, Lنٍصے/ب;->؋(FFFZZ)V

    iget v6, v15, Lنٍصے/ة;->آ:F

    add-float/2addr v3, v6

    add-int/lit8 v14, v14, -0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v12}, Lنٍصے/ب;->آ()Lنٍصے/ت;

    move-result-object v2

    :cond_2
    new-instance v3, Lنٍصے/ث;

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v6, v1

    :goto_2
    iget-object v7, v2, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    const/4 v14, -0x1

    iget-object v15, v2, Lنٍصے/ت;->ؠ:Ljava/util/List;

    if-ge v6, v7, :cond_4

    invoke-interface {v15, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lنٍصے/ة;

    iget-boolean v7, v7, Lنٍصے/ة;->أ:Z

    if-nez v7, :cond_3

    goto :goto_3

    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_4
    move v6, v14

    :goto_3
    invoke-virtual {v2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v7

    iget v7, v7, Lنٍصے/ة;->ؠ:F

    invoke-virtual {v2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v8

    iget v8, v8, Lنٍصے/ة;->آ:F

    div-float/2addr v8, v4

    sub-float/2addr v7, v8

    const/16 v23, 0x0

    cmpl-float v7, v7, v23

    const/16 v24, 0x0

    if-ltz v7, :cond_7

    invoke-virtual {v2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v7

    move v8, v1

    :goto_4
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_6

    invoke-interface {v15, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lنٍصے/ة;

    iget-boolean v10, v9, Lنٍصے/ة;->أ:Z

    if-nez v10, :cond_5

    goto :goto_5

    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    :cond_6
    move-object/from16 v9, v24

    :goto_5
    if-ne v7, v9, :cond_7

    move v7, v5

    goto :goto_6

    :cond_7
    move v7, v1

    :goto_6
    iget v12, v2, Lنٍصے/ت;->آ:I

    iget v11, v2, Lنٍصے/ت;->ء:I

    if-nez v7, :cond_e

    if-ne v6, v14, :cond_8

    goto/16 :goto_c

    :cond_8
    sub-int v7, v11, v6

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v8

    goto :goto_7

    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v8

    :goto_7
    int-to-float v10, v8

    invoke-virtual {v2}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v8

    iget v8, v8, Lنٍصے/ة;->ؠ:F

    invoke-virtual {v2}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v9

    iget v9, v9, Lنٍصے/ة;->آ:F

    div-float/2addr v9, v4

    sub-float/2addr v8, v9

    if-gtz v7, :cond_a

    invoke-virtual {v2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v9

    iget v9, v9, Lنٍصے/ة;->ؤ:F

    cmpl-float v9, v9, v23

    if-lez v9, :cond_a

    invoke-virtual {v2}, Lنٍصے/ت;->؋()Lنٍصے/ة;

    move-result-object v6

    iget v6, v6, Lنٍصے/ة;->ؤ:F

    add-float v9, v8, v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget v6, v2, Lنٍصے/ت;->ء:I

    iget v1, v2, Lنٍصے/ت;->آ:I

    move/from16 v16, v6

    move-object v6, v2

    move/from16 v25, v10

    move/from16 v10, v16

    move/from16 v26, v11

    move v11, v1

    move v1, v12

    move/from16 v12, v25

    invoke-static/range {v6 .. v12}, Lنٍصے/ث;->ء(Lنٍصے/ت;IIFIIF)Lنٍصے/ت;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d

    :cond_a
    move/from16 v25, v10

    move/from16 v26, v11

    move v1, v12

    move/from16 v10, v23

    const/4 v9, 0x0

    :goto_8
    if-ge v9, v7, :cond_f

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/2addr v11, v14

    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lنٍصے/ت;

    add-int v12, v6, v9

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v16

    add-int/lit8 v16, v16, -0x1

    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Lنٍصے/ة;

    iget v5, v5, Lنٍصے/ة;->ؤ:F

    add-float/2addr v10, v5

    add-int/2addr v12, v14

    if-ltz v12, :cond_d

    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lنٍصے/ة;

    iget v5, v5, Lنٍصے/ة;->ء:F

    iget v12, v11, Lنٍصے/ت;->آ:I

    :goto_9
    iget-object v4, v11, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v14

    if-ge v12, v14, :cond_c

    invoke-interface {v4, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lنٍصے/ة;

    iget v4, v4, Lنٍصے/ة;->ء:F

    cmpl-float v4, v5, v4

    if-nez v4, :cond_b

    const/4 v5, -0x1

    goto :goto_a

    :cond_b
    add-int/lit8 v12, v12, 0x1

    const/4 v14, -0x1

    goto :goto_9

    :cond_c
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, -0x1

    add-int/lit8 v12, v4, -0x1

    :goto_a
    add-int/2addr v12, v5

    move/from16 v18, v12

    goto :goto_b

    :cond_d
    move v5, v14

    move/from16 v18, v16

    :goto_b
    sub-int v4, v26, v9

    add-int/lit8 v20, v4, -0x1

    sub-int v12, v1, v9

    add-int/lit8 v21, v12, -0x1

    add-float v19, v8, v10

    move-object/from16 v16, v11

    move/from16 v17, v6

    move/from16 v22, v25

    invoke-static/range {v16 .. v22}, Lنٍصے/ث;->ء(Lنٍصے/ت;IIFIIF)Lنٍصے/ت;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v5, 0x1

    const/4 v14, -0x1

    goto :goto_8

    :cond_e
    :goto_c
    move/from16 v26, v11

    move v1, v12

    :cond_f
    :goto_d
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, -0x1

    add-int/2addr v5, v6

    :goto_e
    if-ltz v5, :cond_11

    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lنٍصے/ة;

    iget-boolean v6, v6, Lنٍصے/ة;->أ:Z

    if-nez v6, :cond_10

    goto :goto_f

    :cond_10
    add-int/lit8 v5, v5, -0x1

    goto :goto_e

    :cond_11
    const/4 v5, -0x1

    :goto_f
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v6

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v6

    :cond_12
    invoke-virtual {v2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v7

    iget v7, v7, Lنٍصے/ة;->ؠ:F

    invoke-virtual {v2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v8

    iget v8, v8, Lنٍصے/ة;->آ:F

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    add-float/2addr v8, v7

    int-to-float v6, v6

    cmpg-float v6, v8, v6

    if-gtz v6, :cond_15

    invoke-virtual {v2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v6

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v7

    :cond_13
    const/4 v8, -0x1

    add-int/2addr v7, v8

    if-ltz v7, :cond_14

    invoke-interface {v15, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lنٍصے/ة;

    iget-boolean v9, v8, Lنٍصے/ة;->أ:Z

    if-nez v9, :cond_13

    goto :goto_10

    :cond_14
    move-object/from16 v8, v24

    :goto_10
    if-ne v6, v8, :cond_15

    const/4 v6, 0x1

    goto :goto_11

    :cond_15
    const/4 v6, 0x0

    :goto_11
    if-nez v6, :cond_1c

    const/4 v6, -0x1

    if-ne v5, v6, :cond_16

    goto/16 :goto_17

    :cond_16
    sub-int v14, v5, v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v6

    if-eqz v6, :cond_17

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v6

    goto :goto_12

    :cond_17
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v6

    :goto_12
    int-to-float v12, v6

    invoke-virtual {v2}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v6

    iget v6, v6, Lنٍصے/ة;->ؠ:F

    invoke-virtual {v2}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v7

    iget v7, v7, Lنٍصے/ة;->آ:F

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    sub-float v16, v6, v7

    if-gtz v14, :cond_18

    invoke-virtual {v2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v6

    iget v6, v6, Lنٍصے/ة;->ؤ:F

    cmpl-float v6, v6, v23

    if-lez v6, :cond_18

    invoke-virtual {v2}, Lنٍصے/ت;->ء()Lنٍصے/ة;

    move-result-object v1

    iget v1, v1, Lنٍصے/ة;->ؤ:F

    sub-float v9, v16, v1

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget v10, v2, Lنٍصے/ت;->ء:I

    iget v11, v2, Lنٍصے/ت;->آ:I

    move-object v6, v2

    invoke-static/range {v6 .. v12}, Lنٍصے/ث;->ء(Lنٍصے/ت;IIFIIF)Lنٍصے/ت;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_18
    const/4 v11, 0x0

    :goto_13
    if-ge v11, v14, :cond_1c

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, -0x1

    add-int/2addr v6, v7

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lنٍصے/ت;

    sub-int v7, v5, v11

    invoke-interface {v15, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lنٍصے/ة;

    iget v8, v8, Lنٍصے/ة;->ؤ:F

    add-float v23, v23, v8

    const/4 v8, 0x1

    add-int/2addr v7, v8

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_1b

    invoke-interface {v15, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lنٍصے/ة;

    iget v7, v7, Lنٍصے/ة;->ء:F

    iget v8, v6, Lنٍصے/ت;->ء:I

    const/16 v17, -0x1

    add-int/lit8 v8, v8, -0x1

    :goto_14
    if-ltz v8, :cond_1a

    iget-object v9, v6, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lنٍصے/ة;

    iget v9, v9, Lنٍصے/ة;->ء:F

    cmpl-float v9, v7, v9

    if-nez v9, :cond_19

    goto :goto_15

    :cond_19
    add-int/lit8 v8, v8, -0x1

    goto :goto_14

    :cond_1a
    const/4 v8, 0x0

    :goto_15
    const/16 v18, 0x1

    add-int/lit8 v8, v8, 0x1

    goto :goto_16

    :cond_1b
    const/16 v17, -0x1

    const/16 v18, 0x1

    const/4 v8, 0x0

    :goto_16
    add-int v7, v26, v11

    add-int/lit8 v10, v7, 0x1

    add-int v7, v1, v11

    add-int/lit8 v19, v7, 0x1

    sub-float v9, v16, v23

    move v7, v5

    move/from16 v20, v11

    move/from16 v11, v19

    move/from16 v19, v12

    invoke-static/range {v6 .. v12}, Lنٍصے/ث;->ء(Lنٍصے/ت;IIFIIF)Lنٍصے/ت;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v20, 0x1

    goto :goto_13

    :cond_1c
    :goto_17
    invoke-direct {v3, v2, v13, v4}, Lنٍصے/ث;-><init>(Lنٍصے/ت;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iput-object v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    return-void
.end method

.method public final ز()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->requestLayout()V

    return-void
.end method

.method public final س(Lنٍصے/ث;)V
    .locals 3

    iget v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ء:I

    iget v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؠ:I

    if-gt v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ح()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lنٍصے/ث;->ء:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lنٍصے/ت;

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lنٍصے/ث;->ؠ:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lنٍصے/ت;

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    int-to-float v2, v2

    int-to-float v1, v1

    int-to-float v0, v0

    invoke-virtual {p1, v2, v1, v0}, Lنٍصے/ث;->؋(FFF)Lنٍصے/ت;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->إ:Lنٍصے/ت;

    iget-object p1, p1, Lنٍصے/ت;->ؠ:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->آ:Lنٍصے/ؤ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Lنٍصے/ؤ;->ؠ:Ljava/util/List;

    return-void
.end method
