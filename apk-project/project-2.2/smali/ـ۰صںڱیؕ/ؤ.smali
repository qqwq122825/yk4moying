.class public abstract Lـ۰صںڱیؕ/ؤ;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
.source "SourceFile"


# instance fields
.field public ؋:Lـ۰صںڱیؕ/إ;

.field public ؠ:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lـ۰صںڱیؕ/ؤ;->ؠ:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput p1, p0, Lـ۰صںڱیؕ/ؤ;->ؠ:I

    return-void
.end method


# virtual methods
.method public onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lـ۰صںڱیؕ/ؤ;->؋(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V

    iget-object p1, p0, Lـ۰صںڱیؕ/ؤ;->؋:Lـ۰صںڱیؕ/إ;

    if-nez p1, :cond_0

    new-instance p1, Lـ۰صںڱیؕ/إ;

    invoke-direct {p1, p2}, Lـ۰صںڱیؕ/إ;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lـ۰صںڱیؕ/ؤ;->؋:Lـ۰صںڱیؕ/إ;

    :cond_0
    iget-object p1, p0, Lـ۰صںڱیؕ/ؤ;->؋:Lـ۰صںڱیؕ/إ;

    iget-object p2, p1, Lـ۰صںڱیؕ/إ;->؋:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    iput p3, p1, Lـ۰صںڱیؕ/إ;->ؠ:I

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    iput p2, p1, Lـ۰صںڱیؕ/إ;->ء:I

    iget-object p1, p0, Lـ۰صںڱیؕ/ؤ;->؋:Lـ۰صںڱیؕ/إ;

    invoke-virtual {p1}, Lـ۰صںڱیؕ/إ;->؋()V

    iget p1, p0, Lـ۰صںڱیؕ/ؤ;->ؠ:I

    if-eqz p1, :cond_2

    iget-object p2, p0, Lـ۰صںڱیؕ/ؤ;->؋:Lـ۰صںڱیؕ/إ;

    iget p3, p2, Lـ۰صںڱیؕ/إ;->آ:I

    if-eq p3, p1, :cond_1

    iput p1, p2, Lـ۰صںڱیؕ/إ;->آ:I

    invoke-virtual {p2}, Lـ۰صںڱیؕ/إ;->؋()V

    :cond_1
    const/4 p1, 0x0

    iput p1, p0, Lـ۰صںڱیؕ/ؤ;->ؠ:I

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public ؋(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V
    .locals 0

    invoke-virtual {p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->onLayoutChild(Landroid/view/View;I)V

    return-void
.end method
