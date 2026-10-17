.class public final Lنٍصے/إ;
.super Lنٍصے/ا;
.source "SourceFile"


# instance fields
.field public final synthetic ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;


# direct methods
.method public constructor <init>(Lcom/google/android/material/carousel/CarouselLayoutManager;)V
    .locals 0

    iput-object p1, p0, Lنٍصے/إ;->ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lنٍصے/ا;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final ؋(Landroidx/recyclerview/widget/RecyclerView$LayoutParams;)F
    .locals 1

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, p1

    int-to-float p1, v0

    return p1
.end method

.method public final ؠ()I
    .locals 1

    iget-object v0, p0, Lنٍصے/إ;->ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v0

    return v0
.end method

.method public final ء()I
    .locals 1

    invoke-virtual {p0}, Lنٍصے/إ;->ؠ()I

    move-result v0

    return v0
.end method

.method public final آ()I
    .locals 1

    iget-object v0, p0, Lنٍصے/إ;->ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingLeft()I

    move-result v0

    return v0
.end method

.method public final أ()I
    .locals 2

    iget-object v0, p0, Lنٍصے/إ;->ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingRight()I

    move-result v0

    sub-int/2addr v1, v0

    return v1
.end method

.method public final ؤ()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final إ()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final ئ(Landroid/view/View;II)V
    .locals 6

    iget-object v0, p0, Lنٍصے/إ;->ؠ:Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {p0}, Lنٍصے/إ;->آ()I

    move-result v2

    invoke-virtual {p0}, Lنٍصے/إ;->أ()I

    move-result v4

    move-object v1, p1

    move v3, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    return-void
.end method

.method public final ا(FFLandroid/graphics/Rect;Landroid/view/View;)V
    .locals 0

    iget p3, p3, Landroid/graphics/Rect;->top:I

    int-to-float p3, p3

    add-float/2addr p3, p1

    sub-float/2addr p2, p3

    float-to-int p1, p2

    invoke-virtual {p4, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    return-void
.end method
