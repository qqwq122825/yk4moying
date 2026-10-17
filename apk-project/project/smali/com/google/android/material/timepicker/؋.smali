.class public final Lcom/google/android/material/timepicker/؋;
.super Lٹ؅ڟ؀ە/ب;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/timepicker/ChipTextInputComboView;


# direct methods
.method public constructor <init>(Lcom/google/android/material/timepicker/ChipTextInputComboView;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/timepicker/؋;->؋:Lcom/google/android/material/timepicker/ChipTextInputComboView;

    invoke-direct {p0}, Lٹ؅ڟ؀ە/ب;-><init>()V

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "00"

    iget-object v2, p0, Lcom/google/android/material/timepicker/؋;->؋:Lcom/google/android/material/timepicker/ChipTextInputComboView;

    if-eqz v0, :cond_0

    iget-object p1, v2, Lcom/google/android/material/timepicker/ChipTextInputComboView;->؋:Lcom/google/android/material/chip/Chip;

    invoke-static {v2, v1}, Lcom/google/android/material/timepicker/ChipTextInputComboView;->؋(Lcom/google/android/material/timepicker/ChipTextInputComboView;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-static {v2, p1}, Lcom/google/android/material/timepicker/ChipTextInputComboView;->؋(Lcom/google/android/material/timepicker/ChipTextInputComboView;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, v2, Lcom/google/android/material/timepicker/ChipTextInputComboView;->؋:Lcom/google/android/material/chip/Chip;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {v2, v1}, Lcom/google/android/material/timepicker/ChipTextInputComboView;->؋(Lcom/google/android/material/timepicker/ChipTextInputComboView;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
