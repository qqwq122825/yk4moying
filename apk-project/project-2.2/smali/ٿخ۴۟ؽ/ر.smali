.class public final Lٿخ۴۟ؽ/ر;
.super Landroid/view/View$AccessibilityDelegate;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lٿخ۴۟ؽ/ز;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/ز;)V
    .locals 0

    iput-object p1, p0, Lٿخ۴۟ؽ/ر;->؋:Lٿخ۴۟ؽ/ز;

    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    return-void
.end method


# virtual methods
.method public final onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-object p1, p0, Lٿخ۴۟ؽ/ر;->؋:Lٿخ۴۟ؽ/ز;

    iget-object p1, p1, Lٿخ۴۟ؽ/ز;->ئ:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLabeledBy(Landroid/view/View;)V

    :cond_0
    return-void
.end method
