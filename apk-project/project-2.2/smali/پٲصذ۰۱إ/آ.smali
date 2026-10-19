.class public final Lپٲصذ۰۱إ/آ;
.super Landroidx/customview/view/AbsSavedState;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u067e\u0672\u0635\u0630\u06f0\u06f1\u0625/\u0622;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lـ۰صںڱیؕ/ؠ;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lـ۰صںڱیؕ/ؠ;-><init>(I)V

    sput-object v0, Lپٲصذ۰۱إ/آ;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/customview/view/AbsSavedState;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lپٲصذ۰۱إ/آ;->آ:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;Lcom/google/android/material/sidesheet/SideSheetBehavior;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/customview/view/AbsSavedState;-><init>(Landroid/os/Parcelable;)V

    iget p1, p2, Lcom/google/android/material/sidesheet/SideSheetBehavior;->ئ:I

    iput p1, p0, Lپٲصذ۰۱إ/آ;->آ:I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/customview/view/AbsSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lپٲصذ۰۱إ/آ;->آ:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
