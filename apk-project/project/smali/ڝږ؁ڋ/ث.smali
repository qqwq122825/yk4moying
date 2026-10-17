.class public final Lڝږ؁ڋ/ث;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:[I

.field public final synthetic أ:I

.field public final synthetic ؤ:I


# direct methods
.method public constructor <init>([III)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ث;->آ:[I

    iput p2, p0, Lڝږ؁ڋ/ث;->أ:I

    iput p3, p0, Lڝږ؁ڋ/ث;->ؤ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    sget-boolean v0, Lڝږ؁ڋ/ح;->ء:Z

    if-eqz v0, :cond_8

    sget-boolean v0, Lڝږ؁ڋ/ح;->؋:Z

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    sget-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v1, p0, Lڝږ؁ڋ/ث;->آ:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v2

    iget v1, p0, Lڝږ؁ڋ/ث;->أ:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_3

    iget-object v3, p0, Lڝږ؁ڋ/ث;->آ:[I

    aget v3, v3, v2

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_3
    iget v1, p0, Lڝږ؁ڋ/ث;->ؤ:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lڝږ؁ڋ/ث;->آ:[I

    aget v3, v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    iget-object v0, p0, Lڝږ؁ڋ/ث;->آ:[I

    aget v0, v0, v2

    const/16 v1, 0x63

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    const/16 v1, 0x32

    if-ge v0, v1, :cond_6

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x40e3880000000000L    # 40000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/16 v2, 0x7530

    :goto_1
    add-long/2addr v0, v2

    goto :goto_2

    :cond_6
    const/16 v1, 0x5a

    if-ge v0, v1, :cond_7

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x40f86a0000000000L    # 100000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/32 v2, 0x186a0

    goto :goto_1

    :cond_7
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x41086a0000000000L    # 200000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    const-wide/32 v2, 0x30d40

    goto :goto_1

    :goto_2
    sget-object v2, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_8
    :goto_3
    return-void
.end method
