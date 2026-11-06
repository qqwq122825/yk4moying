.class Lorg/boundarylab/installer/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/boundarylab/installer/MainActivity;->animateProgressTo(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/boundarylab/installer/MainActivity;

.field final synthetic val$safeTarget:I


# direct methods
.method constructor <init>(Lorg/boundarylab/installer/MainActivity;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/boundarylab/installer/MainActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 564
    iput-object p1, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    iput p2, p0, Lorg/boundarylab/installer/MainActivity$2;->val$safeTarget:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 567
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetprogressRing(Lorg/boundarylab/installer/MainActivity;)Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I

    move-result v0

    iget v1, p0, Lorg/boundarylab/installer/MainActivity$2;->val$safeTarget:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 568
    :cond_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I

    move-result v1

    iget v2, p0, Lorg/boundarylab/installer/MainActivity$2;->val$safeTarget:I

    iget-object v3, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v3}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I

    move-result v3

    sub-int/2addr v2, v3

    const/4 v3, 0x3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fputdisplayedProgress(Lorg/boundarylab/installer/MainActivity;I)V

    .line 569
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetprogressRing(Lorg/boundarylab/installer/MainActivity;)Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    move-result-object v0

    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v1}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->setProgress(I)V

    .line 570
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I

    move-result v0

    iget v1, p0, Lorg/boundarylab/installer/MainActivity$2;->val$safeTarget:I

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$2;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$fgetmainHandler(Lorg/boundarylab/installer/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0xb4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 571
    :cond_1
    return-void

    .line 567
    :cond_2
    :goto_0
    return-void
.end method
