.class public final synthetic Lڛەٟہ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/lite/cloudfinder/activity/MainActivity;

.field public final synthetic ؤ:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V
    .locals 0

    iput p3, p0, Lڛەٟہ/ؤ;->آ:I

    iput-object p1, p0, Lڛەٟہ/ؤ;->أ:Lcom/lite/cloudfinder/activity/MainActivity;

    iput-object p2, p0, Lڛەٟہ/ؤ;->ؤ:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    iget v0, p0, Lڛەٟہ/ؤ;->آ:I

    const v1, 0x7f080241

    const/4 v2, 0x0

    const/16 v3, 0x8

    const v4, 0x7f08019d

    iget-object v7, p0, Lڛەٟہ/ؤ;->ؤ:Ljava/lang/String;

    iget-object v5, p0, Lڛەٟہ/ؤ;->أ:Lcom/lite/cloudfinder/activity/MainActivity;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    sget-boolean v0, Lcom/lite/cloudfinder/activity/MainActivity;->آ:Z

    invoke-virtual {v5, v4}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    invoke-virtual {v5, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v5, v0}, Lcom/lite/cloudfinder/activity/MainActivity;->ؤ(Landroid/webkit/WebView;)V

    :cond_1
    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz v7, :cond_3

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v0, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x14

    if-le v0, v1, :cond_3

    iget-object v5, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    const/4 v6, 0x0

    const-string v8, "text/html"

    const-string v9, "utf-8"

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void

    :pswitch_1
    sget-boolean v0, Lcom/lite/cloudfinder/activity/MainActivity;->آ:Z

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lڛەٟہ/ؤ;

    const/4 v1, 0x1

    invoke-direct {v0, v5, v7, v1}, Lڛەٟہ/ؤ;-><init>(Lcom/lite/cloudfinder/activity/MainActivity;Ljava/lang/String;I)V

    invoke-virtual {v5, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :goto_1
    sget-boolean v0, Lcom/lite/cloudfinder/activity/MainActivity;->آ:Z

    invoke-virtual {v5, v4}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    if-nez v0, :cond_5

    invoke-virtual {v5, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v5, v0}, Lcom/lite/cloudfinder/activity/MainActivity;->ؤ(Landroid/webkit/WebView;)V

    :cond_5
    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_6

    iget-object v0, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/أ;->ة(Landroid/webkit/WebSettings;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_6
    if-eqz v7, :cond_7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v5, v5, Lcom/lite/cloudfinder/activity/MainActivity;->؋:Landroid/webkit/WebView;

    const/4 v6, 0x0

    const-string v8, "text/html"

    const-string v9, "utf-8"

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
