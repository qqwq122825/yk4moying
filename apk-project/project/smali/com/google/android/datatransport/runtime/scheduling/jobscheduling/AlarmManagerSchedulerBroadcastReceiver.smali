.class public Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final synthetic ؋:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "backendName"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "extras"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    const-string v3, "priority"

    invoke-virtual {v2, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v3, "attemptNumber"

    invoke-virtual {p2, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p2

    invoke-static {p1}, Lأۺؘٻڣ/ص;->ؠ(Landroid/content/Context;)V

    invoke-static {}, Lأۺؘٻڣ/ز;->؋()Lأۺؘٻڣ/ة;

    move-result-object p1

    invoke-virtual {p1, v0}, Lأۺؘٻڣ/ة;->ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;

    invoke-static {v2}, Lثڙآ۷ۖس/؋;->ؠ(I)L؋ڽبژ٦ښيل/آ;

    move-result-object v0

    invoke-virtual {p1, v0}, Lأۺؘٻڣ/ة;->ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;

    const/4 v0, 0x0

    if-eqz v1, :cond_0

    invoke-static {v1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    iput-object v1, p1, Lأۺؘٻڣ/ة;->ؠ:[B

    :cond_0
    invoke-static {}, Lأۺؘٻڣ/ص;->؋()Lأۺؘٻڣ/ص;

    move-result-object v1

    iget-object v1, v1, Lأۺؘٻڣ/ص;->آ:Lةؽڗںۍټ٘/ت;

    invoke-virtual {p1}, Lأۺؘٻڣ/ة;->؋()Lأۺؘٻڣ/ت;

    move-result-object p1

    new-instance v2, Lةؽڗںۍټ٘/؋;

    invoke-direct {v2, v0}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lةؽڗںۍټ٘/إ;

    invoke-direct {v0, v1, p1, p2, v2}, Lةؽڗںۍټ٘/إ;-><init>(Lةؽڗںۍټ٘/ت;Lأۺؘٻڣ/ت;ILjava/lang/Runnable;)V

    iget-object p1, v1, Lةؽڗںۍټ٘/ت;->أ:Ljava/util/concurrent/Executor;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
