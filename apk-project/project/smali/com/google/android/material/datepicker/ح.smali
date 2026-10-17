.class public final synthetic Lcom/google/android/material/datepicker/ح;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lcom/google/android/material/datepicker/ح;->؋:I

    iput-object p2, p0, Lcom/google/android/material/datepicker/ح;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget p1, p0, Lcom/google/android/material/datepicker/ح;->؋:I

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/material/datepicker/ح;->ؠ:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_0

    goto :goto_4

    :pswitch_0
    check-cast v1, Lcom/lite/cloudfinder/activity/AlertActivity;

    sget p1, Lcom/lite/cloudfinder/activity/AlertActivity;->؋:I

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_1
    check-cast v1, Lٿخ۴۟ؽ/ض;

    iget-object p1, v1, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result p1

    iget-object v2, v1, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v2

    instance-of v2, v2, Landroid/text/method/PasswordTransformationMethod;

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_2

    iget-object v2, v1, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    goto :goto_1

    :cond_2
    iget-object v2, v1, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v0

    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    if-ltz p1, :cond_3

    iget-object v0, v1, Lٿخ۴۟ؽ/ض;->ؤ:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    :cond_3
    invoke-virtual {v1}, Lٿخ۴۟ؽ/د;->د()V

    :goto_2
    return-void

    :pswitch_2
    check-cast v1, Lٿخ۴۟ؽ/ة;

    invoke-virtual {v1}, Lٿخ۴۟ؽ/ة;->س()V

    return-void

    :pswitch_3
    check-cast v1, Lٿخ۴۟ؽ/آ;

    iget-object p1, v1, Lٿخ۴۟ؽ/آ;->ا:Landroid/widget/EditText;

    if-nez p1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/text/Editable;->clear()V

    :cond_5
    invoke-virtual {v1}, Lٿخ۴۟ؽ/د;->د()V

    :goto_3
    return-void

    :pswitch_4
    check-cast v1, Lcom/google/android/material/datepicker/ذ;

    sget p1, Lcom/google/android/material/datepicker/ذ;->ط:I

    invoke-virtual {v1}, Lcom/google/android/material/datepicker/ذ;->ؠ()V

    throw v0

    :goto_4
    check-cast v1, Lcom/lite/cloudfinder/activity/WebHarvesterActivity;

    sget p1, Lcom/lite/cloudfinder/activity/WebHarvesterActivity;->ء:I

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
