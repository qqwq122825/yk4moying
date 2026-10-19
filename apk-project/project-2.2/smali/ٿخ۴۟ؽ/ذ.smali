.class public final Lٿخ۴۟ؽ/ذ;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Landroid/widget/TextView;

.field public final synthetic ء:I

.field public final synthetic آ:Landroid/widget/TextView;

.field public final synthetic أ:Lٿخ۴۟ؽ/ز;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/ز;ILandroid/widget/TextView;ILandroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lٿخ۴۟ؽ/ذ;->أ:Lٿخ۴۟ؽ/ز;

    iput p2, p0, Lٿخ۴۟ؽ/ذ;->؋:I

    iput-object p3, p0, Lٿخ۴۟ؽ/ذ;->ؠ:Landroid/widget/TextView;

    iput p4, p0, Lٿخ۴۟ؽ/ذ;->ء:I

    iput-object p5, p0, Lٿخ۴۟ؽ/ذ;->آ:Landroid/widget/TextView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    iget p1, p0, Lٿخ۴۟ؽ/ذ;->؋:I

    iget-object v0, p0, Lٿخ۴۟ؽ/ذ;->أ:Lٿخ۴۟ؽ/ز;

    iput p1, v0, Lٿخ۴۟ؽ/ز;->ج:I

    const/4 p1, 0x0

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->ت:Landroid/animation/Animator;

    iget-object v1, p0, Lٿخ۴۟ؽ/ذ;->ؠ:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget v1, p0, Lٿخ۴۟ؽ/ذ;->ء:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object p1, p0, Lٿخ۴۟ؽ/ذ;->آ:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    :cond_1
    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lٿخ۴۟ؽ/ذ;->آ:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    :cond_0
    return-void
.end method
