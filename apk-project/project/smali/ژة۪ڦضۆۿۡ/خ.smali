.class public final Lژة۪ڦضۆۿۡ/خ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lڒڬؾۓؾ/ؠ;

.field public ؠ:Z

.field public ء:Ljava/lang/Boolean;

.field public final synthetic آ:Lcom/google/firebase/messaging/FirebaseMessaging;


# direct methods
.method public constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;Lڒڬؾۓؾ/ؠ;)V
    .locals 0

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/خ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/خ;->؋:Lڒڬؾۓؾ/ؠ;

    return-void
.end method


# virtual methods
.method public final declared-synchronized ؋()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lژة۪ڦضۆۿۡ/خ;->ؠ:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/خ;->ؠ()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/خ;->ء:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    new-instance v0, Lژة۪ڦضۆۿۡ/ح;

    invoke-direct {v0, p0}, Lژة۪ڦضۆۿۡ/ح;-><init>(Lژة۪ڦضۆۿۡ/خ;)V

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/خ;->؋:Lڒڬؾۓؾ/ؠ;

    check-cast v1, Lڊ۟چڗۙ٦/ج;

    invoke-virtual {v1, v0}, Lڊ۟چڗۙ٦/ج;->؋(Lژة۪ڦضۆۿۡ/ح;)V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lژة۪ڦضۆۿۡ/خ;->ؠ:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final ؠ()Ljava/lang/Boolean;
    .locals 6

    const-string v0, "firebase_messaging_auto_init_enabled"

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/خ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v1, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v2, "com.google.firebase.messaging"

    iget-object v1, v1, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "auto_init"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x80

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v2, :cond_1

    invoke-virtual {v2, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
