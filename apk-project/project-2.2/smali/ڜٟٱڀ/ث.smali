.class public final Lڜٟٱڀ/ث;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# virtual methods
.method public final onAvailable(Landroid/net/Network;)V
    .locals 3

    const-string p1, "NetworkMonitor"

    const-string v0, "Network available, triggering reconnect"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lڜٟٱڀ/د;->آ()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lڜٟٱڀ/د;->؋()V

    :cond_0
    :try_start_0
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object p1

    const/4 v0, 0x0

    iput v0, p1, Lڜٟٱڀ/ؤ;->أ:I

    const/4 v0, 0x1

    iput-boolean v0, p1, Lڜٟٱڀ/ؤ;->ؤ:Z

    iget-boolean v0, p1, Lڜٟٱڀ/ؤ;->إ:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p1, Lڜٟٱڀ/ؤ;->ء:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object p1, p1, Lڜٟٱڀ/ؤ;->آ:Ljava/lang/String;

    const/16 v2, 0x1bb

    invoke-virtual {v0, v1, v2, p1}, Lڜٟٱڀ/ش;->؋(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-void
.end method

.method public final onLost(Landroid/net/Network;)V
    .locals 1

    const-string p1, "NetworkMonitor"

    const-string v0, "Network lost"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
