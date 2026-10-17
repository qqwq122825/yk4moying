.class public final Lإٿ٢/إ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lآۋۻؾ۹/ة;

.field public final ؠ:Lإٿ٢/أ;

.field public final ء:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lإٿ٢/أ;)V
    .locals 2

    new-instance v0, Lآۋۻؾ۹/ة;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p1}, Lآۋۻؾ۹/ة;-><init>(ILjava/lang/Object;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lإٿ٢/إ;->ء:Ljava/util/HashMap;

    iput-object v0, p0, Lإٿ٢/إ;->؋:Lآۋۻؾ۹/ة;

    iput-object p2, p0, Lإٿ٢/إ;->ؠ:Lإٿ٢/أ;

    return-void
.end method


# virtual methods
.method public final declared-synchronized ؋(Ljava/lang/String;)Lإٿ٢/ئ;
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lإٿ٢/إ;->ء:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lإٿ٢/إ;->ء:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lإٿ٢/ئ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lإٿ٢/إ;->؋:Lآۋۻؾ۹/ة;

    invoke-virtual {v0, p1}, Lآۋۻؾ۹/ة;->ؤ(Ljava/lang/String;)Lcom/google/android/datatransport/cct/CctBackendFactory;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    :cond_1
    :try_start_2
    iget-object v1, p0, Lإٿ٢/إ;->ؠ:Lإٿ٢/أ;

    new-instance v2, Lإٿ٢/ؠ;

    iget-object v3, v1, Lإٿ٢/أ;->؋:Landroid/content/Context;

    iget-object v4, v1, Lإٿ٢/أ;->ؠ:Lثڈا/؋;

    iget-object v1, v1, Lإٿ٢/أ;->ء:Lثڈا/؋;

    invoke-direct {v2, v3, v4, v1, p1}, Lإٿ٢/ؠ;-><init>(Landroid/content/Context;Lثڈا/؋;Lثڈا/؋;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/google/android/datatransport/cct/CctBackendFactory;->create(Lإٿ٢/آ;)Lإٿ٢/ئ;

    move-result-object v0

    iget-object v1, p0, Lإٿ٢/إ;->ء:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
