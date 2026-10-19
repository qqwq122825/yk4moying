.class public final Lذ۠ۋؿ/ة;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u0629;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public final أ:Z

.field public final ؤ:Z

.field public final إ:I

.field public final ئ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ة;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IZZII)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lذ۠ۋؿ/ة;->آ:I

    iput-boolean p2, p0, Lذ۠ۋؿ/ة;->أ:Z

    iput-boolean p3, p0, Lذ۠ۋؿ/ة;->ؤ:Z

    iput p4, p0, Lذ۠ۋؿ/ة;->إ:I

    iput p5, p0, Lذ۠ۋؿ/ة;->ئ:I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    iget v1, p0, Lذ۠ۋؿ/ة;->آ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v0, 0x2

    iget-boolean v1, p0, Lذ۠ۋؿ/ة;->أ:Z

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/4 v0, 0x3

    iget-boolean v1, p0, Lذ۠ۋؿ/ة;->ؤ:Z

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/4 v0, 0x4

    iget v1, p0, Lذ۠ۋؿ/ة;->إ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v0, 0x5

    iget v1, p0, Lذ۠ۋؿ/ة;->ئ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
