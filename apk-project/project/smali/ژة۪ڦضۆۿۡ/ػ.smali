.class public final synthetic Lژة۪ڦضۆۿۡ/ػ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic ؋:Landroid/content/Context;

.field public final synthetic ؠ:Ljava/util/concurrent/ScheduledExecutorService;

.field public final synthetic ء:Lcom/google/firebase/messaging/FirebaseMessaging;

.field public final synthetic آ:Lژة۪ڦضۆۿۡ/ذ;

.field public final synthetic أ:Lأۺؘٻڣ/ئ;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lأۺؘٻڣ/ئ;Lcom/google/firebase/messaging/FirebaseMessaging;Lژة۪ڦضۆۿۡ/ذ;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ػ;->؋:Landroid/content/Context;

    iput-object p5, p0, Lژة۪ڦضۆۿۡ/ػ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    iput-object p3, p0, Lژة۪ڦضۆۿۡ/ػ;->ء:Lcom/google/firebase/messaging/FirebaseMessaging;

    iput-object p4, p0, Lژة۪ڦضۆۿۡ/ػ;->آ:Lژة۪ڦضۆۿۡ/ذ;

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/ػ;->أ:Lأۺؘٻڣ/ئ;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 8

    iget-object v5, p0, Lژة۪ڦضۆۿۡ/ػ;->؋:Landroid/content/Context;

    iget-object v6, p0, Lژة۪ڦضۆۿۡ/ػ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ػ;->ء:Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v2, p0, Lژة۪ڦضۆۿۡ/ػ;->آ:Lژة۪ڦضۆۿۡ/ذ;

    iget-object v4, p0, Lژة۪ڦضۆۿۡ/ػ;->أ:Lأۺؘٻڣ/ئ;

    const-class v0, Lژة۪ڦضۆۿۡ/غ;

    monitor-enter v0

    :try_start_0
    sget-object v3, Lژة۪ڦضۆۿۡ/غ;->ء:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lژة۪ڦضۆۿۡ/غ;

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-nez v3, :cond_1

    const-string v3, "com.google.android.gms.appid"

    const/4 v7, 0x0

    invoke-virtual {v5, v3, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    new-instance v7, Lژة۪ڦضۆۿۡ/غ;

    invoke-direct {v7, v3, v6}, Lژة۪ڦضۆۿۡ/غ;-><init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledExecutorService;)V

    monitor-enter v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {v3, v6}, Lذ٨ۍ/ر;->ؠ(Landroid/content/SharedPreferences;Ljava/util/concurrent/Executor;)Lذ٨ۍ/ر;

    move-result-object v3

    iput-object v3, v7, Lژة۪ڦضۆۿۡ/غ;->؋:Lذ٨ۍ/ر;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v7

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lژة۪ڦضۆۿۡ/غ;->ء:Ljava/lang/ref/WeakReference;

    move-object v3, v7

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v7

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    :goto_1
    monitor-exit v0

    new-instance v7, Lژة۪ڦضۆۿۡ/ؼ;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lژة۪ڦضۆۿۡ/ؼ;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;Lژة۪ڦضۆۿۡ/ذ;Lژة۪ڦضۆۿۡ/غ;Lأۺؘٻڣ/ئ;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v7

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method
