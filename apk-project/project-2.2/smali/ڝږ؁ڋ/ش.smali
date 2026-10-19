.class public final Lڝږ؁ڋ/ش;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic ؋:[Z

.field public final synthetic ؠ:Landroid/widget/EditText;

.field public final synthetic ء:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>([ZLandroid/widget/EditText;Landroid/widget/ImageView;)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ش;->؋:[Z

    iput-object p2, p0, Lڝږ؁ڋ/ش;->ؠ:Landroid/widget/EditText;

    iput-object p3, p0, Lڝږ؁ڋ/ش;->ء:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lڝږ؁ڋ/ش;->؋:[Z

    const/4 v0, 0x0

    aget-boolean v1, p1, v0

    xor-int/lit8 v2, v1, 0x1

    aput-boolean v2, p1, v0

    iget-object p1, p0, Lڝږ؁ڋ/ش;->ء:Landroid/widget/ImageView;

    iget-object v2, p0, Lڝږ؁ڋ/ش;->ؠ:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    if-eqz v2, :cond_0

    const/16 v1, 0x81

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setInputType(I)V

    :cond_0
    const v1, 0x7f0700c5

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_2

    const/16 v1, 0x91

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setInputType(I)V

    :cond_2
    const v1, 0x7f0700c4

    :goto_0
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    :cond_3
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_4
    return-void
.end method
