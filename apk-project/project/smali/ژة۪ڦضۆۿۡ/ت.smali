.class public final synthetic Lژة۪ڦضۆۿۡ/ت;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/ؤ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/google/firebase/messaging/FirebaseMessaging;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V
    .locals 0

    iput p2, p0, Lژة۪ڦضۆۿۡ/ت;->آ:I

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ت;->أ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ء(Ljava/lang/Object;)V
    .locals 3

    iget v0, p0, Lژة۪ڦضۆۿۡ/ت;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ت;->أ:Lcom/google/firebase/messaging/FirebaseMessaging;

    check-cast p1, Lژة۪ڦضۆۿۡ/ؼ;

    sget-object v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->أ:Lژة۪ڦضۆۿۡ/خ;

    monitor-enter v0

    :try_start_0
    invoke-virtual {v0}, Lژة۪ڦضۆۿۡ/خ;->؋()V

    iget-object v1, v0, Lژة۪ڦضۆۿۡ/خ;->ء:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lژة۪ڦضۆۿۡ/خ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v1, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v1, Lڃٷښـ۝ۼ/إ;->إ:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {v1}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڗښ۸/؋;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    iget-boolean v2, v1, Lڗښ۸/؋;->؋:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move v1, v2

    :goto_0
    monitor-exit v0

    if-eqz v1, :cond_2

    iget-object v0, p1, Lژة۪ڦضۆۿۡ/ؼ;->ئ:Lژة۪ڦضۆۿۡ/غ;

    invoke-virtual {v0}, Lژة۪ڦضۆۿۡ/غ;->؋()Lژة۪ڦضۆۿۡ/ع;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    monitor-enter p1

    :try_start_3
    iget-boolean v0, p1, Lژة۪ڦضۆۿۡ/ؼ;->إ:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p1

    if-nez v0, :cond_2

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lژة۪ڦضۆۿۡ/ؼ;->ؤ(J)V

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0

    :cond_2
    :goto_2
    return-void

    :catchall_1
    move-exception p1

    :try_start_4
    monitor-exit v1

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit v0

    throw p1

    :goto_3
    check-cast p1, Lحظتۢۋۜآظ/؋;

    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ت;->أ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_3

    iget-object p1, p1, Lحظتۢۋۜآظ/؋;->آ:Landroid/content/Intent;

    invoke-static {p1}, Lڗًقڔ/ء;->س(Landroid/content/Intent;)V

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->آ()V

    :cond_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
