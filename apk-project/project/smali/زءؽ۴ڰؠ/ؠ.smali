.class public final Lزءؽ۴ڰؠ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؠ:Ljava/lang/Object;

.field public static volatile ء:Lزءؽ۴ڰؠ/ؠ;


# instance fields
.field public final ؋:Ljava/util/concurrent/ConcurrentHashMap;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lزءؽ۴ڰؠ/ؠ;->ؠ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lزءؽ۴ڰؠ/ؠ;->؋:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public static ؋()Lزءؽ۴ڰؠ/ؠ;
    .locals 2

    sget-object v0, Lزءؽ۴ڰؠ/ؠ;->ء:Lزءؽ۴ڰؠ/ؠ;

    if-nez v0, :cond_1

    sget-object v0, Lزءؽ۴ڰؠ/ؠ;->ؠ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lزءؽ۴ڰؠ/ؠ;->ء:Lزءؽ۴ڰؠ/ؠ;

    if-nez v1, :cond_0

    new-instance v1, Lزءؽ۴ڰؠ/ؠ;

    invoke-direct {v1}, Lزءؽ۴ڰؠ/ؠ;-><init>()V

    sput-object v1, Lزءؽ۴ڰؠ/ؠ;->ء:Lزءؽ۴ڰؠ/ؠ;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lزءؽ۴ڰؠ/ؠ;->ء:Lزءؽ۴ڰؠ/ؠ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public final ؠ(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    .locals 2

    instance-of v0, p2, Lذ۠ۋؿ/ؽ;

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lزءؽ۴ڰؠ/ؠ;->؋:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ServiceConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p1, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw p1

    :cond_0
    :try_start_2
    invoke-virtual {p1, p2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    return-void
.end method

.method public final ء(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/content/ServiceConnection;ILjava/util/concurrent/Executor;)Z
    .locals 7

    invoke-virtual {p3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    const-string v1, "ConnectionTracker"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "com.google.android.gms"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :try_start_0
    invoke-static {p1}, Lسۄھؤۏ۫/ؠ;->؋(Landroid/content/Context;)Lحۨٸڮؐێ/ئ;

    move-result-object v3

    iget-object v3, v3, Lحۨٸڮؐێ/ئ;->؋:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/high16 v3, 0x200000

    and-int/2addr v0, v3

    if-eqz v0, :cond_1

    const-string p1, "Attempted to bind to a service in a STOPPED package."

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :catch_0
    :cond_1
    :goto_0
    instance-of v0, p4, Lذ۠ۋؿ/ؽ;

    const/4 v3, 0x1

    xor-int/2addr v0, v3

    const/4 v4, 0x0

    const/16 v5, 0x1d

    if-eqz v0, :cond_7

    iget-object v0, p0, Lزءؽ۴ڰؠ/ؠ;->؋:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p4, p4}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ServiceConnection;

    if-eqz v6, :cond_2

    if-eq p4, v6, :cond_2

    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    filled-new-array {p4, p2, v6}, [Ljava/lang/Object;

    move-result-object p2

    const-string v6, "Duplicate binding with the same ServiceConnection: %s, %s, %s."

    invoke-static {v6, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    if-nez p6, :cond_3

    move-object p6, v4

    :cond_3
    :try_start_1
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v5, :cond_4

    goto :goto_1

    :cond_4
    move v3, v2

    :goto_1
    if-eqz v3, :cond_5

    if-eqz p6, :cond_5

    invoke-static {p5, p1, p3, p4, p6}, Lزءؽ۴ڰؠ/؋;->ب(ILandroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;Ljava/util/concurrent/Executor;)Z

    move-result p1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :cond_5
    invoke-virtual {p1, p3, p4, p5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    if-eqz p1, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v0, p4, p4}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    return v2

    :goto_3
    invoke-virtual {v0, p4, p4}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    throw p1

    :cond_7
    if-nez p6, :cond_8

    move-object p6, v4

    :cond_8
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v5, :cond_9

    move v2, v3

    :cond_9
    if-eqz v2, :cond_a

    if-eqz p6, :cond_a

    invoke-static {p5, p1, p3, p4, p6}, Lزءؽ۴ڰؠ/؋;->ب(ILandroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;Ljava/util/concurrent/Executor;)Z

    move-result p1

    goto :goto_4

    :cond_a
    invoke-virtual {p1, p3, p4, p5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p1

    :goto_4
    return p1
.end method
