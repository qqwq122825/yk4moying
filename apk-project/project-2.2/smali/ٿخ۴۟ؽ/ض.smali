.class public final Lٿخ۴۟ؽ/ض;
.super Lٿخ۴۟ؽ/د;
.source "SourceFile"


# instance fields
.field public final أ:I

.field public ؤ:Landroid/widget/EditText;

.field public final إ:Lcom/google/android/material/datepicker/ح;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/خ;I)V
    .locals 1

    invoke-direct {p0, p1}, Lٿخ۴۟ؽ/د;-><init>(Lٿخ۴۟ؽ/خ;)V

    const p1, 0x7f0700a5

    iput p1, p0, Lٿخ۴۟ؽ/ض;->أ:I

    new-instance p1, Lcom/google/android/material/datepicker/ح;

    const/4 v0, 0x3

    invoke-direct {p1, v0, p0}, Lcom/google/android/material/datepicker/ح;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lٿخ۴۟ؽ/ض;->إ:Lcom/google/android/material/datepicker/ح;

    if-eqz p2, :cond_0

    iput p2, p0, Lٿخ۴۟ؽ/ض;->أ:I

    :cond_0
    return-void
.end method


# virtual methods
.method public final ؠ()V
    .locals 0

    invoke-virtual {p0}, Lٿخ۴۟ؽ/د;->د()V

    return-void
.end method

.method public final ء()I
    .locals 1

    const v0, 0x7f1000be

    return v0
.end method

.method public final آ()I
    .locals 1

    iget v0, p0, Lٿخ۴۟ؽ/ض;->أ:I

    return v0
.end method

.method public final ؤ()Landroid/view/View$OnClickListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ض;->إ:Lcom/google/android/material/datepicker/ح;

    return-object v0
.end method

.method public final ة()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final ت()Z
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    instance-of v0, v0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, v1

    return v0
.end method

.method public final ث(Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    invoke-virtual {p0}, Lٿخ۴۟ؽ/د;->د()V

    return-void
.end method

.method public final ذ()V
    .locals 3

    iget-object v0, p0, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x10

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x90

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    const/16 v1, 0xe0

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    iget-object v0, p0, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_2
    return-void
.end method

.method public final ر()V
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_0
    return-void
.end method
