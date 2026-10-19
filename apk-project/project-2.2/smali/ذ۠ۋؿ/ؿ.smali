.class public final Lذ۠ۋؿ/ؿ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ئ:Ljava/lang/Object;

.field public static ا:Lذ۠ۋؿ/ؿ;

.field public static ب:Landroid/os/HandlerThread;


# instance fields
.field public final ؋:Ljava/util/HashMap;

.field public final ؠ:Landroid/content/Context;

.field public volatile ء:Lصٝتږۗ/آ;

.field public final آ:Lزءؽ۴ڰؠ/ؠ;

.field public final أ:J

.field public final ؤ:J

.field public volatile إ:Ljava/util/concurrent/Executor;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ؿ;->ئ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    new-instance v0, Lذ۠ۋؿ/ؾ;

    invoke-direct {v0, p0}, Lذ۠ۋؿ/ؾ;-><init>(Lذ۠ۋؿ/ؿ;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lذ۠ۋؿ/ؿ;->ؠ:Landroid/content/Context;

    new-instance p1, Lصٝتږۗ/آ;

    const/4 v1, 0x1

    invoke-direct {p1, p2, v0, v1}, Lصٝتږۗ/آ;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;I)V

    iput-object p1, p0, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    invoke-static {}, Lزءؽ۴ڰؠ/ؠ;->؋()Lزءؽ۴ڰؠ/ؠ;

    move-result-object p1

    iput-object p1, p0, Lذ۠ۋؿ/ؿ;->آ:Lزءؽ۴ڰؠ/ؠ;

    const-wide/16 p1, 0x1388

    iput-wide p1, p0, Lذ۠ۋؿ/ؿ;->أ:J

    const-wide/32 p1, 0x493e0

    iput-wide p1, p0, Lذ۠ۋؿ/ؿ;->ؤ:J

    const/4 p1, 0x0

    iput-object p1, p0, Lذ۠ۋؿ/ؿ;->إ:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/String;Ljava/lang/String;Lذ۠ۋؿ/ظ;Z)V
    .locals 2

    new-instance v0, Lذ۠ۋؿ/ؼ;

    invoke-direct {v0, p1, p2, p4}, Lذ۠ۋؿ/ؼ;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    const-string p1, "Trying to unbind a GmsServiceConnection  that was not bound before.  config="

    const-string p2, "Nonexistent connection status for service config: "

    iget-object p4, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    monitor-enter p4

    :try_start_0
    iget-object v1, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ۠ۋؿ/ؽ;

    if-eqz v1, :cond_2

    iget-object p2, v1, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p1, v1, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, v1, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p2, p0, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    iget-wide v0, p0, Lذ۠ۋؿ/ؿ;->أ:J

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    monitor-exit p4

    return-void

    :cond_1
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Lذ۠ۋؿ/ؼ;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Lذ۠ۋؿ/ؼ;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final ؠ(Lذ۠ۋؿ/ؼ;Lذ۠ۋؿ/ظ;Ljava/lang/String;)Z
    .locals 6

    const-string v0, "Trying to bind a GmsServiceConnection that was already connected before.  config="

    iget-object v1, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lذ۠ۋؿ/ؽ;

    iget-object v3, p0, Lذ۠ۋؿ/ؿ;->إ:Ljava/util/concurrent/Executor;

    if-nez v2, :cond_0

    new-instance v2, Lذ۠ۋؿ/ؽ;

    invoke-direct {v2, p0, p1}, Lذ۠ۋؿ/ؽ;-><init>(Lذ۠ۋؿ/ؿ;Lذ۠ۋؿ/ؼ;)V

    iget-object v0, v2, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {v0, p2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, p3, v3}, Lذ۠ۋؿ/ؽ;->؋(Ljava/lang/String;Ljava/util/concurrent/Executor;)V

    iget-object p2, p0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    iget-object v4, p0, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v4, v2, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {v4, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    iget-object p1, v2, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {p1, p2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, v2, Lذ۠ۋؿ/ؽ;->ؠ:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 p2, 0x2

    if-eq p1, p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2, p3, v3}, Lذ۠ۋؿ/ؽ;->؋(Ljava/lang/String;Ljava/util/concurrent/Executor;)V

    goto :goto_0

    :cond_2
    iget-object p1, v2, Lذ۠ۋؿ/ؽ;->ؤ:Landroid/content/ComponentName;

    iget-object p3, v2, Lذ۠ۋؿ/ؽ;->آ:Landroid/os/IBinder;

    invoke-virtual {p2, p1, p3}, Lذ۠ۋؿ/ظ;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    :goto_0
    iget-boolean p1, v2, Lذ۠ۋؿ/ؽ;->ء:Z

    monitor-exit v1

    return p1

    :cond_3
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Lذ۠ۋؿ/ؼ;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
