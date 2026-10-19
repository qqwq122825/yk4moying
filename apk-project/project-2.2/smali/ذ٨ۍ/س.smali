.class public abstract Lذ٨ۍ/س;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lذ٨ۍ/س;->؋:I

    return-void
.end method

.method public static إ(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p0, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x13

    invoke-direct {p0, v2, v0, v1, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    return-object p0
.end method


# virtual methods
.method public abstract ؋(Lذ٨ۍ/د;)Z
.end method

.method public abstract ؠ(Lذ٨ۍ/د;)[Lحۨٸڮؐێ/ء;
.end method

.method public abstract ء(Lcom/google/android/gms/common/api/Status;)V
.end method

.method public abstract آ(Ljava/lang/RuntimeException;)V
.end method

.method public abstract أ(Lذ٨ۍ/د;)V
.end method

.method public abstract ؤ(Lآۋۻؾ۹/ة;Z)V
.end method
