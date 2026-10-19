.class public abstract Lذ۠ۋؿ/ف;
.super Lطٝڱڸٻێھ/؋;
.source "SourceFile"

# interfaces
.implements Lذ۠ۋؿ/س;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "com.google.android.gms.common.internal.ICertData"

    invoke-direct {p0, v0}, Lطٝڱڸٻێھ/؋;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final ؋(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    move-object p1, p0

    check-cast p1, Lحۨٸڮؐێ/ت;

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    iget p1, p1, Lحۨٸڮؐێ/ت;->ؠ:I

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    :cond_1
    move-object p1, p0

    check-cast p1, Lحۨٸڮؐێ/ت;

    invoke-virtual {p1}, Lحۨٸڮؐێ/ت;->ء()[B

    move-result-object p1

    new-instance v0, Lس۬ٲتٗه/؋;

    invoke-direct {v0, p1}, Lس۬ٲتٗه/؋;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    sget p1, Lطٝڱڸٻێھ/ؠ;->؋:I

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    :goto_0
    return p2
.end method
