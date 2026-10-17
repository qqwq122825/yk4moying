.class public final Lذ٨ۍ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field public static final ح:Lcom/google/android/gms/common/api/Status;

.field public static final خ:Lcom/google/android/gms/common/api/Status;

.field public static final د:Ljava/lang/Object;

.field public static ذ:Lذ٨ۍ/أ;


# instance fields
.field public ؋:J

.field public ؠ:Z

.field public ء:Lذ۠ۋؿ/ت;

.field public آ:Lز؃ۉؾؚۖڿڨ/ء;

.field public final أ:Landroid/content/Context;

.field public final ؤ:Lحۨٸڮؐێ/آ;

.field public final إ:Lآۋۻؾ۹/ة;

.field public final ئ:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final ا:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final ب:Ljava/util/concurrent/ConcurrentHashMap;

.field public final ة:Landroidx/collection/ArraySet;

.field public final ت:Landroidx/collection/ArraySet;

.field public final ث:Lصٝتږۗ/آ;

.field public volatile ج:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/4 v1, 0x4

    const-string v2, "Sign-out occurred while this API call was in progress."

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    sput-object v0, Lذ٨ۍ/أ;->ح:Lcom/google/android/gms/common/api/Status;

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const-string v2, "The user must be signed in to make this API call."

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    sput-object v0, Lذ٨ۍ/أ;->خ:Lcom/google/android/gms/common/api/Status;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lذ٨ۍ/أ;->د:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 6

    sget-object v0, Lحۨٸڮؐێ/آ;->ء:Lحۨٸڮؐێ/آ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v1, 0x2710

    iput-wide v1, p0, Lذ٨ۍ/أ;->؋:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lذ٨ۍ/أ;->ؠ:Z

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lذ٨ۍ/أ;->ئ:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lذ٨ۍ/أ;->ا:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v4, 0x5

    const/high16 v5, 0x3f400000    # 0.75f

    invoke-direct {v2, v4, v5, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v2, p0, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v2, Landroidx/collection/ArraySet;

    invoke-direct {v2}, Landroidx/collection/ArraySet;-><init>()V

    iput-object v2, p0, Lذ٨ۍ/أ;->ة:Landroidx/collection/ArraySet;

    new-instance v2, Landroidx/collection/ArraySet;

    invoke-direct {v2}, Landroidx/collection/ArraySet;-><init>()V

    iput-object v2, p0, Lذ٨ۍ/أ;->ت:Landroidx/collection/ArraySet;

    iput-boolean v3, p0, Lذ٨ۍ/أ;->ج:Z

    iput-object p1, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    new-instance v2, Lصٝتږۗ/آ;

    invoke-direct {v2, p2, p0}, Lصٝتږۗ/آ;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v2, p0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    iput-object v0, p0, Lذ٨ۍ/أ;->ؤ:Lحۨٸڮؐێ/آ;

    new-instance p2, Lآۋۻؾ۹/ة;

    invoke-direct {p2}, Lآۋۻؾ۹/ة;-><init>()V

    iput-object p2, p0, Lذ٨ۍ/أ;->إ:Lآۋۻؾ۹/ة;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    sget-object p2, Lڃٷښـ۝ۼ/ؠ;->آ:Ljava/lang/Boolean;

    if-nez p2, :cond_0

    const-string p2, "android.hardware.type.automotive"

    invoke-virtual {p1, p2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    sput-object p1, Lڃٷښـ۝ۼ/ؠ;->آ:Ljava/lang/Boolean;

    :cond_0
    sget-object p1, Lڃٷښـ۝ۼ/ؠ;->آ:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    iput-boolean v1, p0, Lذ٨ۍ/أ;->ج:Z

    :cond_1
    const/4 p1, 0x6

    invoke-virtual {v2, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public static ء(Lذ٨ۍ/؋;Lحۨٸڮؐێ/؋;)Lcom/google/android/gms/common/api/Status;
    .locals 5

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    iget-object p0, p0, Lذ٨ۍ/؋;->ؠ:Lةؽڗںۍټ٘/ء;

    iget-object p0, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x3f

    add-int/2addr v2, v3

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "API: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is not available on this device. Connection failed with: "

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v1, p1, Lحۨٸڮؐێ/؋;->ؤ:Landroid/app/PendingIntent;

    const/16 v2, 0x11

    invoke-direct {v0, v2, p0, v1, p1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    return-object v0
.end method

.method public static أ(Landroid/content/Context;)Lذ٨ۍ/أ;
    .locals 5

    sget-object v0, Lذ٨ۍ/أ;->د:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lذ٨ۍ/أ;->ذ:Lذ٨ۍ/أ;

    if-nez v1, :cond_1

    sget-object v1, Lذ۠ۋؿ/ؿ;->ئ:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v2, Lذ۠ۋؿ/ؿ;->ب:Landroid/os/HandlerThread;

    if-eqz v2, :cond_0

    :goto_0
    monitor-exit v1

    goto :goto_1

    :cond_0
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "GoogleApiHandler"

    const/16 v4, 0x9

    invoke-direct {v2, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lذ۠ۋؿ/ؿ;->ب:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    sget-object v2, Lذ۠ۋؿ/ؿ;->ب:Landroid/os/HandlerThread;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    :try_start_2
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lذ٨ۍ/أ;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v3, Lحۨٸڮؐێ/آ;->ؠ:Ljava/lang/Object;

    invoke-direct {v2, p0, v1}, Lذ٨ۍ/أ;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    sput-object v2, Lذ٨ۍ/أ;->ذ:Lذ٨ۍ/أ;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p0

    :catchall_1
    move-exception p0

    goto :goto_3

    :cond_1
    :goto_2
    sget-object p0, Lذ٨ۍ/أ;->ذ:Lذ٨ۍ/أ;

    monitor-exit v0

    return-object p0

    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 12

    iget v0, p1, Landroid/os/Message;->what:I

    const-string v1, "GoogleApiManager"

    iget-object v2, p0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    iget-object v3, p0, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    const-wide/32 v4, 0x493e0

    const/16 v6, 0x11

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/StringBuilder;

    const/16 v2, 0x1f

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Unknown message id: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v7

    :pswitch_0
    iput-boolean v7, p0, Lذ٨ۍ/أ;->ؠ:Z

    goto/16 :goto_c

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ٨ۍ/ص;

    iget-wide v0, p1, Lذ٨ۍ/ص;->ء:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    iget-object v1, p1, Lذ٨ۍ/ص;->؋:Lذ۠ۋؿ/ا;

    iget v3, p1, Lذ٨ۍ/ص;->ؠ:I

    if-nez v0, :cond_1

    new-instance p1, Lذ۠ۋؿ/ت;

    filled-new-array {v1}, [Lذ۠ۋؿ/ا;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v3, v0}, Lذ۠ۋؿ/ت;-><init>(ILjava/util/List;)V

    iget-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    if-nez v0, :cond_0

    new-instance v0, Lز؃ۉؾؚۖڿڨ/ء;

    iget-object v1, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-direct {v0, v1}, Lز؃ۉؾؚۖڿڨ/ء;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    :cond_0
    iget-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    invoke-virtual {v0, p1}, Lز؃ۉؾؚۖڿڨ/ء;->ؠ(Lذ۠ۋؿ/ت;)Lؾپۑ۟ڂڷ/ح;

    goto/16 :goto_c

    :cond_1
    iget-object v0, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    if-eqz v0, :cond_8

    iget-object v4, v0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    iget v0, v0, Lذ۠ۋؿ/ت;->آ:I

    if-ne v0, v3, :cond_4

    if-eqz v4, :cond_2

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    iget v4, p1, Lذ٨ۍ/ص;->آ:I

    if-lt v0, v4, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    iget-object v4, v0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    if-nez v4, :cond_3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    :cond_3
    iget-object v0, v0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    :goto_0
    invoke-virtual {v2, v6}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    if-eqz v0, :cond_8

    iget v4, v0, Lذ۠ۋؿ/ت;->آ:I

    if-gtz v4, :cond_5

    invoke-virtual {p0}, Lذ٨ۍ/أ;->؋()Z

    move-result v4

    if-eqz v4, :cond_7

    :cond_5
    iget-object v4, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    if-nez v4, :cond_6

    new-instance v4, Lز؃ۉؾؚۖڿڨ/ء;

    iget-object v5, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-direct {v4, v5}, Lز؃ۉؾؚۖڿڨ/ء;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    :cond_6
    iget-object v4, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    invoke-virtual {v4, v0}, Lز؃ۉؾؚۖڿڨ/ء;->ؠ(Lذ۠ۋؿ/ت;)Lؾپۑ۟ڂڷ/ح;

    :cond_7
    iput-object v8, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    :cond_8
    :goto_1
    iget-object v0, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    if-nez v0, :cond_22

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lذ۠ۋؿ/ت;

    invoke-direct {v1, v3, v0}, Lذ۠ۋؿ/ت;-><init>(ILjava/util/List;)V

    iput-object v1, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-wide v3, p1, Lذ٨ۍ/ص;->ء:J

    invoke-virtual {v2, v0, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_c

    :pswitch_2
    iget-object p1, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    if-eqz p1, :cond_22

    iget v0, p1, Lذ۠ۋؿ/ت;->آ:I

    if-gtz v0, :cond_9

    invoke-virtual {p0}, Lذ٨ۍ/أ;->؋()Z

    move-result v0

    if-eqz v0, :cond_b

    :cond_9
    iget-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    if-nez v0, :cond_a

    new-instance v0, Lز؃ۉؾؚۖڿڨ/ء;

    iget-object v1, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-direct {v0, v1}, Lز؃ۉؾؚۖڿڨ/ء;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    :cond_a
    iget-object v0, p0, Lذ٨ۍ/أ;->آ:Lز؃ۉؾؚۖڿڨ/ء;

    invoke-virtual {v0, p1}, Lز؃ۉؾؚۖڿڨ/ء;->ؠ(Lذ۠ۋؿ/ت;)Lؾپۑ۟ڂڷ/ح;

    :cond_b
    iput-object v8, p0, Lذ٨ۍ/أ;->ء:Lذ۠ۋؿ/ت;

    goto/16 :goto_c

    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ٨ۍ/ذ;

    iget-object v0, p1, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p1, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/د;

    iget-object v1, v0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, v0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v2, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v3, 0xf

    invoke-virtual {v2, v3, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v1, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v2, 0x10

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_c
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    iget-object v5, p1, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    if-eqz v4, :cond_f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lذ٨ۍ/س;

    instance-of v6, v4, Lذ٨ۍ/س;

    if-eqz v6, :cond_c

    invoke-virtual {v4, v0}, Lذ٨ۍ/س;->ؠ(Lذ٨ۍ/د;)[Lحۨٸڮؐێ/ء;

    move-result-object v6

    if-eqz v6, :cond_c

    array-length v8, v6

    move v10, v7

    :goto_3
    if-ge v10, v8, :cond_e

    aget-object v11, v6, v10

    invoke-static {v11, v5}, Lںڍڒڸ/ش;->س(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d

    if-ltz v10, :cond_e

    move v5, v9

    goto :goto_4

    :cond_d
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_e
    move v5, v7

    :goto_4
    if-eqz v5, :cond_c

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_5
    if-ge v7, p1, :cond_22

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/س;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    new-instance v3, Lخڝٻؽؐ/ا;

    invoke-direct {v3, v5}, Lخڝٻؽؐ/ا;-><init>(Lحۨٸڮؐێ/ء;)V

    invoke-virtual {v0, v3}, Lذ٨ۍ/س;->آ(Ljava/lang/RuntimeException;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ٨ۍ/ذ;

    iget-object v0, p1, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p1, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/د;

    iget-object v1, v0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    goto/16 :goto_c

    :cond_10
    iget-boolean p1, v0, Lذ٨ۍ/د;->ب:Z

    if-nez p1, :cond_22

    iget-object p1, v0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Lذ۠ۋؿ/إ;->خ()Z

    move-result p1

    if-nez p1, :cond_11

    invoke-virtual {v0}, Lذ٨ۍ/د;->ث()V

    goto/16 :goto_c

    :cond_11
    invoke-virtual {v0}, Lذ٨ۍ/د;->إ()V

    goto/16 :goto_c

    :pswitch_5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v8

    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lذ٨ۍ/د;

    iget-object v0, p1, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-object v0, p1, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, p1, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_22

    iget-object v1, p1, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    iget-object v2, v1, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    iget-object v1, v1, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_13

    :cond_12
    move v7, v9

    :cond_13
    if-eqz v7, :cond_14

    invoke-virtual {p1}, Lذ٨ۍ/د;->ب()V

    goto/16 :goto_c

    :cond_14
    const-string p1, "Timing out service connection."

    invoke-virtual {v0, p1}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    goto/16 :goto_c

    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lذ٨ۍ/د;

    iget-object v0, p1, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-boolean v1, p1, Lذ٨ۍ/د;->ب:Z

    if-eqz v1, :cond_22

    if-eqz v1, :cond_15

    iget-object v1, p1, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v2, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    iget-object v3, p1, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    const/16 v4, 0xb

    invoke-virtual {v2, v4, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v1, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v2, 0x9

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iput-boolean v7, p1, Lذ٨ۍ/د;->ب:Z

    :cond_15
    iget-object v1, v0, Lذ٨ۍ/أ;->ؤ:Lحۨٸڮؐێ/آ;

    iget-object v0, v0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lحۨٸڮؐێ/آ;->ء(Landroid/content/Context;)I

    move-result v0

    const/16 v1, 0x12

    if-ne v0, v1, :cond_16

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x15

    const-string v2, "Connection timed out waiting for Google Play services update to complete."

    invoke-direct {v0, v1, v2, v8, v8}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    goto :goto_6

    :cond_16
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x16

    const-string v2, "API failed to connect while resuming due to an unknown error."

    invoke-direct {v0, v1, v2, v8, v8}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    :goto_6
    invoke-virtual {p1, v0}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    iget-object p1, p1, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    const-string v0, "Timing out connection while resuming."

    invoke-virtual {p1, v0}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    goto/16 :goto_c

    :pswitch_8
    iget-object p1, p0, Lذ٨ۍ/أ;->ت:Landroidx/collection/ArraySet;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ٨ۍ/؋;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ٨ۍ/د;

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Lذ٨ۍ/د;->خ()V

    goto :goto_7

    :cond_18
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    goto/16 :goto_c

    :pswitch_9
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lذ٨ۍ/د;

    iget-object v0, p1, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-boolean v0, p1, Lذ٨ۍ/د;->ب:Z

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Lذ٨ۍ/د;->ث()V

    goto/16 :goto_c

    :pswitch_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lخڝٻؽؐ/أ;

    invoke-virtual {p0, p1}, Lذ٨ۍ/أ;->آ(Lخڝٻؽؐ/أ;)Lذ٨ۍ/د;

    goto/16 :goto_c

    :pswitch_b
    iget-object p1, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Application;

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    sget-object v0, Lذ٨ۍ/ء;->أ:Lذ٨ۍ/ء;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, v0, Lذ٨ۍ/ء;->آ:Z

    if-nez v1, :cond_19

    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-virtual {p1, v0}, Landroid/app/Application;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    iput-boolean v9, v0, Lذ٨ۍ/ء;->آ:Z

    :cond_19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    new-instance p1, Lذ٨ۍ/ج;

    invoke-direct {p1, p0}, Lذ٨ۍ/ج;-><init>(Lذ٨ۍ/أ;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter v0

    :try_start_1
    iget-object v1, v0, Lذ٨ۍ/ء;->ء:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object p1, v0, Lذ٨ۍ/ء;->ؠ:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1a

    new-instance v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    invoke-static {v1}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    invoke-virtual {p1, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p1

    if-nez p1, :cond_1a

    iget p1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v1, 0x64

    if-le p1, v1, :cond_1a

    iget-object p1, v0, Lذ٨ۍ/ء;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_1a
    iget-object p1, v0, Lذ٨ۍ/ء;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_22

    iput-wide v4, p0, Lذ٨ۍ/أ;->؋:J

    goto/16 :goto_c

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :pswitch_c
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lحۨٸڮؐێ/؋;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lذ٨ۍ/د;

    iget v4, v3, Lذ٨ۍ/د;->ئ:I

    if-ne v4, v0, :cond_1b

    goto :goto_8

    :cond_1c
    move-object v3, v8

    :goto_8
    if-eqz v3, :cond_1e

    iget v0, p1, Lحۨٸڮؐێ/؋;->أ:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1d

    new-instance v1, Lcom/google/android/gms/common/api/Status;

    iget-object v2, p0, Lذ٨ۍ/أ;->ؤ:Lحۨٸڮؐێ/آ;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lحۨٸڮؐێ/إ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0}, Lحۨٸڮؐێ/؋;->؋(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object p1, p1, Lحۨٸڮؐێ/؋;->إ:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x45

    add-int/2addr v2, v4

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Error resolution was canceled by the user, original error message: "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v6, p1, v8, v8}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    invoke-virtual {v3, v1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    goto/16 :goto_c

    :cond_1d
    iget-object v0, v3, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {v0, p1}, Lذ٨ۍ/أ;->ء(Lذ٨ۍ/؋;Lحۨٸڮؐێ/؋;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {v3, p1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    goto/16 :goto_c

    :cond_1e
    new-instance p1, Ljava/lang/StringBuilder;

    const/16 v2, 0x4c

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Could not find API instance "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " while trying to fail enqueued calls."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    :pswitch_d
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lذ٨ۍ/ض;

    iget-object v0, p1, Lذ٨ۍ/ض;->ء:Lخڝٻؽؐ/أ;

    iget-object v0, v0, Lخڝٻؽؐ/أ;->أ:Lذ٨ۍ/؋;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/د;

    if-nez v0, :cond_1f

    iget-object v0, p1, Lذ٨ۍ/ض;->ء:Lخڝٻؽؐ/أ;

    invoke-virtual {p0, v0}, Lذ٨ۍ/أ;->آ(Lخڝٻؽؐ/أ;)Lذ٨ۍ/د;

    move-result-object v0

    :cond_1f
    iget-object v1, v0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-interface {v1}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v1

    iget-object v2, p1, Lذ٨ۍ/ض;->؋:Lذ٨ۍ/س;

    if-eqz v1, :cond_20

    iget-object v1, p0, Lذ٨ۍ/أ;->ا:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    iget p1, p1, Lذ٨ۍ/ض;->ؠ:I

    if-eq v1, p1, :cond_20

    sget-object p1, Lذ٨ۍ/أ;->ح:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v2, p1}, Lذ٨ۍ/س;->ء(Lcom/google/android/gms/common/api/Status;)V

    invoke-virtual {v0}, Lذ٨ۍ/د;->خ()V

    goto :goto_c

    :cond_20
    invoke-virtual {v0, v2}, Lذ٨ۍ/د;->ج(Lذ٨ۍ/س;)V

    goto :goto_c

    :pswitch_e
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lذ٨ۍ/د;

    iget-object v1, v0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iput-object v8, v0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    invoke-virtual {v0}, Lذ٨ۍ/د;->ث()V

    goto :goto_9

    :pswitch_f
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v8

    :pswitch_10
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eq v9, p1, :cond_21

    goto :goto_a

    :cond_21
    const-wide/16 v4, 0x2710

    :goto_a
    iput-wide v4, p0, Lذ٨ۍ/أ;->؋:J

    const/16 p1, 0xc

    invoke-virtual {v2, p1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ٨ۍ/؋;

    invoke-virtual {v2, p1, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-wide v3, p0, Lذ٨ۍ/أ;->؋:J

    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_b

    :cond_22
    :goto_c
    return v9

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_d
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_d
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋()Z
    .locals 4

    iget-boolean v0, p0, Lذ٨ۍ/أ;->ؠ:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lذ۠ۋؿ/ب;->أ()Lذ۠ۋؿ/ب;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lذ٨ۍ/أ;->إ:Lآۋۻؾ۹/ة;

    iget-object v0, v0, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseIntArray;

    const v2, 0xc1fa340

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    if-eq v0, v3, :cond_2

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public final ؠ(Lحۨٸڮؐێ/؋;I)Z
    .locals 7

    iget-object v0, p0, Lذ٨ۍ/أ;->ؤ:Lحۨٸڮؐێ/آ;

    iget-object v1, p0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v2, Lسۄھؤۏ۫/؋;

    monitor-enter v2

    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lسۄھؤۏ۫/؋;->؋:Landroid/content/Context;

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    sget-object v6, Lسۄھؤۏ۫/؋;->ؠ:Ljava/lang/Boolean;

    if-eqz v6, :cond_1

    if-eq v4, v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_1

    :cond_1
    :goto_0
    sput-object v5, Lسۄھؤۏ۫/؋;->ؠ:Ljava/lang/Boolean;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/pm/PackageManager;->isInstantApp()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    sput-object v4, Lسۄھؤۏ۫/؋;->ؠ:Ljava/lang/Boolean;

    sput-object v3, Lسۄھؤۏ۫/؋;->؋:Landroid/content/Context;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    monitor-exit v2

    const/4 v2, 0x0

    if-eqz v3, :cond_2

    goto :goto_5

    :cond_2
    iget v3, p1, Lحۨٸڮؐێ/؋;->أ:I

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    iget-object v6, p1, Lحۨٸڮؐێ/؋;->ؤ:Landroid/app/PendingIntent;

    if-eqz v6, :cond_3

    move v6, v4

    goto :goto_2

    :cond_3
    move v6, v2

    :goto_2
    if-eqz v6, :cond_4

    iget-object v3, p1, Lحۨٸڮؐێ/؋;->ؤ:Landroid/app/PendingIntent;

    goto :goto_4

    :cond_4
    invoke-virtual {v0, v1, v5, v3}, Lحۨٸڮؐێ/آ;->؋(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    if-nez v3, :cond_5

    goto :goto_3

    :cond_5
    const/high16 v5, 0xc000000

    invoke-static {v1, v2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    :goto_3
    move-object v3, v5

    :goto_4
    if-eqz v3, :cond_6

    iget p1, p1, Lحۨٸڮؐێ/؋;->أ:I

    sget v5, Lcom/google/android/gms/common/api/GoogleApiActivity;->ؠ:I

    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/google/android/gms/common/api/GoogleApiActivity;

    invoke-direct {v5, v1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v6, "pending_intent"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v3, "failing_client_id"

    invoke-virtual {v5, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p2, "notify_manager"

    invoke-virtual {v5, p2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget p2, Lصٝتږۗ/ء;->؋:I

    const/high16 v3, 0x8000000

    or-int/2addr p2, v3

    invoke-static {v1, v2, v5, p2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p2

    invoke-virtual {v0, v1, p1, p2}, Lحۨٸڮؐێ/آ;->إ(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    move v2, v4

    :cond_6
    :goto_5
    return v2

    :catchall_0
    move-exception p1

    monitor-exit v2

    throw p1
.end method

.method public final آ(Lخڝٻؽؐ/أ;)Lذ٨ۍ/د;
    .locals 3

    iget-object v0, p1, Lخڝٻؽؐ/أ;->أ:Lذ٨ۍ/؋;

    iget-object v1, p0, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lذ٨ۍ/د;

    if-nez v2, :cond_0

    new-instance v2, Lذ٨ۍ/د;

    invoke-direct {v2, p0, p1}, Lذ٨ۍ/د;-><init>(Lذ٨ۍ/أ;Lخڝٻؽؐ/أ;)V

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object p1, v2, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-interface {p1}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lذ٨ۍ/أ;->ت:Landroidx/collection/ArraySet;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v2}, Lذ٨ۍ/د;->ث()V

    return-object v2
.end method

.method public final ؤ(Lحۨٸڮؐێ/؋;I)V
    .locals 3

    invoke-virtual {p0, p1, p2}, Lذ٨ۍ/أ;->ؠ(Lحۨٸڮؐێ/؋;I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method
