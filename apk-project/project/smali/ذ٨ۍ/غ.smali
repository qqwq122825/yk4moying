.class public final Lذ٨ۍ/غ;
.super Lذ٨ۍ/س;
.source "SourceFile"


# instance fields
.field public final ؠ:Lؾپۑ۟ڂڷ/ا;


# direct methods
.method public constructor <init>(Lؾپۑ۟ڂڷ/ا;)V
    .locals 1

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lذ٨ۍ/س;-><init>(I)V

    iput-object p1, p0, Lذ٨ۍ/غ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    return-void
.end method


# virtual methods
.method public final ؋(Lذ٨ۍ/د;)Z
    .locals 1

    iget-object p1, p1, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p1, 0x0

    return p1
.end method

.method public final ؠ(Lذ٨ۍ/د;)[Lحۨٸڮؐێ/ء;
    .locals 1

    iget-object p1, p1, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final ء(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    new-instance v0, Lخڝٻؽؐ/ء;

    invoke-direct {v0, p1}, Lخڝٻؽؐ/ء;-><init>(Lcom/google/android/gms/common/api/Status;)V

    iget-object p1, p0, Lذ٨ۍ/غ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {p1, v0}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    return-void
.end method

.method public final آ(Ljava/lang/RuntimeException;)V
    .locals 1

    iget-object v0, p0, Lذ٨ۍ/غ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    return-void
.end method

.method public final أ(Lذ٨ۍ/د;)V
    .locals 1

    :try_start_0
    invoke-virtual {p0, p1}, Lذ٨ۍ/غ;->ئ(Lذ٨ۍ/د;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lذ٨ۍ/غ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    goto :goto_0

    :catch_1
    move-exception p1

    invoke-static {p1}, Lذ٨ۍ/س;->إ(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {p0, p1}, Lذ٨ۍ/غ;->ء(Lcom/google/android/gms/common/api/Status;)V

    :goto_0
    return-void

    :catch_2
    move-exception p1

    invoke-static {p1}, Lذ٨ۍ/س;->إ(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {p0, v0}, Lذ٨ۍ/غ;->ء(Lcom/google/android/gms/common/api/Status;)V

    throw p1
.end method

.method public final bridge synthetic ؤ(Lآۋۻؾ۹/ة;Z)V
    .locals 0

    return-void
.end method

.method public final ئ(Lذ٨ۍ/د;)V
    .locals 1

    iget-object p1, p1, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    iget-object p1, p0, Lذ٨ۍ/غ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    return-void
.end method
