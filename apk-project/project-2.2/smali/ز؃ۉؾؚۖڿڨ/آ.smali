.class public final Lز؃ۉؾؚۖڿڨ/آ;
.super Lذ۠ۋؿ/إ;
.source "SourceFile"


# instance fields
.field public final ظ:Lذ۠ۋؿ/ث;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Lذ۠ۋؿ/ث;Lذ٨ۍ/آ;Lذ٨ۍ/ا;)V
    .locals 7

    const/16 v3, 0x10e

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lذ۠ۋؿ/إ;-><init>(Landroid/content/Context;Landroid/os/Looper;ILذ۠ۋؿ/آ;Lذ٨ۍ/آ;Lذ٨ۍ/ا;)V

    iput-object p4, p0, Lز؃ۉؾؚۖڿڨ/آ;->ظ:Lذ۠ۋؿ/ث;

    return-void
.end method


# virtual methods
.method public final آ()I
    .locals 1

    const v0, 0xc1fa340

    return v0
.end method

.method public final synthetic ا(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "com.google.android.gms.common.internal.service.IClientTelemetryService"

    invoke-interface {p1, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Lز؃ۉؾؚۖڿڨ/؋;

    if-eqz v1, :cond_1

    move-object p1, v0

    check-cast p1, Lز؃ۉؾؚۖڿڨ/؋;

    goto :goto_0

    :cond_1
    new-instance v0, Lز؃ۉؾؚۖڿڨ/؋;

    invoke-direct {v0, p1}, Lز؃ۉؾؚۖڿڨ/؋;-><init>(Landroid/os/IBinder;)V

    move-object p1, v0

    :goto_0
    return-object p1
.end method

.method public final ب()[Lحۨٸڮؐێ/ء;
    .locals 1

    sget-object v0, Lسۄھؤۏ۫/؋;->ؤ:[Lحۨٸڮؐێ/ء;

    return-object v0
.end method

.method public final ة()Landroid/os/Bundle;
    .locals 3

    iget-object v0, p0, Lز؃ۉؾؚۖڿڨ/آ;->ظ:Lذ۠ۋؿ/ث;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v0, v0, Lذ۠ۋؿ/ث;->؋:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v2, "api"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v1
.end method

.method public final ث()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.common.internal.service.IClientTelemetryService"

    return-object v0
.end method

.method public final ج()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.common.telemetry.service.START"

    return-object v0
.end method

.method public final ح()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
