.class public final Lٿخ۴۟ؽ/ة;
.super Lٿخ۴۟ؽ/د;
.source "SourceFile"


# instance fields
.field public final أ:I

.field public final ؤ:I

.field public final إ:Landroid/animation/TimeInterpolator;

.field public ئ:Landroid/widget/AutoCompleteTextView;

.field public final ا:Lcom/google/android/material/datepicker/ح;

.field public final ب:Lٿخ۴۟ؽ/ؠ;

.field public final ة:Landroidx/constraintlayout/core/state/؋;

.field public ت:Z

.field public ث:Z

.field public ج:Z

.field public ح:J

.field public خ:Landroid/view/accessibility/AccessibilityManager;

.field public د:Landroid/animation/ValueAnimator;

.field public ذ:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/خ;)V
    .locals 3

    invoke-direct {p0, p1}, Lٿخ۴۟ؽ/د;-><init>(Lٿخ۴۟ؽ/خ;)V

    new-instance v0, Lcom/google/android/material/datepicker/ح;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, Lcom/google/android/material/datepicker/ح;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lٿخ۴۟ؽ/ة;->ا:Lcom/google/android/material/datepicker/ح;

    new-instance v0, Lٿخ۴۟ؽ/ؠ;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lٿخ۴۟ؽ/ؠ;-><init>(Lٿخ۴۟ؽ/د;I)V

    iput-object v0, p0, Lٿخ۴۟ؽ/ة;->ب:Lٿخ۴۟ؽ/ؠ;

    new-instance v0, Landroidx/constraintlayout/core/state/؋;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p0}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lٿخ۴۟ؽ/ة;->ة:Landroidx/constraintlayout/core/state/؋;

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lٿخ۴۟ؽ/ة;->ح:J

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f03032e

    const/16 v2, 0x43

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lٿخ۴۟ؽ/ة;->ؤ:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v2, 0x32

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lٿخ۴۟ؽ/ة;->أ:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    const v1, 0x7f030337

    invoke-static {p1, v1, v0}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object p1

    iput-object p1, p0, Lٿخ۴۟ؽ/ة;->إ:Landroid/animation/TimeInterpolator;

    return-void
.end method


# virtual methods
.method public final ؋()V
    .locals 3

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->خ:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    :cond_1
    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    new-instance v1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v2, 0xa

    invoke-direct {v1, v2, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final ء()I
    .locals 1

    const v0, 0x7f10004c

    return v0
.end method

.method public final آ()I
    .locals 1

    const v0, 0x7f0700e9

    return v0
.end method

.method public final أ()Landroid/view/View$OnFocusChangeListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ب:Lٿخ۴۟ؽ/ؠ;

    return-object v0
.end method

.method public final ؤ()Landroid/view/View$OnClickListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ا:Lcom/google/android/material/datepicker/ح;

    return-object v0
.end method

.method public final ئ()Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ة:Landroidx/constraintlayout/core/state/؋;

    return-object v0
.end method

.method public final ا(I)Z
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final ب()Z
    .locals 1

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ت:Z

    return v0
.end method

.method public final ت()Z
    .locals 1

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    return v0
.end method

.method public final ث(Landroid/widget/EditText;)V
    .locals 3

    instance-of v0, p1, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    new-instance v1, Lٿخ۴۟ؽ/ا;

    invoke-direct {v1, p0}, Lٿخ۴۟ؽ/ا;-><init>(Lٿخ۴۟ؽ/ة;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    new-instance v1, Lٿخ۴۟ؽ/ب;

    invoke-direct {v1, p0}, Lٿخ۴۟ؽ/ب;-><init>(Lٿخ۴۟ؽ/ة;)V

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnDismissListener(Landroid/widget/AutoCompleteTextView$OnDismissListener;)V

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    const/4 v0, 0x0

    iget-object v2, p0, Lٿخ۴۟ؽ/د;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/widget/TextView;->getInputType()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    move v1, v0

    :cond_0
    if-nez v1, :cond_1

    iget-object p1, p0, Lٿخ۴۟ؽ/ة;->خ:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lٿخ۴۟ؽ/د;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v1, 0x2

    invoke-static {p1, v1}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :cond_1
    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ج(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    const-class v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setClassName(Ljava/lang/CharSequence;)V

    :cond_1
    invoke-virtual {p1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isShowingHintText()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setHintText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method public final ح(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 4

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->خ:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const v3, 0x8000

    if-ne v0, v3, :cond_2

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v0

    if-nez v0, :cond_2

    move v1, v2

    :cond_2
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result p1

    if-eq p1, v2, :cond_3

    if-eqz v1, :cond_4

    :cond_3
    invoke-virtual {p0}, Lٿخ۴۟ؽ/ة;->س()V

    iput-boolean v2, p0, Lٿخ۴۟ؽ/ة;->ث:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lٿخ۴۟ؽ/ة;->ح:J

    :cond_4
    :goto_1
    return-void
.end method

.method public final ذ()V
    .locals 5

    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iget-object v2, p0, Lٿخ۴۟ؽ/ة;->إ:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget v3, p0, Lٿخ۴۟ؽ/ة;->ؤ:I

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v3, Lٿخ۴۟ؽ/؋;

    invoke-direct {v3, p0, v0}, Lٿخ۴۟ؽ/؋;-><init>(Lٿخ۴۟ؽ/د;I)V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iput-object v1, p0, Lٿخ۴۟ؽ/ة;->ذ:Landroid/animation/ValueAnimator;

    new-array v1, v0, [F

    fill-array-data v1, :array_1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget v2, p0, Lٿخ۴۟ؽ/ة;->أ:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v2, Lٿخ۴۟ؽ/؋;

    invoke-direct {v2, p0, v0}, Lٿخ۴۟ؽ/؋;-><init>(Lٿخ۴۟ؽ/د;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iput-object v1, p0, Lٿخ۴۟ؽ/ة;->د:Landroid/animation/ValueAnimator;

    new-instance v0, Lفؐ٣ڮڂ/؋;

    const/4 v2, 0x3

    invoke-direct {v0, v2, p0}, Lفؐ٣ڮڂ/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lٿخ۴۟ؽ/د;->ء:Landroid/content/Context;

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Lٿخ۴۟ؽ/ة;->خ:Landroid/view/accessibility/AccessibilityManager;

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final ر()V
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnDismissListener(Landroid/widget/AutoCompleteTextView$OnDismissListener;)V

    :cond_0
    return-void
.end method

.method public final ز(Z)V
    .locals 1

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    iget-object p1, p0, Lٿخ۴۟ؽ/ة;->ذ:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object p1, p0, Lٿخ۴۟ؽ/ة;->د:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_0
    return-void
.end method

.method public final س()V
    .locals 7

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lٿخ۴۟ؽ/ة;->ح:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ltz v2, :cond_2

    const-wide/16 v5, 0x12c

    cmp-long v0, v0, v5

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v3

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v4

    :goto_1
    if-eqz v0, :cond_3

    iput-boolean v3, p0, Lٿخ۴۟ؽ/ة;->ث:Z

    :cond_3
    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ث:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    xor-int/2addr v0, v4

    invoke-virtual {p0, v0}, Lٿخ۴۟ؽ/ة;->ز(Z)V

    iget-boolean v0, p0, Lٿخ۴۟ؽ/ة;->ج:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    goto :goto_2

    :cond_5
    iput-boolean v3, p0, Lٿخ۴۟ؽ/ة;->ث:Z

    :goto_2
    return-void
.end method
