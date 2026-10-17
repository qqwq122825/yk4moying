.class public final Lھۥٓڍچ/ئ;
.super Lںڍڒڸ/ر;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ط;


# static fields
.field public static final ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile runningWorkers:I

.field public final آ:Lںڍڒڸ/ر;

.field public final أ:I

.field public final synthetic ؤ:Lںڍڒڸ/ط;

.field public final إ:Lھۥٓڍچ/ة;

.field public final ئ:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lھۥٓڍچ/ئ;

    const-string v1, "runningWorkers"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lںڍڒڸ/ر;I)V
    .locals 0

    invoke-direct {p0}, Lںڍڒڸ/ر;-><init>()V

    iput-object p1, p0, Lھۥٓڍچ/ئ;->آ:Lںڍڒڸ/ر;

    iput p2, p0, Lھۥٓڍچ/ئ;->أ:I

    instance-of p2, p1, Lںڍڒڸ/ط;

    if-eqz p2, :cond_0

    check-cast p1, Lںڍڒڸ/ط;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    sget-object p1, Lںڍڒڸ/ض;->؋:Lںڍڒڸ/ط;

    :cond_1
    iput-object p1, p0, Lھۥٓڍچ/ئ;->ؤ:Lںڍڒڸ/ط;

    new-instance p1, Lھۥٓڍچ/ة;

    invoke-direct {p1}, Lھۥٓڍچ/ة;-><init>()V

    iput-object p1, p0, Lھۥٓڍچ/ئ;->إ:Lھۥٓڍچ/ة;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھۥٓڍچ/ئ;->ئ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    iget-object p1, p0, Lھۥٓڍچ/ئ;->إ:Lھۥٓڍچ/ة;

    invoke-virtual {p1, p2}, Lھۥٓڍچ/ة;->؋(Ljava/lang/Object;)Z

    sget-object p1, Lھۥٓڍچ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result p2

    iget v0, p0, Lھۥٓڍچ/ئ;->أ:I

    if-ge p2, v0, :cond_2

    iget-object p2, p0, Lھۥٓڍچ/ئ;->ئ:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lھۥٓڍچ/ئ;->أ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v0, v1, :cond_0

    monitor-exit p2

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    :try_start_1
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p2

    const/4 p1, 0x1

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lھۥٓڍچ/ئ;->ؾ()Ljava/lang/Runnable;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    new-instance p2, Lحظتۢۋۜآظ/ة;

    const/16 v0, 0x10

    invoke-direct {p2, p0, p1, v0}, Lحظتۢۋۜآظ/ة;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p1, p0, Lھۥٓڍچ/ئ;->آ:Lںڍڒڸ/ر;

    invoke-virtual {p1, p0, p2}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p2

    throw p1

    :cond_2
    :goto_1
    return-void
.end method

.method public final dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    iget-object p1, p0, Lھۥٓڍچ/ئ;->إ:Lھۥٓڍچ/ة;

    invoke-virtual {p1, p2}, Lھۥٓڍچ/ة;->؋(Ljava/lang/Object;)Z

    sget-object p1, Lھۥٓڍچ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result p2

    iget v0, p0, Lھۥٓڍچ/ئ;->أ:I

    if-ge p2, v0, :cond_2

    iget-object p2, p0, Lھۥٓڍچ/ئ;->ئ:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lھۥٓڍچ/ئ;->أ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v0, v1, :cond_0

    monitor-exit p2

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    :try_start_1
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p2

    const/4 p1, 0x1

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lھۥٓڍچ/ئ;->ؾ()Ljava/lang/Runnable;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    new-instance p2, Lحظتۢۋۜآظ/ة;

    const/16 v0, 0x10

    invoke-direct {p2, p0, p1, v0}, Lحظتۢۋۜآظ/ة;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p1, p0, Lھۥٓڍچ/ئ;->آ:Lںڍڒڸ/ر;

    invoke-virtual {p1, p0, p2}, Lںڍڒڸ/ر;->dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p2

    throw p1

    :cond_2
    :goto_1
    return-void
.end method

.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    invoke-static {p1}, Lڗًقڔ/؋;->ث(I)V

    iget v0, p0, Lھۥٓڍچ/ئ;->أ:I

    if-lt p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-super {p0, p1}, Lںڍڒڸ/ر;->limitedParallelism(I)Lںڍڒڸ/ر;

    move-result-object p1

    return-object p1
.end method

.method public final ر(JLںڍڒڸ/ئ;)V
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ئ;->ؤ:Lںڍڒڸ/ط;

    invoke-interface {v0, p1, p2, p3}, Lںڍڒڸ/ط;->ر(JLںڍڒڸ/ئ;)V

    return-void
.end method

.method public final ؾ()Ljava/lang/Runnable;
    .locals 3

    :goto_0
    iget-object v0, p0, Lھۥٓڍچ/ئ;->إ:Lھۥٓڍچ/ة;

    invoke-virtual {v0}, Lھۥٓڍچ/ة;->آ()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-nez v0, :cond_1

    iget-object v0, p0, Lھۥٓڍچ/ئ;->ئ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lھۥٓڍچ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I

    iget-object v2, p0, Lھۥٓڍچ/ئ;->إ:Lھۥٓڍچ/ة;

    invoke-virtual {v2}, Lھۥٓڍچ/ة;->ء()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    :try_start_1
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :cond_1
    return-object v0
.end method
