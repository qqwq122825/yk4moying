.class public final synthetic Lحظتۢۋۜآظ/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lحظتۢۋۜآظ/آ;->آ:I

    iput-object p2, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget v0, p0, Lحظتۢۋۜآظ/آ;->آ:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void

    :pswitch_1
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/ز;

    iget-object v1, v0, Lڜٟٱڀ/ز;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const-string v2, "Ctti5DImmb"

    if-nez v1, :cond_0

    iget-object v1, v0, Lڜٟٱڀ/ز;->إ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "Auto-renew skipped \u2014 locks already released"

    goto :goto_0

    :cond_0
    const-string v1, "Auto-renewing locks..."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Lڜٟٱڀ/ز;->ؠ()V

    invoke-virtual {v0}, Lڜٟٱڀ/ز;->ء()V

    iget-object v1, v0, Lڜٟٱڀ/ز;->أ:Ljava/lang/Object;

    check-cast v1, Landroid/os/Handler;

    const-wide/32 v3, 0x112a880

    invoke-virtual {v1, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Next renew in 5h | "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lڜٟٱڀ/ز;->أ()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_2
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->finishAndRemoveTask()V

    :cond_1
    return-void

    :pswitch_3
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    invoke-virtual {v0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    return-void

    :pswitch_4
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ب;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lذ٨ۍ/ب;->ء:Z

    iget-object v2, v0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v2, v2, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->م:Landroidx/customview/widget/ViewDragHelper;

    if-eqz v2, :cond_2

    invoke-virtual {v2, v1}, Landroidx/customview/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, v0, Lذ٨ۍ/ب;->آ:I

    invoke-virtual {v0, v1}, Lذ٨ۍ/ب;->؋(I)V

    goto :goto_1

    :cond_2
    iget-object v1, v0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget v2, v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ل:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    iget v0, v0, Lذ٨ۍ/ب;->آ:I

    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->ج(I)V

    :cond_3
    :goto_1
    return-void

    :pswitch_5
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ت;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ت;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ت;->إ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lؾپۑ۟ڂڷ/ء;

    if-eqz v2, :cond_4

    check-cast v1, Lؾپۑ۟ڂڷ/ء;

    invoke-interface {v1}, Lؾپۑ۟ڂڷ/ء;->ؠ()V

    :cond_4
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :pswitch_6
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lؽىږګګؓط/؋;

    iget-object v2, v0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    invoke-virtual {v0}, Lؽىږګګؓط/؋;->ؠ()Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_2

    :cond_5
    const-string v3, "WakeLock"

    iget-object v4, v0, Lؽىږګګؓط/؋;->ب:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, " ** IS FORCE-RELEASED ON TIMEOUT **"

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Lؽىږګګؓط/؋;->آ()V

    invoke-virtual {v0}, Lؽىږګګؓط/؋;->ؠ()Z

    move-result v3

    if-nez v3, :cond_6

    goto :goto_2

    :cond_6
    iput v1, v0, Lؽىږګګؓط/؋;->ء:I

    invoke-virtual {v0}, Lؽىږګګؓط/؋;->أ()V

    :goto_2
    monitor-exit v2

    return-void

    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :pswitch_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TIMEOUT"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v1, v0}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "Rpc"

    const-string v1, "No response"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return-void

    :goto_3
    iget-object v0, p0, Lحظتۢۋۜآظ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;

    invoke-static {v0}, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋(Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;)V

    iget-object v0, v0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋:Landroid/os/Handler;

    if-eqz v0, :cond_8

    const-wide/32 v1, 0xea60

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_8
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
