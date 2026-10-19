.class public final Lحۨٸڮؐێ/ب;
.super Lصٝتږۗ/آ;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final synthetic ؠ:Lحۨٸڮؐێ/آ;


# direct methods
.method public constructor <init>(Lحۨٸڮؐێ/آ;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lحۨٸڮؐێ/ب;->ؠ:Lحۨٸڮؐێ/آ;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    :goto_0
    invoke-direct {p0, p1}, Lصٝتږۗ/آ;-><init>(Landroid/os/Looper;)V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lحۨٸڮؐێ/ب;->؋:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Don\'t know how to handle this message: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "GoogleApiAvailability"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p1, p0, Lحۨٸڮؐێ/ب;->ؠ:Lحۨٸڮؐێ/آ;

    iget-object v1, p0, Lحۨٸڮؐێ/ب;->؋:Landroid/content/Context;

    invoke-virtual {p1, v1}, Lحۨٸڮؐێ/آ;->ء(Landroid/content/Context;)I

    move-result v2

    sget-object v3, Lحۨٸڮؐێ/إ;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    if-eq v2, v0, :cond_1

    const/4 v4, 0x2

    if-eq v2, v4, :cond_1

    const/4 v4, 0x3

    if-eq v2, v4, :cond_1

    const/16 v4, 0x9

    if-eq v2, v4, :cond_1

    move v0, v3

    :cond_1
    if-eqz v0, :cond_3

    const-string v0, "n"

    invoke-virtual {p1, v1, v0, v2}, Lحۨٸڮؐێ/آ;->؋(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    const/high16 v4, 0xc000000

    invoke-static {v1, v3, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v1, v2, v0}, Lحۨٸڮؐێ/آ;->إ(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    :cond_3
    return-void
.end method
