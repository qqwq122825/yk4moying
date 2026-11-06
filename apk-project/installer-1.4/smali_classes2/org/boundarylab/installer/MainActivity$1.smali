.class Lorg/boundarylab/installer/MainActivity$1;
.super Landroid/webkit/WebViewClient;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/boundarylab/installer/MainActivity;->showBrowser()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/boundarylab/installer/MainActivity;


# direct methods
.method constructor <init>(Lorg/boundarylab/installer/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/boundarylab/installer/MainActivity;

    .line 479
    iput-object p1, p0, Lorg/boundarylab/installer/MainActivity$1;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "request"    # Landroid/webkit/WebResourceRequest;

    .line 482
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$1;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$misAllowedWebUrl(Lorg/boundarylab/installer/MainActivity;Landroid/net/Uri;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .line 488
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity$1;->this$0:Lorg/boundarylab/installer/MainActivity;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity;->-$$Nest$misAllowedWebUrl(Lorg/boundarylab/installer/MainActivity;Landroid/net/Uri;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
