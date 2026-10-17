.class public final synthetic Landroidx/core/widget/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/core/widget/ContentLoadingProgressBar;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V
    .locals 0

    iput p2, p0, Landroidx/core/widget/؋;->آ:I

    iput-object p1, p0, Landroidx/core/widget/؋;->أ:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/core/widget/؋;->آ:I

    iget-object v1, p0, Landroidx/core/widget/؋;->أ:Landroidx/core/widget/ContentLoadingProgressBar;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/core/widget/ContentLoadingProgressBar;->؋(Landroidx/core/widget/ContentLoadingProgressBar;)V

    return-void

    :pswitch_1
    invoke-static {v1}, Landroidx/core/widget/ContentLoadingProgressBar;->ؠ(Landroidx/core/widget/ContentLoadingProgressBar;)V

    return-void

    :pswitch_2
    invoke-static {v1}, Landroidx/core/widget/ContentLoadingProgressBar;->آ(Landroidx/core/widget/ContentLoadingProgressBar;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/core/widget/ContentLoadingProgressBar;->ء(Landroidx/core/widget/ContentLoadingProgressBar;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
