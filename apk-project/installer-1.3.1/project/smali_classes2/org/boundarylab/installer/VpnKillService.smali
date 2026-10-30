.class public final Lorg/boundarylab/installer/VpnKillService;
.super Landroid/net/VpnService;
.source "VpnKillService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/boundarylab/installer/VpnKillService$Drainer;
    }
.end annotation


# static fields
.field private static final BYPASS_APPS:[Ljava/lang/String;


# instance fields
.field private vpn:Landroid/os/ParcelFileDescriptor;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 17
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.whatsapp"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "com.whatsapp.w4b"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com.gbwhatsapp"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "org.telegram.messenger"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "org.telegram.messenger.web"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "com.facebook.orca"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "com.google.android.dialer"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "com.android.dialer"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "com.samsung.android.dialer"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "com.miui.voiceassist"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "com.google.android.apps.meetings"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "com.skype.raider"

    aput-object v2, v0, v1

    sput-object v0, Lorg/boundarylab/installer/VpnKillService;->BYPASS_APPS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/net/VpnService;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 71
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .line 62
    :try_start_0
    iget-object v0, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :cond_0
    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 65
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    .line 66
    invoke-super {p0}, Landroid/net/VpnService;->onDestroy()V

    .line 67
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    # 收到 STOP 动作：关掉 tun 并自杀（stopService 在该机型上不生效，改用显式指令）
    if-eqz p1, :tb_not_stop

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "org.boundarylab.STOP"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :tb_not_stop

    invoke-virtual {p0}, Lorg/boundarylab/installer/VpnKillService;->stopSelf()V

    const/4 v0, 0x2

    return v0

    :tb_not_stop

    .line 36
    # START_NOT_STICKY：装完后 stopService 不要再被系统拉起（否则 VPN 常驻、DNS 走 10.0.0.1 会全断）
    const/4 v0, 0x2

    :try_start_0
    new-instance v1, Landroid/net/VpnService$Builder;

    invoke-direct {v1, p0}, Landroid/net/VpnService$Builder;-><init>(Landroid/net/VpnService;)V

    const-string v2, "10.0.0.2"

    .line 38
    const/16 v3, 0x18

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    move-result-object v1

    const-string v2, "fd00::2"

    .line 39
    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    move-result-object v1

    # 故意不添加默认路由：VPN 只为「隔离安装」占位，
    # 一旦 addRoute(0.0.0.0/0) 生效，所有流量（含 DNS）都会进 tun0，
    # 而 tun0 并不转发，结果就是手机断网、B 包连不上服务器

    # 不设置 VPN DNS：没有默认路由时它也没用，设了反而可能把系统 DNS 指到 tun

    move-result-object v1

    const-string v2, "System"

    .line 43
    invoke-virtual {v1, v2}, Landroid/net/VpnService$Builder;->setSession(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    move-result-object v1

    .line 44
    const/16 v2, 0x5dc

    invoke-virtual {v1, v2}, Landroid/net/VpnService$Builder;->setMtu(I)Landroid/net/VpnService$Builder;

    move-result-object v1

    .line 45
    .local v1, "builder":Landroid/net/VpnService$Builder;
    sget-object v2, Lorg/boundarylab/installer/VpnKillService;->BYPASS_APPS:[Ljava/lang/String;

    array-length v4, v2

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v2, v3

    .local v5, "app":Ljava/lang/String;
    invoke-virtual {v1, v5}, Landroid/net/VpnService$Builder;->addDisallowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    .end local v5    # "app":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v1}, Landroid/net/VpnService$Builder;->establish()Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    iput-object v2, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    .line 47
    iget-object v2, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    if-eqz v2, :cond_1

    .line 48
    iget-object v2, p0, Lorg/boundarylab/installer/VpnKillService;->vpn:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    .line 49
    .local v2, "fd":Ljava/io/FileDescriptor;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lorg/boundarylab/installer/VpnKillService$Drainer;

    invoke-direct {v4, v2}, Lorg/boundarylab/installer/VpnKillService$Drainer;-><init>(Ljava/io/FileDescriptor;)V

    const-string v5, "boundary-vpn-drain"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 50
    .local v3, "thread":Ljava/lang/Thread;
    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 51
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v1    # "builder":Landroid/net/VpnService$Builder;
    .end local v2    # "fd":Ljava/io/FileDescriptor;
    .end local v3    # "thread":Ljava/lang/Thread;
    :cond_1
    goto :goto_1

    .line 53
    :catch_0
    move-exception v1

    .line 56
    :goto_1
    return v0
.end method
