.class public final Lٿخ۴۟ؽ/ح;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/util/SparseArray;

.field public final ؠ:Lٿخ۴۟ؽ/خ;

.field public final ء:I

.field public final آ:I


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/خ;Landroidx/appcompat/widget/TintTypedArray;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lٿخ۴۟ؽ/ح;->؋:Landroid/util/SparseArray;

    iput-object p1, p0, Lٿخ۴۟ؽ/ح;->ؠ:Lٿخ۴۟ؽ/خ;

    const/16 p1, 0x1c

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lٿخ۴۟ؽ/ح;->ء:I

    const/16 p1, 0x34

    invoke-virtual {p2, p1, v0}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lٿخ۴۟ؽ/ح;->آ:I

    return-void
.end method
