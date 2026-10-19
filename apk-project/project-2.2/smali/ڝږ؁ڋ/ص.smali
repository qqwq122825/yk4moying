.class public final Lڝږ؁ڋ/ص;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic ؋:Landroid/widget/FrameLayout;

.field public final synthetic ؠ:Z

.field public final synthetic ء:C

.field public final synthetic آ:Ljava/lang/StringBuilder;

.field public final synthetic أ:Landroid/widget/LinearLayout;

.field public final synthetic ؤ:Ljava/util/List;

.field public final synthetic إ:I

.field public final synthetic ئ:I

.field public final synthetic ا:F

.field public final synthetic ب:Lڝږ؁ڋ/ظ;


# direct methods
.method public constructor <init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZCLjava/lang/StringBuilder;Landroid/widget/LinearLayout;Ljava/util/ArrayList;IIF)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ص;->ب:Lڝږ؁ڋ/ظ;

    iput-object p2, p0, Lڝږ؁ڋ/ص;->؋:Landroid/widget/FrameLayout;

    iput-boolean p3, p0, Lڝږ؁ڋ/ص;->ؠ:Z

    iput-char p4, p0, Lڝږ؁ڋ/ص;->ء:C

    iput-object p5, p0, Lڝږ؁ڋ/ص;->آ:Ljava/lang/StringBuilder;

    iput-object p6, p0, Lڝږ؁ڋ/ص;->أ:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lڝږ؁ڋ/ص;->ؤ:Ljava/util/List;

    iput p8, p0, Lڝږ؁ڋ/ص;->إ:I

    iput p9, p0, Lڝږ؁ڋ/ص;->ئ:I

    iput p10, p0, Lڝږ؁ڋ/ص;->ا:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lڝږ؁ڋ/ص;->؋:Landroid/widget/FrameLayout;

    invoke-static {p1}, Lڝږ؁ڋ/ظ;->؋(Landroid/widget/FrameLayout;)V

    iget-boolean v0, p0, Lڝږ؁ڋ/ص;->ؠ:Z

    invoke-static {v0, p1}, Lڝږ؁ڋ/ظ;->ؠ(ZLandroid/widget/FrameLayout;)V

    iget-object p1, p0, Lڝږ؁ڋ/ص;->ب:Lڝږ؁ڋ/ظ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lڝږ؁ڋ/ص;->آ:Ljava/lang/StringBuilder;

    iget-char v1, p0, Lڝږ؁ڋ/ص;->ء:C

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lڝږ؁ڋ/ص;->أ:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_1

    new-instance v3, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget v5, p0, Lڝږ؁ڋ/ص;->إ:I

    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v5, 0x0

    iget v6, p0, Lڝږ؁ڋ/ص;->ئ:I

    invoke-virtual {v4, v6, v5, v6, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v4, p2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget v5, p0, Lڝږ؁ڋ/ص;->ا:F

    const/high16 v6, 0x3fc00000    # 1.5f

    mul-float/2addr v5, v6

    float-to-int v5, v5

    if-eqz v0, :cond_0

    const-string v0, "#88FFFFFF"

    goto :goto_0

    :cond_0
    const-string v0, "#CCFFFFFF"

    :goto_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v5, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lڝږ؁ڋ/ص;->ؤ:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xb4

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2, v6}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "[PIN] Digit: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, " | Buffer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "LockOverlay"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return p2
.end method
