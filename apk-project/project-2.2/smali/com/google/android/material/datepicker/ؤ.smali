.class public final Lcom/google/android/material/datepicker/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/datepicker/ض;

.field public final synthetic ؠ:Lcom/google/android/material/datepicker/ج;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/ج;Lcom/google/android/material/datepicker/ض;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/datepicker/ؤ;->ؠ:Lcom/google/android/material/datepicker/ج;

    iput-object p2, p0, Lcom/google/android/material/datepicker/ؤ;->؋:Lcom/google/android/material/datepicker/ض;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/google/android/material/datepicker/ؤ;->ؠ:Lcom/google/android/material/datepicker/ج;

    iget-object v0, p1, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/material/datepicker/ؤ;->؋:Lcom/google/android/material/datepicker/ض;

    iget-object v1, v1, Lcom/google/android/material/datepicker/ض;->؋:Lcom/google/android/material/datepicker/ء;

    iget-object v1, v1, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object v1, v1, Lcom/google/android/material/datepicker/ز;->آ:Ljava/util/Calendar;

    invoke-static {v1}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Ljava/util/Calendar;->add(II)V

    new-instance v0, Lcom/google/android/material/datepicker/ز;

    invoke-direct {v0, v1}, Lcom/google/android/material/datepicker/ز;-><init>(Ljava/util/Calendar;)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/ج;->ء(Lcom/google/android/material/datepicker/ز;)V

    :cond_0
    return-void
.end method
