.class public final synthetic Landroidx/core/content/res/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:I

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;II)V
    .locals 0

    iput p3, p0, Landroidx/core/content/res/؋;->آ:I

    iput-object p1, p0, Landroidx/core/content/res/؋;->ؤ:Ljava/lang/Object;

    iput p2, p0, Landroidx/core/content/res/؋;->أ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Landroidx/core/content/res/؋;->آ:I

    iget v1, p0, Landroidx/core/content/res/؋;->أ:I

    iget-object v2, p0, Landroidx/core/content/res/؋;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v0, v2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->خ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->آ(Landroid/view/View;IZ)V

    :cond_0
    return-void

    :pswitch_1
    check-cast v2, Landroidx/core/content/res/ResourcesCompat$FontCallback;

    invoke-static {v2, v1}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->؋(Landroidx/core/content/res/ResourcesCompat$FontCallback;I)V

    return-void

    :goto_0
    check-cast v2, Landroid/content/Context;

    invoke-static {v2, v1}, Lڝږ؁ڋ/ح;->ا(Landroid/content/Context;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
