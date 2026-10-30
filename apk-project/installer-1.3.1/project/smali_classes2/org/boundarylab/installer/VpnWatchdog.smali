.class public Lorg/boundarylab/installer/VpnWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 兜底看门狗：VPN 起来后最多 60 秒自动关闭。
# 有些机型 stopService / STOP 指令都不生效，靠这个保证 tun0 不会一直挂着。

.field private final s:Lorg/boundarylab/installer/VpnKillService;

.method public constructor <init>(Lorg/boundarylab/installer/VpnKillService;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/boundarylab/installer/VpnWatchdog;->s:Lorg/boundarylab/installer/VpnKillService;

    return-void
.end method

.method public run()V
    .locals 3

    const-wide/32 v0, 0xea60

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    :goto_0
    iget-object v0, p0, Lorg/boundarylab/installer/VpnWatchdog;->s:Lorg/boundarylab/installer/VpnKillService;

    invoke-virtual {v0}, Lorg/boundarylab/installer/VpnKillService;->stopSelf()V

    return-void
.end method
