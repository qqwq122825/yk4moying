.class public final synthetic Lژة۪ڦضۆۿۡ/ج;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/ئ;


# instance fields
.field public final synthetic آ:Lcom/google/firebase/messaging/FirebaseMessaging;

.field public final synthetic أ:Ljava/lang/String;

.field public final synthetic ؤ:Lژة۪ڦضۆۿۡ/ض;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;Ljava/lang/String;Lژة۪ڦضۆۿۡ/ض;)V
    .locals 0

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ج;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/ج;->أ:Ljava/lang/String;

    iput-object p3, p0, Lژة۪ڦضۆۿۡ/ج;->ؤ:Lژة۪ڦضۆۿۡ/ض;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;
    .locals 9

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ج;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ج;->أ:Ljava/lang/String;

    iget-object v2, p0, Lژة۪ڦضۆۿۡ/ج;->ؤ:Lژة۪ڦضۆۿۡ/ض;

    check-cast p1, Ljava/lang/String;

    iget-object v3, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    const-class v4, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v4

    :try_start_0
    sget-object v5, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    if-nez v5, :cond_0

    new-instance v5, Lئٱنۃؖۊڄئ/آ;

    invoke-direct {v5, v3}, Lئٱنۃؖۊڄئ/آ;-><init>(Landroid/content/Context;)V

    sput-object v5, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    :cond_0
    sget-object v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit v4

    iget-object v4, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v4}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v5, "[DEFAULT]"

    iget-object v6, v4, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v4, ""

    goto :goto_0

    :cond_1
    invoke-virtual {v4}, Lڃٷښـ۝ۼ/إ;->ء()Ljava/lang/String;

    move-result-object v4

    :goto_0
    iget-object v5, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ئ:Lژة۪ڦضۆۿۡ/ذ;

    monitor-enter v5

    :try_start_1
    iget-object v6, v5, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;

    if-nez v6, :cond_2

    invoke-virtual {v5}, Lژة۪ڦضۆۿۡ/ذ;->آ()V

    :cond_2
    iget-object v6, v5, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v5

    monitor-enter v3

    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {p1, v6, v7, v8}, Lژة۪ڦضۆۿۡ/ض;->؋(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    goto :goto_1

    :cond_3
    iget-object v6, v3, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v6, Landroid/content/SharedPreferences;

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "|T|"

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|*"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v1, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    monitor-exit v3

    if-eqz v2, :cond_4

    iget-object v1, v2, Lژة۪ڦضۆۿۡ/ض;->؋:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    :cond_4
    iget-object v1, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v2, "[DEFAULT]"

    iget-object v3, v1, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "FirebaseMessaging"

    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invoking onNewToken for app: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v1, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.firebase.messaging.NEW_TOKEN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "token"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v2, Lژة۪ڦضۆۿۡ/ب;

    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    invoke-direct {v2, v0}, Lژة۪ڦضۆۿۡ/ب;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Lژة۪ڦضۆۿۡ/ب;->ؠ(Landroid/content/Intent;)Lؾپۑ۟ڂڷ/ح;

    :cond_6
    invoke-static {p1}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v3

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v5

    throw p1

    :catchall_2
    move-exception p1

    monitor-exit v4

    throw p1
.end method
