.class public final Lٹ؅ڟ؀ە/؋;
.super Landroidx/customview/view/AbsSavedState;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u0679\u0605\u069f\u0600\u06d5/\u060b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public آ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lـ۰صںڱیؕ/ؠ;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lـ۰صںڱیؕ/ؠ;-><init>(I)V

    sput-object v0, Lٹ؅ڟ؀ە/؋;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/customview/view/AbsSavedState;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lٹ؅ڟ؀ە/؋;->آ:Z

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/customview/view/AbsSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    iget-boolean p2, p0, Lٹ؅ڟ؀ە/؋;->آ:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
