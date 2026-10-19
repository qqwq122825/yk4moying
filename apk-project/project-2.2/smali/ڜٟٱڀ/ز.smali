.class public final Lڜٟٱڀ/ز;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ا:Lڜٟٱڀ/ز;


# instance fields
.field public ؋:Ljava/lang/Object;

.field public ؠ:Ljava/lang/Object;

.field public ء:Ljava/lang/Object;

.field public آ:Ljava/lang/Object;

.field public final أ:Ljava/lang/Object;

.field public final ؤ:Ljava/lang/Object;

.field public final إ:Ljava/lang/Object;

.field public final ئ:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lڜٟٱڀ/ز;->أ:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    new-instance v0, Lحظتۢۋۜآظ/آ;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lڜٟٱڀ/ز;->ئ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/google/android/material/datepicker/ج;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0302eb

    invoke-static {p1, v0, v1}, Lٹۧ٥ؐح/ؠ;->ء(Landroid/content/Context;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object v0

    iget v0, v0, Landroid/util/TypedValue;->data:I

    sget-object v1, Lؾٿټڷ/؋;->ت:[I

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p1, v1}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v1

    iput-object v1, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p1, v1}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v1

    iput-object v1, p0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p1, v1}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v1

    iput-object v1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p1, v1}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v1

    iput-object v1, p0, Lڜٟٱڀ/ز;->ء:Ljava/lang/Object;

    const/4 v1, 0x7

    invoke-static {p1, v0, v1}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    const/16 v3, 0x9

    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {p1, v3}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v3

    iput-object v3, p0, Lڜٟٱڀ/ز;->آ:Ljava/lang/Object;

    const/16 v3, 0x8

    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {p1, v3}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object v3

    iput-object v3, p0, Lڜٟٱڀ/ز;->أ:Ljava/lang/Object;

    const/16 v3, 0xa

    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {p1, v2}, Lذ۠ۋؿ/ب;->ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;

    move-result-object p1

    iput-object p1, p0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lڜٟٱڀ/ز;->ئ:Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static declared-synchronized آ()Lڜٟٱڀ/ز;
    .locals 2

    const-class v0, Lڜٟٱڀ/ز;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڜٟٱڀ/ز;->ا:Lڜٟٱڀ/ز;

    if-nez v1, :cond_0

    new-instance v1, Lڜٟٱڀ/ز;

    invoke-direct {v1}, Lڜٟٱڀ/ز;-><init>()V

    sput-object v1, Lڜٟٱڀ/ز;->ا:Lڜٟٱڀ/ز;

    :cond_0
    sget-object v1, Lڜٟٱڀ/ز;->ا:Lڜٟٱڀ/ز;
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
.method public final ؋(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lڜٟٱڀ/ز;->ء:Ljava/lang/Object;

    const-string v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    iput-object p1, p0, Lڜٟٱڀ/ز;->آ:Ljava/lang/Object;

    iget-object p1, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    check-cast p1, Landroid/os/PowerManager$WakeLock;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lڜٟٱڀ/ز;->ء:Ljava/lang/Object;

    check-cast p1, Landroid/os/PowerManager;

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    const-string v2, "ChildApp::CpuWakeLock"

    invoke-virtual {p1, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    iput-object p1, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_0
    iget-object p1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    check-cast p1, Landroid/net/wifi/WifiManager$WifiLock;

    if-nez p1, :cond_1

    iget-object p1, p0, Lڜٟٱڀ/ز;->آ:Ljava/lang/Object;

    check-cast p1, Landroid/net/wifi/WifiManager;

    if-eqz p1, :cond_1

    const/4 v1, 0x3

    const-string v2, "ChildApp::WifiWakeLock"

    invoke-virtual {p1, v1, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object p1

    iput-object p1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/net/wifi/WifiManager$WifiLock;->setReferenceCounted(Z)V

    :cond_1
    invoke-virtual {p0}, Lڜٟٱڀ/ز;->ؠ()V

    invoke-virtual {p0}, Lڜٟٱڀ/ز;->ء()V

    iget-object p1, p0, Lڜٟٱڀ/ز;->أ:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    iget-object v0, p0, Lڜٟٱڀ/ز;->ئ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/32 v1, 0x112a880

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "All locks acquired + auto-renew scheduled | "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lڜٟٱڀ/ز;->أ()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Ctti5DImmb"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ؠ()V
    .locals 4

    const-string v0, "Ctti5DImmb"

    :try_start_0
    iget-object v1, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Landroid/os/PowerManager$WakeLock;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/os/PowerManager$WakeLock;

    const-wide/32 v2, 0x1499700

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    iget-object v1, p0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v1, "CPU lock acquired (6h timeout)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_1

    :goto_0
    const-string v2, "CPU lock acquire failed"

    goto :goto_2

    :goto_1
    const-string v2, "WAKE_LOCK permission missing!"

    :goto_2
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_3
    return-void
.end method

.method public final ء()V
    .locals 3

    const-string v0, "Ctti5DImmb"

    :try_start_0
    iget-object v1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    check-cast v1, Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    :cond_0
    iget-object v1, p0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v1, "WiFi lock acquired (HIGH_PERF)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "WiFi lock acquire failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public final أ()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-string v1, "ON"

    const-string v2, "OFF"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Landroid/os/PowerManager$WakeLock;

    if-eqz v3, :cond_0

    check-cast v0, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    iget-object v3, p0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v4, :cond_1

    check-cast v3, Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move-object v1, v2

    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CPU="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " | WiFi="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؤ()V
    .locals 6

    iget-object v0, p0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    iget-object v1, p0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    const-string v2, "Ctti5DImmb"

    iget-object v3, p0, Lڜٟٱڀ/ز;->أ:Ljava/lang/Object;

    check-cast v3, Landroid/os/Handler;

    iget-object v4, p0, Lڜٟٱڀ/ز;->ئ:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    move-object v5, v4

    check-cast v5, Landroid/os/PowerManager$WakeLock;

    if-eqz v5, :cond_0

    check-cast v4, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v4}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lڜٟٱڀ/ز;->؋:Ljava/lang/Object;

    check-cast v4, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v4}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    move-object v4, v1

    check-cast v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v4, "CPU lock released"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    const-string v5, "CPU lock release failed"

    invoke-static {v2, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_0
    :try_start_1
    iget-object v1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v4, :cond_1

    check-cast v1, Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lڜٟٱڀ/ز;->ؠ:Ljava/lang/Object;

    check-cast v1, Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    :cond_1
    move-object v1, v0

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v1, "WiFi lock released"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v4, "WiFi lock release failed"

    invoke-static {v2, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_1
    const-string v0, "All locks released + auto-renew stopped"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
