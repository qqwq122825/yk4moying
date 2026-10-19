.class public final Lٿخ۴۟ؽ/ش;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# instance fields
.field public ؋:Landroid/content/res/ColorStateList;

.field public ؠ:Landroid/content/res/ColorStateList;

.field public final synthetic ء:Lٿخ۴۟ؽ/ص;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/ص;Landroid/content/Context;I[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lٿخ۴۟ؽ/ش;->ء:Lٿخ۴۟ؽ/ص;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/ش;->؋()V

    return-void
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_3

    move-object p2, p1

    check-cast p2, Landroid/widget/TextView;

    iget-object p3, p0, Lٿخ۴۟ؽ/ش;->ء:Lٿخ۴۟ؽ/ص;

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget v0, p3, Lٿخ۴۟ؽ/ص;->إ:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    iget p3, p3, Lٿخ۴۟ؽ/ص;->إ:I

    invoke-direct {v0, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iget-object p3, p0, Lٿخ۴۟ؽ/ش;->ؠ:Landroid/content/res/ColorStateList;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lٿخ۴۟ؽ/ش;->؋:Landroid/content/res/ColorStateList;

    invoke-static {v0, p3}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    iget-object v2, p0, Lٿخ۴۟ؽ/ش;->ؠ:Landroid/content/res/ColorStateList;

    invoke-direct {p3, v2, v0, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    move-object v1, p3

    goto :goto_1

    :cond_1
    move-object v1, v0

    :cond_2
    :goto_1
    invoke-static {p2, v1}, Landroidx/core/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_3
    return-object p1
.end method

.method public final ؋()V
    .locals 7

    iget-object v0, p0, Lٿخ۴۟ؽ/ش;->ء:Lٿخ۴۟ؽ/ص;

    iget-object v1, v0, Lٿخ۴۟ؽ/ص;->ئ:Landroid/content/res/ColorStateList;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    const/4 v5, 0x0

    if-nez v4, :cond_1

    move-object v6, v5

    goto :goto_1

    :cond_1
    const v4, 0x10100a7

    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    filled-new-array {v1, v3}, [I

    move-result-object v1

    new-array v6, v3, [I

    filled-new-array {v4, v6}, [[I

    move-result-object v4

    new-instance v6, Landroid/content/res/ColorStateList;

    invoke-direct {v6, v4, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    :goto_1
    iput-object v6, p0, Lٿخ۴۟ؽ/ش;->ؠ:Landroid/content/res/ColorStateList;

    iget v1, v0, Lٿخ۴۟ؽ/ص;->إ:I

    if-eqz v1, :cond_2

    move v1, v2

    goto :goto_2

    :cond_2
    move v1, v3

    :goto_2
    if-eqz v1, :cond_4

    iget-object v1, v0, Lٿخ۴۟ؽ/ص;->ئ:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    move v2, v3

    :goto_3
    if-eqz v2, :cond_4

    const v1, 0x1010367

    const v2, -0x10100a7

    filled-new-array {v1, v2}, [I

    move-result-object v1

    const v4, 0x10100a1

    filled-new-array {v4, v2}, [I

    move-result-object v2

    iget-object v4, v0, Lٿخ۴۟ؽ/ص;->ئ:Landroid/content/res/ColorStateList;

    invoke-virtual {v4, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    iget-object v5, v0, Lٿخ۴۟ؽ/ص;->ئ:Landroid/content/res/ColorStateList;

    invoke-virtual {v5, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v5

    iget v6, v0, Lٿخ۴۟ؽ/ص;->إ:I

    invoke-static {v4, v6}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result v4

    iget v6, v0, Lٿخ۴۟ؽ/ص;->إ:I

    invoke-static {v5, v6}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result v5

    iget v0, v0, Lٿخ۴۟ؽ/ص;->إ:I

    filled-new-array {v4, v5, v0}, [I

    move-result-object v0

    new-array v3, v3, [I

    filled-new-array {v2, v1, v3}, [[I

    move-result-object v1

    new-instance v5, Landroid/content/res/ColorStateList;

    invoke-direct {v5, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    :cond_4
    iput-object v5, p0, Lٿخ۴۟ؽ/ش;->؋:Landroid/content/res/ColorStateList;

    return-void
.end method
