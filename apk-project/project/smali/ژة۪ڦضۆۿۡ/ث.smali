.class public final synthetic Lژة۪ڦضۆۿۡ/ث;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/google/firebase/messaging/FirebaseMessaging;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V
    .locals 0

    iput p2, p0, Lژة۪ڦضۆۿۡ/ث;->آ:I

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ث;->أ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    iget v0, p0, Lژة۪ڦضۆۿۡ/ث;->آ:I

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ث;->أ:Lcom/google/firebase/messaging/FirebaseMessaging;

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    iget-object v0, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->أ:Lژة۪ڦضۆۿۡ/خ;

    monitor-enter v0

    :try_start_0
    invoke-virtual {v0}, Lژة۪ڦضۆۿۡ/خ;->؋()V

    iget-object v2, v0, Lژة۪ڦضۆۿۡ/خ;->ء:Ljava/lang/Boolean;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    goto :goto_0

    :cond_0
    iget-object v2, v0, Lژة۪ڦضۆۿۡ/خ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v2, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v2}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v2, v2, Lڃٷښـ۝ۼ/إ;->إ:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {v2}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lڗښ۸/؋;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    iget-boolean v3, v2, Lڗښ۸/؋;->؋:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move v2, v3

    :goto_0
    monitor-exit v0

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->ء()Lژة۪ڦضۆۿۡ/ض;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->إ(Lژة۪ڦضۆۿۡ/ض;)Z

    move-result v0

    if-eqz v0, :cond_2

    monitor-enter v1

    :try_start_3
    iget-boolean v0, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z

    if-nez v0, :cond_1

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/messaging/FirebaseMessaging;->ؤ(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_1
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    :goto_1
    return-void

    :catchall_1
    move-exception v1

    :try_start_4
    monitor-exit v2

    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v1

    monitor-exit v0

    throw v1

    :goto_2
    iget-object v0, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    invoke-static {v0}, Lںڍڒڸ/ش;->ـ(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->أ()Z

    move-result v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-lt v3, v4, :cond_3

    move v3, v5

    goto :goto_3

    :cond_3
    move v3, v6

    :goto_3
    if-nez v3, :cond_4

    goto :goto_6

    :cond_4
    invoke-static {v0}, Lڗًقڔ/؋;->ؽ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "proxy_retention"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v3, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-ne v3, v2, :cond_5

    goto :goto_4

    :cond_5
    move v5, v6

    :goto_4
    if-nez v5, :cond_7

    iget-object v3, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ء:Lأۺؘٻڣ/ئ;

    iget-object v3, v3, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    check-cast v3, Lحظتۢۋۜآظ/ؠ;

    iget-object v5, v3, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {v5}, Lحظتۢۋۜآظ/ر;->؋()I

    move-result v5

    const v7, 0xe5ee4e0

    if-lt v5, v7, :cond_6

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v5, v4, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v3, v3, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-static {v3}, Lحظتۢۋۜآظ/ذ;->؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;

    move-result-object v3

    new-instance v4, Lحظتۢۋۜآظ/ح;

    monitor-enter v3

    :try_start_5
    iget v7, v3, Lحظتۢۋۜآظ/ذ;->آ:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v3, Lحظتۢۋۜآظ/ذ;->آ:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    monitor-exit v3

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Lحظتۢۋۜآظ/ح;-><init>(IILandroid/os/Bundle;I)V

    invoke-virtual {v3, v4}, Lحظتۢۋۜآظ/ذ;->ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v3

    goto :goto_5

    :catchall_3
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_6
    new-instance v3, Ljava/io/IOException;

    const-string v4, "SERVICE_NOT_AVAILABLE"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance v4, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v4}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {v4, v3}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    move-object v3, v4

    :goto_5
    new-instance v4, Landroidx/arch/core/executor/؋;

    const/16 v5, 0xc

    invoke-direct {v4, v5}, Landroidx/arch/core/executor/؋;-><init>(I)V

    new-instance v5, Lژة۪ڦضۆۿۡ/ز;

    invoke-direct {v5, v0, v2}, Lژة۪ڦضۆۿۡ/ز;-><init>(Landroid/content/Context;Z)V

    invoke-virtual {v3, v4, v5}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    :cond_7
    :goto_6
    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->أ()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->آ()V

    :cond_8
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
