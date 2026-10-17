.class public final Lز؃ۉؾؚۖڿڨ/ؠ;
.super Lڗًقڔ/؋;
.source "SourceFile"


# instance fields
.field public final synthetic ل:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lز؃ۉؾؚۖڿڨ/ؠ;->ل:I

    invoke-direct {p0}, Lڗًقڔ/؋;-><init>()V

    return-void
.end method


# virtual methods
.method public final إ(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Lخڝٻؽؐ/؋;Lخڝٻؽؐ/ؤ;Lخڝٻؽؐ/إ;)Lذ۠ۋؿ/إ;
    .locals 8

    const/4 v0, 0x0

    iget v1, p0, Lز؃ۉؾؚۖڿڨ/ؠ;->ل:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p4}, Landroidx/activity/result/؋;->ز(Lخڝٻؽؐ/؋;)V

    throw v0

    :pswitch_1
    move-object v1, p4

    check-cast v1, Lؼۄٿأ/؋;

    new-instance v7, Lؼۿعڽٵۄٙ؀/؋;

    iget-object v1, p3, Lذ۠ۋؿ/آ;->إ:Ljava/lang/Integer;

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v2, "com.google.android.gms.signin.internal.clientRequestedAccount"

    iget-object v5, p3, Lذ۠ۋؿ/آ;->؋:Landroid/accounts/Account;

    invoke-virtual {v4, v2, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    if-eqz v1, :cond_0

    const-string v2, "com.google.android.gms.common.internal.ClientSettings.sessionId"

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v4, v2, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    const-string v1, "com.google.android.gms.signin.internal.offlineAccessRequested"

    const/4 v2, 0x0

    invoke-virtual {v4, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "com.google.android.gms.signin.internal.idTokenRequested"

    invoke-virtual {v4, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "com.google.android.gms.signin.internal.serverClientId"

    invoke-virtual {v4, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.signin.internal.usePromptModeForAuthCode"

    const/4 v5, 0x1

    invoke-virtual {v4, v1, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "com.google.android.gms.signin.internal.forceCodeForRefreshToken"

    invoke-virtual {v4, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "com.google.android.gms.signin.internal.hostedDomain"

    invoke-virtual {v4, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.signin.internal.logSessionId"

    invoke-virtual {v4, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.google.android.gms.signin.internal.waitForAccessTokenRefresh"

    invoke-virtual {v4, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lؼۿعڽٵۄٙ؀/؋;-><init>(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Landroid/os/Bundle;Lخڝٻؽؐ/ؤ;Lخڝٻؽؐ/إ;)V

    return-object v7

    :goto_0
    packed-switch v1, :pswitch_data_1

    goto :goto_1

    :pswitch_2
    move-object v4, p4

    check-cast v4, Lذ۠ۋؿ/ث;

    new-instance v7, Lز؃ۉؾؚۖڿڨ/آ;

    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lز؃ۉؾؚۖڿڨ/آ;-><init>(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Lذ۠ۋؿ/ث;Lذ٨ۍ/آ;Lذ٨ۍ/ا;)V

    return-object v7

    :goto_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "buildClient must be implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
    .end packed-switch
.end method
