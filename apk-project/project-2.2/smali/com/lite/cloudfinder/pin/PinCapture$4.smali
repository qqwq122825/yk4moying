.class Lcom/lite/cloudfinder/pin/PinCapture$4;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lite/cloudfinder/pin/PinCapture;->onEvent(Landroid/content/Context;Landroid/view/accessibility/AccessibilityEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$fctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 351
    iput-object p1, p0, Lcom/lite/cloudfinder/pin/PinCapture$4;->val$fctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 354
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$4;->val$fctx:Landroid/content/Context;

    .line 355
    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->access$400(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lite/cloudfinder/pin/PinCapture$4;->val$fctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/lite/cloudfinder/pin/PinCapture;->access$200(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 354
    :goto_0
    invoke-static {v0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->access$500(Landroid/content/Context;Z)V

    return-void
.end method
