.class public final Lذ۠ۋؿ/ر;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u0631;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public final أ:Landroid/os/IBinder;

.field public final ؤ:Lحۨٸڮؐێ/؋;

.field public final إ:Z

.field public final ئ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ر;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/os/IBinder;Lحۨٸڮؐێ/؋;ZZ)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lذ۠ۋؿ/ر;->آ:I

    iput-object p2, p0, Lذ۠ۋؿ/ر;->أ:Landroid/os/IBinder;

    iput-object p3, p0, Lذ۠ۋؿ/ر;->ؤ:Lحۨٸڮؐێ/؋;

    iput-boolean p4, p0, Lذ۠ۋؿ/ر;->إ:Z

    iput-boolean p5, p0, Lذ۠ۋؿ/ر;->ئ:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    return v1

    :cond_1
    instance-of v2, p1, Lذ۠ۋؿ/ر;

    if-nez v2, :cond_2

    return v0

    :cond_2
    check-cast p1, Lذ۠ۋؿ/ر;

    iget-object v2, p0, Lذ۠ۋؿ/ر;->ؤ:Lحۨٸڮؐێ/؋;

    iget-object v3, p1, Lذ۠ۋؿ/ر;->ؤ:Lحۨٸڮؐێ/؋;

    invoke-virtual {v2, v3}, Lحۨٸڮؐێ/؋;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v2, 0x0

    const-string v3, "com.google.android.gms.common.internal.IAccountAccessor"

    iget-object v4, p0, Lذ۠ۋؿ/ر;->أ:Landroid/os/IBinder;

    if-nez v4, :cond_3

    move-object v5, v2

    goto :goto_0

    :cond_3
    sget v5, Lذ۠ۋؿ/؋;->ؠ:I

    invoke-interface {v4, v3}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v5

    instance-of v6, v5, Lذ۠ۋؿ/ئ;

    if-eqz v6, :cond_4

    check-cast v5, Lذ۠ۋؿ/ئ;

    goto :goto_0

    :cond_4
    new-instance v5, Lذ۠ۋؿ/ـ;

    invoke-direct {v5, v4}, Lذ۠ۋؿ/ـ;-><init>(Landroid/os/IBinder;)V

    :goto_0
    iget-object p1, p1, Lذ۠ۋؿ/ر;->أ:Landroid/os/IBinder;

    if-nez p1, :cond_5

    goto :goto_1

    :cond_5
    sget v2, Lذ۠ۋؿ/؋;->ؠ:I

    invoke-interface {p1, v3}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v2

    instance-of v3, v2, Lذ۠ۋؿ/ئ;

    if-eqz v3, :cond_6

    check-cast v2, Lذ۠ۋؿ/ئ;

    goto :goto_1

    :cond_6
    new-instance v2, Lذ۠ۋؿ/ـ;

    invoke-direct {v2, p1}, Lذ۠ۋؿ/ـ;-><init>(Landroid/os/IBinder;)V

    :goto_1
    invoke-static {v5, v2}, Lںڍڒڸ/ش;->س(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    return v1

    :cond_7
    return v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lذ۠ۋؿ/ر;->آ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    iget-object v1, p0, Lذ۠ۋؿ/ر;->أ:Landroid/os/IBinder;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    invoke-static {p1, v2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    invoke-static {p1, v2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    :goto_0
    const/4 v1, 0x3

    iget-object v2, p0, Lذ۠ۋؿ/ر;->ؤ:Lحۨٸڮؐێ/؋;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    const/4 p2, 0x4

    iget-boolean v1, p0, Lذ۠ۋؿ/ر;->إ:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/4 p2, 0x5

    iget-boolean v1, p0, Lذ۠ۋؿ/ر;->ئ:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
