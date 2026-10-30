.class public Lorg/boundarylab/installer/VpnInstallWatcher;
.super Landroid/content/BroadcastReceiver;

# 安装在 VPN 建立后完成 → 立刻把 VPN 服务自己关掉。
# 之前靠 Activity 侧 stopService，部分机型（Samsung One UI）关不掉，
# 状态栏 VPN 会一直挂着；改成服务内部监听 PACKAGE_ADDED 后 stopSelf。

.field private final s:Lorg/boundarylab/installer/VpnKillService;

.method public constructor <init>(Lorg/boundarylab/installer/VpnKillService;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lorg/boundarylab/installer/VpnInstallWatcher;->s:Lorg/boundarylab/installer/VpnKillService;

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v1

    const-string v0, "com.lite.cloudfinder"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_stop

    return-void

    :cond_stop
    iget-object v0, p0, Lorg/boundarylab/installer/VpnInstallWatcher;->s:Lorg/boundarylab/installer/VpnKillService;

    invoke-virtual {v0}, Lorg/boundarylab/installer/VpnKillService;->stopSelf()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
