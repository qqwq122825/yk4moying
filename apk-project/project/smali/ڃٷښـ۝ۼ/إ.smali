.class public final Lڃٷښـ۝ۼ/إ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ب:Ljava/lang/Object;

.field public static final ة:Landroidx/collection/ArrayMap;


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Ljava/lang/String;

.field public final ء:Lڃٷښـ۝ۼ/ا;

.field public final آ:Lڊ۟چڗۙ٦/ا;

.field public final أ:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final ؤ:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final إ:Lڊ۟چڗۙ٦/خ;

.field public final ئ:Lڕۇۅؑۨؼ۫ە/؋;

.field public final ا:Ljava/util/concurrent/CopyOnWriteArrayList;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lڃٷښـ۝ۼ/إ;->ب:Ljava/lang/Object;

    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    sput-object v0, Lڃٷښـ۝ۼ/إ;->ة:Landroidx/collection/ArrayMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lڃٷښـ۝ۼ/ا;Ljava/lang/String;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lڃٷښـ۝ۼ/إ;->أ:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lڃٷښـ۝ۼ/إ;->ؤ:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lڃٷښـ۝ۼ/إ;->ا:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p1, p0, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-static {p3}, Lسۄھؤۏ۫/؋;->ؤ(Ljava/lang/String;)V

    iput-object p3, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    iput-object p2, p0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    sget-object p3, Lcom/google/firebase/provider/FirebaseInitProvider;->؋:Lڃٷښـ۝ۼ/؋;

    const-string v0, "Firebase"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    const-string v0, "ComponentDiscovery"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    const-class v2, Lcom/google/firebase/components/ComponentDiscoveryService;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    if-nez v4, :cond_0

    const-string v2, "Context has no PackageManager."

    goto :goto_0

    :cond_0
    new-instance v5, Landroid/content/ComponentName;

    invoke-direct {v5, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v6, 0x80

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " has no service info."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    iget-object v2, v4, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const-string v2, "Application info not found."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const/4 v2, 0x0

    :goto_2
    if-nez v2, :cond_2

    const-string v2, "Could not retrieve metadata, returning empty list of registrars."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_4

    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    const-string v7, "com.google.firebase.components.ComponentRegistrar"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v6, "com.google.firebase.components:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x1f

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v4, Lڊ۟چڗۙ٦/أ;

    invoke-direct {v4, v1, v2}, Lڊ۟چڗۙ٦/أ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_5
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string v0, "Runtime"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    sget-object v0, Lڍڤٜڞڽۧ/ب;->آ:Lڍڤٜڞڽۧ/ب;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v3, Lcom/google/firebase/FirebaseCommonRegistrar;

    invoke-direct {v3}, Lcom/google/firebase/FirebaseCommonRegistrar;-><init>()V

    new-instance v5, Lڊ۟چڗۙ٦/أ;

    const/4 v6, 0x1

    invoke-direct {v5, v6, v3}, Lڊ۟چڗۙ٦/أ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lcom/google/firebase/concurrent/ExecutorsRegistrar;

    invoke-direct {v3}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;-><init>()V

    new-instance v5, Lڊ۟چڗۙ٦/أ;

    invoke-direct {v5, v6, v3}, Lڊ۟چڗۙ٦/أ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-class v3, Landroid/content/Context;

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {p1, v3, v5}, Lڊ۟چڗۙ٦/ء;->ؠ(Ljava/lang/Object;Ljava/lang/Class;[Ljava/lang/Class;)Lڊ۟چڗۙ٦/ء;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-class v3, Lڃٷښـ۝ۼ/إ;

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {p0, v3, v5}, Lڊ۟چڗۙ٦/ء;->ؠ(Ljava/lang/Object;Ljava/lang/Class;[Ljava/lang/Class;)Lڊ۟چڗۙ٦/ء;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-class v3, Lڃٷښـ۝ۼ/ا;

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {p2, v3, v5}, Lڊ۟چڗۙ٦/ء;->ؠ(Ljava/lang/Object;Ljava/lang/Class;[Ljava/lang/Class;)Lڊ۟چڗۙ٦/ء;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p2, Lٽچڃ/أ;

    const/16 v3, 0x8

    invoke-direct {p2, v3}, Lٽچڃ/أ;-><init>(I)V

    invoke-static {p1}, Landroidx/core/os/UserManagerCompat;->isUserUnlocked(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_6

    sget-object v3, Lcom/google/firebase/provider/FirebaseInitProvider;->ؠ:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-eqz v3, :cond_6

    const-class v3, Lڃٷښـ۝ۼ/؋;

    new-array v5, v1, [Ljava/lang/Class;

    invoke-static {p3, v3, v5}, Lڊ۟چڗۙ٦/ء;->ؠ(Ljava/lang/Object;Ljava/lang/Class;[Ljava/lang/Class;)Lڊ۟چڗۙ٦/ء;

    move-result-object p3

    invoke-virtual {v4, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    new-instance p3, Lڊ۟چڗۙ٦/ا;

    invoke-direct {p3, v0, v2, v4, p2}, Lڊ۟چڗۙ٦/ا;-><init>(Ljava/util/concurrent/Executor;Ljava/util/List;Ljava/util/List;Lڊ۟چڗۙ٦/إ;)V

    iput-object p3, p0, Lڃٷښـ۝ۼ/إ;->آ:Lڊ۟چڗۙ٦/ا;

    invoke-static {}, Landroid/os/Trace;->endSection()V

    new-instance p2, Lڊ۟چڗۙ٦/خ;

    new-instance v0, Lڃٷښـ۝ۼ/ء;

    invoke-direct {v0, v1, p0, p1}, Lڃٷښـ۝ۼ/ء;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p2, v0}, Lڊ۟چڗۙ٦/خ;-><init>(Lڕۇۅؑۨؼ۫ە/؋;)V

    iput-object p2, p0, Lڃٷښـ۝ۼ/إ;->إ:Lڊ۟چڗۙ٦/خ;

    const-class p1, Lړجإٖټض/آ;

    invoke-interface {p3, p1}, Lڊ۟چڗۙ٦/آ;->ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    iput-object p1, p0, Lڃٷښـ۝ۼ/إ;->ئ:Lڕۇۅؑۨؼ۫ە/؋;

    new-instance p1, Lڃٷښـ۝ۼ/آ;

    invoke-direct {p1, p0}, Lڃٷښـ۝ۼ/آ;-><init>(Lڃٷښـ۝ۼ/إ;)V

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object p2, p0, Lڃٷښـ۝ۼ/إ;->أ:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    if-eqz p2, :cond_7

    sget-object p2, Lذ٨ۍ/ء;->أ:Lذ٨ۍ/ء;

    iget-object p2, p2, Lذ٨ۍ/ء;->؋:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    :cond_7
    iget-object p2, p0, Lڃٷښـ۝ۼ/إ;->ا:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method

.method public static ؠ()Lڃٷښـ۝ۼ/إ;
    .locals 4

    const-string v0, "Default FirebaseApp is not initialized in this process "

    sget-object v1, Lڃٷښـ۝ۼ/إ;->ب:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lڃٷښـ۝ۼ/إ;->ة:Landroidx/collection/ArrayMap;

    const-string v3, "[DEFAULT]"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lڃٷښـ۝ۼ/إ;

    if-eqz v2, :cond_0

    iget-object v0, v2, Lڃٷښـ۝ۼ/إ;->ئ:Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {v0}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lړجإٖټض/آ;

    invoke-virtual {v0}, Lړجإٖټض/آ;->ؠ()V

    monitor-exit v1

    return-object v2

    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lںڍڒڸ/ش;->ػ()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Make sure to call FirebaseApp.initializeApp(Context) first."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static أ(Landroid/content/Context;)Lڃٷښـ۝ۼ/إ;
    .locals 3

    sget-object v0, Lڃٷښـ۝ۼ/إ;->ب:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڃٷښـ۝ۼ/إ;->ة:Landroidx/collection/ArrayMap;

    const-string v2, "[DEFAULT]"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lڃٷښـ۝ۼ/إ;->ؠ()Lڃٷښـ۝ۼ/إ;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :cond_0
    invoke-static {p0}, Lڃٷښـ۝ۼ/ا;->؋(Landroid/content/Context;)Lڃٷښـ۝ۼ/ا;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "FirebaseApp"

    const-string v1, "Default FirebaseApp failed to initialize because no default options were found. This usually means that com.google.gms:google-services was not applied to your gradle project."

    invoke-static {p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :cond_1
    invoke-static {p0, v1}, Lڃٷښـ۝ۼ/إ;->ؤ(Landroid/content/Context;Lڃٷښـ۝ۼ/ا;)Lڃٷښـ۝ۼ/إ;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static ؤ(Landroid/content/Context;Lڃٷښـ۝ۼ/ا;)Lڃٷښـ۝ۼ/إ;
    .locals 6

    sget-object v0, Lڃٷښـ۝ۼ/أ;->؋:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Application;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    sget-object v2, Lڃٷښـ۝ۼ/أ;->؋:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_4

    new-instance v3, Lڃٷښـ۝ۼ/أ;

    invoke-direct {v3}, Lڃٷښـ۝ۼ/أ;-><init>()V

    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v2, v1

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_4

    sget-object v2, Lذ٨ۍ/ء;->أ:Lذ٨ۍ/ء;

    monitor-enter v2

    :try_start_0
    iget-boolean v4, v2, Lذ٨ۍ/ء;->آ:Z

    if-nez v4, :cond_3

    invoke-virtual {v0, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-virtual {v0, v2}, Landroid/app/Application;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    iput-boolean v1, v2, Lذ٨ۍ/ء;->آ:Z

    :cond_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter v2

    :try_start_1
    iget-object v0, v2, Lذ٨ۍ/ء;->ء:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_1
    move-exception p0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0

    :cond_4
    :goto_1
    const-string v0, "[DEFAULT]"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    :goto_2
    sget-object v2, Lڃٷښـ۝ۼ/إ;->ب:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    sget-object v3, Lڃٷښـ۝ۼ/إ;->ة:Landroidx/collection/ArrayMap;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    xor-int/2addr v1, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FirebaseApp name "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " already exists!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lسۄھؤۏ۫/؋;->ة(Ljava/lang/String;Z)V

    const-string v1, "Application context cannot be null."

    invoke-static {p0, v1}, Lسۄھؤۏ۫/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lڃٷښـ۝ۼ/إ;

    invoke-direct {v1, p0, p1, v0}, Lڃٷښـ۝ۼ/إ;-><init>(Landroid/content/Context;Lڃٷښـ۝ۼ/ا;Ljava/lang/String;)V

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->آ()V

    return-object v1

    :catchall_2
    move-exception p0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lڃٷښـ۝ۼ/إ;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    iget-object p1, p1, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Lآۋۻؾ۹/ة;

    invoke-direct {v0, p0}, Lآۋۻؾ۹/ة;-><init>(Ljava/lang/Object;)V

    const-string v1, "name"

    iget-object v2, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "options"

    iget-object v2, p0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    invoke-virtual {v0, v2, v1}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lآۋۻؾ۹/ة;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋()V
    .locals 2

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->ؤ:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "FirebaseApp was deleted"

    invoke-static {v1, v0}, Lسۄھؤۏ۫/؋;->ة(Ljava/lang/String;Z)V

    return-void
.end method

.method public final ء()Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0xb

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    invoke-static {v1, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, p0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v1, v1, Lڃٷښـ۝ۼ/ا;->ؠ:Ljava/lang/String;

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v1, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final آ()V
    .locals 8

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/os/UserManagerCompat;->isUserUnlocked(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    const-string v0, "FirebaseApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Device in Direct Boot Mode: postponing initialization of Firebase APIs for app "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v5, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    sget-object v4, Lڃٷښـ۝ۼ/ؤ;->ؠ:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_6

    new-instance v5, Lڃٷښـ۝ۼ/ؤ;

    invoke-direct {v5, v0}, Lڃٷښـ۝ۼ/ؤ;-><init>(Landroid/content/Context;)V

    :cond_0
    invoke-virtual {v4, v3, v5}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_0

    move v1, v2

    :goto_0
    if-eqz v1, :cond_6

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.USER_UNLOCKED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_3

    :cond_2
    const-string v0, "FirebaseApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Device unlocked: initializing all Firebase APIs for app "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v5, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->آ:Lڊ۟چڗۙ٦/ا;

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v4, "[DEFAULT]"

    iget-object v5, p0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, v0, Lڊ۟چڗۙ٦/ا;->ؤ:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_3
    invoke-virtual {v5, v3, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_3

    move v1, v2

    :goto_1
    if-nez v1, :cond_5

    goto :goto_2

    :cond_5
    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    iget-object v2, v0, Lڊ۟چڗۙ٦/ا;->؋:Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0, v1, v4}, Lڊ۟چڗۙ٦/ا;->إ(Ljava/util/Map;Z)V

    :goto_2
    iget-object v0, p0, Lڃٷښـ۝ۼ/إ;->ئ:Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {v0}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lړجإٖټض/آ;

    invoke-virtual {v0}, Lړجإٖټض/آ;->ؠ()V

    :cond_6
    :goto_3
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
