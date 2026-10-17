.class public final Lـ۰صںڱیؕ/إ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/view/View;

.field public ؠ:I

.field public ء:I

.field public آ:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lـ۰صںڱیؕ/إ;->؋:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final ؋()V
    .locals 4

    iget v0, p0, Lـ۰صںڱیؕ/إ;->آ:I

    iget-object v1, p0, Lـ۰صںڱیؕ/إ;->؋:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Lـ۰صںڱیؕ/إ;->ؠ:I

    sub-int/2addr v2, v3

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Landroidx/core/view/ViewCompat;->offsetTopAndBottom(Landroid/view/View;I)V

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v2, p0, Lـ۰صںڱیؕ/إ;->ء:I

    sub-int/2addr v0, v2

    rsub-int/lit8 v0, v0, 0x0

    invoke-static {v1, v0}, Landroidx/core/view/ViewCompat;->offsetLeftAndRight(Landroid/view/View;I)V

    return-void
.end method
