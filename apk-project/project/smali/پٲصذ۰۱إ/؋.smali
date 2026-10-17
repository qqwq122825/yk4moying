.class public final Lپٲصذ۰۱إ/؋;
.super Lڃٷښـ۝ۼ/ؠ;
.source "SourceFile"


# instance fields
.field public final synthetic ح:I

.field public final خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;I)V
    .locals 0

    iput p2, p0, Lپٲصذ۰۱إ/؋;->ح:I

    invoke-direct {p0}, Lڃٷښـ۝ۼ/ؠ;-><init>()V

    iput-object p1, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    return-void
.end method


# virtual methods
.method public final ع(Landroid/view/ViewGroup$MarginLayoutParams;)I
    .locals 1

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    return p1

    :goto_0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final غ(I)F
    .locals 2

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, v0

    int-to-float p1, p1

    sub-float/2addr p1, v0

    div-float/2addr p1, v1

    return p1

    :goto_0
    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v0, v1

    int-to-float p1, p1

    sub-float/2addr v0, p1

    div-float/2addr v0, v1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ػ()I
    .locals 4

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    const/4 v1, 0x0

    iget-object v2, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ج:I

    iget v2, v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    add-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    :goto_0
    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v0

    iget v3, v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ت:I

    sub-int/2addr v0, v3

    iget v2, v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؼ()I
    .locals 2

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    iget-object v1, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ت:I

    neg-int v0, v0

    iget v1, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    sub-int/2addr v0, v1

    return v0

    :goto_0
    iget v0, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ث:I

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؽ(Landroid/view/View;)I
    .locals 2

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    iget-object v1, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    iget v0, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    add-int/2addr p1, v0

    return p1

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    iget v0, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ح:I

    sub-int/2addr p1, v0

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؾ(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)I
    .locals 1

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    return p1

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؿ()I
    .locals 1

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ـ(F)Z
    .locals 4

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    cmpl-float p1, p1, v3

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    :goto_1
    cmpg-float p1, p1, v3

    if-gez p1, :cond_1

    goto :goto_2

    :cond_1
    move v1, v2

    :goto_2
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ف(Landroid/view/View;)Z
    .locals 4

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result v0

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v3

    sub-int/2addr v0, v3

    div-int/lit8 v0, v0, 0x2

    if-ge p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ؼ()I

    move-result v0

    invoke-virtual {p0}, Lپٲصذ۰۱إ/؋;->ػ()I

    move-result v3

    add-int/2addr v3, v0

    div-int/lit8 v3, v3, 0x2

    if-le p1, v3, :cond_1

    goto :goto_2

    :cond_1
    move v1, v2

    :goto_2
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ق(FF)Z
    .locals 5

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    const/4 v1, 0x1

    const/16 v2, 0x1f4

    iget-object v3, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, v0, p2

    if-lez p2, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    move p2, v4

    :goto_0
    if-eqz p2, :cond_1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    int-to-float p2, v2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    return v1

    :goto_2
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, v0, p2

    if-lez p2, :cond_2

    move p2, v1

    goto :goto_3

    :cond_2
    move p2, v4

    :goto_3
    if-eqz p2, :cond_3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    int-to-float p2, v2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    goto :goto_4

    :cond_3
    move v1, v4

    :goto_4
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ك(Landroid/view/View;F)Z
    .locals 5

    iget v0, p0, Lپٲصذ۰۱إ/؋;->ح:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    iget-object v4, p0, Lپٲصذ۰۱إ/؋;->خ:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    int-to-float p1, p1

    iget v0, v4, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ة:F

    mul-float/2addr p2, v0

    add-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, v3

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p1

    int-to-float p1, p1

    iget v0, v4, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ة:F

    mul-float/2addr p2, v0

    add-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, v3

    if-lez p1, :cond_1

    goto :goto_2

    :cond_1
    move v1, v2

    :goto_2
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
