.class public final Lذ۠ۋؿ/ذ;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0630\u06e0\u06cb\u063f/\u0630;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public final أ:Landroid/accounts/Account;

.field public final ؤ:I

.field public final إ:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lذ۠ۋؿ/ذ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lذ۠ۋؿ/ذ;->آ:I

    iput-object p2, p0, Lذ۠ۋؿ/ذ;->أ:Landroid/accounts/Account;

    iput p3, p0, Lذ۠ۋؿ/ذ;->ؤ:I

    iput-object p4, p0, Lذ۠ۋؿ/ذ;->إ:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lذ۠ۋؿ/ذ;->آ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x2

    iget-object v2, p0, Lذ۠ۋؿ/ذ;->أ:Landroid/accounts/Account;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    const/4 v1, 0x3

    iget v2, p0, Lذ۠ۋؿ/ذ;->ؤ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x4

    iget-object v2, p0, Lذ۠ۋؿ/ذ;->إ:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
