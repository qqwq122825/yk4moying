.class public final Lٿخ۴۟ؽ/ء;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Lٿخ۴۟ؽ/آ;


# direct methods
.method public synthetic constructor <init>(Lٿخ۴۟ؽ/آ;I)V
    .locals 0

    iput p2, p0, Lٿخ۴۟ؽ/ء;->؋:I

    iput-object p1, p0, Lٿخ۴۟ؽ/ء;->ؠ:Lٿخ۴۟ؽ/آ;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget v0, p0, Lٿخ۴۟ؽ/ء;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void

    :pswitch_0
    iget-object p1, p0, Lٿخ۴۟ؽ/ء;->ؠ:Lٿخ۴۟ؽ/آ;

    iget-object p1, p1, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lٿخ۴۟ؽ/خ;->ئ(Z)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget v0, p0, Lٿخ۴۟ؽ/ء;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_0
    iget-object p1, p0, Lٿخ۴۟ؽ/ء;->ؠ:Lٿخ۴۟ؽ/آ;

    iget-object p1, p1, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lٿخ۴۟ؽ/خ;->ئ(Z)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
