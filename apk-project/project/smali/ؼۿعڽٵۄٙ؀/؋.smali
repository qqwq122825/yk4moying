.class public final Lؼۿعڽٵۄٙ؀/؋;
.super Lذ۠ۋؿ/إ;
.source "SourceFile"

# interfaces
.implements Lؼۄٿأ/ء;


# instance fields
.field public final ظ:Z

.field public final ع:Lذ۠ۋؿ/آ;

.field public final غ:Landroid/os/Bundle;

.field public final ػ:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Landroid/os/Bundle;Lخڝٻؽؐ/ؤ;Lخڝٻؽؐ/إ;)V
    .locals 7

    const/16 v3, 0x2c

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lذ۠ۋؿ/إ;-><init>(Landroid/content/Context;Landroid/os/Looper;ILذ۠ۋؿ/آ;Lذ٨ۍ/آ;Lذ٨ۍ/ا;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lؼۿعڽٵۄٙ؀/؋;->ظ:Z

    iput-object p3, p0, Lؼۿعڽٵۄٙ؀/؋;->ع:Lذ۠ۋؿ/آ;

    iput-object p4, p0, Lؼۿعڽٵۄٙ؀/؋;->غ:Landroid/os/Bundle;

    iget-object p1, p3, Lذ۠ۋؿ/آ;->إ:Ljava/lang/Integer;

    iput-object p1, p0, Lؼۿعڽٵۄٙ؀/؋;->ػ:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final ؠ(Lؼۿعڽٵۄٙ؀/أ;)V
    .locals 8

    if-eqz p1, :cond_3

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    iget-object v2, p0, Lؼۿعڽٵۄٙ؀/؋;->ع:Lذ۠ۋؿ/آ;

    iget-object v2, v2, Lذ۠ۋؿ/آ;->؋:Landroid/accounts/Account;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v3, "<<default account>>"

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    :try_start_1
    new-instance v2, Landroid/accounts/Account;

    const-string v4, "com.google"

    invoke-direct {v2, v3, v4}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v4, v2, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-static {v3}, Lحآ؋ڎ۵ڻٯ/؋;->؋(Landroid/content/Context;)Lحآ؋ڎ۵ڻٯ/؋;

    move-result-object v3

    const-string v4, "defaultGoogleSignInAccount"

    iget-object v5, v3, Lحآ؋ڎ۵ڻٯ/؋;->؋:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    iget-object v6, v3, Lحآ؋ڎ۵ڻٯ/؋;->ؠ:Landroid/content/SharedPreferences;

    invoke-interface {v6, v4, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    new-instance v6, Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x14

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "googleSignInAccount:"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Lحآ؋ڎ۵ڻٯ/؋;->؋:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    :try_start_4
    iget-object v3, v3, Lحآ؋ڎ۵ڻٯ/؋;->ؠ:Landroid/content/SharedPreferences;

    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    if-eqz v3, :cond_2

    :try_start_6
    invoke-static {v3}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->؋(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v3
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    :catchall_0
    move-exception v2

    :try_start_7
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2

    :catchall_1
    move-exception v2

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2

    :catch_0
    :cond_2
    :goto_1
    move-object v3, v0

    :goto_2
    new-instance v4, Lذ۠ۋؿ/ذ;

    iget-object v5, p0, Lؼۿعڽٵۄٙ؀/؋;->ػ:Ljava/lang/Integer;

    invoke-static {v5}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x2

    invoke-direct {v4, v6, v2, v5, v3}, Lذ۠ۋؿ/ذ;-><init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    invoke-virtual {p0}, Lذ۠ۋؿ/إ;->ت()Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Lؼۿعڽٵۄٙ؀/ؤ;

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    iget-object v5, v2, Lصٝتږۗ/؋;->ء:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    sget v5, Lصٝتږۗ/ؠ;->؋:I

    invoke-virtual {v3, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v5, 0x4f45

    invoke-static {v3, v5}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v5

    invoke-static {v3, v1, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v7, 0x0

    invoke-static {v3, v6, v4, v7}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    invoke-static {v3, v5}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    move-object v4, p1

    check-cast v4, Lؼۿعڽٵۄٙ؀/آ;

    invoke-virtual {v3, v4}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1

    :try_start_8
    iget-object v2, v2, Lصٝتږۗ/؋;->ؠ:Landroid/os/IBinder;

    const/16 v5, 0xc

    invoke-interface {v2, v5, v3, v4, v7}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {v4}, Landroid/os/Parcel;->readException()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    return-void

    :catchall_2
    move-exception v2

    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    throw v2
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_1

    :catch_1
    move-exception v2

    const-string v3, "SignInClientImpl"

    const-string v4, "Remote service probably died when signIn is called"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_a
    new-instance v4, Lؼۿعڽٵۄٙ؀/ا;

    new-instance v5, Lحۨٸڮؐێ/؋;

    const/16 v6, 0x8

    invoke-direct {v5, v6, v0}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {v4, v1, v5, v0}, Lؼۿعڽٵۄٙ؀/ا;-><init>(ILحۨٸڮؐێ/؋;Lذ۠ۋؿ/ر;)V

    check-cast p1, Lذ٨ۍ/ظ;

    new-instance v0, Lحظتۢۋۜآظ/ة;

    const/4 v1, 0x3

    invoke-direct {v0, p1, v4, v1}, Lحظتۢۋۜآظ/ة;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p1, p1, Lذ٨ۍ/ظ;->ء:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_2

    return-void

    :catch_2
    const-string p1, "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException."

    invoke-static {v3, p1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Expecting a valid ISignInCallbacks"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final آ()I
    .locals 1

    const v0, 0xbdfcb8

    return v0
.end method

.method public final إ()Z
    .locals 1

    iget-boolean v0, p0, Lؼۿعڽٵۄٙ؀/؋;->ظ:Z

    return v0
.end method

.method public final ئ()V
    .locals 2

    new-instance v0, Lذ۠ۋؿ/ء;

    invoke-direct {v0, p0}, Lذ۠ۋؿ/ء;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V

    return-void
.end method

.method public final synthetic ا(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "com.google.android.gms.signin.internal.ISignInService"

    invoke-interface {p1, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Lؼۿعڽٵۄٙ؀/ؤ;

    if-eqz v1, :cond_1

    move-object p1, v0

    check-cast p1, Lؼۿعڽٵۄٙ؀/ؤ;

    goto :goto_0

    :cond_1
    new-instance v0, Lؼۿعڽٵۄٙ؀/ؤ;

    invoke-direct {v0, p1}, Lؼۿعڽٵۄٙ؀/ؤ;-><init>(Landroid/os/IBinder;)V

    move-object p1, v0

    :goto_0
    return-object p1
.end method

.method public final ة()Landroid/os/Bundle;
    .locals 3

    iget-object v0, p0, Lؼۿعڽٵۄٙ؀/؋;->ع:Lذ۠ۋؿ/آ;

    iget-object v1, v0, Lذ۠ۋؿ/آ;->آ:Ljava/lang/String;

    iget-object v2, p0, Lذ۠ۋؿ/إ;->ء:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Lؼۿعڽٵۄٙ؀/؋;->غ:Landroid/os/Bundle;

    if-nez v1, :cond_0

    iget-object v0, v0, Lذ۠ۋؿ/آ;->آ:Ljava/lang/String;

    const-string v1, "com.google.android.gms.signin.internal.realClientPackageName"

    invoke-virtual {v2, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v2
.end method

.method public final ث()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.signin.internal.ISignInService"

    return-object v0
.end method

.method public final ج()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.signin.service.START"

    return-object v0
.end method
