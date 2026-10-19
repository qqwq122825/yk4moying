.class public final synthetic Lڝږ؁ڋ/ؿ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Lڝږ؁ڋ/ق;

.field public final synthetic ء:I


# direct methods
.method public synthetic constructor <init>(Lڝږ؁ڋ/ق;II)V
    .locals 0

    iput p3, p0, Lڝږ؁ڋ/ؿ;->؋:I

    iput-object p1, p0, Lڝږ؁ڋ/ؿ;->ؠ:Lڝږ؁ڋ/ق;

    iput p2, p0, Lڝږ؁ڋ/ؿ;->ء:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    iget v0, p0, Lڝږ؁ڋ/ؿ;->؋:I

    iget v1, p0, Lڝږ؁ڋ/ؿ;->ء:I

    iget-object v2, p0, Lڝږ؁ڋ/ؿ;->ؠ:Lڝږ؁ڋ/ق;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, v2, Lڝږ؁ڋ/ق;->ؠ:[F

    aput p1, v0, v1

    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    return-void

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, v2, Lڝږ؁ڋ/ق;->ؠ:[F

    aput p1, v0, v1

    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
