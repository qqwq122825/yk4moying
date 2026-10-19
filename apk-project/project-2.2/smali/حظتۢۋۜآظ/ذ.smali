.class public final Lحظتۢۋۜآظ/ذ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static أ:Lحظتۢۋۜآظ/ذ;


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Ljava/util/concurrent/ScheduledExecutorService;

.field public ء:Lحظتۢۋۜآظ/ج;

.field public آ:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lحظتۢۋۜآظ/ج;

    invoke-direct {v0, p0}, Lحظتۢۋۜآظ/ج;-><init>(Lحظتۢۋۜآظ/ذ;)V

    iput-object v0, p0, Lحظتۢۋۜآظ/ذ;->ء:Lحظتۢۋۜآظ/ج;

    const/4 v0, 0x1

    iput v0, p0, Lحظتۢۋۜآظ/ذ;->آ:I

    iput-object p2, p0, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lحظتۢۋۜآظ/ذ;->؋:Landroid/content/Context;

    return-void
.end method

.method public static declared-synchronized ؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;
    .locals 4

    const-class v0, Lحظتۢۋۜآظ/ذ;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lحظتۢۋۜآظ/ذ;->أ:Lحظتۢۋۜآظ/ذ;

    if-nez v1, :cond_0

    new-instance v1, Lحظتۢۋۜآظ/ذ;

    new-instance v2, Lسڒذ/؋;

    const-string v3, "MessengerIpcClient"

    invoke-direct {v2, v3}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    invoke-static {v2}, Ljava/util/concurrent/Executors;->unconfigurableScheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lحظتۢۋۜآظ/ذ;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V

    sput-object v1, Lحظتۢۋۜآظ/ذ;->أ:Lحظتۢۋۜآظ/ذ;

    :cond_0
    sget-object p0, Lحظتۢۋۜآظ/ذ;->أ:Lحظتۢۋۜآظ/ذ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public final declared-synchronized ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "MessengerIpcClient"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lحظتۢۋۜآظ/خ;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Queueing "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "MessengerIpcClient"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lحظتۢۋۜآظ/ذ;->ء:Lحظتۢۋۜآظ/ج;

    invoke-virtual {v0, p1}, Lحظتۢۋۜآظ/ج;->آ(Lحظتۢۋۜآظ/ح;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lحظتۢۋۜآظ/ج;

    invoke-direct {v0, p0}, Lحظتۢۋۜآظ/ج;-><init>(Lحظتۢۋۜآظ/ذ;)V

    iput-object v0, p0, Lحظتۢۋۜآظ/ذ;->ء:Lحظتۢۋۜآظ/ج;

    invoke-virtual {v0, p1}, Lحظتۢۋۜآظ/ج;->آ(Lحظتۢۋۜآظ/ح;)Z

    :cond_1
    iget-object p1, p1, Lحظتۢۋۜآظ/خ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    iget-object p1, p1, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
