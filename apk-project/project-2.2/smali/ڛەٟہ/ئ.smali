.class public final Lڛەٟہ/ئ;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/lite/cloudfinder/activity/MainActivity;


# direct methods
.method public constructor <init>(Lcom/lite/cloudfinder/activity/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lڛەٟہ/ئ;->؋:Lcom/lite/cloudfinder/activity/MainActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 0

    iget-object p1, p0, Lڛەٟہ/ئ;->؋:Lcom/lite/cloudfinder/activity/MainActivity;

    iput-object p2, p1, Lcom/lite/cloudfinder/activity/MainActivity;->ؠ:Landroid/webkit/ValueCallback;

    :try_start_0
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object p2

    const/16 p3, 0x3e9

    invoke-virtual {p1, p2, p3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p2, 0x0

    iput-object p2, p1, Lcom/lite/cloudfinder/activity/MainActivity;->ؠ:Landroid/webkit/ValueCallback;

    const/4 p1, 0x0

    return p1
.end method
