.class public final Lنٍصے/آ;
.super Landroidx/recyclerview/widget/LinearSmoothScroller;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/carousel/CarouselLayoutManager;


# direct methods
.method public constructor <init>(Lcom/google/android/material/carousel/CarouselLayoutManager;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lنٍصے/آ;->؋:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final calculateDxToMakeVisible(Landroid/view/View;I)I
    .locals 1

    iget-object p2, p0, Lنٍصے/آ;->؋:Lcom/google/android/material/carousel/CarouselLayoutManager;

    iget-object v0, p2, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة(ILنٍصے/ت;)I

    move-result p1

    int-to-float p1, p1

    iget p2, p2, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    int-to-float p2, p2

    sub-float/2addr p2, p1

    float-to-int p1, p2

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final calculateDyToMakeVisible(Landroid/view/View;I)I
    .locals 1

    iget-object p2, p0, Lنٍصے/آ;->؋:Lcom/google/android/material/carousel/CarouselLayoutManager;

    iget-object v0, p2, Lcom/google/android/material/carousel/CarouselLayoutManager;->ؤ:Lنٍصے/ث;

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ا(I)Lنٍصے/ت;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ة(ILنٍصے/ت;)I

    move-result p1

    int-to-float p1, p1

    iget p2, p2, Lcom/google/android/material/carousel/CarouselLayoutManager;->؋:I

    int-to-float p2, p2

    sub-float/2addr p2, p1

    float-to-int p1, p2

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1

    iget-object v0, p0, Lنٍصے/آ;->؋:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1
.end method
