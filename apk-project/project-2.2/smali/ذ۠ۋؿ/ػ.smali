.class public final Lذ۠ۋؿ/ػ;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u063b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:Landroid/os/Bundle;

.field public final أ:[Lحۨٸڮؐێ/ء;

.field public final ؤ:I

.field public final إ:Lذ۠ۋؿ/أ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ػ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;[Lحۨٸڮؐێ/ء;ILذ۠ۋؿ/أ;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput-object p1, p0, Lذ۠ۋؿ/ػ;->آ:Landroid/os/Bundle;

    iput-object p2, p0, Lذ۠ۋؿ/ػ;->أ:[Lحۨٸڮؐێ/ء;

    iput p3, p0, Lذ۠ۋؿ/ػ;->ؤ:I

    iput-object p4, p0, Lذ۠ۋؿ/ػ;->إ:Lذ۠ۋؿ/أ;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    iget-object v2, p0, Lذ۠ۋؿ/ػ;->آ:Landroid/os/Bundle;

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->ع(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    const/4 v1, 0x2

    iget-object v2, p0, Lذ۠ۋؿ/ػ;->أ:[Lحۨٸڮؐێ/ء;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ؽ(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/4 v1, 0x3

    iget v2, p0, Lذ۠ۋؿ/ػ;->ؤ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x4

    iget-object v2, p0, Lذ۠ۋؿ/ػ;->إ:Lذ۠ۋؿ/أ;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
