.class public final Lذ۠ۋؿ/ت;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u062a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public أ:Ljava/util/List;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ت;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lذ۠ۋؿ/ت;->آ:I

    iput-object p2, p0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    iget v1, p0, Lذ۠ۋؿ/ت;->آ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    iget-object v0, p0, Lذ۠ۋؿ/ت;->أ:Ljava/util/List;

    const/4 v1, 0x2

    invoke-static {p1, v1, v0}, Lسۄھؤۏ۫/؋;->ؾ(Landroid/os/Parcel;ILjava/util/List;)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
