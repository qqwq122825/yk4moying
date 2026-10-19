.class public abstract Lذ۠ۋؿ/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lخڝٻؽؐ/ؠ;


# static fields
.field public static final ط:[Lحۨٸڮؐێ/ء;


# instance fields
.field public volatile ؋:Ljava/lang/String;

.field public ؠ:Lڜأِجطّثٮ/؋;

.field public final ء:Landroid/content/Context;

.field public final آ:Lذ۠ۋؿ/ؿ;

.field public final أ:Lذ۠ۋؿ/ض;

.field public final ؤ:Ljava/lang/Object;

.field public final إ:Ljava/lang/Object;

.field public ئ:Lذ۠ۋؿ/ش;

.field public ا:Lذ۠ۋؿ/ؠ;

.field public ب:Landroid/os/IInterface;

.field public final ة:Ljava/util/ArrayList;

.field public ت:Lذ۠ۋؿ/ظ;

.field public ث:I

.field public final ج:Lذ۠ۋؿ/ء;

.field public final ح:Lذ۠ۋؿ/ء;

.field public final خ:I

.field public final د:Ljava/lang/String;

.field public volatile ذ:Ljava/lang/String;

.field public ر:Lحۨٸڮؐێ/؋;

.field public ز:Z

.field public volatile س:Lذ۠ۋؿ/ػ;

.field public final ش:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final ص:Ljava/util/Set;

.field public final ض:Landroid/accounts/Account;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Lحۨٸڮؐێ/ء;

    sput-object v0, Lذ۠ۋؿ/إ;->ط:[Lحۨٸڮؐێ/ء;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;ILذ۠ۋؿ/آ;Lذ٨ۍ/آ;Lذ٨ۍ/ا;)V
    .locals 4

    sget-object v0, Lذ۠ۋؿ/ؿ;->ئ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lذ۠ۋؿ/ؿ;->ا:Lذ۠ۋؿ/ؿ;

    if-nez v1, :cond_0

    new-instance v1, Lذ۠ۋؿ/ؿ;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lذ۠ۋؿ/ؿ;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    sput-object v1, Lذ۠ۋؿ/ؿ;->ا:Lذ۠ۋؿ/ؿ;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lذ۠ۋؿ/ؿ;->ا:Lذ۠ۋؿ/ؿ;

    sget-object v1, Lحۨٸڮؐێ/آ;->ؠ:Ljava/lang/Object;

    invoke-static {p5}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    invoke-static {p6}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    new-instance v1, Lذ۠ۋؿ/ء;

    invoke-direct {v1, p5}, Lذ۠ۋؿ/ء;-><init>(Ljava/lang/Object;)V

    new-instance p5, Lذ۠ۋؿ/ء;

    invoke-direct {p5, p6}, Lذ۠ۋؿ/ء;-><init>(Ljava/lang/Object;)V

    iget-object p6, p4, Lذ۠ۋؿ/آ;->أ:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    iput-object v2, p0, Lذ۠ۋؿ/إ;->؋:Ljava/lang/String;

    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lذ۠ۋؿ/إ;->إ:Ljava/lang/Object;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    const/4 v3, 0x1

    iput v3, p0, Lذ۠ۋؿ/إ;->ث:I

    iput-object v2, p0, Lذ۠ۋؿ/إ;->ر:Lحۨٸڮؐێ/؋;

    const/4 v3, 0x0

    iput-boolean v3, p0, Lذ۠ۋؿ/إ;->ز:Z

    iput-object v2, p0, Lذ۠ۋؿ/إ;->س:Lذ۠ۋؿ/ػ;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v2, "Context must not be null"

    if-eqz p1, :cond_4

    iput-object p1, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    const-string p1, "Looper must not be null"

    if-eqz p2, :cond_3

    const-string p1, "Supervisor must not be null"

    invoke-static {v0, p1}, Lسۄھؤۏ۫/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lذ۠ۋؿ/إ;->آ:Lذ۠ۋؿ/ؿ;

    new-instance p1, Lذ۠ۋؿ/ض;

    invoke-direct {p1, p0, p2}, Lذ۠ۋؿ/ض;-><init>(Lذ۠ۋؿ/إ;Landroid/os/Looper;)V

    iput-object p1, p0, Lذ۠ۋؿ/إ;->أ:Lذ۠ۋؿ/ض;

    iput p3, p0, Lذ۠ۋؿ/إ;->خ:I

    iput-object v1, p0, Lذ۠ۋؿ/إ;->ج:Lذ۠ۋؿ/ء;

    iput-object p5, p0, Lذ۠ۋؿ/إ;->ح:Lذ۠ۋؿ/ء;

    iput-object p6, p0, Lذ۠ۋؿ/إ;->د:Ljava/lang/String;

    iget-object p1, p4, Lذ۠ۋؿ/آ;->؋:Landroid/accounts/Account;

    iput-object p1, p0, Lذ۠ۋؿ/إ;->ض:Landroid/accounts/Account;

    iget-object p1, p4, Lذ۠ۋؿ/آ;->ء:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Expanding scopes is not permitted, use implied scopes instead"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    iput-object p1, p0, Lذ۠ۋؿ/إ;->ص:Ljava/util/Set;

    return-void

    :cond_3
    new-instance p2, Ljava/lang/NullPointerException;

    invoke-direct {p2, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static bridge synthetic ذ(Lذ۠ۋؿ/إ;IILandroid/os/IInterface;)Z
    .locals 2

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lذ۠ۋؿ/إ;->ث:I

    if-eq v1, p1, :cond_0

    monitor-exit v0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p3, p2}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    monitor-exit v0

    const/4 p0, 0x1

    :goto_0
    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public final ؋()Ljava/util/Set;
    .locals 1

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->إ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ص:Ljava/util/Set;

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public final ء(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/إ;->؋:Ljava/lang/String;

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->أ()V

    return-void
.end method

.method public final أ()V
    .locals 5

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x0

    if-ge v2, v1, :cond_0

    iget-object v4, p0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lذ۠ۋؿ/ز;

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iput-object v3, v4, Lذ۠ۋؿ/ز;->؋:Ljava/lang/Object;

    monitor-exit v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1

    :catchall_1
    move-exception v1

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lذ۠ۋؿ/إ;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object v1, p0, Lذ۠ۋؿ/إ;->إ:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object v3, p0, Lذ۠ۋؿ/إ;->ئ:Lذ۠ۋؿ/ش;

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/4 v0, 0x1

    invoke-virtual {p0, v3, v0}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    return-void

    :catchall_2
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1
.end method

.method public final ؤ(Lذ۠ۋؿ/ئ;Ljava/util/Set;)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    invoke-virtual/range {p0 .. p0}, Lذ۠ۋؿ/إ;->ة()Landroid/os/Bundle;

    move-result-object v2

    new-instance v15, Lذ۠ۋؿ/ؤ;

    iget-object v14, v1, Lذ۠ۋؿ/إ;->ذ:Ljava/lang/String;

    sget v6, Lحۨٸڮؐێ/أ;->؋:I

    sget-object v9, Lذ۠ۋؿ/ؤ;->ذ:[Lcom/google/android/gms/common/api/Scope;

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    const/4 v4, 0x6

    iget v5, v1, Lذ۠ۋؿ/إ;->خ:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v11, 0x0

    sget-object v13, Lذ۠ۋؿ/ؤ;->ر:[Lحۨٸڮؐێ/ء;

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object v3, v15

    move-object v12, v13

    move-object/from16 v19, v14

    move/from16 v14, v16

    move-object/from16 v20, v15

    move/from16 v15, v17

    move/from16 v16, v18

    move-object/from16 v17, v19

    invoke-direct/range {v3 .. v17}, Lذ۠ۋؿ/ؤ;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lحۨٸڮؐێ/ء;[Lحۨٸڮؐێ/ء;ZIZLjava/lang/String;)V

    iget-object v3, v1, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v4, v20

    iput-object v3, v4, Lذ۠ۋؿ/ؤ;->إ:Ljava/lang/String;

    iput-object v2, v4, Lذ۠ۋؿ/ؤ;->ب:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/common/api/Scope;

    iput-object v0, v4, Lذ۠ۋؿ/ؤ;->ا:[Lcom/google/android/gms/common/api/Scope;

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lذ۠ۋؿ/إ;->إ()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, v1, Lذ۠ۋؿ/إ;->ض:Landroid/accounts/Account;

    if-nez v0, :cond_1

    new-instance v0, Landroid/accounts/Account;

    const-string v2, "<<default account>>"

    const-string v3, "com.google"

    invoke-direct {v0, v2, v3}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iput-object v0, v4, Lذ۠ۋؿ/ؤ;->ة:Landroid/accounts/Account;

    if-eqz p1, :cond_2

    move-object/from16 v0, p1

    check-cast v0, Lذ۠ۋؿ/ـ;

    iget-object v0, v0, Lذ۠ۋؿ/ـ;->ؠ:Landroid/os/IBinder;

    iput-object v0, v4, Lذ۠ۋؿ/ؤ;->ئ:Landroid/os/IBinder;

    :cond_2
    sget-object v0, Lذ۠ۋؿ/إ;->ط:[Lحۨٸڮؐێ/ء;

    iput-object v0, v4, Lذ۠ۋؿ/ؤ;->ت:[Lحۨٸڮؐێ/ء;

    invoke-virtual/range {p0 .. p0}, Lذ۠ۋؿ/إ;->ب()[Lحۨٸڮؐێ/ء;

    move-result-object v0

    iput-object v0, v4, Lذ۠ۋؿ/ؤ;->ث:[Lحۨٸڮؐێ/ء;

    :try_start_0
    iget-object v2, v1, Lذ۠ۋؿ/إ;->إ:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, v1, Lذ۠ۋؿ/إ;->ئ:Lذ۠ۋؿ/ش;

    if-eqz v0, :cond_3

    new-instance v3, Lذ۠ۋؿ/ط;

    iget-object v5, v1, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v5

    invoke-direct {v3, v1, v5}, Lذ۠ۋؿ/ط;-><init>(Lذ۠ۋؿ/إ;I)V

    invoke-virtual {v0, v3, v4}, Lذ۠ۋؿ/ش;->؋(Lذ۠ۋؿ/ط;Lذ۠ۋؿ/ؤ;)V

    goto :goto_0

    :cond_3
    const-string v0, "GmsClient"

    const-string v3, "mServiceBroker is null, client disconnected"

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    monitor-exit v2

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    const-string v2, "GmsClient"

    const-string v3, "IGmsServiceBroker.getService failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, v1, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    new-instance v2, Lذ۠ۋؿ/ع;

    const/16 v3, 0x8

    const/4 v4, 0x0

    invoke-direct {v2, v1, v3, v4, v4}, Lذ۠ۋؿ/ع;-><init>(Lذ۠ۋؿ/إ;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    iget-object v3, v1, Lذ۠ۋؿ/إ;->أ:Lذ۠ۋؿ/ض;

    const/4 v4, 0x1

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v0, v5, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_2

    :catch_2
    move-exception v0

    throw v0

    :catch_3
    move-exception v0

    const-string v2, "GmsClient"

    const-string v3, "IGmsServiceBroker.getService failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, v1, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget-object v2, v1, Lذ۠ۋؿ/إ;->أ:Lذ۠ۋؿ/ض;

    const/4 v3, 0x6

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v0, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_2
    return-void
.end method

.method public bridge synthetic إ()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract ا(Landroid/os/IBinder;)Landroid/os/IInterface;
.end method

.method public bridge synthetic ب()[Lحۨٸڮؐێ/ء;
    .locals 1

    sget-object v0, Lذ۠ۋؿ/إ;->ط:[Lحۨٸڮؐێ/ء;

    return-object v0
.end method

.method public abstract ة()Landroid/os/Bundle;
.end method

.method public final ت()Landroid/os/IInterface;
    .locals 3

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lذ۠ۋؿ/إ;->ث:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lذ۠ۋؿ/إ;->ب:Landroid/os/IInterface;

    const-string v2, "Client is connected but service is null"

    invoke-static {v1, v2}, Lسۄھؤۏ۫/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    monitor-exit v0

    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    new-instance v1, Landroid/os/DeadObjectException;

    invoke-direct {v1}, Landroid/os/DeadObjectException;-><init>()V

    throw v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract ث()Ljava/lang/String;
.end method

.method public abstract ج()Ljava/lang/String;
.end method

.method public ح()Z
    .locals 2

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->آ()I

    move-result v0

    const v1, 0xc9e4920

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final خ()Z
    .locals 3

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lذ۠ۋؿ/إ;->ث:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final د()Z
    .locals 3

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lذ۠ۋؿ/إ;->ث:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final ر(Landroid/os/IInterface;I)V
    .locals 7

    const-string v0, "unable to connect to service: "

    const-string v1, "Calling connect() while still connected, missing disconnect() for "

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x4

    if-eq p2, v4, :cond_0

    move v5, v2

    goto :goto_0

    :cond_0
    move v5, v3

    :goto_0
    if-nez p1, :cond_1

    move v6, v2

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    if-ne v5, v6, :cond_2

    move v2, v3

    :cond_2
    if-eqz v2, :cond_d

    iget-object v2, p0, Lذ۠ۋؿ/إ;->ؤ:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iput p2, p0, Lذ۠ۋؿ/إ;->ث:I

    iput-object p1, p0, Lذ۠ۋؿ/إ;->ب:Landroid/os/IInterface;

    if-eq p2, v3, :cond_a

    const/4 v3, 0x2

    if-eq p2, v3, :cond_4

    const/4 v3, 0x3

    if-eq p2, v3, :cond_4

    if-eq p2, v4, :cond_3

    goto/16 :goto_3

    :cond_3
    invoke-static {p1}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    goto/16 :goto_3

    :cond_4
    iget-object p1, p0, Lذ۠ۋؿ/إ;->ت:Lذ۠ۋؿ/ظ;

    if-eqz p1, :cond_6

    iget-object p2, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    if-eqz p2, :cond_6

    const-string v3, "GmsClient"

    iget-object v4, p2, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object p2, p2, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    check-cast p2, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " on "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lذ۠ۋؿ/إ;->آ:Lذ۠ۋؿ/ؿ;

    iget-object v1, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v1, v1, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v3, v3, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lذ۠ۋؿ/إ;->د:Ljava/lang/String;

    if-nez v4, :cond_5

    iget-object v4, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_5
    iget-object v4, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-boolean v4, v4, Lڜأِجطّثٮ/؋;->ء:Z

    invoke-virtual {p2, v1, v3, p1, v4}, Lذ۠ۋؿ/ؿ;->؋(Ljava/lang/String;Ljava/lang/String;Lذ۠ۋؿ/ظ;Z)V

    iget-object p1, p0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    :cond_6
    new-instance p1, Lذ۠ۋؿ/ظ;

    iget-object p2, p0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    invoke-direct {p1, p0, p2}, Lذ۠ۋؿ/ظ;-><init>(Lذ۠ۋؿ/إ;I)V

    iput-object p1, p0, Lذ۠ۋؿ/إ;->ت:Lذ۠ۋؿ/ظ;

    new-instance p2, Lڜأِجطّثٮ/؋;

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->ج()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->ح()Z

    move-result v3

    invoke-direct {p2, v1, v3}, Lڜأِجطّثٮ/؋;-><init>(Ljava/lang/String;Z)V

    iput-object p2, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-boolean p2, p2, Lڜأِجطّثٮ/؋;->ء:Z

    if-eqz p2, :cond_8

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->آ()I

    move-result p2

    const v1, 0x1110e58

    if-lt p2, v1, :cond_7

    goto :goto_2

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    iget-object p2, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object p2, p2, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    const-string v0, "Internal Error, the minimum apk version of this BaseGmsClient is too low to support dynamic lookup. Start service action: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    :goto_2
    iget-object p2, p0, Lذ۠ۋؿ/إ;->آ:Lذ۠ۋؿ/ؿ;

    iget-object v1, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v1, v1, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v3, v3, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lذ۠ۋؿ/إ;->د:Ljava/lang/String;

    if-nez v4, :cond_9

    iget-object v4, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    :cond_9
    iget-object v5, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-boolean v5, v5, Lڜأِجطّثٮ/؋;->ء:Z

    new-instance v6, Lذ۠ۋؿ/ؼ;

    invoke-direct {v6, v1, v3, v5}, Lذ۠ۋؿ/ؼ;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p2, v6, p1, v4}, Lذ۠ۋؿ/ؿ;->ؠ(Lذ۠ۋؿ/ؼ;Lذ۠ۋؿ/ظ;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_c

    const-string p1, "GmsClient"

    iget-object p2, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v1, p2, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p2, p2, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    check-cast p2, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " on "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lذ۠ۋؿ/إ;->ش:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    new-instance p2, Lذ۠ۋؿ/غ;

    const/16 v0, 0x10

    invoke-direct {p2, p0, v0}, Lذ۠ۋؿ/غ;-><init>(Lذ۠ۋؿ/إ;I)V

    iget-object v0, p0, Lذ۠ۋؿ/إ;->أ:Lذ۠ۋؿ/ض;

    const/4 v1, 0x7

    const/4 v3, -0x1

    invoke-virtual {v0, v1, p1, v3, p2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_3

    :cond_a
    iget-object p1, p0, Lذ۠ۋؿ/إ;->ت:Lذ۠ۋؿ/ظ;

    if-eqz p1, :cond_c

    iget-object p2, p0, Lذ۠ۋؿ/إ;->آ:Lذ۠ۋؿ/ؿ;

    iget-object v0, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v0, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v1, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-object v1, v1, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Lذ۠ۋؿ/إ;->د:Ljava/lang/String;

    if-nez v3, :cond_b

    iget-object v3, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_b
    iget-object v3, p0, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    iget-boolean v3, v3, Lڜأِجطّثٮ/؋;->ء:Z

    invoke-virtual {p2, v0, v1, p1, v3}, Lذ۠ۋؿ/ؿ;->؋(Ljava/lang/String;Ljava/lang/String;Lذ۠ۋؿ/ظ;Z)V

    const/4 p1, 0x0

    iput-object p1, p0, Lذ۠ۋؿ/إ;->ت:Lذ۠ۋؿ/ظ;

    :cond_c
    :goto_3
    monitor-exit v2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method
