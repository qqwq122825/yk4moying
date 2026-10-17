.class public final synthetic Lةؽڗںۍټ٘/ا;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةڈۑۂٝےآذ/ؠ;
.implements Lڍڤٜڞڽۧ/ؤ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:J

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;

.field public final synthetic ئ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lةؽڗںۍټ٘/ت;Ljava/lang/Iterable;Lأۺؘٻڣ/ز;J)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lةؽڗںۍټ٘/ا;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lةؽڗںۍټ٘/ا;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Lةؽڗںۍټ٘/ا;->إ:Ljava/lang/Object;

    iput-object p3, p0, Lةؽڗںۍټ٘/ا;->ئ:Ljava/lang/Object;

    iput-wide p4, p0, Lةؽڗںۍټ٘/ا;->أ:J

    return-void
.end method

.method public synthetic constructor <init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;I)V
    .locals 0

    iput p6, p0, Lةؽڗںۍټ٘/ا;->آ:I

    iput-object p1, p0, Lةؽڗںۍټ٘/ا;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Lةؽڗںۍټ٘/ا;->إ:Ljava/lang/Object;

    iput-wide p3, p0, Lةؽڗںۍټ٘/ا;->أ:J

    iput-object p5, p0, Lةؽڗںۍټ٘/ا;->ئ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lةؽڗںۍټ٘/ا;->ؤ:Ljava/lang/Object;

    check-cast v0, Lةؽڗںۍټ٘/ت;

    iget-object v1, p0, Lةؽڗںۍټ٘/ا;->إ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Iterable;

    iget-object v2, p0, Lةؽڗںۍټ٘/ا;->ئ:Ljava/lang/Object;

    check-cast v2, Lأۺؘٻڣ/ز;

    iget-object v3, v0, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v3, Lةٌخ/ة;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "UPDATE events SET num_attempts = num_attempts + 1 WHERE _id in "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lةٌخ/ة;->ـ(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lئٱنۃؖۊڄئ/؋;

    const/4 v5, 0x1

    const-string v6, "SELECT COUNT(*), transport_name FROM events WHERE num_attempts >= 16 GROUP BY transport_name"

    invoke-direct {v4, v3, v1, v6, v5}, Lئٱنۃؖۊڄئ/؋;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v3, v4}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    :goto_0
    iget-object v0, v0, Lةؽڗںۍټ٘/ت;->إ:Lثڈا/؋;

    check-cast v0, Lثڈا/ؠ;

    invoke-virtual {v0}, Lثڈا/ؠ;->؋()J

    move-result-wide v0

    iget-wide v4, p0, Lةؽڗںۍټ٘/ا;->أ:J

    add-long/2addr v0, v4

    new-instance v4, Lةٌخ/أ;

    invoke-direct {v4, v0, v1, v2}, Lةٌخ/أ;-><init>(JLأۺؘٻڣ/ز;)V

    invoke-virtual {v3, v4}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    const/4 v0, 0x0

    return-object v0
.end method

.method public final ؋(Lئٱنۃؖۊڄئ/آ;)Ljava/util/concurrent/ScheduledFuture;
    .locals 7

    iget v0, p0, Lةؽڗںۍټ٘/ا;->آ:I

    iget-wide v1, p0, Lةؽڗںۍټ٘/ا;->أ:J

    iget-object v3, p0, Lةؽڗںۍټ٘/ا;->ئ:Ljava/lang/Object;

    iget-object v4, p0, Lةؽڗںۍټ٘/ا;->إ:Ljava/lang/Object;

    iget-object v5, p0, Lةؽڗںۍټ٘/ا;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v5, Lڍڤٜڞڽۧ/أ;

    check-cast v4, Ljava/util/concurrent/Callable;

    check-cast v3, Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroidx/work/impl/؋;

    const/4 v6, 0x1

    invoke-direct {v0, v5, v4, p1, v6}, Landroidx/work/impl/؋;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p1, v5, Lڍڤٜڞڽۧ/أ;->أ:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p1, v0, v1, v2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    return-object p1

    :goto_0
    check-cast v5, Lڍڤٜڞڽۧ/أ;

    check-cast v4, Ljava/lang/Runnable;

    check-cast v3, Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڍڤٜڞڽۧ/ء;

    const/4 v6, 0x2

    invoke-direct {v0, v5, v4, p1, v6}, Lڍڤٜڞڽۧ/ء;-><init>(Lڍڤٜڞڽۧ/أ;Ljava/lang/Runnable;Lئٱنۃؖۊڄئ/آ;I)V

    iget-object p1, v5, Lڍڤٜڞڽۧ/أ;->أ:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p1, v0, v1, v2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
