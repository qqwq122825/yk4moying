.class public final Lذ۠ۋؿ/أ;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u0623;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:Lذ۠ۋؿ/ة;

.field public final أ:Z

.field public final ؤ:Z

.field public final إ:[I

.field public final ئ:I

.field public final ا:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/أ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Lذ۠ۋؿ/ة;ZZ[II[I)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput-object p1, p0, Lذ۠ۋؿ/أ;->آ:Lذ۠ۋؿ/ة;

    iput-boolean p2, p0, Lذ۠ۋؿ/أ;->أ:Z

    iput-boolean p3, p0, Lذ۠ۋؿ/أ;->ؤ:Z

    iput-object p4, p0, Lذ۠ۋؿ/أ;->إ:[I

    iput p5, p0, Lذ۠ۋؿ/أ;->ئ:I

    iput-object p6, p0, Lذ۠ۋؿ/أ;->ا:[I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    iget-object v2, p0, Lذ۠ۋؿ/أ;->آ:Lذ۠ۋؿ/ة;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    const/4 p2, 0x2

    iget-boolean v1, p0, Lذ۠ۋؿ/أ;->أ:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/4 p2, 0x3

    iget-boolean v1, p0, Lذ۠ۋؿ/أ;->ؤ:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    iget-object p2, p0, Lذ۠ۋؿ/أ;->إ:[I

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v1

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    :goto_0
    const/4 p2, 0x5

    iget v1, p0, Lذ۠ۋؿ/أ;->ئ:I

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    iget-object p2, p0, Lذ۠ۋؿ/أ;->ا:[I

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x6

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v1

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    :goto_1
    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
