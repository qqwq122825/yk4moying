.class public final Lڛەٟہ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:[I

.field public final synthetic أ:Landroid/widget/ProgressBar;

.field public final synthetic ؤ:Landroid/widget/TextView;

.field public final synthetic إ:Landroid/os/Handler;

.field public final synthetic ئ:Lcom/lite/cloudfinder/activity/AdbBlackScreenActivity;


# direct methods
.method public constructor <init>(Lcom/lite/cloudfinder/activity/AdbBlackScreenActivity;[ILandroid/widget/ProgressBar;Landroid/widget/TextView;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lڛەٟہ/؋;->ئ:Lcom/lite/cloudfinder/activity/AdbBlackScreenActivity;

    iput-object p2, p0, Lڛەٟہ/؋;->آ:[I

    iput-object p3, p0, Lڛەٟہ/؋;->أ:Landroid/widget/ProgressBar;

    iput-object p4, p0, Lڛەٟہ/؋;->ؤ:Landroid/widget/TextView;

    iput-object p5, p0, Lڛەٟہ/؋;->إ:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lڛەٟہ/؋;->ئ:Lcom/lite/cloudfinder/activity/AdbBlackScreenActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lڛەٟہ/؋;->آ:[I

    const/4 v1, 0x0

    aget v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    aput v2, v0, v1

    iget-object v3, p0, Lڛەٟہ/؋;->أ:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lڛەٟہ/؋;->ؤ:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    aget v0, v0, v1

    const/16 v1, 0x63

    if-lt v0, v1, :cond_1

    return-void

    :cond_1
    const/16 v1, 0x32

    if-ge v0, v1, :cond_2

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x40e3880000000000L    # 40000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/16 v2, 0x7530

    :goto_0
    add-long/2addr v0, v2

    goto :goto_1

    :cond_2
    const/16 v1, 0x5a

    if-ge v0, v1, :cond_3

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x40f86a0000000000L    # 100000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/32 v2, 0x186a0

    goto :goto_0

    :cond_3
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x41086a0000000000L    # 200000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/32 v2, 0x30d40

    goto :goto_0

    :goto_1
    iget-object v2, p0, Lڛەٟہ/؋;->إ:Landroid/os/Handler;

    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
