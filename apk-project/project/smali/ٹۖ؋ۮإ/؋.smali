.class public final Lٹۖ؋ۮإ/؋;
.super Landroidx/appcompat/widget/AppCompatRadioButton;
.source "SourceFile"


# static fields
.field public static final ء:[[I


# instance fields
.field public ؋:Landroid/content/res/ColorStateList;

.field public ؠ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    const v0, 0x101009e

    const v1, 0x10100a0

    filled-new-array {v0, v1}, [I

    move-result-object v2

    const v3, -0x10100a0

    filled-new-array {v0, v3}, [I

    move-result-object v0

    const v4, -0x101009e

    filled-new-array {v4, v1}, [I

    move-result-object v1

    filled-new-array {v4, v3}, [I

    move-result-object v3

    filled-new-array {v2, v0, v1, v3}, [[I

    move-result-object v0

    sput-object v0, Lٹۖ؋ۮإ/؋;->ء:[[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8

    const v0, 0x7f110412

    const v1, 0x7f030392

    invoke-static {p1, p2, v1, v0}, Lڗًقڔ/؋;->ڌ(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, v1}, Landroidx/appcompat/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v4, Lؾٿټڷ/؋;->ح:[I

    const v6, 0x7f110412

    const/4 v0, 0x0

    new-array v7, v0, [I

    const v5, 0x7f030392

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v2 .. v7}, Lٹ؅ڟ؀ە/ة;->آ(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1, p2, v0}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-static {p0, p1}, Landroidx/core/widget/CompoundButtonCompat;->setButtonTintList(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    :cond_0
    const/4 p1, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lٹۖ؋ۮإ/؋;->ؠ:Z

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private getMaterialThemeColorsTintList()Landroid/content/res/ColorStateList;
    .locals 6

    iget-object v0, p0, Lٹۖ؋ۮإ/؋;->؋:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_0

    const v0, 0x7f0300f9

    invoke-static {v0, p0}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v0

    const v1, 0x7f03010c

    invoke-static {v1, p0}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v1

    const v2, 0x7f030123

    invoke-static {v2, p0}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v0, v3}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v0

    const v3, 0x3f0a3d71    # 0.54f

    invoke-static {v2, v1, v3}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v3

    const v4, 0x3ec28f5c    # 0.38f

    invoke-static {v2, v1, v4}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v5

    invoke-static {v2, v1, v4}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v1

    filled-new-array {v0, v3, v5, v1}, [I

    move-result-object v0

    new-instance v1, Landroid/content/res/ColorStateList;

    sget-object v2, Lٹۖ؋ۮإ/؋;->ء:[[I

    invoke-direct {v1, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    iput-object v1, p0, Lٹۖ؋ۮإ/؋;->؋:Landroid/content/res/ColorStateList;

    :cond_0
    iget-object v0, p0, Lٹۖ؋ۮإ/؋;->؋:Landroid/content/res/ColorStateList;

    return-object v0
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-boolean v0, p0, Lٹۖ؋ۮإ/؋;->ؠ:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Landroidx/core/widget/CompoundButtonCompat;->getButtonTintList(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lٹۖ؋ۮإ/؋;->setUseMaterialThemeColors(Z)V

    :cond_0
    return-void
.end method

.method public setUseMaterialThemeColors(Z)V
    .locals 0

    iput-boolean p1, p0, Lٹۖ؋ۮإ/؋;->ؠ:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lٹۖ؋ۮإ/؋;->getMaterialThemeColorsTintList()Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p0, p1}, Landroidx/core/widget/CompoundButtonCompat;->setButtonTintList(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method
