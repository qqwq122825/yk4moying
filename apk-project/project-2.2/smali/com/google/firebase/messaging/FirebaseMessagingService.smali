.class public Lcom/google/firebase/messaging/FirebaseMessagingService;
.super Lcom/google/firebase/messaging/EnhancedIntentService;
.source "SourceFile"


# static fields
.field public static final ئ:Ljava/util/ArrayDeque;


# instance fields
.field public إ:Lحظتۢۋۜآظ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayDeque;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    sput-object v0, Lcom/google/firebase/messaging/FirebaseMessagingService;->ئ:Ljava/util/ArrayDeque;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/firebase/messaging/EnhancedIntentService;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؠ(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 0

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object p1

    iget-object p1, p1, Lژة۪ڦضۆۿۡ/ص;->آ:Ljava/lang/Object;

    check-cast p1, Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    return-object p1
.end method

.method public final ء(Landroid/content/Intent;)V
    .locals 10

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.c2dm.intent.RECEIVE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "FirebaseMessaging"

    if-nez v1, :cond_2

    const-string v1, "com.google.firebase.messaging.RECEIVE_DIRECT_BOOT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "com.google.firebase.messaging.NEW_TOKEN"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "token"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_7

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown intent action: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7

    :cond_2
    :goto_0
    const-string v0, "google.message_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x3

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    sget-object v3, Lcom/google/firebase/messaging/FirebaseMessagingService;->ئ:Ljava/util/ArrayDeque;

    invoke-virtual {v3, v1}, Ljava/util/ArrayDeque;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, "Received duplicate message: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    move v1, v5

    goto :goto_2

    :cond_5
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v7

    const/16 v8, 0xa

    if-lt v7, v8, :cond_6

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    :cond_6
    invoke-virtual {v3, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :goto_1
    move v1, v4

    :goto_2
    const-string v3, "message_id"

    if-nez v1, :cond_12

    const-string v1, "message_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v7, "gcm"

    if-nez v1, :cond_7

    move-object v1, v7

    :cond_7
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/4 v9, 0x2

    sparse-switch v8, :sswitch_data_0

    goto :goto_3

    :sswitch_0
    const-string v7, "send_event"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    goto :goto_3

    :cond_8
    move v7, v6

    goto :goto_4

    :sswitch_1
    const-string v7, "send_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    goto :goto_3

    :cond_9
    move v7, v9

    goto :goto_4

    :sswitch_2
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a

    goto :goto_3

    :cond_a
    move v7, v5

    goto :goto_4

    :sswitch_3
    const-string v7, "deleted_messages"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    goto :goto_3

    :cond_b
    move v7, v4

    goto :goto_4

    :goto_3
    const/4 v7, -0x1

    :goto_4
    if-eqz v7, :cond_12

    if-eq v7, v5, :cond_f

    if-eq v7, v9, :cond_d

    if-eq v7, v6, :cond_c

    const-string v5, "Received message with unknown type: "

    invoke-virtual {v5, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_c
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_5

    :cond_d
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_e

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    :cond_e
    new-instance v1, Lحظتۢۋۜآظ/د;

    const-string v2, "error"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lحظتۢۋۜآظ/د;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_f
    invoke-static {p1}, Lڗًقڔ/ء;->س(Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_10

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    :cond_10
    const-string v2, "androidx.content.wakelockid"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    invoke-static {v1}, Lڙڧا/ء;->ة(Landroid/os/Bundle;)Z

    move-result v2

    if-eqz v2, :cond_12

    new-instance v2, Lڙڧا/ء;

    invoke-direct {v2, v1}, Lڙڧا/ء;-><init>(Landroid/os/Bundle;)V

    new-instance v1, Lسڒذ/؋;

    const-string v5, "Firebase-Messaging-Network-Io"

    invoke-direct {v1, v5}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v5, Lژة۪ڦضۆۿۡ/إ;

    invoke-direct {v5, p0, v2, v1}, Lژة۪ڦضۆۿۡ/إ;-><init>(Landroid/content/Context;Lڙڧا/ء;Ljava/util/concurrent/ExecutorService;)V

    :try_start_0
    invoke-virtual {v5}, Lژة۪ڦضۆۿۡ/إ;->؋()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    if-eqz v2, :cond_11

    goto :goto_5

    :cond_11
    invoke-static {p1}, Lڗًقڔ/ء;->غ(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_12

    const-string v1, "_nf"

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v1, v2}, Lڗًقڔ/ء;->ش(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_5

    :catchall_0
    move-exception p1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    throw p1

    :cond_12
    :goto_5
    iget-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessagingService;->إ:Lحظتۢۋۜآظ/ؠ;

    if-nez v1, :cond_13

    new-instance v1, Lحظتۢۋۜآظ/ؠ;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lحظتۢۋۜآظ/ؠ;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessagingService;->إ:Lحظتۢۋۜآظ/ؠ;

    :cond_13
    iget-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessagingService;->إ:Lحظتۢۋۜآظ/ؠ;

    iget-object v2, v1, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {v2}, Lحظتۢۋۜآظ/ر;->؋()I

    move-result v2

    const v5, 0xdedfaa0

    if-lt v2, v5, :cond_17

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_14

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_14
    invoke-virtual {v2, v0, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "google.product_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_6

    :cond_15
    const/4 p1, 0x0

    :goto_6
    if-eqz p1, :cond_16

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v2, v0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_16
    iget-object p1, v1, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-static {p1}, Lحظتۢۋۜآظ/ذ;->؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;

    move-result-object p1

    new-instance v0, Lحظتۢۋۜآظ/ح;

    monitor-enter p1

    :try_start_1
    iget v1, p1, Lحظتۢۋۜآظ/ذ;->آ:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p1, Lحظتۢۋۜآظ/ذ;->آ:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p1

    invoke-direct {v0, v1, v6, v2, v4}, Lحظتۢۋۜآظ/ح;-><init>(IILandroid/os/Bundle;I)V

    invoke-virtual {p1, v0}, Lحظتۢۋۜآظ/ذ;->ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;

    goto :goto_7

    :catchall_1
    move-exception v0

    monitor-exit p1

    throw v0

    :cond_17
    new-instance p1, Ljava/io/IOException;

    const-string v0, "SERVICE_NOT_AVAILABLE"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_7
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7aedf14e -> :sswitch_3
        0x18f11 -> :sswitch_2
        0x308f3e91 -> :sswitch_1
        0x3090df23 -> :sswitch_0
    .end sparse-switch
.end method
