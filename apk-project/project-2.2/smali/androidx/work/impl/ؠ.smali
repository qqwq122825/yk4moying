.class public final synthetic Landroidx/work/impl/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Z

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ZLؾپۑ۟ڂڷ/ا;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Landroidx/work/impl/ؠ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/ؠ;->ؤ:Ljava/lang/Object;

    iput-boolean p2, p0, Landroidx/work/impl/ؠ;->أ:Z

    iput-object p3, p0, Landroidx/work/impl/ؠ;->إ:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/work/impl/Processor;Landroidx/work/impl/model/WorkGenerationalId;Z)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Landroidx/work/impl/ؠ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/ؠ;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/work/impl/ؠ;->إ:Ljava/lang/Object;

    iput-boolean p3, p0, Landroidx/work/impl/ؠ;->أ:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    iget v0, p0, Landroidx/work/impl/ؠ;->آ:I

    iget-boolean v1, p0, Landroidx/work/impl/ؠ;->أ:Z

    iget-object v2, p0, Landroidx/work/impl/ؠ;->إ:Ljava/lang/Object;

    iget-object v3, p0, Landroidx/work/impl/ؠ;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v3, Landroidx/work/impl/Processor;

    check-cast v2, Landroidx/work/impl/model/WorkGenerationalId;

    invoke-static {v3, v2, v1}, Landroidx/work/impl/Processor;->؋(Landroidx/work/impl/Processor;Landroidx/work/impl/model/WorkGenerationalId;Z)V

    return-void

    :goto_0
    check-cast v3, Landroid/content/Context;

    check-cast v2, Lؾپۑ۟ڂڷ/ا;

    const-string v0, "error configuring notification delegate for package "

    const/4 v4, 0x0

    :try_start_0
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->uid:I

    const/4 v7, 0x1

    if-ne v5, v6, :cond_0

    move v5, v7

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    :goto_1
    if-nez v5, :cond_1

    const-string v1, "FirebaseMessaging"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_1
    invoke-static {v3}, Lڗًقڔ/؋;->ؽ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "proxy_notification_initialized"

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {v3, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "com.google.android.gms"

    if-eqz v1, :cond_2

    :try_start_1
    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->إ(Landroid/app/NotificationManager;)V

    goto :goto_2

    :cond_2
    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->أ(Landroid/app/NotificationManager;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->ث(Landroid/app/NotificationManager;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    :goto_2
    invoke-virtual {v2, v4}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v2, v4}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
