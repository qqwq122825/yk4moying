.class Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;


# direct methods
.method constructor <init>(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)V
    .locals 0
    .param p1, "this$0"    # Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    .line 389
    iput-object p1, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 392
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fgetprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)F

    move-result v1

    iget-object v2, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v2}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fgetforward(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x3e3851ec    # 0.18f

    goto :goto_0

    :cond_0
    const v2, -0x421eb852    # -0.11f

    :goto_0
    add-float/2addr v1, v2

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fputprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;F)V

    .line 393
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fgetprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_1

    .line 394
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fputprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;F)V

    .line 395
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fputforward(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;Z)V

    .line 396
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 397
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-virtual {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->invalidate()V

    .line 398
    return-void

    .line 400
    :cond_1
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fgetprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;)F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2

    .line 401
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fputprogress(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;F)V

    .line 402
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->-$$Nest$fputforward(Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;Z)V

    .line 403
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    const-wide/16 v1, 0xb4

    invoke-virtual {v0, p0, v1, v2}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 404
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-virtual {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->invalidate()V

    .line 405
    return-void

    .line 407
    :cond_2
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-virtual {v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->invalidate()V

    .line 408
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView$1;->this$0:Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    const-wide/16 v1, 0xe

    invoke-virtual {v0, p0, v1, v2}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 409
    return-void
.end method
