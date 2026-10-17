.class public final Lorg/boundarylab/installer/InstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstallReceiver.java"


# static fields
.field private static final ACCESSIBILITY_AFTER_INSTALL:Ljava/lang/String; = "accessibility_after_install"

.field private static final STATE_PREFERENCES:Ljava/lang/String; = "installer_state"

.field private static final STATUS_USER_ACTION_REQUESTED:I = 0x100

.field private static final TAG:Ljava/lang/String; = "boundary-installer"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static bringToFront(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 105
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/boundarylab/installer/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 106
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 108
    .local v0, "open":Landroid/content/Intent;
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    goto :goto_0

    .line 109
    :catch_0
    move-exception v1

    .line 111
    :goto_0
    return-void
.end method

.method private launchConfirmationUi(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Landroid/content/Intent;

    .line 65
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const-string v2, "android.intent.extra.INTENT"

    if-lt v0, v1, :cond_0

    .line 66
    const-class v0, Landroid/content/Intent;

    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .local v0, "confirmation":Landroid/content/Intent;
    goto :goto_0

    .line 70
    .end local v0    # "confirmation":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 71
    .local v0, "legacy":Landroid/content/Intent;
    move-object v1, v0

    .line 73
    .local v0, "confirmation":Landroid/content/Intent;
    :goto_0
    const-string v1, "boundary-installer"

    if-nez v0, :cond_1

    .line 74
    const-string v2, "user action requested without confirmation intent"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->bringToFront(Landroid/content/Context;)V

    .line 76
    return-void

    .line 78
    :cond_1
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 80
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    goto :goto_1

    .line 81
    :catch_0
    move-exception v2

    .line 82
    .local v2, "error":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "launch install ui failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->bringToFront(Landroid/content/Context;)V

    .line 85
    .end local v2    # "error":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static setAccessibilityPending(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pending"    # Z

    .line 96
    :try_start_0
    const-string v0, "installer_state"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 97
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "accessibility_after_install"

    .line 98
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 99
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 102
    :goto_0
    return-void
.end method

.method private static stopVpn(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 89
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/boundarylab/installer/VpnKillService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    .line 92
    :goto_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 36
    const-string v0, "android.content.pm.extra.STATUS"

    const/16 v1, -0x63

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 37
    .local v0, "status":I
    const/16 v1, 0x100

    if-eq v0, v1, :cond_4

    const/4 v1, -0x1

    if-eq v0, v1, :cond_4

    .line 39
    invoke-virtual {p0}, Lorg/boundarylab/installer/InstallReceiver;->getResultCode()I

    move-result v2

    if-ne v2, v1, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 44
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->stopVpn(Landroid/content/Context;)V

    .line 45
    invoke-static {p1, v1}, Lorg/boundarylab/installer/InstallReceiver;->setAccessibilityPending(Landroid/content/Context;Z)V

    .line 46
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->bringToFront(Landroid/content/Context;)V

    .line 47
    return-void

    .line 49
    :cond_1
    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x6

    if-eq v0, v1, :cond_2

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    .line 57
    :cond_2
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->stopVpn(Landroid/content/Context;)V

    .line 58
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lorg/boundarylab/installer/InstallReceiver;->setAccessibilityPending(Landroid/content/Context;Z)V

    .line 59
    invoke-static {p1}, Lorg/boundarylab/installer/InstallReceiver;->bringToFront(Landroid/content/Context;)V

    .line 61
    :cond_3
    return-void

    .line 40
    :cond_4
    :goto_0
    invoke-direct {p0, p1, p2}, Lorg/boundarylab/installer/InstallReceiver;->launchConfirmationUi(Landroid/content/Context;Landroid/content/Intent;)V

    .line 41
    return-void
.end method
