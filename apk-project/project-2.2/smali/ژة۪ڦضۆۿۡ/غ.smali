.class public final Lژة۪ڦضۆۿۡ/غ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ء:Ljava/lang/ref/WeakReference;


# instance fields
.field public ؋:Lذ٨ۍ/ر;

.field public final ؠ:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/غ;->ؠ:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public final declared-synchronized ؋()Lژة۪ڦضۆۿۡ/ع;
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lژة۪ڦضۆۿۡ/غ;->؋:Lذ٨ۍ/ر;

    iget-object v1, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v1, Ljava/util/ArrayDeque;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget-object v1, Lژة۪ڦضۆۿۡ/ع;->آ:Ljava/util/regex/Pattern;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "!"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    :goto_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    new-instance v1, Lژة۪ڦضۆۿۡ/ع;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v0, v0, v3

    invoke-direct {v1, v2, v0}, Lژة۪ڦضۆۿۡ/ع;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v0, v1

    :goto_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method
