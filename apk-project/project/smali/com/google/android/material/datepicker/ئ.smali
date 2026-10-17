.class public final Lcom/google/android/material/datepicker/ئ;
.super Lcom/google/android/material/datepicker/ع;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Lcom/google/android/material/datepicker/ج;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/ج;Landroid/content/Context;II)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/datepicker/ئ;->ؠ:Lcom/google/android/material/datepicker/ج;

    iput p4, p0, Lcom/google/android/material/datepicker/ئ;->؋:I

    invoke-direct {p0, p2, p3}, Lcom/google/android/material/datepicker/ع;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final calculateExtraLayoutSpace(Landroidx/recyclerview/widget/RecyclerView$State;[I)V
    .locals 3

    iget p1, p0, Lcom/google/android/material/datepicker/ئ;->؋:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/material/datepicker/ئ;->ؠ:Lcom/google/android/material/datepicker/ج;

    if-nez p1, :cond_0

    iget-object p1, v2, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    aput p1, p2, v1

    iget-object p1, v2, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    aput p1, p2, v0

    goto :goto_0

    :cond_0
    iget-object p1, v2, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    aput p1, p2, v1

    iget-object p1, v2, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    aput p1, p2, v0

    :goto_0
    return-void
.end method
