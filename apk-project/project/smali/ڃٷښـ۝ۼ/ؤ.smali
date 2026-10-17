.class public final Lڃٷښـ۝ۼ/ؤ;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final ؠ:Ljava/util/concurrent/atomic/AtomicReference;


# instance fields
.field public final ؋:Landroid/content/Context;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lڃٷښـ۝ۼ/ؤ;->ؠ:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lڃٷښـ۝ۼ/ؤ;->؋:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    sget-object p1, Lڃٷښـ۝ۼ/إ;->ب:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    sget-object p2, Lڃٷښـ۝ۼ/إ;->ة:Landroidx/collection/ArrayMap;

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->آ()V

    goto :goto_0

    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lڃٷښـ۝ۼ/ؤ;->؋:Landroid/content/Context;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method
