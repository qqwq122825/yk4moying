.class public final Lةؽڗںۍټ٘/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/آ;


# instance fields
.field public آ:Ljava/lang/Object;

.field public أ:Ljava/lang/Object;

.field public ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    iput-object p2, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    iput-object p3, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lز؃ۉؾؚۖڿڨ/ؠ;Lړجإٖټض/أ;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "ClientTelemetry.API"

    iput-object v0, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    iput-object p1, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    iput-object p2, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Lؾپۑ۟ڂڷ/ح;)V
    .locals 3

    iget-object p1, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast p1, Lحظتۢۋۜآظ/ؠ;

    iget-object v0, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ScheduledFuture;

    iget-object v2, p1, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    monitor-enter v2

    :try_start_0
    iget-object p1, p1, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1, v0}, Landroidx/collection/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    invoke-interface {v1, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final ؠ()Lةؽڗںۍټ٘/آ;
    .locals 8

    iget-object v0, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_0

    const-string v0, " delta"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_1

    const-string v1, " maxAllowedDelay"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    if-nez v1, :cond_2

    const-string v1, " flags"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v0, Lةؽڗںۍټ٘/آ;

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Ljava/util/Set;

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lةؽڗںۍټ٘/آ;-><init>(JJLjava/util/Set;)V

    return-object v0

    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Missing required properties:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final ء()Lڗًقڔ/آ;
    .locals 5

    iget-object v0, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_0

    const-string v0, " tokenExpirationTimestamp"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v0, Lڗًقڔ/آ;

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget-object v4, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    check-cast v4, Lڗًقڔ/ئ;

    invoke-direct {v0, v1, v2, v3, v4}, Lڗًقڔ/آ;-><init>(Ljava/lang/String;JLڗًقڔ/ئ;)V

    return-object v0

    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Missing required properties:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 7

    const-string v0, "Emitted [enc msg]: type="

    const-string v1, "enc"

    iget-object v2, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v2, Lio/socket/client/Socket;

    const/4 v3, 0x0

    const-string v4, "MessageSender"

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lio/socket/client/Socket;->connected()Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_2

    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "action"

    invoke-virtual {v2, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "type"

    invoke-virtual {v2, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_1

    const-string v1, "data"

    invoke-virtual {v2, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    iget-object p2, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, Lڙڧا/ء;

    iget-object v1, v1, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v1, Ljavax/crypto/spec/SecretKeySpec;

    const/4 v5, 0x1

    if-eqz v1, :cond_2

    move v1, v5

    goto :goto_0

    :cond_2
    move v1, v3

    :goto_0
    if-eqz v1, :cond_4

    check-cast p2, Lڙڧا/ء;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p2, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v2, Ljavax/crypto/spec/SecretKeySpec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v2, :cond_5

    if-nez v1, :cond_3

    goto :goto_1

    :cond_3
    :try_start_1
    const-string v2, "AES/ECB/PKCS5Padding"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    iget-object p2, p2, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast p2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v2, v5, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    const-string p2, "UTF-8"

    invoke-virtual {v1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    invoke-virtual {v2, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p2

    const/4 v2, 0x2

    invoke-static {p2, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    :try_start_2
    const-string v2, "AesCipher"

    const-string v6, "encrypt error"

    invoke-static {v2, v6, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :cond_4
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_5
    :goto_1
    const-string p2, "enc msg"

    iget-object v2, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v2, Lio/socket/client/Socket;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, p2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return v5

    :catch_1
    move-exception p1

    const-string p2, "emit error"

    invoke-static {v4, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3

    :cond_6
    :goto_2
    const-string p1, "Socket not connected, cannot emit"

    invoke-static {v4, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3
.end method

.method public final أ(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    .locals 4

    new-instance v0, Lڒڦٶ٣٧/ؤ;

    iget-object v1, p0, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    iget-object v2, p0, Lةؽڗںۍټ٘/ء;->أ:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    iget-object v3, p0, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    check-cast v3, Lڑ٘ڰ٩ۓ۲ىښ/آ;

    invoke-direct {v0, p2, v1, v2, v3}, Lڒڦٶ٣٧/ؤ;-><init>(Ljava/io/ByteArrayOutputStream;Ljava/util/Map;Ljava/util/Map;Lڑ٘ڰ٩ۓ۲ىښ/آ;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/آ;

    if-eqz p2, :cond_0

    invoke-interface {p2, p1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/؋;->؋(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_0
    new-instance p2, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No encoder for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p2
.end method
