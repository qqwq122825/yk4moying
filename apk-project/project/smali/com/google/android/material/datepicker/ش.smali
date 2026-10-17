.class public final Lcom/google/android/material/datepicker/ش;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic ؋:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

.field public final synthetic ؠ:Lcom/google/android/material/datepicker/ض;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/ض;Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/datepicker/ش;->ؠ:Lcom/google/android/material/datepicker/ض;

    iput-object p2, p0, Lcom/google/android/material/datepicker/ش;->؋:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1

    iget-object p1, p0, Lcom/google/android/material/datepicker/ش;->؋:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->؋()Lcom/google/android/material/datepicker/س;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/material/datepicker/س;->؋()I

    move-result p4

    const/4 p5, 0x1

    const/4 v0, 0x0

    if-lt p3, p4, :cond_0

    invoke-virtual {p2}, Lcom/google/android/material/datepicker/س;->؋()I

    move-result p4

    iget-object p2, p2, Lcom/google/android/material/datepicker/س;->؋:Lcom/google/android/material/datepicker/ز;

    iget p2, p2, Lcom/google/android/material/datepicker/ز;->ئ:I

    add-int/2addr p4, p2

    add-int/lit8 p4, p4, -0x1

    if-gt p3, p4, :cond_0

    move p2, p5

    goto :goto_0

    :cond_0
    move p2, v0

    :goto_0
    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/google/android/material/datepicker/ش;->ؠ:Lcom/google/android/material/datepicker/ض;

    iget-object p2, p2, Lcom/google/android/material/datepicker/ض;->ؠ:Lcom/google/android/material/datepicker/ث;

    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->؋()Lcom/google/android/material/datepicker/س;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/google/android/material/datepicker/س;->ؠ(I)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p3

    check-cast p2, Lcom/google/android/material/datepicker/ا;

    iget-object p1, p2, Lcom/google/android/material/datepicker/ا;->؋:Lcom/google/android/material/datepicker/ج;

    iget-object p1, p1, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    iget-object p1, p1, Lcom/google/android/material/datepicker/ء;->ؤ:Lcom/google/android/material/datepicker/ؠ;

    check-cast p1, Lcom/google/android/material/datepicker/آ;

    iget-wide p1, p1, Lcom/google/android/material/datepicker/آ;->آ:J

    cmp-long p1, p3, p1

    if-ltz p1, :cond_1

    goto :goto_1

    :cond_1
    move p5, v0

    :goto_1
    if-nez p5, :cond_2

    goto :goto_2

    :cond_2
    const/4 p1, 0x0

    throw p1

    :cond_3
    :goto_2
    return-void
.end method
