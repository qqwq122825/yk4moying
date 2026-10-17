.class public final Lفؐ٣ڮڂ/؋;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lفؐ٣ڮڂ/؋;->؋:I

    iput-object p2, p0, Lفؐ٣ڮڂ/؋;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    iget p1, p0, Lفؐ٣ڮڂ/؋;->؋:I

    const/4 v0, 0x0

    iget-object v1, p0, Lفؐ٣ڮڂ/؋;->ؠ:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    check-cast v1, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_1
    check-cast v1, Lٿخ۴۟ؽ/ة;

    invoke-virtual {v1}, Lٿخ۴۟ؽ/د;->د()V

    iget-object p1, v1, Lٿخ۴۟ؽ/ة;->ذ:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :pswitch_2
    invoke-static {v1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v0

    :pswitch_3
    check-cast v1, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;

    iput-object v0, v1, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ئ:Landroid/view/ViewPropertyAnimator;

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget v0, p0, Lفؐ٣ڮڂ/؋;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_0
    iget-object p1, p0, Lفؐ٣ڮڂ/؋;->ؠ:Ljava/lang/Object;

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p1, 0x0

    throw p1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
