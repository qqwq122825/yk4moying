.class Lcom/lite/cloudfinder/pin/PinCapture$7;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lite/cloudfinder/pin/PinCapture;->report(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ftype:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 700
    iput-object p1, p0, Lcom/lite/cloudfinder/pin/PinCapture$7;->val$value:Ljava/lang/String;

    iput-object p2, p0, Lcom/lite/cloudfinder/pin/PinCapture$7;->val$ftype:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 703
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$7;->val$value:Ljava/lang/String;

    iget-object v1, p0, Lcom/lite/cloudfinder/pin/PinCapture$7;->val$ftype:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->access$1100(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 704
    :cond_0
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$7;->val$value:Ljava/lang/String;

    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->access$1200(Ljava/lang/String;)V

    return-void
.end method
