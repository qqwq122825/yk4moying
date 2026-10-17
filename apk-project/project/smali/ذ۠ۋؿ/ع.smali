.class public final Lذ۠ۋؿ/ع;
.super Lذ۠ۋؿ/ز;
.source "SourceFile"


# instance fields
.field public final إ:Landroid/os/IBinder;

.field public final synthetic ئ:Lذ۠ۋؿ/إ;


# direct methods
.method public constructor <init>(Lذ۠ۋؿ/إ;ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/ع;->ئ:Lذ۠ۋؿ/إ;

    invoke-direct {p0, p1, p2, p4}, Lذ۠ۋؿ/ز;-><init>(Lذ۠ۋؿ/إ;ILandroid/os/Bundle;)V

    iput-object p3, p0, Lذ۠ۋؿ/ع;->إ:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public final ؋(Lحۨٸڮؐێ/؋;)V
    .locals 1

    iget-object v0, p0, Lذ۠ۋؿ/ع;->ئ:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ح:Lذ۠ۋؿ/ء;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ا;

    invoke-interface {v0, p1}, Lذ٨ۍ/ا;->ء(Lحۨٸڮؐێ/؋;)V

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void
.end method

.method public final ؠ()Z
    .locals 5

    iget-object v0, p0, Lذ۠ۋؿ/ع;->إ:Landroid/os/IBinder;

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v0}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    invoke-interface {v0}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v3, p0, Lذ۠ۋؿ/ع;->ئ:Lذ۠ۋؿ/إ;

    invoke-virtual {v3}, Lذ۠ۋؿ/إ;->ث()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Lذ۠ۋؿ/إ;->ث()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "service descriptor mismatch: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " vs. "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {v3, v0}, Lذ۠ۋؿ/إ;->ا(Landroid/os/IBinder;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v2, 0x2

    const/4 v4, 0x4

    invoke-static {v3, v2, v4, v0}, Lذ۠ۋؿ/إ;->ذ(Lذ۠ۋؿ/إ;IILandroid/os/IInterface;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x3

    invoke-static {v3, v2, v4, v0}, Lذ۠ۋؿ/إ;->ذ(Lذ۠ۋؿ/إ;IILandroid/os/IInterface;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    const/4 v0, 0x0

    iput-object v0, v3, Lذ۠ۋؿ/إ;->ر:Lحۨٸڮؐێ/؋;

    iget-object v0, v3, Lذ۠ۋؿ/إ;->ج:Lذ۠ۋؿ/ء;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/آ;

    invoke-interface {v0}, Lذ٨ۍ/آ;->ؠ()V

    :cond_2
    const/4 v0, 0x1

    return v0

    :cond_3
    return v1

    :catch_0
    const-string v0, "service probably died"

    :goto_0
    const-string v2, "GmsClient"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method
