.class public final Lٿخ۴۟ؽ/آ;
.super Lٿخ۴۟ؽ/د;
.source "SourceFile"


# instance fields
.field public final أ:I

.field public final ؤ:I

.field public final إ:Landroid/animation/TimeInterpolator;

.field public final ئ:Landroid/animation/TimeInterpolator;

.field public ا:Landroid/widget/EditText;

.field public final ب:Lcom/google/android/material/datepicker/ح;

.field public final ة:Lٿخ۴۟ؽ/ؠ;

.field public ت:Landroid/animation/AnimatorSet;

.field public ث:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/خ;)V
    .locals 3

    invoke-direct {p0, p1}, Lٿخ۴۟ؽ/د;-><init>(Lٿخ۴۟ؽ/خ;)V

    new-instance v0, Lcom/google/android/material/datepicker/ح;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lcom/google/android/material/datepicker/ح;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lٿخ۴۟ؽ/آ;->ب:Lcom/google/android/material/datepicker/ح;

    new-instance v0, Lٿخ۴۟ؽ/ؠ;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lٿخ۴۟ؽ/ؠ;-><init>(Lٿخ۴۟ؽ/د;I)V

    iput-object v0, p0, Lٿخ۴۟ؽ/آ;->ة:Lٿخ۴۟ؽ/ؠ;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f03032e

    const/16 v2, 0x64

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lٿخ۴۟ؽ/آ;->أ:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v2, 0x96

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lٿخ۴۟ؽ/آ;->ؤ:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    const v2, 0x7f030337

    invoke-static {v0, v2, v1}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object v0

    iput-object v0, p0, Lٿخ۴۟ؽ/آ;->إ:Landroid/animation/TimeInterpolator;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lؿ١ڔظۇٟؗٞ/؋;->آ:Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    const v1, 0x7f030335

    invoke-static {p1, v1, v0}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object p1

    iput-object p1, p0, Lٿخ۴۟ؽ/آ;->ئ:Landroid/animation/TimeInterpolator;

    return-void
.end method


# virtual methods
.method public final ؋()V
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lٿخ۴۟ؽ/آ;->س()Z

    move-result v0

    invoke-virtual {p0, v0}, Lٿخ۴۟ؽ/آ;->ز(Z)V

    return-void
.end method

.method public final ء()I
    .locals 1

    const v0, 0x7f100031

    return v0
.end method

.method public final آ()I
    .locals 1

    const v0, 0x7f0700ec

    return v0
.end method

.method public final أ()Landroid/view/View$OnFocusChangeListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ة:Lٿخ۴۟ؽ/ؠ;

    return-object v0
.end method

.method public final ؤ()Landroid/view/View$OnClickListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ب:Lcom/google/android/material/datepicker/ح;

    return-object v0
.end method

.method public final إ()Landroid/view/View$OnFocusChangeListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ة:Lٿخ۴۟ؽ/ؠ;

    return-object v0
.end method

.method public final ث(Landroid/widget/EditText;)V
    .locals 1

    iput-object p1, p0, Lٿخ۴۟ؽ/آ;->ا:Landroid/widget/EditText;

    iget-object p1, p0, Lٿخ۴۟ؽ/د;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Lٿخ۴۟ؽ/آ;->س()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    return-void
.end method

.method public final خ(Z)V
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lٿخ۴۟ؽ/آ;->ز(Z)V

    return-void
.end method

.method public final ذ()V
    .locals 9

    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iget-object v2, p0, Lٿخ۴۟ؽ/آ;->ئ:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget v2, p0, Lٿخ۴۟ؽ/آ;->ؤ:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v2, Lٿخ۴۟ؽ/؋;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lٿخ۴۟ؽ/؋;-><init>(Lٿخ۴۟ؽ/د;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-array v2, v0, [F

    fill-array-data v2, :array_1

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    iget-object v4, p0, Lٿخ۴۟ؽ/آ;->إ:Landroid/animation/TimeInterpolator;

    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget v5, p0, Lٿخ۴۟ؽ/آ;->أ:I

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v6, Lٿخ۴۟ؽ/؋;

    const/4 v7, 0x1

    invoke-direct {v6, p0, v7}, Lٿخ۴۟ؽ/؋;-><init>(Lٿخ۴۟ؽ/د;I)V

    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v6, Landroid/animation/AnimatorSet;

    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v6, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    new-array v8, v0, [Landroid/animation/Animator;

    aput-object v1, v8, v3

    aput-object v2, v8, v7

    invoke-virtual {v6, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v1, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    new-instance v2, Lٿخ۴۟ؽ/ء;

    invoke-direct {v2, p0, v3}, Lٿخ۴۟ؽ/ء;-><init>(Lٿخ۴۟ؽ/آ;I)V

    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-array v0, v0, [F

    fill-array-data v0, :array_2

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    int-to-long v1, v5

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v1, Lٿخ۴۟ؽ/؋;

    invoke-direct {v1, p0, v7}, Lٿخ۴۟ؽ/؋;-><init>(Lٿخ۴۟ؽ/د;I)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iput-object v0, p0, Lٿخ۴۟ؽ/آ;->ث:Landroid/animation/ValueAnimator;

    new-instance v1, Lٿخ۴۟ؽ/ء;

    invoke-direct {v1, p0, v7}, Lٿخ۴۟ؽ/ء;-><init>(Lٿخ۴۟ؽ/آ;I)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :array_0
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final ر()V
    .locals 3

    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ا:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    new-instance v1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v2, 0x9

    invoke-direct {v1, v2, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public final ز(Z)V
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_1

    iget-object v1, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ث:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    if-eqz v0, :cond_2

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    goto :goto_1

    :cond_1
    if-nez p1, :cond_2

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ت:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ث:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    if-eqz v0, :cond_2

    iget-object p1, p0, Lٿخ۴۟ؽ/آ;->ث:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    :cond_2
    :goto_1
    return-void
.end method

.method public final س()Z
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ا:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lٿخ۴۟ؽ/آ;->ا:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
