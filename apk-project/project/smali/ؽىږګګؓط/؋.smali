.class public final Lؽىږګګؓط/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ج:J

.field public static volatile ح:Ljava/util/concurrent/ScheduledExecutorService;

.field public static final خ:Ljava/lang/Object;


# instance fields
.field public final ؋:Ljava/lang/Object;

.field public final ؠ:Landroid/os/PowerManager$WakeLock;

.field public ء:I

.field public آ:Ljava/util/concurrent/ScheduledFuture;

.field public أ:J

.field public final ؤ:Ljava/util/HashSet;

.field public إ:Z

.field public ئ:Lطڔڔ۸قڈہۇ/؋;

.field public final ا:Lذ۠ۋؿ/ب;

.field public final ب:Ljava/lang/String;

.field public final ة:Ljava/util/HashMap;

.field public final ت:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final ث:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x16e

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lؽىږګګؓط/؋;->ج:J

    const/4 v0, 0x0

    sput-object v0, Lؽىږګګؓط/؋;->ح:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lؽىږګګؓط/؋;->خ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    const-string v0, "wake:com.google.firebase.iid.WakeLockHolder"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    const/4 v2, 0x0

    iput v2, p0, Lؽىږګګؓط/؋;->ء:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lؽىږګګؓط/؋;->ؤ:Ljava/util/HashSet;

    const/4 v3, 0x1

    iput-boolean v3, p0, Lؽىږګګؓط/؋;->إ:Z

    sget-object v4, Lذ۠ۋؿ/ب;->ئ:Lذ۠ۋؿ/ب;

    iput-object v4, p0, Lؽىږګګؓط/؋;->ا:Lذ۠ۋؿ/ب;

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v4, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v4, p0, Lؽىږګګؓط/؋;->ت:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v4, "WakeLock: wakeLockName must not be empty"

    invoke-static {v4, v0}, Lسۄھؤۏ۫/؋;->إ(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    const/4 v4, 0x0

    iput-object v4, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;

    const-string v5, "com.google.android.gms"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "*gcore*:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_0
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v5, v6

    :goto_0
    iput-object v5, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    goto :goto_1

    :cond_1
    iput-object v0, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    :goto_1
    const-string v5, "power"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    if-eqz v5, :cond_d

    invoke-virtual {v5, v3, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lؽىږګګؓط/؋;->ؠ:Landroid/os/PowerManager$WakeLock;

    sget-object v0, Lسً؀ٗٿ/ؠ;->؋:Ljava/lang/reflect/Method;

    const-class v0, Lسً؀ٗٿ/ؠ;

    monitor-enter v0

    :try_start_0
    sget-object v5, Lسً؀ٗٿ/ؠ;->ء:Ljava/lang/Boolean;

    if-eqz v5, :cond_2

    goto :goto_3

    :cond_2
    const-string v5, "android.permission.UPDATE_DEVICE_STATS"

    invoke-static {p1, v5}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_3

    move v5, v3

    goto :goto_2

    :cond_3
    move v5, v2

    :goto_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    sput-object v5, Lسً؀ٗٿ/ؠ;->ء:Ljava/lang/Boolean;

    :goto_3
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit v0

    if-eqz v5, :cond_a

    sget v0, Lسً؀ٗٿ/؋;->؋:I

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v2

    goto :goto_5

    :cond_5
    :goto_4
    move v0, v3

    :goto_5
    if-eqz v0, :cond_6

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    :cond_6
    const-string v0, "WorkSourceUtil"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    if-eqz v5, :cond_9

    if-eqz v1, :cond_9

    :try_start_1
    invoke-static {p1}, Lسۄھؤۏ۫/ؠ;->؋(Landroid/content/Context;)Lحۨٸڮؐێ/ئ;

    move-result-object p1

    iget-object p1, p1, Lحۨٸڮؐێ/ئ;->؋:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    if-nez p1, :cond_7

    const-string p1, "Could not get applicationInfo from package: "

    goto :goto_6

    :cond_7
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    new-instance v4, Landroid/os/WorkSource;

    invoke-direct {v4}, Landroid/os/WorkSource;-><init>()V

    const-string v5, "Unable to assign blame through WorkSource"

    sget-object v6, Lسً؀ٗٿ/ؠ;->ؠ:Ljava/lang/reflect/Method;

    if-eqz v6, :cond_8

    const/4 v7, 0x2

    :try_start_2
    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v2

    aput-object v1, v7, v3

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_7

    :cond_8
    sget-object v1, Lسً؀ٗٿ/ؠ;->؋:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_9

    :try_start_3
    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v6, v2

    invoke-virtual {v1, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_7

    :catch_0
    move-exception p1

    invoke-static {v0, v5, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    :catch_1
    const-string p1, "Could not find package: "

    :goto_6
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    :goto_7
    if-eqz v4, :cond_a

    iget-object p1, p0, Lؽىږګګؓط/؋;->ؠ:Landroid/os/PowerManager$WakeLock;

    :try_start_4
    invoke-virtual {p1, v4}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_9

    :catch_2
    move-exception p1

    goto :goto_8

    :catch_3
    move-exception p1

    :goto_8
    const-string v0, "WakeLock"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    :goto_9
    sget-object p1, Lؽىږګګؓط/؋;->ح:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez p1, :cond_c

    sget-object v0, Lؽىږګګؓط/؋;->خ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_5
    sget-object p1, Lؽىږګګؓط/؋;->ح:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez p1, :cond_b

    invoke-static {v3}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    invoke-static {p1}, Ljava/util/concurrent/Executors;->unconfigurableScheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    sput-object p1, Lؽىږګګؓط/؋;->ح:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_b
    monitor-exit v0

    goto :goto_a

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1

    :cond_c
    :goto_a
    iput-object p1, p0, Lؽىږګګؓط/؋;->ث:Ljava/util/concurrent/ScheduledExecutorService;

    return-void

    :catchall_1
    move-exception p1

    monitor-exit v0

    throw p1

    :cond_d
    new-instance p1, Lرسٗ/ؠ;

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "expected a non-null reference"

    invoke-virtual {v0, v3, v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final ؋(J)V
    .locals 9

    iget-object v0, p0, Lؽىږګګؓط/؋;->ت:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    sget-wide v0, Lؽىږګګؓط/؋;->ج:J

    const-wide v2, 0x7fffffffffffffffL

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v4, 0x1

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v4, p1, v4

    if-lez v4, :cond_0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    :cond_0
    iget-object p1, p0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    invoke-virtual {p0}, Lؽىږګګؓط/؋;->ؠ()Z

    move-result p2

    if-nez p2, :cond_1

    sget-object p2, Lطڔڔ۸قڈہۇ/؋;->آ:Lطڔڔ۸قڈہۇ/؋;

    iput-object p2, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;

    iget-object p2, p0, Lؽىږګګؓط/؋;->ؠ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {p2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object p2, p0, Lؽىږګګؓط/؋;->ا:Lذ۠ۋؿ/ب;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    :cond_1
    iget p2, p0, Lؽىږګګؓط/؋;->ء:I

    const/4 v4, 0x1

    add-int/2addr p2, v4

    iput p2, p0, Lؽىږګګؓط/؋;->ء:I

    iget-boolean p2, p0, Lؽىږګګؓط/؋;->إ:Z

    const/4 v5, 0x0

    if-eqz p2, :cond_2

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p2, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lؽىږګګؓط/ؠ;

    if-nez p2, :cond_3

    new-instance p2, Lؽىږګګؓط/ؠ;

    invoke-direct {p2}, Lؽىږګګؓط/ؠ;-><init>()V

    iget-object v6, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v6, v5, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget v5, p2, Lؽىږګګؓط/ؠ;->؋:I

    add-int/2addr v5, v4

    iput v5, p2, Lؽىږګګؓط/ؠ;->؋:I

    iget-object p2, p0, Lؽىږګګؓط/؋;->ا:Lذ۠ۋؿ/ب;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    sub-long v7, v2, v5

    cmp-long p2, v7, v0

    if-lez p2, :cond_4

    add-long v2, v5, v0

    :cond_4
    iget-wide v5, p0, Lؽىږګګؓط/؋;->أ:J

    cmp-long p2, v2, v5

    if-lez p2, :cond_6

    iput-wide v2, p0, Lؽىږګګؓط/؋;->أ:J

    iget-object p2, p0, Lؽىږګګؓط/؋;->آ:Ljava/util/concurrent/ScheduledFuture;

    if-eqz p2, :cond_5

    const/4 v2, 0x0

    invoke-interface {p2, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_5
    iget-object p2, p0, Lؽىږګګؓط/؋;->ث:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Lحظتۢۋۜآظ/آ;

    invoke-direct {v2, v4, p0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p2, v2, v0, v1, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p2

    iput-object p2, p0, Lؽىږګګؓط/؋;->آ:Ljava/util/concurrent/ScheduledFuture;

    :cond_6
    monitor-exit p1

    return-void

    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public final ؠ()Z
    .locals 2

    iget-object v0, p0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lؽىږګګؓط/؋;->ء:I

    if-lez v1, :cond_0

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

.method public final ء()V
    .locals 4

    iget-object v0, p0, Lؽىږګګؓط/؋;->ت:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-gez v0, :cond_0

    const-string v0, "WakeLock"

    iget-object v1, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, " release without a matched acquire!"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؽىږګګؓط/؋;->إ:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_2

    :cond_1
    :goto_0
    iget-object v1, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lؽىږګګؓط/ؠ;

    if-eqz v1, :cond_3

    iget v3, v1, Lؽىږګګؓط/ؠ;->؋:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v1, Lؽىږګګؓط/ؠ;->؋:I

    if-nez v3, :cond_3

    iget-object v1, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    const-string v1, "WakeLock"

    iget-object v2, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, " counter does not exist"

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    invoke-virtual {p0}, Lؽىږګګؓط/؋;->أ()V

    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final آ()V
    .locals 2

    iget-object v0, p0, Lؽىږګګؓط/؋;->ؤ:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 v0, 0x0

    throw v0
.end method

.method public final أ()V
    .locals 6

    iget-object v0, p0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lؽىږګګؓط/؋;->ؠ()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-boolean v1, p0, Lؽىږګګؓط/؋;->إ:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget v1, p0, Lؽىږګګؓط/؋;->ء:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lؽىږګګؓط/؋;->ء:I

    if-gtz v1, :cond_1

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :cond_2
    iput v2, p0, Lؽىږګګؓط/؋;->ء:I

    :goto_0
    invoke-virtual {p0}, Lؽىږګګؓط/؋;->آ()V

    iget-object v1, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lؽىږګګؓط/ؠ;

    iput v2, v3, Lؽىږګګؓط/ؠ;->؋:I

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lؽىږګګؓط/؋;->ة:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    iget-object v1, p0, Lؽىږګګؓط/؋;->آ:Ljava/util/concurrent/ScheduledFuture;

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v3, p0, Lؽىږګګؓط/؋;->آ:Ljava/util/concurrent/ScheduledFuture;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lؽىږګګؓط/؋;->أ:J

    :cond_4
    iget-object v1, p0, Lؽىږګګؓط/؋;->ؠ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_7

    :try_start_1
    iget-object v1, p0, Lؽىږګګؓط/؋;->ؠ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v1, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_8

    goto :goto_2

    :catchall_0
    move-exception v1

    goto :goto_3

    :catch_0
    move-exception v1

    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v4, Ljava/lang/RuntimeException;

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "WakeLock"

    iget-object v4, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, " failed to release!"

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object v1, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;

    if-eqz v1, :cond_8

    :goto_2
    iput-object v3, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    :cond_5
    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_3
    :try_start_6
    iget-object v2, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;

    if-eqz v2, :cond_6

    iput-object v3, p0, Lؽىږګګؓط/؋;->ئ:Lطڔڔ۸قڈہۇ/؋;

    :cond_6
    throw v1

    :cond_7
    const-string v1, "WakeLock"

    iget-object v2, p0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, " should be held!"

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    :goto_4
    monitor-exit v0

    return-void

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1
.end method
