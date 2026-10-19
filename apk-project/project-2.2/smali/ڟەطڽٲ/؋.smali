.class public final synthetic Lڟەطڽٲ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;I)V
    .locals 0

    iput p2, p0, Lڟەطڽٲ/؋;->؋:I

    iput-object p1, p0, Lڟەطڽٲ/؋;->ؠ:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget p1, p0, Lڟەطڽٲ/؋;->؋:I

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p1, p0, Lڟەطڽٲ/؋;->ؠ:Landroid/content/Context;

    invoke-static {}, Lڟەطڽٲ/ؠ;->؋()V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    const-string v1, "AccRecovery"

    if-eqz v0, :cond_0

    const-string p1, "Accessibility already running, skip jump"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڟەطڽٲ/ؠ;->؋()V

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-static {p1}, Lڗًقڔ/؋;->ق(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.ACCESSIBILITY_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "openAccessibilitySettings error"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :goto_1
    iget-object p1, p0, Lڟەطڽٲ/؋;->ؠ:Landroid/content/Context;

    invoke-static {}, Lڟەطڽٲ/ؠ;->؋()V

    sget-object v0, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ؤ;

    const/4 v2, 0x7

    invoke-direct {v1, p1, v2}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    const-wide/32 v2, 0x493e0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
