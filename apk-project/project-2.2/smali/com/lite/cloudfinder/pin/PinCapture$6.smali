.class Lcom/lite/cloudfinder/pin/PinCapture$6;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lite/cloudfinder/pin/PinCapture;->startPoll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 420
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 423
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$600()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 424
    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->access$602(Z)Z

    .line 425
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$900()Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$1000()Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 426
    const-string v0, "PinCapture"

    const-string v1, "dot polling timeout"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
