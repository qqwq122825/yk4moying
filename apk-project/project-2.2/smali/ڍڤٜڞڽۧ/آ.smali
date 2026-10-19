.class public final synthetic Lڍڤٜڞڽۧ/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Runnable;

.field public final synthetic ؤ:Lئٱنۃؖۊڄئ/آ;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V
    .locals 0

    iput p3, p0, Lڍڤٜڞڽۧ/آ;->آ:I

    iput-object p1, p0, Lڍڤٜڞڽۧ/آ;->أ:Ljava/lang/Runnable;

    iput-object p2, p0, Lڍڤٜڞڽۧ/آ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lڍڤٜڞڽۧ/آ;->آ:I

    iget-object v1, p0, Lڍڤٜڞڽۧ/آ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    iget-object v2, p0, Lڍڤٜڞڽۧ/آ;->أ:Ljava/lang/Runnable;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    :try_start_0
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    iget-object v0, v1, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lڍڤٜڞڽۧ/إ;

    sget v2, Lڍڤٜڞڽۧ/إ;->أ:I

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/AbstractResolvableFuture;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, v1, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lڍڤٜڞڽۧ/إ;

    sget v2, Lڍڤٜڞڽۧ/إ;->أ:I

    invoke-virtual {v1, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    :goto_0
    return-void

    :pswitch_1
    :try_start_1
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception v0

    iget-object v1, v1, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lڍڤٜڞڽۧ/إ;

    sget v2, Lڍڤٜڞڽۧ/إ;->أ:I

    invoke-virtual {v1, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    throw v0

    :goto_1
    :try_start_2
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    iget-object v1, v1, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lڍڤٜڞڽۧ/إ;

    sget v2, Lڍڤٜڞڽۧ/إ;->أ:I

    invoke-virtual {v1, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
