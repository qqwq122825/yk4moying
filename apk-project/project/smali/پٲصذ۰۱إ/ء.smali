.class public final Lپٲصذ۰۱إ/ء;
.super Landroidx/customview/widget/ViewDragHelper$Callback;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V
    .locals 0

    iput-object p1, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    invoke-direct {p0}, Landroidx/customview/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public final clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 1

    iget-object p1, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object p3, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    iget v0, p3, Lپٲصذ۰۱إ/؋;->ح:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p3, p3, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget p3, p3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ت:I

    neg-int p3, p3

    goto :goto_1

    :goto_0
    invoke-virtual {p3}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result p3

    :goto_1
    iget-object p1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    iget v0, p1, Lپٲصذ۰۱إ/؋;->ح:I

    iget-object p1, p1, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v0, :pswitch_data_1

    goto :goto_2

    :pswitch_1
    iget p1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    goto :goto_3

    :goto_2
    iget p1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ث:I

    :goto_3
    invoke-static {p2, p3, p1}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method

.method public final clampViewPositionVertical(Landroid/view/View;II)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    return p1
.end method

.method public final getViewHorizontalDragRange(Landroid/view/View;)I
    .locals 1

    iget-object p1, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget v0, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ت:I

    iget p1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    add-int/2addr v0, p1

    return v0
.end method

.method public final onViewDragStateChanged(I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-boolean v1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->إ:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ء(I)V

    :cond_0
    return-void
.end method

.method public final onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 4

    iget-object p3, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object p4, p3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->د:Ljava/lang/ref/WeakReference;

    const/4 p5, 0x0

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/view/View;

    goto :goto_0

    :cond_0
    move-object p4, p5

    :goto_0
    if-eqz p4, :cond_2

    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_2

    iget-object v1, p3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    iget v3, v1, Lپٲصذ۰۱إ/؋;->ح:I

    iget-object v1, v1, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget v1, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ث:I

    if-gt v2, v1, :cond_1

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    goto :goto_2

    :goto_1
    iget p1, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ث:I

    if-gt v2, p1, :cond_1

    sub-int/2addr p1, v2

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :cond_1
    :goto_2
    invoke-virtual {p4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    iget-object p1, p3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->س:Ljava/util/LinkedHashSet;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_4

    iget-object p3, p3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {p3, p2}, Lپٲصذ۰۱إ/؋;->غ(I)F

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_3

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw p5

    :cond_4
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onViewReleased(Landroid/view/View;FF)V
    .locals 3

    iget-object v0, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v1, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {v1, p2}, Lپٲصذ۰۱إ/؋;->ـ(F)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {v1, p1, p2}, Lپٲصذ۰۱إ/؋;->ك(Landroid/view/View;F)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {v1, p2, p3}, Lپٲصذ۰۱إ/؋;->ق(FF)Z

    move-result p2

    if-nez p2, :cond_5

    iget-object p2, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {p2, p1}, Lپٲصذ۰۱إ/؋;->ف(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_2

    :cond_1
    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-eqz v1, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    cmpl-float p2, p2, p3

    if-lez p2, :cond_2

    move p2, v2

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    :goto_0
    if-nez p2, :cond_5

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    iget-object p3, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {p3}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result p3

    sub-int p3, p2, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    iget-object v1, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->؋:Lپٲصذ۰۱إ/؋;

    invoke-virtual {v1}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-ge p3, p2, :cond_5

    :cond_4
    :goto_1
    const/4 p2, 0x3

    goto :goto_3

    :cond_5
    :goto_2
    const/4 p2, 0x5

    :goto_3
    invoke-virtual {v0, p1, p2, v2}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->آ(Landroid/view/View;IZ)V

    return-void
.end method

.method public final tryCaptureView(Landroid/view/View;I)Z
    .locals 3

    iget-object p2, p0, Lپٲصذ۰۱إ/ء;->؋:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget v0, p2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ئ:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    iget-object p2, p2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->خ:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p1, :cond_1

    move v1, v2

    :cond_1
    return v1
.end method
