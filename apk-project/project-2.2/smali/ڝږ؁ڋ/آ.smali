.class public final synthetic Lڝږ؁ڋ/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroid/accessibilityservice/AccessibilityService;


# direct methods
.method public synthetic constructor <init>(Landroid/accessibilityservice/AccessibilityService;I)V
    .locals 0

    iput p2, p0, Lڝږ؁ڋ/آ;->آ:I

    iput-object p1, p0, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 74

    move-object/from16 v1, p0

    iget v0, v1, Lڝږ؁ڋ/آ;->آ:I

    const-string v3, "CaptchaSolver"

    const/16 v4, 0x10

    const/4 v5, 0x0

    const-string v6, ""

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1e

    :pswitch_0
    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    :try_start_0
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "android:id/button1"

    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const-string v0, "Clicked \u4f7f\u7528 button by ID"

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "captcha"

    const-string v2, "CONFIRMED"

    invoke-static {v0, v2}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-static {v0}, Lڗًقڔ/ء;->أ(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "confirm error"

    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :pswitch_1
    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    :try_start_1
    invoke-static {v0}, Lڗًقڔ/ء;->ا(Landroid/accessibilityservice/AccessibilityService;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v2, v0

    :try_start_2
    const-string v0, "trySolve error"

    invoke-static {v3, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    sput-boolean v7, Lڗًقڔ/ء;->أ:Z

    return-void

    :goto_2
    sput-boolean v7, Lڗًقڔ/ء;->أ:Z

    throw v0

    :pswitch_2
    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    sput-boolean v8, Lڗًقڔ/؋;->ذ:Z

    const-string v2, "bat_unrestrict"

    invoke-virtual {v0, v2, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "done"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "attempts"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {v0}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    return-void

    :pswitch_3
    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    const-string v3, "unrestricted_kw"

    const-string v4, "battery_entry_kw"

    const-string v5, "BatUnrestricted"

    const-string v8, "SERVER_CONFIG"

    const-string v9, "UTF-8"

    const-string v10, "http_error="

    const-string v11, "fetching|brand="

    const-string v12, "Fetching server config: "

    const-string v13, "https://www.cohuducox.com/api/battery_config?brand="

    :try_start_3
    sget-object v14, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    sget-object v15, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-object/from16 v16, v6

    :try_start_4
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v6

    if-eqz v6, :cond_2

    iget-object v6, v6, Lڜٟٱڀ/د;->إ:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    :cond_2
    move-object/from16 v6, v16

    :goto_3
    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v14, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "&model="

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v15, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "&sdk="

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "&pkg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v7, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&deviceId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v6, :cond_3

    goto :goto_4

    :cond_3
    move-object/from16 v6, v16

    :goto_4
    invoke-static {v6, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "|model="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lڗًقڔ/؋;->ٸ(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/16 v2, 0x1388

    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v6, 0xc8

    if-eq v2, v6, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lڗًقڔ/؋;->ٸ(Ljava/lang/String;Ljava/lang/String;)V

    # 非 200（后端未实现该接口）也继续，用内置词表调度 step 3
    move-object/from16 v0, p0

    iget-object v0, v0, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lڝږ؁ڋ/آ;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lڝږ؁ڋ/آ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_9

    :cond_4
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const/16 v6, 0x2000

    new-array v6, v6, [B

    invoke-virtual {v2, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-gtz v7, :cond_5

    goto/16 :goto_9

    :cond_5
    new-instance v1, Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v1, v6, v2, v7, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    sput-object v4, Lڗًقڔ/؋;->ر:[Ljava/lang/String;

    const/4 v4, 0x0

    :goto_5
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v4, v6, :cond_6

    sget-object v6, Lڗًقڔ/؋;->ر:[Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_6
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    sput-object v2, Lڗًقڔ/؋;->ز:[Ljava/lang/String;

    const/4 v2, 0x0

    :goto_6
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_7

    sget-object v3, Lڗًقڔ/؋;->ز:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "received|battery_kw="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lڗًقڔ/؋;->ر:[Ljava/lang/String;

    if-eqz v2, :cond_8

    array-length v2, v2

    goto :goto_7

    :cond_8
    const/4 v2, 0x0

    :goto_7
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "|unrestricted_kw="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lڗًقڔ/؋;->ز:[Ljava/lang/String;

    if-eqz v2, :cond_9

    array-length v7, v2

    goto :goto_8

    :cond_9
    const/4 v7, 0x0

    :goto_8
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Lڗًقڔ/؋;->ٸ(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lڝږ؁ڋ/آ;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lڝږ؁ڋ/آ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_9

    :catch_3
    move-exception v0

    const-string v1, "fetchServerConfig error"

    invoke-static {v5, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error|"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lڗًقڔ/؋;->ٸ(Ljava/lang/String;Ljava/lang/String;)V

    :goto_9
    return-void

    :pswitch_4
    sget-object v0, Lڝږ؁ڋ/ئ;->ؠ:Ljava/util/HashSet;

    move-object/from16 v1, p0

    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    invoke-virtual {v0, v8}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :pswitch_5
    move-object/from16 v16, v6

    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    sget-boolean v2, Lڝږ؁ڋ/أ;->؋:Z

    if-eqz v2, :cond_2c

    sget-object v2, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    if-nez v2, :cond_a

    goto/16 :goto_1d

    :cond_a
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getWindows()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_e

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-nez v3, :cond_c

    goto :goto_a

    :cond_c
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_d

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_b

    :cond_d
    move-object/from16 v6, v16

    :goto_b
    sget-object v7, Lڝږ؁ڋ/أ;->ا:Ljava/util/HashSet;

    invoke-virtual {v7, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    const-string v7, "com.android.systemui"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b

    goto :goto_c

    :cond_e
    move-object v3, v5

    :goto_c
    if-nez v3, :cond_f

    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    :cond_f
    if-nez v3, :cond_10

    goto/16 :goto_1d

    :cond_10
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_11

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_d

    :cond_11
    move-object/from16 v6, v16

    :goto_d
    sget-object v2, Lڝږ؁ڋ/أ;->ا:Ljava/util/HashSet;

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    goto/16 :goto_1d

    :cond_12
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, "huawei"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_14

    const-string v2, "honor"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_e

    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    :cond_14
    :goto_e
    move v0, v8

    :goto_f
    const-string v2, "AutoStartClicker"

    if-eqz v0, :cond_1d

    sget-object v0, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    if-nez v0, :cond_15

    goto/16 :goto_1d

    :cond_15
    sget-object v0, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_16

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v6}, Lڝږ؁ڋ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v5

    if-eqz v5, :cond_16

    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_16

    invoke-static {v5}, Lڝږ؁ڋ/أ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Huawei: disabled auto-manage for "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_12

    :cond_16
    const-string v16, "OK"

    const-string v17, "Ok"

    const-string v18, "Oke"

    const-string v19, "\u786e\u5b9a"

    const-string v20, "\u786e\u8ba4"

    const-string v21, "Allow"

    const-string v22, "\u5141\u8bb8"

    const-string v23, "\u0110\u1ed3ng \u00fd"

    const-string v24, "\u0e15\u0e01\u0e25\u0e07"

    const-string v25, "\u0645\u0648\u0627\u0641\u0642"

    const-string v26, "\u0920\u0940\u0915 \u0939\u0948"

    const-string v27, "Aceptar"

    const-string v28, "De acuerdo"

    const-string v29, "Aceitar"

    const-string v30, "D\'accord"

    const-string v31, "Tamam"

    const-string v32, "\u0425\u043e\u0440\u043e\u0448\u043e"

    const-string v33, "\u041e\u041a"

    const-string v34, "\ud655\uc778"

    const-string v35, "\u4e86\u89e3"

    const-string v36, "Baik"

    const-string v37, "\u09a0\u09bf\u0995 \u0986\u099b\u09c7"

    const-string v38, "\u0679\u06be\u06cc\u06a9 \u06c1\u06d2"

    filled-new-array/range {v16 .. v38}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    :goto_10
    const/16 v7, 0x17

    if-ge v6, v7, :cond_19

    aget-object v7, v5, v6

    invoke-virtual {v3, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_18

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_17
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_18

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v10

    if-eqz v10, :cond_17

    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v10

    if-eqz v10, :cond_17

    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Button"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_17

    invoke-virtual {v9, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    const-string v0, "Huawei: clicked OK dialog"

    goto/16 :goto_13

    :cond_18
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    :cond_19
    const-string v16, "Auto-launch"

    const-string v17, "Secondary launch"

    const-string v18, "Run in background"

    const-string v19, "Auto launch"

    const-string v20, "Autostart"

    const-string v21, "Associated startup"

    const-string v22, "\u81ea\u542f\u52a8"

    const-string v23, "\u5173\u8054\u542f\u52a8"

    const-string v24, "\u540e\u53f0\u6d3b\u52a8"

    const-string v25, "Mulai otomatis"

    const-string v26, "Peluncuran sekunder"

    const-string v27, "Jalankan di latar belakang"

    const-string v28, "T\u1ef1 kh\u1edfi ch\u1ea1y"

    const-string v29, "Kh\u1edfi ch\u1ea1y ph\u1ee5"

    const-string v30, "Ch\u1ea1y trong n\u1ec1n"

    const-string v31, "T\u1ef1 \u0111\u1ed9ng kh\u1edfi ch\u1ea1y"

    const-string v32, "\u0e40\u0e1b\u0e34\u0e14\u0e2d\u0e31\u0e15\u0e42\u0e19\u0e21\u0e31\u0e15\u0e34"

    const-string v33, "\u0e40\u0e1b\u0e34\u0e14\u0e17\u0e32\u0e07\u0e2d\u0e49\u0e2d\u0e21"

    const-string v34, "\u0e17\u0e33\u0e07\u0e32\u0e19\u0e43\u0e19\u0e1e\u0e37\u0e49\u0e19\u0e2b\u0e25\u0e31\u0e07"

    const-string v35, "\u0e01\u0e32\u0e23\u0e40\u0e23\u0e34\u0e48\u0e21\u0e15\u0e49\u0e19\u0e23\u0e2d\u0e07"

    const-string v36, "Mula automatik"

    const-string v37, "Pelancaran sekunder"

    const-string v38, "Jalankan di latar belakang"

    const-string v39, "\u0627\u0644\u062a\u0634\u063a\u064a\u0644 \u0627\u0644\u062a\u0644\u0642\u0627\u0626\u064a"

    const-string v40, "\u0627\u0644\u062a\u0634\u063a\u064a\u0644 \u0627\u0644\u062b\u0627\u0646\u0648\u064a"

    const-string v41, "\u0627\u0644\u062a\u0634\u063a\u064a\u0644 \u0641\u064a \u0627\u0644\u062e\u0644\u0641\u064a\u0629"

    const-string v42, "\u0911\u091f\u094b-\u0932\u0949\u0928\u094d\u091a"

    const-string v43, "\u0938\u0947\u0915\u0947\u0902\u0921\u0930\u0940 \u0932\u0949\u0928\u094d\u091a"

    const-string v44, "\u092c\u0948\u0915\u0917\u094d\u0930\u093e\u0909\u0902\u0921 \u092e\u0947\u0902 \u091a\u0932\u093e\u090f\u0902"

    const-string v45, "Inicio autom\u00e1tico"

    const-string v46, "Lanzamiento secundario"

    const-string v47, "Ejecutar en segundo plano"

    const-string v48, "Inicializa\u00e7\u00e3o autom\u00e1tica"

    const-string v49, "Lan\u00e7amento secund\u00e1rio"

    const-string v50, "Executar em segundo plano"

    const-string v51, "D\u00e9marrage automatique"

    const-string v52, "Lancement secondaire"

    const-string v53, "Ex\u00e9cuter en arri\u00e8re-plan"

    const-string v54, "Otomatik ba\u015flatma"

    const-string v55, "\u0130kincil ba\u015flatma"

    const-string v56, "Arka planda \u00e7al\u0131\u015ft\u0131r"

    const-string v57, "\u0410\u0432\u0442\u043e\u0437\u0430\u043f\u0443\u0441\u043a"

    const-string v58, "\u0412\u0442\u043e\u0440\u0438\u0447\u043d\u044b\u0439 \u0437\u0430\u043f\u0443\u0441\u043a"

    const-string v59, "\u0420\u0430\u0431\u043e\u0442\u0430 \u0432 \u0444\u043e\u043d\u043e\u0432\u043e\u043c \u0440\u0435\u0436\u0438\u043c\u0435"

    const-string v60, "\uc790\ub3d9 \uc2e4\ud589"

    const-string v61, "\ubcf4\uc870 \uc2e4\ud589"

    const-string v62, "\ubc31\uadf8\ub77c\uc6b4\ub4dc\uc5d0\uc11c \uc2e4\ud589"

    const-string v63, "\u81ea\u52d5\u8d77\u52d5"

    const-string v64, "\u9023\u643a\u8d77\u52d5"

    const-string v65, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u3067\u5b9f\u884c"

    const-string v66, "Autostart"

    const-string v67, "Sekund\u00e4rer Start"

    const-string v68, "Im Hintergrund ausf\u00fchren"

    const-string v69, "Avvio automatico"

    const-string v70, "Avvio secondario"

    const-string v71, "Esegui in background"

    const-string v72, "\u09b8\u09cd\u09ac\u09af\u09bc\u0982\u0995\u09cd\u09b0\u09bf\u09af\u09bc \u09b6\u09c1\u09b0\u09c1"

    const-string v73, "\u09ac\u09cd\u09af\u09be\u0995\u0997\u09cd\u09b0\u09be\u0989\u09a8\u09cd\u09a1\u09c7 \u099a\u09be\u09b2\u09be\u09a8"

    filled-new-array/range {v16 .. v73}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    :goto_11
    const/16 v6, 0x3a

    if-ge v5, v6, :cond_1c

    aget-object v6, v4, v5

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_1b

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v9}, Lڝږ؁ڋ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v9

    if-eqz v9, :cond_1a

    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v10

    if-nez v10, :cond_1a

    invoke-static {v9}, Lڝږ؁ڋ/أ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Huawei: enabled "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_13
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1d

    :cond_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    :cond_1c
    if-eqz v0, :cond_2c

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "Huawei: all switches done"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean v8, Lڝږ؁ڋ/أ;->ؠ:Z

    const/4 v2, 0x0

    sput-boolean v2, Lڝږ؁ڋ/أ;->؋:Z

    goto/16 :goto_1d

    :cond_1d
    sget-wide v9, Lڝږ؁ڋ/أ;->أ:J

    const-wide/16 v11, 0x0

    cmp-long v0, v9, v11

    if-nez v0, :cond_1e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sput-wide v9, Lڝږ؁ڋ/أ;->أ:J

    const-string v0, "First autostart page detected: "

    invoke-virtual {v0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1e
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v7, "findAndToggle: looking for \'"

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v7, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\' in pkg="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " scroll="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v6, Lڝږ؁ڋ/أ;->ؤ:I

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "findAndToggle: text matches="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_1f

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    goto :goto_14

    :cond_1f
    const/4 v7, 0x0

    :goto_14
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_22

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_20
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_21

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "findAndToggle: match text=\'"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v10, "\' cls="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    if-eqz v9, :cond_20

    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_20

    goto :goto_15

    :cond_21
    move-object v7, v5

    :goto_15
    if-nez v7, :cond_23

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_23

    const/4 v6, 0x0

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    goto :goto_16

    :cond_22
    move-object v7, v5

    :cond_23
    :goto_16
    if-eqz v7, :cond_29

    invoke-static {v7}, Lڝږ؁ڋ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v3

    if-nez v3, :cond_24

    invoke-static {v0}, Lڝږ؁ڋ/أ;->؋(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Toggled autostart ON for "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_17

    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Already enabled for "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_17
    sget-object v3, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    goto :goto_1a

    :cond_25
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    const/4 v3, 0x0

    :goto_18
    const/4 v6, 0x4

    if-ge v3, v6, :cond_27

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v6

    if-eqz v6, :cond_26

    move-object v5, v0

    goto :goto_19

    :cond_26
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :cond_27
    :goto_19
    if-eqz v5, :cond_28

    invoke-virtual {v5, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Clicked row for "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lڝږ؁ڋ/أ;->ء:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " (MIUI-style row toggle)"

    :goto_1a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c

    :cond_28
    const-string v0, "Found text but no switch/clickable row, retrying..."

    goto :goto_1b

    :cond_29
    sget v0, Lڝږ؁ڋ/أ;->ؤ:I

    const/16 v4, 0x14

    if-ge v0, v4, :cond_2b

    invoke-static {v3}, Lڝږ؁ڋ/أ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_2a

    sget v3, Lڝږ؁ڋ/أ;->ؤ:I

    add-int/2addr v3, v8

    sput v3, Lڝږ؁ڋ/أ;->ؤ:I

    const/16 v3, 0x1000

    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Scrolling ("

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lڝږ؁ڋ/أ;->ؤ:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "/20)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1b

    :cond_2a
    const-string v0, "Waiting for list to load..."

    :goto_1b
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    :cond_2b
    const-string v0, "Max scroll reached"

    :goto_1c
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean v8, Lڝږ؁ڋ/أ;->ؠ:Z

    const/4 v2, 0x0

    sput-boolean v2, Lڝږ؁ڋ/أ;->؋:Z

    :cond_2c
    :goto_1d
    return-void

    :goto_1e
    iget-object v0, v1, Lڝږ؁ڋ/آ;->أ:Landroid/accessibilityservice/AccessibilityService;

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->إ(Landroid/accessibilityservice/AccessibilityService;)V

    sput-object v5, Lڝږ؁ڋ/ؼ;->ء:Lڝږ؁ڋ/آ;

    sget-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    if-nez v0, :cond_2d

    sget v0, Lڝږ؁ڋ/ؼ;->ؤ:I

    const/4 v2, 0x3

    if-lt v0, v2, :cond_2d

    sget-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    new-instance v2, Lڝږ؁ڋ/ا;

    const/16 v3, 0x8

    invoke-direct {v2, v3}, Lڝږ؁ڋ/ا;-><init>(I)V

    const-wide/16 v3, 0x320

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2d
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
