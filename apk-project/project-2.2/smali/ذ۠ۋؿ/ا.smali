.class public final Lذ۠ۋؿ/ا;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u0627;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public final أ:I

.field public final ؤ:I

.field public final إ:J

.field public final ئ:J

.field public final ا:Ljava/lang/String;

.field public final ب:Ljava/lang/String;

.field public final ة:I

.field public final ت:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ا;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lذ۠ۋؿ/ا;->آ:I

    iput p2, p0, Lذ۠ۋؿ/ا;->أ:I

    iput p3, p0, Lذ۠ۋؿ/ا;->ؤ:I

    iput-wide p4, p0, Lذ۠ۋؿ/ا;->إ:J

    iput-wide p6, p0, Lذ۠ۋؿ/ا;->ئ:J

    iput-object p8, p0, Lذ۠ۋؿ/ا;->ا:Ljava/lang/String;

    iput-object p9, p0, Lذ۠ۋؿ/ا;->ب:Ljava/lang/String;

    iput p10, p0, Lذ۠ۋؿ/ا;->ة:I

    iput p11, p0, Lذ۠ۋؿ/ا;->ت:I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    iget v1, p0, Lذ۠ۋؿ/ا;->آ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v0, 0x2

    iget v1, p0, Lذ۠ۋؿ/ا;->أ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v0, 0x3

    iget v1, p0, Lذ۠ۋؿ/ا;->ؤ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const v0, 0x80004

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v0, p0, Lذ۠ۋؿ/ا;->إ:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    const v0, 0x80005

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v0, p0, Lذ۠ۋؿ/ا;->ئ:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    const/4 v0, 0x6

    iget-object v1, p0, Lذ۠ۋؿ/ا;->ا:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    const/4 v0, 0x7

    iget-object v1, p0, Lذ۠ۋؿ/ا;->ب:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    const/16 v0, 0x8

    iget v1, p0, Lذ۠ۋؿ/ا;->ة:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/16 v0, 0x9

    iget v1, p0, Lذ۠ۋؿ/ا;->ت:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
