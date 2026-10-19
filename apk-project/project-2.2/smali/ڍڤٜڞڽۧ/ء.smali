.class public final synthetic Lڍڤٜڞڽۧ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڍڤٜڞڽۧ/أ;

.field public final synthetic ؤ:Ljava/lang/Runnable;

.field public final synthetic إ:Lئٱنۃؖۊڄئ/آ;


# direct methods
.method public synthetic constructor <init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V
    .locals 0

    iput p4, p0, Lڍڤٜڞڽۧ/ء;->آ:I

    iput-object p1, p0, Lڍڤٜڞڽۧ/ء;->أ:Lڍڤٜڞڽۧ/أ;

    iput-object p2, p0, Lڍڤٜڞڽۧ/ء;->ؤ:Ljava/lang/Runnable;

    iput-object p3, p0, Lڍڤٜڞڽۧ/ء;->إ:Lئٱنۃؖۊڄئ/آ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget v0, p0, Lڍڤٜڞڽۧ/ء;->آ:I

    iget-object v1, p0, Lڍڤٜڞڽۧ/ء;->إ:Lئٱنۃؖۊڄئ/آ;

    iget-object v2, p0, Lڍڤٜڞڽۧ/ء;->ؤ:Ljava/lang/Runnable;

    iget-object v3, p0, Lڍڤٜڞڽۧ/ء;->أ:Lڍڤٜڞڽۧ/أ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڍڤٜڞڽۧ/آ;

    const/4 v4, 0x2

    invoke-direct {v0, v2, v1, v4}, Lڍڤٜڞڽۧ/آ;-><init>(Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    iget-object v1, v3, Lڍڤٜڞڽۧ/أ;->آ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڍڤٜڞڽۧ/آ;

    const/4 v4, 0x0

    invoke-direct {v0, v2, v1, v4}, Lڍڤٜڞڽۧ/آ;-><init>(Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    iget-object v1, v3, Lڍڤٜڞڽۧ/أ;->آ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :goto_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڍڤٜڞڽۧ/آ;

    const/4 v4, 0x1

    invoke-direct {v0, v2, v1, v4}, Lڍڤٜڞڽۧ/آ;-><init>(Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    iget-object v1, v3, Lڍڤٜڞڽۧ/أ;->آ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
