.class public final Lؼۿعڽٵۄٙ؀/إ;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u063c\u06ff\u0639\u06bd\u0675\u06c4\u0659\u0600/\u0625;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:Ljava/util/List;

.field public final أ:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lؼۿعڽٵۄٙ؀/إ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput-object p2, p0, Lؼۿعڽٵۄٙ؀/إ;->آ:Ljava/util/List;

    iput-object p1, p0, Lؼۿعڽٵۄٙ؀/إ;->أ:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    iget-object v0, p0, Lؼۿعڽٵۄٙ؀/إ;->آ:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    invoke-static {p1, v1}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    :goto_0
    iget-object v0, p0, Lؼۿعڽٵۄٙ؀/إ;->أ:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {p1, v1, v0}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method
