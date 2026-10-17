.class public final synthetic Landroidx/appcompat/widget/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/appcompat/widget/TooltipCompatHandler;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/widget/TooltipCompatHandler;I)V
    .locals 0

    iput p2, p0, Landroidx/appcompat/widget/ء;->آ:I

    iput-object p1, p0, Landroidx/appcompat/widget/ء;->أ:Landroidx/appcompat/widget/TooltipCompatHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/appcompat/widget/ء;->آ:I

    iget-object v1, p0, Landroidx/appcompat/widget/ء;->أ:Landroidx/appcompat/widget/TooltipCompatHandler;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/appcompat/widget/TooltipCompatHandler;->؋(Landroidx/appcompat/widget/TooltipCompatHandler;)V

    return-void

    :goto_0
    invoke-virtual {v1}, Landroidx/appcompat/widget/TooltipCompatHandler;->hide()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
