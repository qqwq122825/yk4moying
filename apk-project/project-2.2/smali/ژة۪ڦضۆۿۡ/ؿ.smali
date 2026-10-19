.class public abstract Lژة۪ڦضۆۿۡ/ؿ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:J

.field public static final ؠ:Ljava/lang/Object;

.field public static ء:Lؽىږګګؓط/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lژة۪ڦضۆۿۡ/ؿ;->؋:J

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lژة۪ڦضۆۿۡ/ؿ;->ؠ:Ljava/lang/Object;

    return-void
.end method

.method public static ؋(Landroid/content/Intent;)V
    .locals 3

    sget-object v0, Lژة۪ڦضۆۿۡ/ؿ;->ؠ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    if-eqz v1, :cond_0

    const-string v1, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-object p0, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    invoke-virtual {p0}, Lؽىږګګؓط/؋;->ء()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static ؠ(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .locals 4

    sget-object v0, Lژة۪ڦضۆۿۡ/ؿ;->ؠ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    const/4 v2, 0x1

    if-nez v1, :cond_0

    new-instance v1, Lؽىږګګؓط/؋;

    invoke-direct {v1, p0}, Lؽىږګګؓط/؋;-><init>(Landroid/content/Context;)V

    sput-object v1, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    iget-object v3, v1, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iput-boolean v2, v1, Lؽىږګګؓط/؋;->إ:Z

    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0

    :cond_0
    :goto_0
    const-string v1, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object p0

    if-nez p0, :cond_1

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :cond_1
    if-nez v1, :cond_2

    sget-object p1, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    sget-wide v1, Lژة۪ڦضۆۿۡ/ؿ;->؋:J

    invoke-virtual {p1, v1, v2}, Lؽىږګګؓط/؋;->؋(J)V

    :cond_2
    monitor-exit v0

    return-object p0

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0
.end method
