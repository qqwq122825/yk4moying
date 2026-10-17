.class public final synthetic Lڝږ؁ڋ/ؾ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڝږ؁ڋ/ق;


# direct methods
.method public synthetic constructor <init>(Lڝږ؁ڋ/ق;I)V
    .locals 0

    iput p2, p0, Lڝږ؁ڋ/ؾ;->آ:I

    iput-object p1, p0, Lڝږ؁ڋ/ؾ;->أ:Lڝږ؁ڋ/ق;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget v2, p0, Lڝږ؁ڋ/ؾ;->آ:I

    iget-object v3, p0, Lڝږ؁ڋ/ؾ;->أ:Lڝږ؁ڋ/ق;

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v2, v3, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v6, 0x2

    new-array v6, v6, [F

    iget-object v7, v3, Lڝږ؁ڋ/ق;->ؠ:[F

    aget v7, v7, v4

    aput v7, v6, v1

    aput v0, v6, v5

    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v6

    const-wide/16 v7, 0xc8

    invoke-virtual {v6, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v7, Lڝږ؁ڋ/ؿ;

    invoke-direct {v7, v3, v4, v5}, Lڝږ؁ڋ/ؿ;-><init>(Lڝږ؁ڋ/ق;II)V

    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    :cond_0
    new-instance v0, Lڝږ؁ڋ/ؾ;

    invoke-direct {v0, v3, v5}, Lڝږ؁ڋ/ؾ;-><init>(Lڝږ؁ڋ/ق;I)V

    const-wide/16 v1, 0xfa

    invoke-virtual {v3, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :goto_1
    iget-object v2, v3, Lڝږ؁ڋ/ق;->ء:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iput-boolean v1, v3, Lڝږ؁ڋ/ق;->ت:Z

    :goto_2
    const/16 v2, 0x9

    if-ge v1, v2, :cond_1

    iget-object v2, v3, Lڝږ؁ڋ/ق;->ؠ:[F

    aput v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
