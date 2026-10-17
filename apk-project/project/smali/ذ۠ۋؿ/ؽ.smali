.class public final Lذ۠ۋؿ/ؽ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public final ؋:Ljava/util/HashMap;

.field public ؠ:I

.field public ء:Z

.field public آ:Landroid/os/IBinder;

.field public final أ:Lذ۠ۋؿ/ؼ;

.field public ؤ:Landroid/content/ComponentName;

.field public final synthetic إ:Lذ۠ۋؿ/ؿ;


# direct methods
.method public constructor <init>(Lذ۠ۋؿ/ؿ;Lذ۠ۋؿ/ؼ;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lذ۠ۋؿ/ؽ;->أ:Lذ۠ۋؿ/ؼ;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    const/4 p1, 0x2

    iput p1, p0, Lذ۠ۋؿ/ؽ;->ؠ:I

    return-void
.end method


# virtual methods
.method public final onBindingDied(Landroid/content/ComponentName;)V
    .locals 0

    invoke-virtual {p0, p1}, Lذ۠ۋؿ/ؽ;->onServiceDisconnected(Landroid/content/ComponentName;)V

    return-void
.end method

.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    iget-object v0, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object v0, v0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object v1, v1, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    iget-object v2, p0, Lذ۠ۋؿ/ؽ;->أ:Lذ۠ۋؿ/ؼ;

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iput-object p2, p0, Lذ۠ۋؿ/ؽ;->آ:Landroid/os/IBinder;

    iput-object p1, p0, Lذ۠ۋؿ/ؽ;->ؤ:Landroid/content/ComponentName;

    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ServiceConnection;

    invoke-interface {v2, p1, p2}, Landroid/content/ServiceConnection;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    goto :goto_0

    :cond_0
    iput v3, p0, Lذ۠ۋؿ/ؽ;->ؠ:I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4

    iget-object v0, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object v0, v0, Lذ۠ۋؿ/ؿ;->؋:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object v1, v1, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    iget-object v2, p0, Lذ۠ۋؿ/ؽ;->أ:Lذ۠ۋؿ/ؼ;

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lذ۠ۋؿ/ؽ;->آ:Landroid/os/IBinder;

    iput-object p1, p0, Lذ۠ۋؿ/ؽ;->ؤ:Landroid/content/ComponentName;

    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->؋:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ServiceConnection;

    invoke-interface {v2, p1}, Landroid/content/ServiceConnection;->onServiceDisconnected(Landroid/content/ComponentName;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    iput p1, p0, Lذ۠ۋؿ/ؽ;->ؠ:I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final ؋(Ljava/lang/String;Ljava/util/concurrent/Executor;)V
    .locals 11

    const/4 v0, 0x3

    iput v0, p0, Lذ۠ۋؿ/ؽ;->ؠ:I

    invoke-static {}, Landroid/os/StrictMode;->getVmPolicy()Landroid/os/StrictMode$VmPolicy;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    const/4 v3, 0x1

    if-lt v1, v2, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    new-instance v1, Landroid/os/StrictMode$VmPolicy$Builder;

    invoke-direct {v1, v0}, Landroid/os/StrictMode$VmPolicy$Builder;-><init>(Landroid/os/StrictMode$VmPolicy;)V

    invoke-static {v1}, Landroidx/core/app/آ;->ا(Landroid/os/StrictMode$VmPolicy$Builder;)Landroid/os/StrictMode$VmPolicy$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/StrictMode$VmPolicy$Builder;->build()Landroid/os/StrictMode$VmPolicy;

    move-result-object v1

    invoke-static {v1}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    :cond_1
    :try_start_0
    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object v4, v1, Lذ۠ۋؿ/ؿ;->آ:Lزءؽ۴ڰؠ/ؠ;

    iget-object v5, v1, Lذ۠ۋؿ/ؿ;->ؠ:Landroid/content/Context;

    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->أ:Lذ۠ۋؿ/ؼ;

    invoke-virtual {v1, v5}, Lذ۠ۋؿ/ؼ;->؋(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v7

    const/16 v9, 0x1081

    move-object v6, p1

    move-object v8, p0

    move-object v10, p2

    invoke-virtual/range {v4 .. v10}, Lزءؽ۴ڰؠ/ؠ;->ء(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/content/ServiceConnection;ILjava/util/concurrent/Executor;)Z

    move-result p1

    iput-boolean p1, p0, Lذ۠ۋؿ/ؽ;->ء:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object p1, p1, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    iget-object p2, p0, Lذ۠ۋؿ/ؽ;->أ:Lذ۠ۋؿ/ؼ;

    invoke-virtual {p1, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p2, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object p2, p2, Lذ۠ۋؿ/ؿ;->ء:Lصٝتږۗ/آ;

    iget-object v1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-wide v1, v1, Lذ۠ۋؿ/ؿ;->ؤ:J

    invoke-virtual {p2, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_1

    :cond_2
    const/4 p1, 0x2

    iput p1, p0, Lذ۠ۋؿ/ؽ;->ؠ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object p1, p0, Lذ۠ۋؿ/ؽ;->إ:Lذ۠ۋؿ/ؿ;

    iget-object p2, p1, Lذ۠ۋؿ/ؿ;->آ:Lزءؽ۴ڰؠ/ؠ;

    iget-object p1, p1, Lذ۠ۋؿ/ؿ;->ؠ:Landroid/content/Context;

    invoke-virtual {p2, p1, p0}, Lزءؽ۴ڰؠ/ؠ;->ؠ(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    :goto_1
    invoke-static {v0}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    throw p1
.end method
