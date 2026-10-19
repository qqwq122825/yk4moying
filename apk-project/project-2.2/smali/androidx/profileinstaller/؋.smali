.class public final synthetic Landroidx/profileinstaller/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:I

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/profileinstaller/DeviceProfileWriter;ILjava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Landroidx/profileinstaller/؋;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/profileinstaller/؋;->ؤ:Ljava/lang/Object;

    iput p2, p0, Landroidx/profileinstaller/؋;->أ:I

    iput-object p3, p0, Landroidx/profileinstaller/؋;->إ:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lڜأِجطّثٮ/ء;Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Landroidx/profileinstaller/؋;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/profileinstaller/؋;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/profileinstaller/؋;->إ:Ljava/lang/Object;

    iput p3, p0, Landroidx/profileinstaller/؋;->أ:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget v0, p0, Landroidx/profileinstaller/؋;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Landroidx/profileinstaller/؋;->ؤ:Ljava/lang/Object;

    check-cast v0, Landroidx/profileinstaller/DeviceProfileWriter;

    iget v1, p0, Landroidx/profileinstaller/؋;->أ:I

    iget-object v2, p0, Landroidx/profileinstaller/؋;->إ:Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroidx/profileinstaller/DeviceProfileWriter;->؋(Landroidx/profileinstaller/DeviceProfileWriter;ILjava/lang/Object;)V

    return-void

    :goto_0
    iget-object v0, p0, Landroidx/profileinstaller/؋;->ؤ:Ljava/lang/Object;

    check-cast v0, Lڜأِجطّثٮ/ء;

    iget-object v1, p0, Landroidx/profileinstaller/؋;->إ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget v2, p0, Landroidx/profileinstaller/؋;->أ:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "\u914d\u5bf9\u5931\u8d25: "

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v0, v2, v1}, Lڜأِجطّثٮ/ء;->ؤ(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "AdbPairMgr"

    const-string v5, "Manual pair failed"

    invoke-static {v2, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v2, "error"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lڜأِجطّثٮ/ء;->ض(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    iput-boolean v4, v0, Lڜأِجطّثٮ/ء;->ؠ:Z

    return-void

    :catchall_0
    move-exception v1

    iput-boolean v4, v0, Lڜأِجطّثٮ/ء;->ؠ:Z

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
