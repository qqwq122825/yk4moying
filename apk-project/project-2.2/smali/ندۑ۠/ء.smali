.class public final Lندۑ۠/ء;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lcom/google/android/material/button/MaterialButton;

.field public ؠ:Lٽچڃ/ب;

.field public ء:I

.field public آ:I

.field public أ:I

.field public ؤ:I

.field public إ:I

.field public ئ:I

.field public ا:Landroid/graphics/PorterDuff$Mode;

.field public ب:Landroid/content/res/ColorStateList;

.field public ة:Landroid/content/res/ColorStateList;

.field public ت:Landroid/content/res/ColorStateList;

.field public ث:Lٽچڃ/إ;

.field public ج:Z

.field public ح:Z

.field public خ:Z

.field public د:Z

.field public ذ:Z

.field public ر:Landroid/graphics/drawable/RippleDrawable;

.field public ز:I


# direct methods
.method public constructor <init>(Lcom/google/android/material/button/MaterialButton;Lٽچڃ/ب;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lندۑ۠/ء;->ج:Z

    iput-boolean v0, p0, Lندۑ۠/ء;->ح:Z

    iput-boolean v0, p0, Lندۑ۠/ء;->خ:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lندۑ۠/ء;->ذ:Z

    iput-object p1, p0, Lندۑ۠/ء;->؋:Lcom/google/android/material/button/MaterialButton;

    iput-object p2, p0, Lندۑ۠/ء;->ؠ:Lٽچڃ/ب;

    return-void
.end method


# virtual methods
.method public final ؋()Lٽچڃ/س;
    .locals 3

    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v2, 0x2

    if-le v0, v2, :cond_0

    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    check-cast v0, Lٽچڃ/س;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final ؠ(Z)Lٽچڃ/إ;
    .locals 2

    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/DrawableWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lٽچڃ/إ;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final ء(Lٽچڃ/ب;)V
    .locals 2

    iput-object p1, p0, Lندۑ۠/ء;->ؠ:Lٽچڃ/ب;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v0

    invoke-virtual {v0, p1}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v0}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v0

    invoke-virtual {v0, p1}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_1
    invoke-virtual {p0}, Lندۑ۠/ء;->؋()Lٽچڃ/س;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lندۑ۠/ء;->؋()Lٽچڃ/س;

    move-result-object v0

    invoke-interface {v0, p1}, Lٽچڃ/س;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_2
    return-void
.end method

.method public final آ(II)V
    .locals 8

    iget-object v0, p0, Lندۑ۠/ء;->؋:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    iget v5, p0, Lندۑ۠/ء;->أ:I

    iget v6, p0, Lندۑ۠/ء;->ؤ:I

    iput p2, p0, Lندۑ۠/ء;->ؤ:I

    iput p1, p0, Lندۑ۠/ء;->أ:I

    iget-boolean v7, p0, Lندۑ۠/ء;->ح:Z

    if-nez v7, :cond_0

    invoke-virtual {p0}, Lندۑ۠/ء;->أ()V

    :cond_0
    add-int/2addr v2, p1

    sub-int/2addr v2, v5

    add-int/2addr v4, p2

    sub-int/2addr v4, v6

    invoke-static {v0, v1, v2, v3, v4}, Landroidx/core/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    return-void
.end method

.method public final أ()V
    .locals 12

    new-instance v0, Lٽچڃ/إ;

    iget-object v1, p0, Lندۑ۠/ء;->ؠ:Lٽچڃ/ب;

    invoke-direct {v0, v1}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    iget-object v1, p0, Lندۑ۠/ء;->؋:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lٽچڃ/إ;->ئ(Landroid/content/Context;)V

    iget-object v2, p0, Lندۑ۠/ء;->ب:Landroid/content/res/ColorStateList;

    invoke-static {v0, v2}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    iget-object v2, p0, Lندۑ۠/ء;->ا:Landroid/graphics/PorterDuff$Mode;

    if-eqz v2, :cond_0

    invoke-static {v0, v2}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    iget v2, p0, Lندۑ۠/ء;->ئ:I

    int-to-float v2, v2

    iget-object v3, p0, Lندۑ۠/ء;->ة:Landroid/content/res/ColorStateList;

    iget-object v4, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput v2, v4, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    iget-object v2, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v4, v2, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v4, v3, :cond_1

    iput-object v3, v2, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v2

    invoke-virtual {v0, v2}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_1
    new-instance v2, Lٽچڃ/إ;

    iget-object v3, p0, Lندۑ۠/ء;->ؠ:Lٽچڃ/ب;

    invoke-direct {v2, v3}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lٽچڃ/إ;->setTint(I)V

    iget v4, p0, Lندۑ۠/ء;->ئ:I

    int-to-float v4, v4

    iget-boolean v5, p0, Lندۑ۠/ء;->ج:Z

    if-eqz v5, :cond_2

    const v5, 0x7f030123

    invoke-static {v5, v1}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v5

    goto :goto_0

    :cond_2
    move v5, v3

    :goto_0
    iget-object v6, v2, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput v4, v6, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v2}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iget-object v5, v2, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v6, v5, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v6, v4, :cond_3

    iput-object v4, v5, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v4

    invoke-virtual {v2, v4}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_3
    new-instance v4, Lٽچڃ/إ;

    iget-object v5, p0, Lندۑ۠/ء;->ؠ:Lٽچڃ/ب;

    invoke-direct {v4, v5}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    iput-object v4, p0, Lندۑ۠/ء;->ث:Lٽچڃ/إ;

    const/4 v5, -0x1

    invoke-static {v4, v5}, Landroidx/core/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    iget-object v5, p0, Lندۑ۠/ء;->ت:Landroid/content/res/ColorStateList;

    invoke-static {v5}, Lٺپر/؋;->؋(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v5

    new-instance v7, Landroid/graphics/drawable/LayerDrawable;

    const/4 v6, 0x2

    new-array v6, v6, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v6, v3

    const/4 v2, 0x1

    aput-object v0, v6, v2

    invoke-direct {v7, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    iget v8, p0, Lندۑ۠/ء;->ء:I

    iget v9, p0, Lندۑ۠/ء;->أ:I

    iget v10, p0, Lندۑ۠/ء;->آ:I

    iget v11, p0, Lندۑ۠/ء;->ؤ:I

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    iget-object v2, p0, Lندۑ۠/ء;->ث:Lٽچڃ/إ;

    invoke-direct {v4, v5, v0, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v4, p0, Lندۑ۠/ء;->ر:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v1, v4}, Lcom/google/android/material/button/MaterialButton;->setInternalBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v3}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v0

    if-eqz v0, :cond_4

    iget v2, p0, Lندۑ۠/ء;->ز:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Lٽچڃ/إ;->ا(F)V

    invoke-virtual {v1}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_4
    return-void
.end method

.method public final ؤ()V
    .locals 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lندۑ۠/ء;->ؠ(Z)Lٽچڃ/إ;

    move-result-object v2

    if-eqz v1, :cond_2

    iget v3, p0, Lندۑ۠/ء;->ئ:I

    int-to-float v3, v3

    iget-object v4, p0, Lندۑ۠/ء;->ة:Landroid/content/res/ColorStateList;

    iget-object v5, v1, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput v3, v5, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v1}, Lٽچڃ/إ;->invalidateSelf()V

    iget-object v3, v1, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v5, v3, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v5, v4, :cond_0

    iput-object v4, v3, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v3

    invoke-virtual {v1, v3}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_0
    if-eqz v2, :cond_2

    iget v1, p0, Lندۑ۠/ء;->ئ:I

    int-to-float v1, v1

    iget-boolean v3, p0, Lندۑ۠/ء;->ج:Z

    if-eqz v3, :cond_1

    iget-object v0, p0, Lندۑ۠/ء;->؋:Lcom/google/android/material/button/MaterialButton;

    const v3, 0x7f030123

    invoke-static {v3, v0}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v0

    :cond_1
    iget-object v3, v2, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput v1, v3, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v2}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iget-object v1, v2, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v3, v1, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v3, v0, :cond_2

    iput-object v0, v1, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    invoke-virtual {v2, v0}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_2
    return-void
.end method
