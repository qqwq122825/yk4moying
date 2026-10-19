.class public final Lذ٨ۍ/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public ؠ:Ljava/lang/Object;

.field public ء:Z

.field public آ:I

.field public أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lذ٨ۍ/ب;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lذ٨ۍ/ب;->ء:Z

    iput v0, p0, Lذ٨ۍ/ب;->آ:I

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lذ٨ۍ/ب;->؋:I

    iput-object p1, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lحظتۢۋۜآظ/آ;

    const/4 v0, 0x3

    invoke-direct {p1, v0, p0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)V
    .locals 0

    const/4 p2, 0x2

    iput p2, p0, Lذ٨ۍ/ب;->؋:I

    invoke-direct {p0, p1}, Lذ٨ۍ/ب;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lذ٨ۍ/ب;->؋:I

    iput-object p1, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v0, 0x8

    invoke-direct {p1, v0, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lذ٨ۍ/ب;[Lحۨٸڮؐێ/ء;ZI)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lذ٨ۍ/ب;->؋:I

    iput-object p1, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lذ٨ۍ/ب;->ء:Z

    iput p4, p0, Lذ٨ۍ/ب;->آ:I

    return-void
.end method


# virtual methods
.method public final ؋(I)V
    .locals 2

    iget v0, p0, Lذ٨ۍ/ب;->؋:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v0, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٱ:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lذ٨ۍ/ب;->آ:I

    iget-boolean p1, p0, Lذ٨ۍ/ب;->ء:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ٱ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object v0, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    iput-boolean v1, p0, Lذ٨ۍ/ب;->ء:Z

    :cond_1
    :goto_0
    return-void

    :goto_1
    iget-object v0, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v0, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->خ:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    iput p1, p0, Lذ٨ۍ/ب;->آ:I

    iget-boolean p1, p0, Lذ٨ۍ/ب;->ء:Z

    if-nez p1, :cond_3

    iget-object p1, p0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object p1, p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->خ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object v0, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    iput-boolean v1, p0, Lذ٨ۍ/ب;->ء:Z

    :cond_3
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public final ؠ(Lذ۠ۋؿ/إ;Lؾپۑ۟ڂڷ/ا;)V
    .locals 4

    iget-object v0, p0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ب;

    iget-object v0, v0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    check-cast v0, Lڙڧا/ء;

    iget-object v0, v0, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Lذ۠ۋؿ/ت;

    check-cast p1, Lز؃ۉؾؚۖڿڨ/آ;

    invoke-virtual {p1}, Lذ۠ۋؿ/إ;->ت()Landroid/os/IInterface;

    move-result-object p1

    check-cast p1, Lز؃ۉؾؚۖڿڨ/؋;

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    iget-object v2, p1, Lصٝتږۗ/؋;->ء:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    sget v2, Lصٝتږۗ/ؠ;->؋:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-interface {v0, v1, v3}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    :goto_0
    :try_start_0
    iget-object p1, p1, Lصٝتږۗ/؋;->ؠ:Landroid/os/IBinder;

    const/4 v0, 0x0

    invoke-interface {p1, v2, v1, v0, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {p2, v0}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    throw p1
.end method
