.class public final Lك۰ێخڊعءآ/آ;
.super Landroidx/customview/widget/ViewDragHelper$Callback;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V
    .locals 0

    iput-object p1, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-direct {p0}, Landroidx/customview/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public final clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    return p1
.end method

.method public final clampViewPositionVertical(Landroid/view/View;II)I
    .locals 0

    iget-object p3, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->إ()I

    move-result p3

    invoke-virtual {p0, p1}, Lك۰ێخڊعءآ/آ;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result p1

    invoke-static {p2, p3, p1}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result p1

    return p1
.end method

.method public final getViewVerticalDragRange(Landroid/view/View;)I
    .locals 1

    iget-object p1, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-boolean v0, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ف:Z

    if-eqz v0, :cond_0

    iget p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٯ:I

    return p1

    :cond_0
    iget p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؿ:I

    return p1
.end method

.method public final onViewDragStateChanged(I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-boolean v1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ك:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ج(I)V

    :cond_0
    return-void
.end method

.method public final onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 0

    iget-object p1, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p1, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->آ(I)V

    return-void
.end method

.method public final onViewReleased(Landroid/view/View;FF)V
    .locals 6

    const/4 v0, 0x0

    cmpg-float v1, p3, v0

    const/4 v2, 0x1

    const/4 v3, 0x6

    const/4 v4, 0x3

    iget-object v5, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-gez v1, :cond_2

    iget-boolean p2, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؠ:Z

    if-eqz p2, :cond_1

    :cond_0
    :goto_0
    move v3, v4

    goto/16 :goto_4

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؽ:I

    if-le p2, p3, :cond_0

    goto/16 :goto_4

    :cond_2
    iget-boolean v1, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ف:Z

    if-eqz v1, :cond_8

    invoke-virtual {v5, p1, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ح(Landroid/view/View;F)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_3

    iget p2, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->آ:I

    int-to-float p2, p2

    cmpl-float p2, p3, p2

    if-gtz p2, :cond_5

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٯ:I

    invoke-virtual {v5}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->إ()I

    move-result v0

    add-int/2addr v0, p3

    div-int/lit8 v0, v0, 0x2

    if-le p2, v0, :cond_4

    move p2, v2

    goto :goto_1

    :cond_4
    const/4 p2, 0x0

    :goto_1
    if-eqz p2, :cond_6

    :cond_5
    const/4 v3, 0x5

    goto/16 :goto_4

    :cond_6
    iget-boolean p2, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؠ:Z

    if-eqz p2, :cond_7

    goto :goto_0

    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    invoke-virtual {v5}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->إ()I

    move-result p3

    sub-int/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p3

    iget v0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؽ:I

    sub-int/2addr p3, v0

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    if-ge p2, p3, :cond_10

    goto :goto_0

    :cond_8
    cmpl-float v0, p3, v0

    const/4 v1, 0x4

    if-eqz v0, :cond_d

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    cmpl-float p2, p2, p3

    if-lez p2, :cond_9

    goto :goto_3

    :cond_9
    iget-boolean p2, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؠ:Z

    if-eqz p2, :cond_b

    :cond_a
    move v3, v1

    goto :goto_4

    :cond_b
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؽ:I

    sub-int p3, p2, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    iget v0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؿ:I

    sub-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-ge p3, p2, :cond_a

    :cond_c
    :goto_2
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_4

    :cond_d
    :goto_3
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    iget-boolean p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؠ:Z

    if-eqz p3, :cond_e

    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؼ:I

    sub-int p3, p2, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    iget v0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؿ:I

    sub-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-ge p3, p2, :cond_a

    goto/16 :goto_0

    :cond_e
    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؽ:I

    if-ge p2, p3, :cond_f

    iget p3, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؿ:I

    sub-int p3, p2, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    if-ge p2, p3, :cond_c

    goto/16 :goto_0

    :cond_f
    sub-int p3, p2, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    iget v0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ؿ:I

    sub-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-ge p3, p2, :cond_a

    goto :goto_2

    :cond_10
    :goto_4
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, p1, v3, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->خ(Landroid/view/View;IZ)V

    return-void
.end method

.method public final tryCaptureView(Landroid/view/View;I)Z
    .locals 5

    iget-object v0, p0, Lك۰ێخڊعءآ/آ;->؋:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget v1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ل:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    return v2

    :cond_0
    iget-boolean v4, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٷ:Z

    if-eqz v4, :cond_1

    return v2

    :cond_1
    const/4 v4, 0x3

    if-ne v1, v4, :cond_3

    iget v1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٵ:I

    if-ne v1, p2, :cond_3

    iget-object p2, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٲ:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_3

    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p2

    if-eqz p2, :cond_3

    return v2

    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object p2, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٱ:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_4

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p1, :cond_4

    move v2, v3

    :cond_4
    return v2
.end method
