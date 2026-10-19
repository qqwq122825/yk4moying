.class public final synthetic Lڍڤٜڞڽۧ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڍڤٜڞڽۧ/ؤ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڍڤٜڞڽۧ/أ;

.field public final synthetic ؤ:Ljava/lang/Runnable;

.field public final synthetic إ:J

.field public final synthetic ئ:J

.field public final synthetic ا:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public synthetic constructor <init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;I)V
    .locals 0

    iput p8, p0, Lڍڤٜڞڽۧ/ؠ;->آ:I

    iput-object p1, p0, Lڍڤٜڞڽۧ/ؠ;->أ:Lڍڤٜڞڽۧ/أ;

    iput-object p2, p0, Lڍڤٜڞڽۧ/ؠ;->ؤ:Ljava/lang/Runnable;

    iput-wide p3, p0, Lڍڤٜڞڽۧ/ؠ;->إ:J

    iput-wide p5, p0, Lڍڤٜڞڽۧ/ؠ;->ئ:J

    iput-object p7, p0, Lڍڤٜڞڽۧ/ؠ;->ا:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋(Lئٱنۃؖۊڄئ/آ;)Ljava/util/concurrent/ScheduledFuture;
    .locals 10

    iget v0, p0, Lڍڤٜڞڽۧ/ؠ;->آ:I

    iget-object v1, p0, Lڍڤٜڞڽۧ/ؠ;->ؤ:Ljava/lang/Runnable;

    iget-object v2, p0, Lڍڤٜڞڽۧ/ؠ;->أ:Lڍڤٜڞڽۧ/أ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-wide v5, p0, Lڍڤٜڞڽۧ/ؠ;->إ:J

    iget-wide v7, p0, Lڍڤٜڞڽۧ/ؠ;->ئ:J

    iget-object v9, p0, Lڍڤٜڞڽۧ/ؠ;->ا:Ljava/util/concurrent/TimeUnit;

    iget-object v3, v2, Lڍڤٜڞڽۧ/أ;->أ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v4, Lڍڤٜڞڽۧ/ء;

    const/4 v0, 0x1

    invoke-direct {v4, v2, v1, p1, v0}, Lڍڤٜڞڽۧ/ء;-><init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    invoke-interface/range {v3 .. v9}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    return-object p1

    :goto_0
    iget-wide v3, p0, Lڍڤٜڞڽۧ/ؠ;->إ:J

    iget-wide v5, p0, Lڍڤٜڞڽۧ/ؠ;->ئ:J

    iget-object v7, p0, Lڍڤٜڞڽۧ/ؠ;->ا:Ljava/util/concurrent/TimeUnit;

    iget-object v0, v2, Lڍڤٜڞڽۧ/أ;->أ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v8, Lڍڤٜڞڽۧ/ء;

    const/4 v9, 0x0

    invoke-direct {v8, v2, v1, p1, v9}, Lڍڤٜڞڽۧ/ء;-><init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    move-object v1, v8

    move-wide v2, v3

    move-wide v4, v5

    move-object v6, v7

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
