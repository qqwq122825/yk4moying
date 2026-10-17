.class public final Lذ٨ۍ/ع;
.super Lذ٨ۍ/س;
.source "SourceFile"


# instance fields
.field public final ؠ:Lذ٨ۍ/ب;

.field public final ء:Lؾپۑ۟ڂڷ/ا;

.field public final آ:Lٽچڃ/أ;


# direct methods
.method public constructor <init>(Lذ٨ۍ/ب;Lؾپۑ۟ڂڷ/ا;Lٽچڃ/أ;)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lذ٨ۍ/س;-><init>(I)V

    iput-object p2, p0, Lذ٨ۍ/ع;->ء:Lؾپۑ۟ڂڷ/ا;

    iput-object p1, p0, Lذ٨ۍ/ع;->ؠ:Lذ٨ۍ/ب;

    iput-object p3, p0, Lذ٨ۍ/ع;->آ:Lٽچڃ/أ;

    iget-boolean p1, p1, Lذ٨ۍ/ب;->ء:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Best-effort write calls cannot pass methods that should auto-resolve missing features."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final ؋(Lذ٨ۍ/د;)Z
    .locals 0

    iget-object p1, p0, Lذ٨ۍ/ع;->ؠ:Lذ٨ۍ/ب;

    iget-boolean p1, p1, Lذ٨ۍ/ب;->ء:Z

    return p1
.end method

.method public final ؠ(Lذ٨ۍ/د;)[Lحۨٸڮؐێ/ء;
    .locals 0

    iget-object p1, p0, Lذ٨ۍ/ع;->ؠ:Lذ٨ۍ/ب;

    iget-object p1, p1, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast p1, [Lحۨٸڮؐێ/ء;

    return-object p1
.end method

.method public final ء(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    iget-object v0, p0, Lذ٨ۍ/ع;->آ:Lٽچڃ/أ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lcom/google/android/gms/common/api/Status;->ؤ:Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    new-instance v0, Lخڝٻؽؐ/ئ;

    invoke-direct {v0, p1}, Lخڝٻؽؐ/ئ;-><init>(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_1

    :cond_1
    new-instance v0, Lخڝٻؽؐ/ء;

    invoke-direct {v0, p1}, Lخڝٻؽؐ/ء;-><init>(Lcom/google/android/gms/common/api/Status;)V

    :goto_1
    iget-object p1, p0, Lذ٨ۍ/ع;->ء:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {p1, v0}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    return-void
.end method

.method public final آ(Ljava/lang/RuntimeException;)V
    .locals 1

    iget-object v0, p0, Lذ٨ۍ/ع;->ء:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    return-void
.end method

.method public final أ(Lذ٨ۍ/د;)V
    .locals 2

    iget-object v0, p0, Lذ٨ۍ/ع;->ء:Lؾپۑ۟ڂڷ/ا;

    :try_start_0
    iget-object v1, p0, Lذ٨ۍ/ع;->ؠ:Lذ٨ۍ/ب;

    iget-object p1, p1, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v1, p1, v0}, Lذ٨ۍ/ب;->ؠ(Lذ۠ۋؿ/إ;Lؾپۑ۟ڂڷ/ا;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    goto :goto_1

    :catch_2
    move-exception p1

    goto :goto_2

    :goto_0
    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    return-void

    :goto_1
    invoke-static {p1}, Lذ٨ۍ/س;->إ(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {p0, p1}, Lذ٨ۍ/ع;->ء(Lcom/google/android/gms/common/api/Status;)V

    return-void

    :goto_2
    throw p1
.end method

.method public final ؤ(Lآۋۻؾ۹/ة;Z)V
    .locals 2

    iget-object v0, p1, Lآۋۻؾ۹/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iget-object v1, p0, Lذ٨ۍ/ع;->ء:Lؾپۑ۟ڂڷ/ا;

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, v1, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    new-instance v0, Lآۋۻؾ۹/ة;

    invoke-direct {v0, p1, v1}, Lآۋۻؾ۹/ة;-><init>(Lآۋۻؾ۹/ة;Lؾپۑ۟ڂڷ/ا;)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lؾپۑ۟ڂڷ/ب;->؋:Lأۺؘٻڣ/ذ;

    new-instance v1, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v1, p1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    iget-object p1, p2, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v1}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p2}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-void
.end method
