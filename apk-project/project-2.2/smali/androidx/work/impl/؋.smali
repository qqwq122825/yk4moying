.class public final synthetic Landroidx/work/impl/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;

.field public final synthetic ء:Ljava/lang/Object;

.field public final synthetic آ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p4, p0, Landroidx/work/impl/؋;->؋:I

    iput-object p1, p0, Landroidx/work/impl/؋;->ؠ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/work/impl/؋;->ء:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/work/impl/؋;->آ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    iget v0, p0, Landroidx/work/impl/؋;->؋:I

    iget-object v1, p0, Landroidx/work/impl/؋;->آ:Ljava/lang/Object;

    iget-object v2, p0, Landroidx/work/impl/؋;->ء:Ljava/lang/Object;

    iget-object v3, p0, Landroidx/work/impl/؋;->ؠ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v3, Landroidx/work/impl/Processor;

    check-cast v2, Ljava/util/ArrayList;

    check-cast v1, Ljava/lang/String;

    invoke-static {v3, v2, v1}, Landroidx/work/impl/Processor;->ؠ(Landroidx/work/impl/Processor;Ljava/util/ArrayList;Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v0

    return-object v0

    :goto_0
    check-cast v3, Lڍڤٜڞڽۧ/أ;

    check-cast v2, Ljava/util/concurrent/Callable;

    check-cast v1, Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v4, 0x10

    invoke-direct {v0, v4, v2, v1}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v3, Lڍڤٜڞڽۧ/أ;->آ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
