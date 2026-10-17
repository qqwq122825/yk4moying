.class public final Lژة۪ڦضۆۿۡ/س;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0698\u0629\u06ea\u06a6\u0636\u06c6\u06ff\u06e1/\u0633;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:Landroid/os/Bundle;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lژة۪ڦضۆۿۡ/س;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/س;->آ:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x2

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/س;->آ:Landroid/os/Bundle;

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ع(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
