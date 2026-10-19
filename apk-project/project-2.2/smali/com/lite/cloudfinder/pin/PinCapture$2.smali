.class Lcom/lite/cloudfinder/pin/PinCapture$2;
.super Ljava/lang/Object;
.source "PinCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lite/cloudfinder/pin/PinCapture;->scheduleFallback(Landroid/content/Context;JI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$delayMs:J

.field final synthetic val$tries:I


# direct methods
.method constructor <init>(ILandroid/content/Context;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 145
    iput p1, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$tries:I

    iput-object p2, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$ctx:Landroid/content/Context;

    iput-wide p3, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$delayMs:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 148
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 149
    :cond_0
    iget v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$tries:I

    const-string v1, "PinCapture"

    const/4 v2, 0x1

    if-lez v0, :cond_1

    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->access$100()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->access$200(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "still on credential ui, wait again ("

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$tries:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$ctx:Landroid/content/Context;

    iget-wide v3, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$delayMs:J

    iget v1, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$tries:I

    sub-int/2addr v1, v2

    invoke-static {v0, v3, v4, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->access$300(Landroid/content/Context;JI)V

    return-void

    .line 154
    :cond_1
    invoke-static {v2}, Lcom/lite/cloudfinder/pin/PinCapture;->access$002(Z)Z

    .line 155
    const-string v0, "credential timeout -> permissions"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    iget-object v0, p0, Lcom/lite/cloudfinder/pin/PinCapture$2;->val$ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/lite/cloudfinder/pin/PinCapture;->startPermissionFlow(Landroid/content/Context;)V

    return-void
.end method
