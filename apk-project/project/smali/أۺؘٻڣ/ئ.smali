.class public final Lأۺؘٻڣ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public ؋:Ljava/lang/Object;

.field public ؠ:Ljava/lang/Object;

.field public ء:Ljava/lang/Object;

.field public آ:Ljava/lang/Object;

.field public أ:Ljava/lang/Object;

.field public ؤ:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lڃٷښـ۝ۼ/إ;Lژة۪ڦضۆۿۡ/ذ;Lڕۇۅؑۨؼ۫ە/؋;Lڕۇۅؑۨؼ۫ە/؋;Lږٍڔڴٝ/آ;)V
    .locals 2

    new-instance v0, Lحظتۢۋۜآظ/ؠ;

    invoke-virtual {p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, p1, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-direct {v0, v1}, Lحظتۢۋۜآظ/ؠ;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    iput-object p2, p0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    iput-object v0, p0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    iput-object p3, p0, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    iput-object p4, p0, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    iput-object p5, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lأۺؘٻڣ/ئ;->آ()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final ؠ()Lأۺؘٻڣ/ا;
    .locals 11

    iget-object v0, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, " transportName"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iget-object v1, p0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    check-cast v1, Lأۺؘٻڣ/ح;

    if-nez v1, :cond_1

    const-string v1, " encodedPayload"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    iget-object v1, p0, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_2

    const-string v1, " eventMillis"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    iget-object v1, p0, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_3

    const-string v1, " uptimeMillis"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    iget-object v1, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_4

    const-string v1, " autoMetadata"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    new-instance v0, Lأۺؘٻڣ/ا;

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/Integer;

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lأۺؘٻڣ/ح;

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v1, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Ljava/util/Map;

    move-object v2, v0

    invoke-direct/range {v2 .. v10}, Lأۺؘٻڣ/ا;-><init>(Ljava/lang/String;Ljava/lang/Integer;Lأۺؘٻڣ/ح;JJLjava/util/Map;)V

    return-object v0

    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Missing required properties:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final ء(Lؾپۑ۟ڂڷ/ح;)Lؾپۑ۟ڂڷ/ح;
    .locals 3

    new-instance v0, Landroidx/arch/core/executor/؋;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroidx/arch/core/executor/؋;-><init>(I)V

    new-instance v1, Landroidx/constraintlayout/core/state/؋;

    const/16 v2, 0xb

    invoke-direct {v1, v2, p0}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0, v1}, Lؾپۑ۟ڂڷ/ح;->ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    return-object p1
.end method

.method public final آ()Ljava/util/Map;
    .locals 2

    iget-object v0, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/util/Map;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Property \"autoMetadata\" has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final أ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 5

    const-string v0, "scope"

    invoke-virtual {p3, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "sender"

    invoke-virtual {p3, p2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "subtype"

    invoke-virtual {p3, p2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "gmp_app_id"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    check-cast p2, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {p2}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object p2, p2, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object p2, p2, Lڃٷښـ۝ۼ/ا;->ؠ:Ljava/lang/String;

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "gmsv"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    check-cast p2, Lژة۪ڦضۆۿۡ/ذ;

    monitor-enter p2

    :try_start_0
    iget v0, p2, Lژة۪ڦضۆۿۡ/ذ;->آ:I

    if-nez v0, :cond_0

    const-string v0, "com.google.android.gms"

    invoke-virtual {p2, v0}, Lژة۪ڦضۆۿۡ/ذ;->ؠ(Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    iput v0, p2, Lژة۪ڦضۆۿۡ/ذ;->آ:I

    :cond_0
    iget v0, p2, Lژة۪ڦضۆۿۡ/ذ;->آ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    monitor-exit p2

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "osv"

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "app_ver"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    check-cast p2, Lژة۪ڦضۆۿۡ/ذ;

    monitor-enter p2

    :try_start_1
    iget-object v0, p2, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-virtual {p2}, Lژة۪ڦضۆۿۡ/ذ;->آ()V

    :cond_1
    iget-object v0, p2, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    monitor-exit p2

    invoke-virtual {p3, p1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "app_ver_name"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    check-cast p2, Lژة۪ڦضۆۿۡ/ذ;

    monitor-enter p2

    :try_start_2
    iget-object v0, p2, Lژة۪ڦضۆۿۡ/ذ;->ء:Ljava/lang/String;

    if-nez v0, :cond_2

    invoke-virtual {p2}, Lژة۪ڦضۆۿۡ/ذ;->آ()V

    :cond_2
    iget-object v0, p2, Lژة۪ڦضۆۿۡ/ذ;->ء:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    monitor-exit p2

    invoke-virtual {p3, p1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "firebase-app-name-hash"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    check-cast p2, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {p2}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object p2, p2, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    const-string v0, "SHA-1"

    :try_start_3
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p2

    const/16 v0, 0xb

    invoke-static {p2, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p2
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    :catch_0
    const-string p2, "[HASH-ERROR]"

    :goto_0
    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_4
    iget-object p1, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    check-cast p1, Lږٍڔڴٝ/آ;

    check-cast p1, Lږٍڔڴٝ/ء;

    invoke-virtual {p1}, Lږٍڔڴٝ/ء;->آ()Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    invoke-static {p1}, Lڃٷښـ۝ۼ/ؠ;->ؠ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lږٍڔڴٝ/؋;

    iget-object p1, p1, Lږٍڔڴٝ/؋;->؋:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "Goog-Firebase-Installations-Auth"

    invoke-virtual {p3, p2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    const-string p1, "FirebaseMessaging"

    const-string p2, "FIS auth token is empty"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    goto :goto_1

    :catch_2
    move-exception p1

    :goto_1
    const-string p2, "FirebaseMessaging"

    const-string v0, "Failed to get FIS auth token"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    const-string p1, "appid"

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    check-cast p2, Lږٍڔڴٝ/آ;

    check-cast p2, Lږٍڔڴٝ/ء;

    invoke-virtual {p2}, Lږٍڔڴٝ/ء;->ء()Lؾپۑ۟ڂڷ/ح;

    move-result-object p2

    invoke-static {p2}, Lڃٷښـ۝ۼ/ؠ;->ؠ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "cliv"

    const-string p2, "fcm-24.0.0"

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    check-cast p1, Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {p1}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lړجإٖټض/إ;

    iget-object p2, p0, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    check-cast p2, Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {p2}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lڙڧا/ؠ;

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    check-cast p1, Lړجإٖټض/آ;

    monitor-enter p1

    :try_start_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p1, Lړجإٖټض/آ;->؋:Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {v2}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lړجإٖټض/ئ;

    monitor-enter v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    invoke-virtual {v2, v0, v1}, Lړجإٖټض/ئ;->إ(J)Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    monitor-exit v2

    const/4 v1, 0x1

    if-eqz v0, :cond_4

    monitor-enter v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lړجإٖټض/ئ;->آ(J)Ljava/lang/String;

    move-result-object v0

    iget-object v3, v2, Lړجإٖټض/ئ;->؋:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "last-used-date"

    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-virtual {v2, v0}, Lړجإٖټض/ئ;->ؤ(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    monitor-exit v2

    const/4 v0, 0x3

    goto :goto_3

    :catchall_0
    move-exception p2

    monitor-exit v2

    throw p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :cond_4
    move v0, v1

    :goto_3
    monitor-exit p1

    if-eq v0, v1, :cond_5

    const-string p1, "Firebase-Client-Log-Type"

    invoke-static {v0}, Lإٿ٢/ء;->ؠ(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, p1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Firebase-Client"

    invoke-virtual {p2}, Lڙڧا/ؠ;->؋()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :catchall_1
    move-exception p2

    :try_start_a
    monitor-exit v2

    throw p2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p2

    monitor-exit p1

    throw p2

    :cond_5
    :goto_4
    return-void

    :catchall_3
    move-exception p1

    monitor-exit p2

    throw p1

    :catchall_4
    move-exception p1

    monitor-exit p2

    throw p1

    :catchall_5
    move-exception p1

    monitor-exit p2

    throw p1
.end method

.method public final ؤ(Lأۺؘٻڣ/ح;)V
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null encodedPayload"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final إ(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null transportName"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ئ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;
    .locals 3

    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lأۺؘٻڣ/ئ;->أ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object p1, p0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    check-cast p1, Lحظتۢۋۜآظ/ؠ;

    iget-object p2, p1, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {p2}, Lحظتۢۋۜآظ/ر;->؋()I

    move-result v0

    sget-object v1, Lحظتۢۋۜآظ/ز;->آ:Lحظتۢۋۜآظ/ز;

    const v2, 0xb71b00

    if-ge v0, v2, :cond_1

    invoke-virtual {p2}, Lحظتۢۋۜآظ/ر;->ؠ()I

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1, p3}, Lحظتۢۋۜآظ/ؠ;->؋(Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p2

    new-instance v0, Lآۋۻؾ۹/ة;

    const/16 v2, 0x8

    invoke-direct {v0, v2, p1, p3}, Lآۋۻؾ۹/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v1, v0}, Lؾپۑ۟ڂڷ/ح;->آ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MISSING_INSTANCEID_SERVICE"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance p2, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {p2}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {p2, p1}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    move-object p1, p2

    goto :goto_0

    :cond_1
    iget-object p1, p1, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-static {p1}, Lحظتۢۋۜآظ/ذ;->؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;

    move-result-object p1

    new-instance p2, Lحظتۢۋۜآظ/ح;

    monitor-enter p1

    :try_start_1
    iget v0, p1, Lحظتۢۋۜآظ/ذ;->آ:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p1, Lحظتۢۋۜآظ/ذ;->آ:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p1

    const/4 v2, 0x1

    invoke-direct {p2, v0, v2, p3, v2}, Lحظتۢۋۜآظ/ح;-><init>(IILandroid/os/Bundle;I)V

    invoke-virtual {p1, p2}, Lحظتۢۋۜآظ/ذ;->ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    sget-object p2, Lذ۠ۋؿ/ب;->ؤ:Lذ۠ۋؿ/ب;

    invoke-virtual {p1, v1, p2}, Lؾپۑ۟ڂڷ/ح;->ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    :goto_0
    return-object p1

    :catchall_0
    move-exception p2

    monitor-exit p1

    throw p2

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_1
    new-instance p2, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {p2}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {p2, p1}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    return-object p2
.end method
