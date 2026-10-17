.class public final Lcom/google/android/material/datepicker/ج;
.super Lcom/google/android/material/datepicker/ط;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/material/datepicker/\u0637;"
    }
.end annotation


# static fields
.field public static final synthetic ث:I


# instance fields
.field public ؠ:I

.field public ء:Lcom/google/android/material/datepicker/ء;

.field public آ:Lcom/google/android/material/datepicker/ز;

.field public أ:I

.field public ؤ:Lڜٟٱڀ/ز;

.field public إ:Landroidx/recyclerview/widget/RecyclerView;

.field public ئ:Landroidx/recyclerview/widget/RecyclerView;

.field public ا:Landroid/view/View;

.field public ب:Landroid/view/View;

.field public ة:Landroid/view/View;

.field public ت:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/material/datepicker/ط;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    :cond_0
    const-string v0, "THEME_RES_ID_KEY"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/datepicker/ج;->ؠ:I

    const-string v0, "GRID_SELECTOR_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->خ(Landroid/os/Parcelable;)V

    const-string v0, "CALENDAR_CONSTRAINTS_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/ء;

    iput-object v0, p0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    const-string v0, "DAY_VIEW_DECORATOR_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->خ(Landroid/os/Parcelable;)V

    const-string v0, "CURRENT_MONTH_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/datepicker/ز;

    iput-object p1, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9

    new-instance p3, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/datepicker/ج;->ؠ:I

    invoke-direct {p3, v0, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lڜٟٱڀ/ز;

    invoke-direct {v0, p3}, Lڜٟٱڀ/ز;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/datepicker/ج;->ؤ:Lڜٟٱڀ/ز;

    invoke-virtual {p1, p3}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    invoke-static {p3}, Lcom/google/android/material/datepicker/ذ;->آ(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const v1, 0x7f0b005f

    move v4, v2

    goto :goto_0

    :cond_0
    const v1, 0x7f0b005a

    move v4, v3

    :goto_0
    invoke-virtual {p1, v1, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v1, 0x7f060286

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v5, 0x7f060287

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    add-int/2addr v5, v1

    const v1, 0x7f060285

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    add-int/2addr v1, v5

    const v5, 0x7f060276

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    sget v6, Lcom/google/android/material/datepicker/س;->آ:I

    const v7, 0x7f060271

    invoke-virtual {p2, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    mul-int/2addr v7, v6

    add-int/lit8 v6, v6, -0x1

    const v8, 0x7f060284

    invoke-virtual {p2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    mul-int/2addr v8, v6

    add-int/2addr v8, v7

    const v6, 0x7f06026e

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p2

    add-int/2addr v1, v5

    add-int/2addr v1, v8

    add-int/2addr v1, p2

    invoke-virtual {p1, v1}, Landroid/view/View;->setMinimumHeight(I)V

    const p2, 0x7f080148

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/GridView;

    new-instance v1, Lcom/google/android/material/datepicker/إ;

    invoke-direct {v1, v3, p0}, Lcom/google/android/material/datepicker/إ;-><init>(ILjava/lang/Object;)V

    invoke-static {p2, v1}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    iget-object v1, p0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    iget v1, v1, Lcom/google/android/material/datepicker/ء;->ئ:I

    new-instance v5, Lcom/google/android/material/datepicker/أ;

    if-lez v1, :cond_1

    invoke-direct {v5, v1}, Lcom/google/android/material/datepicker/أ;-><init>(I)V

    goto :goto_1

    :cond_1
    invoke-direct {v5}, Lcom/google/android/material/datepicker/أ;-><init>()V

    :goto_1
    invoke-virtual {p2, v5}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget v0, v0, Lcom/google/android/material/datepicker/ز;->إ:I

    invoke-virtual {p2, v0}, Landroid/widget/GridView;->setNumColumns(I)V

    invoke-virtual {p2, v3}, Landroid/view/View;->setEnabled(Z)V

    const p2, 0x7f08014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lcom/google/android/material/datepicker/ئ;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0, v4, v4}, Lcom/google/android/material/datepicker/ئ;-><init>(Lcom/google/android/material/datepicker/ج;Landroid/content/Context;II)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    iget-object p2, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    const-string v0, "MONTHS_VIEW_GROUP_TAG"

    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance p2, Lcom/google/android/material/datepicker/ض;

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    new-instance v1, Lcom/google/android/material/datepicker/ا;

    invoke-direct {v1, p0}, Lcom/google/android/material/datepicker/ا;-><init>(Lcom/google/android/material/datepicker/ج;)V

    invoke-direct {p2, p3, v0, v1}, Lcom/google/android/material/datepicker/ض;-><init>(Landroid/view/ContextThemeWrapper;Lcom/google/android/material/datepicker/ء;Lcom/google/android/material/datepicker/ا;)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    invoke-virtual {p3}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    const v1, 0x7f08014e

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v4, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v4, :cond_2

    invoke-virtual {v4, v2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    iget-object v4, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {v5, p3, v0, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lcom/google/android/material/datepicker/ؽ;

    invoke-direct {v3, p0}, Lcom/google/android/material/datepicker/ؽ;-><init>(Lcom/google/android/material/datepicker/ج;)V

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lcom/google/android/material/datepicker/ب;

    invoke-direct {v3, p0}, Lcom/google/android/material/datepicker/ب;-><init>(Lcom/google/android/material/datepicker/ج;)V

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    :cond_2
    const v0, 0x7f080141

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    const-string v3, "SELECTOR_TOGGLE_TAG"

    invoke-virtual {v0, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v3, Lcom/google/android/material/datepicker/إ;

    const/4 v4, 0x2

    invoke-direct {v3, v4, p0}, Lcom/google/android/material/datepicker/إ;-><init>(ILjava/lang/Object;)V

    invoke-static {v0, v3}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    const v3, 0x7f080143

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/datepicker/ج;->ا:Landroid/view/View;

    const-string v4, "NAVIGATION_PREV_TAG"

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const v3, 0x7f080142

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/datepicker/ج;->ب:Landroid/view/View;

    const-string v4, "NAVIGATION_NEXT_TAG"

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/datepicker/ج;->ة:Landroid/view/View;

    const v1, 0x7f080147

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/datepicker/ج;->ت:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/google/android/material/datepicker/ج;->آ(I)V

    iget-object v1, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    invoke-virtual {v1}, Lcom/google/android/material/datepicker/ز;->ء()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lcom/google/android/material/datepicker/ة;

    invoke-direct {v3, p0, p2, v0}, Lcom/google/android/material/datepicker/ة;-><init>(Lcom/google/android/material/datepicker/ج;Lcom/google/android/material/datepicker/ض;Lcom/google/android/material/button/MaterialButton;)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    new-instance v1, Lcom/google/android/material/datepicker/خ;

    invoke-direct {v1, p0}, Lcom/google/android/material/datepicker/خ;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ب:Landroid/view/View;

    new-instance v1, Lcom/google/android/material/datepicker/ت;

    invoke-direct {v1, p0, p2}, Lcom/google/android/material/datepicker/ت;-><init>(Lcom/google/android/material/datepicker/ج;Lcom/google/android/material/datepicker/ض;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ا:Landroid/view/View;

    new-instance v1, Lcom/google/android/material/datepicker/ؤ;

    invoke-direct {v1, p0, p2}, Lcom/google/android/material/datepicker/ؤ;-><init>(Lcom/google/android/material/datepicker/ج;Lcom/google/android/material/datepicker/ض;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3
    invoke-static {p3}, Lcom/google/android/material/datepicker/ذ;->آ(Landroid/content/Context;)Z

    move-result p3

    if-nez p3, :cond_4

    new-instance p3, Landroidx/recyclerview/widget/PagerSnapHelper;

    invoke-direct {p3}, Landroidx/recyclerview/widget/PagerSnapHelper;-><init>()V

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3, v0}, Landroidx/recyclerview/widget/SnapHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_4
    iget-object p3, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object p2, p2, Lcom/google/android/material/datepicker/ض;->؋:Lcom/google/android/material/datepicker/ء;

    iget-object p2, p2, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object v1, p2, Lcom/google/android/material/datepicker/ز;->آ:Ljava/util/Calendar;

    instance-of v1, v1, Ljava/util/GregorianCalendar;

    if-eqz v1, :cond_5

    iget v1, v0, Lcom/google/android/material/datepicker/ز;->ؤ:I

    iget v3, p2, Lcom/google/android/material/datepicker/ز;->ؤ:I

    sub-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0xc

    iget v0, v0, Lcom/google/android/material/datepicker/ز;->أ:I

    iget p2, p2, Lcom/google/android/material/datepicker/ز;->أ:I

    sub-int/2addr v0, p2

    add-int/2addr v0, v1

    invoke-virtual {p3, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    iget-object p2, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p3, Lcom/google/android/material/datepicker/إ;

    invoke-direct {p3, v2, p0}, Lcom/google/android/material/datepicker/إ;-><init>(ILjava/lang/Object;)V

    invoke-static {p2, p3}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    return-object p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Only Gregorian calendars are supported."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "THEME_RES_ID_KEY"

    iget v1, p0, Lcom/google/android/material/datepicker/ج;->ؠ:I

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "GRID_SELECTOR_KEY"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "CALENDAR_CONSTRAINTS_KEY"

    iget-object v2, p0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "DAY_VIEW_DECORATOR_KEY"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "CURRENT_MONTH_KEY"

    iget-object v1, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-void
.end method

.method public final ؠ(I)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lذ٨ۍ/ح;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lذ٨ۍ/ح;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final ء(Lcom/google/android/material/datepicker/ز;)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/ض;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ض;->؋:Lcom/google/android/material/datepicker/ء;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-object v1, v0, Lcom/google/android/material/datepicker/ز;->آ:Ljava/util/Calendar;

    instance-of v2, v1, Ljava/util/GregorianCalendar;

    const-string v3, "Only Gregorian calendars are supported."

    if-eqz v2, :cond_5

    iget v2, p1, Lcom/google/android/material/datepicker/ز;->ؤ:I

    iget v4, v0, Lcom/google/android/material/datepicker/ز;->ؤ:I

    sub-int/2addr v2, v4

    mul-int/lit8 v2, v2, 0xc

    iget v5, p1, Lcom/google/android/material/datepicker/ز;->أ:I

    iget v0, v0, Lcom/google/android/material/datepicker/ز;->أ:I

    sub-int/2addr v5, v0

    add-int/2addr v5, v2

    iget-object v2, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    instance-of v1, v1, Ljava/util/GregorianCalendar;

    if-eqz v1, :cond_4

    iget v1, v2, Lcom/google/android/material/datepicker/ز;->ؤ:I

    sub-int/2addr v1, v4

    mul-int/lit8 v1, v1, 0xc

    iget v2, v2, Lcom/google/android/material/datepicker/ز;->أ:I

    sub-int/2addr v2, v0

    add-int/2addr v2, v1

    sub-int v0, v5, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-le v1, v2, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    iput-object p1, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    if-eqz v1, :cond_2

    if-eqz v3, :cond_2

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    add-int/lit8 v0, v5, -0x3

    goto :goto_2

    :cond_2
    if-eqz v1, :cond_3

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ئ:Landroidx/recyclerview/widget/RecyclerView;

    add-int/lit8 v0, v5, 0x3

    :goto_2
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    :cond_3
    invoke-virtual {p0, v5}, Lcom/google/android/material/datepicker/ج;->ؠ(I)V

    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final آ(I)V
    .locals 4

    iput p1, p0, Lcom/google/android/material/datepicker/ج;->أ:I

    const/4 v0, 0x2

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/material/datepicker/ج;->إ:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/ؽ;

    iget-object v3, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    iget v3, v3, Lcom/google/android/material/datepicker/ز;->ؤ:I

    iget-object v0, v0, Lcom/google/android/material/datepicker/ؽ;->؋:Lcom/google/android/material/datepicker/ج;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ج;->ء:Lcom/google/android/material/datepicker/ء;

    iget-object v0, v0, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget v0, v0, Lcom/google/android/material/datepicker/ز;->ؤ:I

    sub-int/2addr v3, v0

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ة:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ت:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ا:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ب:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ة:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ت:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ا:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->ب:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/datepicker/ج;->آ:Lcom/google/android/material/datepicker/ز;

    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/ج;->ء(Lcom/google/android/material/datepicker/ز;)V

    :cond_1
    :goto_0
    return-void
.end method
