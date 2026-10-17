.class final Lorg/boundarylab/installer/VpnKillService$Drainer;
.super Ljava/lang/Object;
.source "VpnKillService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/boundarylab/installer/VpnKillService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Drainer"
.end annotation


# instance fields
.field private final stream:Ljava/io/FileInputStream;


# direct methods
.method constructor <init>(Ljava/io/FileDescriptor;)V
    .locals 1
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v0, p0, Lorg/boundarylab/installer/VpnKillService$Drainer;->stream:Ljava/io/FileInputStream;

    .line 79
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 83
    const v0, 0x8000

    new-array v0, v0, [B

    .line 85
    .local v0, "buffer":[B
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/boundarylab/installer/VpnKillService$Drainer;->stream:Ljava/io/FileInputStream;

    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz v1, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    goto :goto_1

    .line 88
    :catch_0
    move-exception v1

    .line 91
    :goto_1
    return-void
.end method
