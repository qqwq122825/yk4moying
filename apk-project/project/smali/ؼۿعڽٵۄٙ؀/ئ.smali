.class public final Lؼۿعڽٵۄٙ؀/ئ;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u063c\u06ff\u0639\u06bd\u0675\u06c4\u0659\u0600/\u0626;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I

.field public final أ:Lذ۠ۋؿ/ذ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lؼۿعڽٵۄٙ؀/ئ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILذ۠ۋؿ/ذ;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput p1, p0, Lؼۿعڽٵۄٙ؀/ئ;->آ:I

    iput-object p2, p0, Lؼۿعڽٵۄٙ؀/ئ;->أ:Lذ۠ۋؿ/ذ;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lؼۿعڽٵۄٙ؀/ئ;->آ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    iget-object v1, p0, Lؼۿعڽٵۄٙ؀/ئ;->أ:Lذ۠ۋؿ/ذ;

    const/4 v2, 0x2

    invoke-static {p1, v2, v1, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
