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
    # 不比对包名：内嵌 B 的包名每次构建都可能不同（面板可随机包名），
    # VPN 只在安装期间存在，任何一次安装完成都说明该收尾了
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
