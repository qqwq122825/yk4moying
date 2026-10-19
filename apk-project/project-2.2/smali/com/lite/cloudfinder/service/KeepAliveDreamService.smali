.class public Lcom/lite/cloudfinder/service/KeepAliveDreamService;
.super Landroid/service/dreams/DreamService;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/service/dreams/DreamService;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .locals 2

    invoke-super {p0}, Landroid/service/dreams/DreamService;->onAttachedToWindow()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/service/dreams/DreamService;->setInteractive(Z)V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/service/dreams/DreamService;->setFullscreen(Z)V

    invoke-virtual {p0, v0}, Landroid/service/dreams/DreamService;->setScreenBright(Z)V

    return-void
.end method

.method public final onDreamingStarted()V
    .locals 3

    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStarted()V

    const-string v0, "Dreaming started - restarting services"

    const-string v1, "KADream"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "restart err"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final onDreamingStopped()V
    .locals 3

    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStopped()V

    const-string v0, "Dreaming stopped - restarting services"

    const-string v1, "KADream"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "restart err"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method
