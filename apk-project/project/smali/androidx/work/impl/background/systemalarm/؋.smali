.class public final synthetic Landroidx/work/impl/background/systemalarm/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;I)V
    .locals 0

    iput p2, p0, Landroidx/work/impl/background/systemalarm/؋;->آ:I

    iput-object p1, p0, Landroidx/work/impl/background/systemalarm/؋;->أ:Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/work/impl/background/systemalarm/؋;->آ:I

    iget-object v1, p0, Landroidx/work/impl/background/systemalarm/؋;->أ:Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;->؋(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;)V

    return-void

    :pswitch_1
    invoke-static {v1}, Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;->؋(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;)V

    return-void

    :pswitch_2
    invoke-static {v1}, Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;->ؠ(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;)V

    return-void

    :pswitch_3
    invoke-static {v1}, Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;->ؠ(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;->ؠ(Landroidx/work/impl/background/systemalarm/DelayMetCommandHandler;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
