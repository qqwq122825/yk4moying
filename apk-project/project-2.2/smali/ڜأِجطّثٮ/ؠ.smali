.class public final Lڜأِجطّثٮ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile آ:Lڜأِجطّثٮ/ؠ;


# instance fields
.field public ؋:Lڜأِجطّثٮ/؋;

.field public ؠ:Ljava/lang/String;

.field public volatile ء:Z


# direct methods
.method public static أ()Lڜأِجطّثٮ/ؠ;
    .locals 2

    sget-object v0, Lڜأِجطّثٮ/ؠ;->آ:Lڜأِجطّثٮ/ؠ;

    if-nez v0, :cond_1

    const-class v0, Lڜأِجطّثٮ/ؠ;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڜأِجطّثٮ/ؠ;->آ:Lڜأِجطّثٮ/ؠ;

    if-nez v1, :cond_0

    new-instance v1, Lڜأِجطّثٮ/ؠ;

    invoke-direct {v1}, Lڜأِجطّثٮ/ؠ;-><init>()V

    sput-object v1, Lڜأِجطّثٮ/ؠ;->آ:Lڜأِجطّثٮ/ؠ;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lڜأِجطّثٮ/ؠ;->آ:Lڜأِجطّثٮ/ؠ;

    return-object v0
.end method


# virtual methods
.method public final ؋(ILjava/lang/String;)Z
    .locals 5

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lڜأِجطّثٮ/؋;->ء()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "connect "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v3, 0x3a98

    invoke-virtual {p2, v0, v3, v4}, Lڜأِجطّثٮ/؋;->؋(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_1

    return v1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v3, "connected to"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_3

    const-string v3, "already connected"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    :goto_0
    move v0, v4

    :goto_1
    const-string v3, "AdbCtrl"

    if-eqz v0, :cond_5

    iput-object p1, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    iput-boolean v4, p0, Lڜأِجطّثٮ/ؠ;->ء:Z

    invoke-virtual {p0}, Lڜأِجطّثٮ/ؠ;->ح()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Connected and verified: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    :cond_4
    iput-boolean v1, p0, Lڜأِجطّثٮ/ؠ;->ء:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " \u2192 "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_2
    return v1
.end method

.method public final ؠ()V
    .locals 1

    const-string v0, "settings put secure enabled_accessibility_services \'\'"

    invoke-virtual {p0, v0}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "settings put secure accessibility_enabled 0"

    invoke-virtual {p0, v0}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public final ء()V
    .locals 4

    const-string v0, "disconnect "

    iget-object v1, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v2, 0x1388

    invoke-virtual {v1, v0, v2, v3}, Lڜأِجطّثٮ/؋;->؋(Ljava/lang/String;J)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜأِجطّثٮ/ؠ;->ء:Z

    return-void
.end method

.method public final آ(Ljava/lang/String;)V
    .locals 4

    const-string v0, "settings get secure enabled_accessibility_services"

    invoke-virtual {p0, v0}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "settings put secure accessibility_enabled 1"

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "null"

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "settings put secure enabled_accessibility_services "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0, v1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public final ؤ(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "pm grant "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p2, "Exception"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    :cond_0
    return-void
.end method

.method public final إ(Landroid/content/Context;)Z
    .locals 10

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    sget-object v0, Lڜأِجطّثٮ/؋;->آ:Lڜأِجطّثٮ/؋;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const-class v0, Lڜأِجطّثٮ/؋;

    monitor-enter v0

    :try_start_0
    sget-object v2, Lڜأِجطّثٮ/؋;->آ:Lڜأِجطّثٮ/؋;

    if-nez v2, :cond_0

    new-instance v2, Lڜأِجطّثٮ/؋;

    invoke-direct {v2, v1}, Lڜأِجطّثٮ/؋;-><init>(I)V

    sput-object v2, Lڜأِجطّثٮ/؋;->آ:Lڜأِجطّثٮ/؋;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    sget-object v0, Lڜأِجطّثٮ/؋;->آ:Lڜأِجطّثٮ/؋;

    iput-object v0, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    iget-boolean v2, v0, Lڜأِجطّثٮ/؋;->ء:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    iget-object v2, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_2

    goto/16 :goto_4

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const-string v4, "/libadb.so"

    invoke-static {v2, v4}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "/system/bin/adb"

    const-string v5, "/system/xbin/adb"

    filled-new-array {v2, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    move v4, v1

    :goto_1
    const/4 v5, 0x3

    if-ge v4, v5, :cond_7

    aget-object v5, v2, v4

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/32 v8, 0x7d000

    cmp-long v6, v6, v8

    if-gez v6, :cond_3

    goto :goto_2

    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "sh -c \"\'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\' version 2>&1\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-wide/16 v7, 0x1388

    invoke-static {v6, v7, v8}, Lڜأِجطّثٮ/؋;->آ(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "illegal instruction"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "permission denied"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "not found"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "cannot execute"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "no such file"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_2

    :cond_5
    const-string v7, "android debug bridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    iput-object v5, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    goto :goto_3

    :cond_6
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_7
    :goto_3
    iget-object v2, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const-string v4, "AdbBinExec"

    if-nez v2, :cond_8

    const-string p1, "No valid adb binary found"

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_8
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v5, "adb_home"

    invoke-direct {v1, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v5, "adb_tmp"

    invoke-direct {v2, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v5, "export HOME=\'"

    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' TMPDIR=\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' ANDROID_ADB_SERVER_PORT=5037; "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lڜأِجطّثٮ/؋;->ؠ:Ljava/io/Serializable;

    iput-boolean v3, v0, Lڜأِجطّثٮ/؋;->ء:Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "ADB binary: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/io/File;

    iget-object v0, v0, Lڜأِجطّثٮ/؋;->؋:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v5, 0x400

    div-long/2addr v0, v5

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "KB)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    move v1, v3

    :goto_5
    return v1
.end method

.method public final ئ()Z
    .locals 1

    iget-boolean v0, p0, Lڜأِجطّثٮ/ؠ;->ء:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ا(Ljava/lang/String;)V
    .locals 1

    const-string v0, "input keyevent "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public final ب(ILjava/lang/String;)Z
    .locals 6

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lڜأِجطّثٮ/؋;->ء()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "pair 127.0.0.1:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v4, 0x7530

    invoke-virtual {v0, p2, v4, v5}, Lڜأِجطّثٮ/؋;->؋(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_1

    return v1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, "successfully paired"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "already paired"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/4 v1, 0x1

    :cond_3
    const-string v0, " \u2192 "

    invoke-static {v3, p1, v0}, Landroidx/activity/result/؋;->ة(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    if-eqz v1, :cond_4

    const-string p2, "SUCCESS"

    :cond_4
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AdbCtrl"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_0
    return v1
.end method

.method public final ة()[B
    .locals 5

    const-string v0, "-s "

    invoke-virtual {p0}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    :try_start_0
    iget-object v1, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " exec-out screencap -p"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v3, 0x2710

    invoke-virtual {v1, v0, v3, v4}, Lڜأِجطّثٮ/؋;->ؠ(Ljava/lang/String;J)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "AdbCtrl"

    const-string v3, "screenshot failed"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method public final ت(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, "-s "

    invoke-virtual {p0}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " shell "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v3, 0x3a98

    invoke-virtual {v1, v0, v3, v4}, Lڜأِجطّثٮ/؋;->؋(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "shell failed: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AdbCtrl"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-object v2
.end method

.method public final ث(IIIII)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "input swipe "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public final ج(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "input tap "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lڜأِجطّثٮ/ؠ;->ت(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public final ح()Z
    .locals 5

    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lڜأِجطّثٮ/ؠ;->؋:Lڜأِجطّثٮ/؋;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "-s "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lڜأِجطّثٮ/ؠ;->ؠ:Ljava/lang/String;

    const-string v4, " shell echo adb_ok"

    invoke-static {v2, v3, v4}, Landroidx/activity/result/؋;->ا(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x1388

    invoke-virtual {v0, v2, v3, v4}, Lڜأِجطّثٮ/؋;->؋(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v2, "adb_ok"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lڜأِجطّثٮ/ؠ;->ء:Z

    return v1
.end method
