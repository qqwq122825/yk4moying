.class public final Lذ٨ۍ/ر;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lذ۠ۋؿ/ؠ;


# instance fields
.field public ؋:Z

.field public final ؠ:Ljava/lang/Object;

.field public final ء:Ljava/lang/Object;

.field public آ:Ljava/lang/Object;

.field public أ:Ljava/util/Collection;

.field public final ؤ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/Executor;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lذ٨ۍ/ر;->؋:Z

    iput-object p1, p0, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    const-string p1, "topic_operation_queue"

    iput-object p1, p0, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    const-string p1, ","

    iput-object p1, p0, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    iput-object p2, p0, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lذ٨ۍ/أ;Lذ۠ۋؿ/إ;Lذ٨ۍ/؋;)V
    .locals 0

    iput-object p1, p0, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    iput-object p1, p0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lذ٨ۍ/ر;->؋:Z

    iput-object p2, p0, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    iput-object p3, p0, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    return-void
.end method

.method public static ؠ(Landroid/content/SharedPreferences;Ljava/util/concurrent/Executor;)Lذ٨ۍ/ر;
    .locals 5

    new-instance v0, Lذ٨ۍ/ر;

    invoke-direct {v0, p0, p1}, Lذ٨ۍ/ر;-><init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/Executor;)V

    iget-object p0, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast p0, Ljava/util/ArrayDeque;

    monitor-enter p0

    :try_start_0
    iget-object p1, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast p1, Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    iget-object p1, v0, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object v1, v0, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, ""

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, v0, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, v0, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    if-nez v1, :cond_1

    const-string v1, "FirebaseMessaging"

    const-string v2, "Corrupted queue. Please check the queue contents and item separator provided"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, p1, v2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, v0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v4, Ljava/util/ArrayDeque;

    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public final ؋(Lحۨٸڮؐێ/؋;)V
    .locals 3

    iget-object v0, p0, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v1, Lحظتۢۋۜآظ/ة;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Lحظتۢۋۜآظ/ة;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final ء(Ljava/lang/String;)Z
    .locals 4

    iget-object v0, p0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v0, Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean v1, p0, Lذ٨ۍ/ر;->؋:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v3, 0xd

    invoke-direct {v2, v3, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final آ(Lحۨٸڮؐێ/؋;)V
    .locals 7

    iget-object v0, p0, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    check-cast v1, Lذ٨ۍ/؋;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/د;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-object v1, v0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    new-instance v6, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x19

    add-int/2addr v4, v5

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "onSignInFailed for "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " with "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V

    :cond_0
    return-void
.end method
