.class public Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;
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
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 2

    # 调试模式：不弹录屏请求页，直接结束
    :try_start_debugcap
    invoke-static {p0}, Lڝږ؁ڋ/ڽ;->isDebug(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :debugcap_go
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
    :debugcap_go
    :try_end_debugcap
    .catch Ljava/lang/Exception; {:try_start_debugcap .. :try_end_debugcap} :catch_debugcap
    goto :goto_debugcap

    :catch_debugcap
    move-exception v0
    :goto_debugcap

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
