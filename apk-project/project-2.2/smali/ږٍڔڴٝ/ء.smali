.class public final Lږٍڔڴٝ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lږٍڔڴٝ/آ;


# static fields
.field public static final ث:Ljava/lang/Object;


# instance fields
.field public final ؋:Lڃٷښـ۝ۼ/إ;

.field public final ؠ:Lڗًقڔ/أ;

.field public final ء:Lآۋۻؾ۹/ة;

.field public final آ:Lږٍڔڴٝ/ب;

.field public final أ:Lڊ۟چڗۙ٦/خ;

.field public final ؤ:Lږٍڔڴٝ/ئ;

.field public final إ:Ljava/lang/Object;

.field public final ئ:Ljava/util/concurrent/ExecutorService;

.field public final ا:Ljava/util/concurrent/Executor;

.field public ب:Ljava/lang/String;

.field public final ة:Ljava/util/HashSet;

.field public final ت:Ljava/util/ArrayList;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lږٍڔڴٝ/ء;->ث:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Lڃٷښـ۝ۼ/إ;Lڕۇۅؑۨؼ۫ە/؋;Ljava/util/concurrent/ExecutorService;Lڍڤٜڞڽۧ/ا;)V
    .locals 5

    new-instance v0, Lڗًقڔ/أ;

    invoke-virtual {p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, p1, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-direct {v0, v1, p2}, Lڗًقڔ/أ;-><init>(Landroid/content/Context;Lڕۇۅؑۨؼ۫ە/؋;)V

    new-instance p2, Lآۋۻؾ۹/ة;

    invoke-direct {p2, p1}, Lآۋۻؾ۹/ة;-><init>(Lڃٷښـ۝ۼ/إ;)V

    sget-object v1, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    if-nez v1, :cond_0

    new-instance v1, Lٽچڃ/أ;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Lٽچڃ/أ;-><init>(I)V

    sput-object v1, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    :cond_0
    sget-object v1, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    sget-object v2, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    if-nez v2, :cond_1

    new-instance v2, Lږٍڔڴٝ/ب;

    invoke-direct {v2, v1}, Lږٍڔڴٝ/ب;-><init>(Lٽچڃ/أ;)V

    sput-object v2, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    :cond_1
    sget-object v1, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    new-instance v2, Lڊ۟چڗۙ٦/خ;

    new-instance v3, Lڊ۟چڗۙ٦/أ;

    const/4 v4, 0x2

    invoke-direct {v3, v4, p1}, Lڊ۟چڗۙ٦/أ;-><init>(ILjava/lang/Object;)V

    invoke-direct {v2, v3}, Lڊ۟چڗۙ٦/خ;-><init>(Lڕۇۅؑۨؼ۫ە/؋;)V

    new-instance v3, Lږٍڔڴٝ/ئ;

    invoke-direct {v3}, Lږٍڔڴٝ/ئ;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v4, Ljava/lang/Object;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v4, p0, Lږٍڔڴٝ/ء;->إ:Ljava/lang/Object;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lږٍڔڴٝ/ء;->ة:Ljava/util/HashSet;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lږٍڔڴٝ/ء;->ت:Ljava/util/ArrayList;

    iput-object p1, p0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    iput-object v0, p0, Lږٍڔڴٝ/ء;->ؠ:Lڗًقڔ/أ;

    iput-object p2, p0, Lږٍڔڴٝ/ء;->ء:Lآۋۻؾ۹/ة;

    iput-object v1, p0, Lږٍڔڴٝ/ء;->آ:Lږٍڔڴٝ/ب;

    iput-object v2, p0, Lږٍڔڴٝ/ء;->أ:Lڊ۟چڗۙ٦/خ;

    iput-object v3, p0, Lږٍڔڴٝ/ء;->ؤ:Lږٍڔڴٝ/ئ;

    iput-object p3, p0, Lږٍڔڴٝ/ء;->ئ:Ljava/util/concurrent/ExecutorService;

    iput-object p4, p0, Lږٍڔڴٝ/ء;->ا:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public final ؋(Z)V
    .locals 7

    sget-object v0, Lږٍڔڴٝ/ء;->ث:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v1, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-static {v1}, Lآۋۻؾ۹/ة;->ؠ(Landroid/content/Context;)Lآۋۻؾ۹/ة;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p0, Lږٍڔڴٝ/ء;->ء:Lآۋۻؾ۹/ة;

    invoke-virtual {v2}, Lآۋۻؾ۹/ة;->ب()Lږۄڙ/؋;

    move-result-object v2

    sget-object v3, Lږۄڙ/ء;->أ:Lږۄڙ/ء;

    iget-object v4, v2, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    const/4 v5, 0x1

    if-eq v4, v3, :cond_1

    sget-object v3, Lږۄڙ/ء;->آ:Lږۄڙ/ء;

    if-ne v4, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v3, v5

    :goto_1
    if-eqz v3, :cond_2

    invoke-virtual {p0, v2}, Lږٍڔڴٝ/ء;->ؤ(Lږۄڙ/؋;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lږٍڔڴٝ/ء;->ء:Lآۋۻؾ۹/ة;

    new-instance v6, Lآۋۻؾ۹/ث;

    invoke-direct {v6, v2}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    iput-object v3, v6, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    sget-object v2, Lږۄڙ/ء;->ؤ:Lږۄڙ/ء;

    invoke-virtual {v6, v2}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    invoke-virtual {v6}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v2

    invoke-virtual {v4, v2}, Lآۋۻؾ۹/ة;->ا(Lږۄڙ/؋;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    if-eqz v1, :cond_3

    :try_start_2
    invoke-virtual {v1}, Lآۋۻؾ۹/ة;->ة()V

    :cond_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p1, :cond_4

    new-instance v0, Lآۋۻؾ۹/ث;

    invoke-direct {v0, v2}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    const/4 v1, 0x0

    iput-object v1, v0, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    invoke-virtual {v0}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v2

    :cond_4
    invoke-virtual {p0, v2}, Lږٍڔڴٝ/ء;->ئ(Lږۄڙ/؋;)V

    iget-object v0, p0, Lږٍڔڴٝ/ء;->ا:Ljava/util/concurrent/Executor;

    new-instance v1, Lږٍڔڴٝ/ؠ;

    invoke-direct {v1, p0, p1, v5}, Lږٍڔڴٝ/ؠ;-><init>(Ljava/lang/Object;ZI)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    if-eqz v1, :cond_5

    :try_start_3
    invoke-virtual {v1}, Lآۋۻؾ۹/ة;->ة()V

    :cond_5
    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public final ؠ(Lږۄڙ/؋;)Lږۄڙ/؋;
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    iget-object v2, v1, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v2}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v2, v2, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v2, v2, Lڃٷښـ۝ۼ/ا;->؋:Ljava/lang/String;

    iget-object v3, v0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    iget-object v4, v1, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v4}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v4, v4, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v4, v4, Lڃٷښـ۝ۼ/ا;->إ:Ljava/lang/String;

    iget-object v5, v0, Lږۄڙ/؋;->آ:Ljava/lang/String;

    iget-object v6, v1, Lږٍڔڴٝ/ء;->ؠ:Lڗًقڔ/أ;

    iget-object v7, v6, Lڗًقڔ/أ;->ء:Lڗًقڔ/إ;

    monitor-enter v7

    :try_start_0
    iget v8, v7, Lڗًقڔ/إ;->ء:I

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v8, :cond_1

    iget-object v8, v7, Lڗًقڔ/إ;->؋:Lږٍڔڴٝ/ب;

    iget-object v8, v8, Lږٍڔڴٝ/ب;->؋:Lٽچڃ/أ;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    iget-wide v13, v7, Lڗًقڔ/إ;->ؠ:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    cmp-long v8, v11, v13

    if-lez v8, :cond_0

    goto :goto_0

    :cond_0
    move v8, v9

    goto :goto_1

    :cond_1
    :goto_0
    move v8, v10

    :goto_1
    monitor-exit v7

    const-string v11, "Firebase Installations Service is unavailable. Please try again later."

    if-eqz v8, :cond_c

    const-string v8, "projects/%s/installations/%s/authTokens:generate"

    filled-new-array {v4, v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v8, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lڗًقڔ/أ;->؋(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    move v8, v9

    :goto_2
    if-gt v8, v10, :cond_b

    const v12, 0x8003

    invoke-static {v12}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    invoke-virtual {v6, v3, v2}, Lڗًقڔ/أ;->ء(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v12

    :try_start_1
    const-string v13, "POST"

    invoke-virtual {v12, v13}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v13, "Authorization"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "FIS_v2 "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/net/URLConnection;->setDoOutput(Z)V

    invoke-static {v12}, Lڗًقڔ/أ;->ئ(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    invoke-virtual {v7, v13}, Lڗًقڔ/إ;->؋(I)V

    const/16 v14, 0xc8

    if-lt v13, v14, :cond_2

    const/16 v14, 0x12c

    if-ge v13, v14, :cond_2

    move v14, v10

    goto :goto_3

    :cond_2
    move v14, v9

    :goto_3
    const/4 v15, 0x0

    if-eqz v14, :cond_3

    invoke-static {v12}, Lڗًقڔ/أ;->ؤ(Ljava/net/HttpURLConnection;)Lڗًقڔ/آ;

    move-result-object v2

    goto :goto_6

    :cond_3
    invoke-static {v12, v15, v2, v4}, Lڗًقڔ/أ;->ؠ(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v14, 0x191

    const-wide/16 v16, 0x0

    if-eq v13, v14, :cond_7

    const/16 v14, 0x194

    if-ne v13, v14, :cond_4

    goto :goto_4

    :cond_4
    const/16 v14, 0x1ad

    if-eq v13, v14, :cond_6

    const/16 v14, 0x1f4

    if-lt v13, v14, :cond_5

    const/16 v14, 0x258

    if-ge v13, v14, :cond_5

    goto/16 :goto_7

    :cond_5
    const-string v13, "Firebase-Installations"

    const-string v14, "Firebase Installations can not communicate with Firebase server APIs due to invalid configuration. Please update your Firebase initialization process and set valid Firebase options (API key, Project ID, Application ID) when initializing Firebase."

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v13, Lةؽڗںۍټ٘/ء;

    invoke-direct {v13}, Lةؽڗںۍټ٘/ء;-><init>()V

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    iput-object v14, v13, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    sget-object v14, Lڗًقڔ/ئ;->أ:Lڗًقڔ/ئ;

    goto :goto_5

    :cond_6
    new-instance v13, Lږٍڔڴٝ/أ;

    const-string v14, "Firebase servers have received too many requests from this client in a short period of time. Please try again later."

    invoke-direct {v13, v14}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v13

    :cond_7
    :goto_4
    new-instance v13, Lةؽڗںۍټ٘/ء;

    invoke-direct {v13}, Lةؽڗںۍټ٘/ء;-><init>()V

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    iput-object v14, v13, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    sget-object v14, Lڗًقڔ/ئ;->ؤ:Lڗًقڔ/ئ;

    :goto_5
    iput-object v14, v13, Lةؽڗںۍټ٘/ء;->ؤ:Ljava/lang/Object;

    invoke-virtual {v13}, Lةؽڗںۍټ٘/ء;->ء()Lڗًقڔ/آ;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_6
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    iget-object v3, v2, Lڗًقڔ/آ;->ء:Lڗًقڔ/ئ;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_a

    if-eq v3, v10, :cond_9

    const/4 v2, 0x2

    if-ne v3, v2, :cond_8

    monitor-enter p0

    :try_start_2
    iput-object v15, v1, Lږٍڔڴٝ/ء;->ب:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    new-instance v2, Lآۋۻؾ۹/ث;

    invoke-direct {v2, v0}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    sget-object v0, Lږۄڙ/ء;->أ:Lږۄڙ/ء;

    invoke-virtual {v2, v0}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    invoke-virtual {v2}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    move-object v2, v0

    monitor-exit p0

    throw v2

    :cond_8
    new-instance v0, Lږٍڔڴٝ/أ;

    invoke-direct {v0, v11}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    new-instance v2, Lآۋۻؾ۹/ث;

    invoke-direct {v2, v0}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    const-string v0, "BAD CONFIG"

    iput-object v0, v2, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    sget-object v0, Lږۄڙ/ء;->ئ:Lږۄڙ/ء;

    invoke-virtual {v2, v0}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    invoke-virtual {v2}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v0

    return-object v0

    :cond_a
    iget-object v3, v1, Lږٍڔڴٝ/ء;->آ:Lږٍڔڴٝ/ب;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v3, v3, Lږٍڔڴٝ/ب;->؋:Lٽچڃ/أ;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v3

    new-instance v5, Lآۋۻؾ۹/ث;

    invoke-direct {v5, v0}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    iget-object v0, v2, Lڗًقڔ/آ;->؋:Ljava/lang/String;

    iput-object v0, v5, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    iget-wide v6, v2, Lڗًقڔ/آ;->ؠ:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v5, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v5, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    invoke-virtual {v5}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v0

    return-object v0

    :catchall_1
    move-exception v0

    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    throw v0

    :catch_0
    :goto_7
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2

    :cond_b
    new-instance v0, Lږٍڔڴٝ/أ;

    invoke-direct {v0, v11}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    new-instance v0, Lږٍڔڴٝ/أ;

    invoke-direct {v0, v11}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_2
    move-exception v0

    monitor-exit v7

    throw v0
.end method

.method public final ء()Lؾپۑ۟ڂڷ/ح;
    .locals 4

    invoke-virtual {p0}, Lږٍڔڴٝ/ء;->أ()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lږٍڔڴٝ/ء;->ب:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit p0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    new-instance v1, Lږٍڔڴٝ/إ;

    invoke-direct {v1, v0}, Lږٍڔڴٝ/إ;-><init>(Lؾپۑ۟ڂڷ/ا;)V

    iget-object v2, p0, Lږٍڔڴٝ/ء;->إ:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    iget-object v3, p0, Lږٍڔڴٝ/ء;->ت:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    iget-object v1, p0, Lږٍڔڴٝ/ء;->ئ:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v3, 0xc

    invoke-direct {v2, v3, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final آ()Lؾپۑ۟ڂڷ/ح;
    .locals 4

    invoke-virtual {p0}, Lږٍڔڴٝ/ء;->أ()V

    new-instance v0, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    new-instance v1, Lږٍڔڴٝ/ؤ;

    iget-object v2, p0, Lږٍڔڴٝ/ء;->آ:Lږٍڔڴٝ/ب;

    invoke-direct {v1, v2, v0}, Lږٍڔڴٝ/ؤ;-><init>(Lږٍڔڴٝ/ب;Lؾپۑ۟ڂڷ/ا;)V

    iget-object v2, p0, Lږٍڔڴٝ/ء;->إ:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lږٍڔڴٝ/ء;->ت:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v1, Lږٍڔڴٝ/ؠ;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, v2}, Lږٍڔڴٝ/ؠ;-><init>(Ljava/lang/Object;ZI)V

    iget-object v2, p0, Lږٍڔڴٝ/ء;->ئ:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final أ()V
    .locals 5

    iget-object v0, p0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v1, v1, Lڃٷښـ۝ۼ/ا;->ؠ:Ljava/lang/String;

    const-string v2, "Please set your Application ID. A valid Firebase App ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options."

    invoke-static {v2, v1}, Lسۄھؤۏ۫/؋;->إ(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v1, v1, Lڃٷښـ۝ۼ/ا;->إ:Ljava/lang/String;

    const-string v3, "Please set your Project ID. A valid Firebase Project ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options."

    invoke-static {v3, v1}, Lسۄھؤۏ۫/؋;->إ(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v1, v1, Lڃٷښـ۝ۼ/ا;->؋:Ljava/lang/String;

    const-string v3, "Please set a valid API key. A Firebase API key is required to communicate with Firebase server APIs: It authenticates your project with Google.Please refer to https://firebase.google.com/support/privacy/init-options."

    invoke-static {v3, v1}, Lسۄھؤۏ۫/؋;->إ(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v1, v0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v1, v1, Lڃٷښـ۝ۼ/ا;->ؠ:Ljava/lang/String;

    sget-object v4, Lږٍڔڴٝ/ب;->ء:Ljava/util/regex/Pattern;

    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v0, v0, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v0, v0, Lڃٷښـ۝ۼ/ا;->؋:Ljava/lang/String;

    sget-object v1, Lږٍڔڴٝ/ب;->ء:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ؤ(Lږۄڙ/؋;)Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v0, v0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    const-string v1, "CHIME_ANDROID_SDK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v1, "[DEFAULT]"

    iget-object v0, v0, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    sget-object v0, Lږۄڙ/ء;->آ:Lږۄڙ/ء;

    iget-object p1, p1, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_3

    :cond_2
    iget-object p1, p0, Lږٍڔڴٝ/ء;->ؤ:Lږٍڔڴٝ/ئ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lږٍڔڴٝ/ئ;->؋()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    iget-object p1, p0, Lږٍڔڴٝ/ء;->أ:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {p1}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lږۄڙ/ؠ;

    iget-object v0, p1, Lږۄڙ/ؠ;->؋:Landroid/content/SharedPreferences;

    monitor-enter v0

    :try_start_0
    iget-object v1, p1, Lږۄڙ/ؠ;->؋:Landroid/content/SharedPreferences;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p1, Lږۄڙ/ؠ;->؋:Landroid/content/SharedPreferences;

    const-string v3, "|S|id"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    :try_start_2
    invoke-virtual {p1}, Lږۄڙ/ؠ;->؋()Ljava/lang/String;

    move-result-object v2

    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lږٍڔڴٝ/ء;->ؤ:Lږٍڔڴٝ/ئ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lږٍڔڴٝ/ئ;->؋()Ljava/lang/String;

    move-result-object v2

    :cond_5
    return-object v2

    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1
.end method

.method public final إ(Lږۄڙ/؋;)Lږۄڙ/؋;
    .locals 22

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    iget-object v2, v0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v5, 0xb

    if-ne v2, v5, :cond_3

    iget-object v2, v1, Lږٍڔڴٝ/ء;->أ:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {v2}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lږۄڙ/ؠ;

    iget-object v5, v2, Lږۄڙ/ؠ;->؋:Landroid/content/SharedPreferences;

    monitor-enter v5

    :try_start_0
    sget-object v6, Lږۄڙ/ؠ;->ء:[Ljava/lang/String;

    const/4 v7, 0x0

    :goto_0
    const/4 v8, 0x4

    if-ge v7, v8, :cond_1

    aget-object v8, v6, v7

    iget-object v9, v2, Lږۄڙ/ؠ;->ؠ:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "|T|"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v2, Lږۄڙ/ؠ;->؋:Landroid/content/SharedPreferences;

    invoke-interface {v9, v8, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    const-string v2, "{"

    invoke-virtual {v8, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "token"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_0
    move-object v4, v8

    :catch_0
    :cond_1
    :goto_1
    :try_start_2
    monitor-exit v5

    goto :goto_2

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_3
    :goto_2
    iget-object v2, v1, Lږٍڔڴٝ/ء;->ؠ:Lڗًقڔ/أ;

    iget-object v5, v1, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v5}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v5, v5, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v5, v5, Lڃٷښـ۝ۼ/ا;->؋:Ljava/lang/String;

    iget-object v6, v0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    iget-object v7, v1, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v7}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v7, v7, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v7, v7, Lڃٷښـ۝ۼ/ا;->إ:Ljava/lang/String;

    iget-object v8, v1, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v8}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v8, v8, Lڃٷښـ۝ۼ/إ;->ء:Lڃٷښـ۝ۼ/ا;

    iget-object v8, v8, Lڃٷښـ۝ۼ/ا;->ؠ:Ljava/lang/String;

    iget-object v9, v2, Lڗًقڔ/أ;->ء:Lڗًقڔ/إ;

    monitor-enter v9

    :try_start_3
    iget v10, v9, Lڗًقڔ/إ;->ء:I

    const/4 v11, 0x1

    if-eqz v10, :cond_5

    iget-object v10, v9, Lڗًقڔ/إ;->؋:Lږٍڔڴٝ/ب;

    iget-object v10, v10, Lږٍڔڴٝ/ب;->؋:Lٽچڃ/أ;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    iget-wide v14, v9, Lڗًقڔ/إ;->ؠ:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    cmp-long v10, v12, v14

    if-lez v10, :cond_4

    goto :goto_3

    :cond_4
    const/4 v10, 0x0

    goto :goto_4

    :cond_5
    :goto_3
    move v10, v11

    :goto_4
    monitor-exit v9

    const-string v12, "Firebase Installations Service is unavailable. Please try again later."

    if-eqz v10, :cond_e

    const-string v10, "projects/%s/installations"

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v13

    invoke-static {v10, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lڗًقڔ/أ;->؋(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v10

    const/4 v13, 0x0

    :goto_5
    if-gt v13, v11, :cond_d

    const v14, 0x8001

    invoke-static {v14}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    invoke-virtual {v2, v10, v5}, Lڗًقڔ/أ;->ء(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v14

    :try_start_4
    const-string v15, "POST"

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/net/URLConnection;->setDoOutput(Z)V

    if-eqz v4, :cond_6

    const-string v15, "x-goog-fis-android-iid-migration-auth"

    invoke-virtual {v14, v15, v4}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    invoke-static {v14, v6, v8}, Lڗًقڔ/أ;->إ(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v15

    invoke-virtual {v9, v15}, Lڗًقڔ/إ;->؋(I)V

    const/16 v3, 0xc8

    if-lt v15, v3, :cond_7

    const/16 v3, 0x12c

    if-ge v15, v3, :cond_7

    move v3, v11

    goto :goto_6

    :cond_7
    const/4 v3, 0x0

    :goto_6
    if-eqz v3, :cond_8

    invoke-static {v14}, Lڗًقڔ/أ;->أ(Ljava/net/HttpURLConnection;)Lڗًقڔ/ؠ;

    move-result-object v2

    goto :goto_7

    :cond_8
    invoke-static {v14, v8, v5, v7}, Lڗًقڔ/أ;->ؠ(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0x1ad

    if-eq v15, v3, :cond_c

    const/16 v3, 0x1f4

    if-lt v15, v3, :cond_9

    const/16 v3, 0x258

    if-ge v15, v3, :cond_9

    goto/16 :goto_8

    :cond_9
    const-string v3, "Firebase-Installations"

    const-string v15, "Firebase Installations can not communicate with Firebase server APIs due to invalid configuration. Please update your Firebase initialization process and set valid Firebase options (API key, Project ID, Application ID) when initializing Firebase."

    invoke-static {v3, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v20, 0x0

    const/16 v19, 0x0

    const/16 v18, 0x0

    const/16 v17, 0x0

    sget-object v21, Lڗًقڔ/ؤ;->أ:Lڗًقڔ/ؤ;

    new-instance v3, Lڗًقڔ/ؠ;

    move-object/from16 v16, v3

    invoke-direct/range {v16 .. v21}, Lڗًقڔ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lڗًقڔ/آ;Lڗًقڔ/ؤ;)V
    :try_end_4
    .catch Ljava/lang/AssertionError; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v2, v3

    :goto_7
    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    iget-object v3, v2, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_b

    if-ne v3, v11, :cond_a

    new-instance v2, Lآۋۻؾ۹/ث;

    invoke-direct {v2, v0}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    const-string v0, "BAD CONFIG"

    iput-object v0, v2, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    sget-object v0, Lږۄڙ/ء;->ئ:Lږۄڙ/ء;

    invoke-virtual {v2, v0}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    invoke-virtual {v2}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v0

    return-object v0

    :cond_a
    new-instance v0, Lږٍڔڴٝ/أ;

    const-string v2, "Firebase Installations Service is unavailable. Please try again later."

    invoke-direct {v0, v2}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    iget-object v3, v2, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    iget-object v4, v2, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    iget-object v5, v1, Lږٍڔڴٝ/ء;->آ:Lږٍڔڴٝ/ب;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v5, v5, Lږٍڔڴٝ/ب;->؋:Lٽچڃ/أ;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v5

    iget-object v2, v2, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    iget-object v7, v2, Lڗًقڔ/آ;->؋:Ljava/lang/String;

    iget-wide v8, v2, Lڗًقڔ/آ;->ؠ:J

    new-instance v2, Lآۋۻؾ۹/ث;

    invoke-direct {v2, v0}, Lآۋۻؾ۹/ث;-><init>(Lږۄڙ/؋;)V

    iput-object v3, v2, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    sget-object v0, Lږۄڙ/ء;->إ:Lږۄڙ/ء;

    invoke-virtual {v2, v0}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    iput-object v7, v2, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    iput-object v4, v2, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v2, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v2, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    invoke-virtual {v2}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    move-result-object v0

    return-object v0

    :cond_c
    :try_start_5
    new-instance v3, Lږٍڔڴٝ/أ;

    const-string v15, "Firebase servers have received too many requests from this client in a short period of time. Please try again later."

    invoke-direct {v3, v15}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    throw v0

    :catch_1
    :goto_8
    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_5

    :cond_d
    new-instance v0, Lږٍڔڴٝ/أ;

    invoke-direct {v0, v12}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    new-instance v0, Lږٍڔڴٝ/أ;

    invoke-direct {v0, v12}, Lږٍڔڴٝ/أ;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_2
    move-exception v0

    monitor-exit v9

    throw v0
.end method

.method public final ئ(Lږۄڙ/؋;)V
    .locals 3

    iget-object v0, p0, Lږٍڔڴٝ/ء;->إ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lږٍڔڴٝ/ء;->ت:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lږٍڔڴٝ/ا;

    invoke-interface {v2, p1}, Lږٍڔڴٝ/ا;->ؠ(Lږۄڙ/؋;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
