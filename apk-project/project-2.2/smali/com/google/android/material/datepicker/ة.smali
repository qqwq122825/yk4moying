.class public final Lcom/google/android/material/datepicker/ة;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/datepicker/ض;

.field public final synthetic ؠ:Lcom/google/android/material/button/MaterialButton;

.field public final synthetic ء:Lcom/google/android/material/datepicker/ج;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/ج;Lcom/google/android/material/datepicker/ض;Lcom/google/android/material/button/MaterialButton;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/datepicker/ة;->ء:Lcom/google/android/material/datepicker/ج;

    iput-object p2, p0, Lcom/google/android/material/datepicker/ة;->؋:Lcom/google/android/material/datepicker/ض;

    iput-object p3, p0, Lcom/google/android/material/datepicker/ة;->ؠ:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/google/android/material/datepicker/ة;->ؠ:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public final onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 3

    iget-object p1, p0, Lcom/google/android/material/datepicker/ة;->ء:Lcom/google/android/material/datepicker/ج;

    if-gez p2, :cond_0

    iget-object p2, p1, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result p2

    goto :goto_0

    :cond_0
    iget-object p2, p1, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result p2

    :goto_0
    iget-object p3, p0, Lcom/google/android/material/datepicker/ة;->؋:Lcom/google/android/material/datepicker/ض;

    iget-object v0, p3, Lcom/google/android/material/datepicker/ض;->؋:Lcom/google/android/material/datepicker/ء;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ز;->آ:Ljava/util/Calendar;

    invoke-static {v0}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->add(II)V

    new-instance v2, Lcom/google/android/material/datepicker/ز;

    invoke-direct {v2, v0}, Lcom/google/android/material/datepicker/ز;-><init>(Ljava/util/Calendar;)V

    iput-object v2, p1, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object p1, p3, Lcom/google/android/material/datepicker/ض;->؋:Lcom/google/android/material/datepicker/ء;

    iget-object p1, p1, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object p1, p1, Lcom/google/android/material/datepicker/ز;->آ:Ljava/util/Calendar;

    invoke-static {p1}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1, v1, p2}, Ljava/util/Calendar;->add(II)V

    const/4 p2, 0x5

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->set(II)V

    invoke-static {p1}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    const/4 p3, 0x7

    invoke-virtual {p1, p3}, Ljava/util/Calendar;->getMaximum(I)I

    invoke-virtual {p1, p2}, Ljava/util/Calendar;->getActualMaximum(I)I

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    const-string v0, "yMMMM"

    invoke-static {v0, p3}, Lcom/google/android/material/datepicker/ػ;->؋(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p3

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p3, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/material/datepicker/ة;->ؠ:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
