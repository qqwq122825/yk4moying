.class public final Lژة۪ڦضۆۿۡ/ص;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static أ:Lژة۪ڦضۆۿۡ/ص;

.field public static ؤ:Lژة۪ڦضۆۿۡ/ص;


# instance fields
.field public ؋:Ljava/lang/Object;

.field public ؠ:Ljava/lang/Object;

.field public ء:Ljava/io/Serializable;

.field public آ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v2, 0x2

    if-eq p1, v2, :cond_0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->آ:Ljava/lang/Object;

    return-void

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    new-instance v2, Lحظتۢۋۜآظ/ث;

    invoke-direct {v2, v1, p0}, Lحظتۢۋۜآظ/ث;-><init>(ILjava/lang/Object;)V

    invoke-direct {p1, v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    return-void

    :cond_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->آ:Ljava/lang/Object;

    const-string p1, ""

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    return-void
.end method

.method public static declared-synchronized ؋()Lژة۪ڦضۆۿۡ/ص;
    .locals 3

    const-class v0, Lژة۪ڦضۆۿۡ/ص;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lژة۪ڦضۆۿۡ/ص;->أ:Lژة۪ڦضۆۿۡ/ص;

    if-nez v1, :cond_0

    new-instance v1, Lژة۪ڦضۆۿۡ/ص;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lژة۪ڦضۆۿۡ/ص;-><init>(I)V

    sput-object v1, Lژة۪ڦضۆۿۡ/ص;->أ:Lژة۪ڦضۆۿۡ/ص;

    :cond_0
    sget-object v1, Lژة۪ڦضۆۿۡ/ص;->أ:Lژة۪ڦضۆۿۡ/ص;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public final ؠ(Landroid/content/Context;)Z
    .locals 1

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    check-cast v0, Ljava/lang/Boolean;

    if-nez v0, :cond_1

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    :cond_1
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "FirebaseMessaging"

    const/4 v0, 0x3

    invoke-static {p1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "Missing Permission: android.permission.ACCESS_NETWORK_STATE this should normally be included by the manifest merger, but may needed to be manually added to your manifest"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public final ء(Landroid/content/Context;)Z
    .locals 1

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    if-nez v0, :cond_1

    const-string v0, "android.permission.WAKE_LOCK"

    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    :cond_1
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x3

    const-string v0, "FirebaseMessaging"

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "Missing Permission: android.permission.WAKE_LOCK this should normally be included by the manifest merger, but may needed to be manually added to your manifest"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method
