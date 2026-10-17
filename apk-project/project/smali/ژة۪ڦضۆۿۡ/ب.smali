.class public final Lژة۪ڦضۆۿۡ/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ء:Ljava/lang/Object;

.field public static آ:Lژة۪ڦضۆۿۡ/ق;


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Landroidx/arch/core/executor/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lژة۪ڦضۆۿۡ/ب;->ء:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ب;->؋:Landroid/content/Context;

    new-instance p1, Landroidx/arch/core/executor/؋;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, Landroidx/arch/core/executor/؋;-><init>(I)V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ب;->ؠ:Landroidx/arch/core/executor/؋;

    return-void
.end method

.method public static ؋(Landroid/content/Context;Landroid/content/Intent;Z)Lؾپۑ۟ڂڷ/ح;
    .locals 4

    const-string v0, "FirebaseMessaging"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FirebaseMessaging"

    const-string v1, "Binding to service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lژة۪ڦضۆۿۡ/ب;->ء:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lژة۪ڦضۆۿۡ/ب;->آ:Lژة۪ڦضۆۿۡ/ق;

    if-nez v1, :cond_1

    new-instance v1, Lژة۪ڦضۆۿۡ/ق;

    invoke-direct {v1, p0}, Lژة۪ڦضۆۿۡ/ق;-><init>(Landroid/content/Context;)V

    sput-object v1, Lژة۪ڦضۆۿۡ/ب;->آ:Lژة۪ڦضۆۿۡ/ق;

    :cond_1
    sget-object v1, Lژة۪ڦضۆۿۡ/ب;->آ:Lژة۪ڦضۆۿۡ/ق;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz p2, :cond_5

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object p2

    invoke-virtual {p2, p0}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_4

    sget-object p2, Lژة۪ڦضۆۿۡ/ؿ;->ؠ:Ljava/lang/Object;

    monitor-enter p2

    :try_start_1
    sget-object v0, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    const/4 v2, 0x1

    if-nez v0, :cond_2

    new-instance v0, Lؽىږګګؓط/؋;

    invoke-direct {v0, p0}, Lؽىږګګؓط/؋;-><init>(Landroid/content/Context;)V

    sput-object v0, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    iget-object p0, v0, Lؽىږګګؓط/؋;->؋:Ljava/lang/Object;

    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iput-boolean v2, v0, Lؽىږګګؓط/؋;->إ:Z

    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1

    :cond_2
    :goto_0
    const-string p0, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    const-string v0, "com.google.firebase.iid.WakeLockHolder.wakefulintent"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-nez p0, :cond_3

    sget-object p0, Lژة۪ڦضۆۿۡ/ؿ;->ء:Lؽىږګګؓط/؋;

    sget-wide v2, Lژة۪ڦضۆۿۡ/ؿ;->؋:J

    invoke-virtual {p0, v2, v3}, Lؽىږګګؓط/؋;->؋(J)V

    :cond_3
    invoke-virtual {v1, p1}, Lژة۪ڦضۆۿۡ/ق;->ؠ(Landroid/content/Intent;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p0

    new-instance v0, Landroidx/constraintlayout/core/state/؋;

    const/16 v1, 0xc

    invoke-direct {v0, v1, p1}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lؾپۑ۟ڂڷ/ب;->؋:Lأۺؘٻڣ/ذ;

    new-instance v1, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v1, p1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v1}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    monitor-exit p2

    goto :goto_1

    :catchall_1
    move-exception p0

    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0

    :cond_4
    invoke-virtual {v1, p1}, Lژة۪ڦضۆۿۡ/ق;->ؠ(Landroid/content/Intent;)Lؾپۑ۟ڂڷ/ح;

    :goto_1
    const/4 p0, -0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p0

    return-object p0

    :cond_5
    invoke-virtual {v1, p1}, Lژة۪ڦضۆۿۡ/ق;->ؠ(Landroid/content/Intent;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p0

    new-instance p1, Landroidx/arch/core/executor/؋;

    const/16 p2, 0x9

    invoke-direct {p1, p2}, Landroidx/arch/core/executor/؋;-><init>(I)V

    new-instance p2, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v0, 0x1c

    invoke-direct {p2, v0}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-virtual {p0, p1, p2}, Lؾپۑ۟ڂڷ/ح;->ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p0

    return-object p0

    :catchall_2
    move-exception p0

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p0
.end method


# virtual methods
.method public final ؠ(Landroid/content/Intent;)Lؾپۑ۟ڂڷ/ح;
    .locals 6

    const-string v0, "gcm.rawData64"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v3, "rawData"

    invoke-static {v1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ب;->؋:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/16 v3, 0x1a

    const/4 v4, 0x1

    if-lt v1, v3, :cond_1

    move v1, v4

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v3

    const/high16 v5, 0x10000000

    and-int/2addr v3, v5

    if-eqz v3, :cond_2

    move v2, v4

    :cond_2
    if-eqz v1, :cond_3

    if-nez v2, :cond_3

    invoke-static {v0, p1, v2}, Lژة۪ڦضۆۿۡ/ب;->؋(Landroid/content/Context;Landroid/content/Intent;Z)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    goto :goto_1

    :cond_3
    new-instance v1, Lژة۪ڦضۆۿۡ/ئ;

    invoke-direct {v1, v0, p1}, Lژة۪ڦضۆۿۡ/ئ;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ب;->ؠ:Landroidx/arch/core/executor/؋;

    invoke-static {v3, v1}, Lڃٷښـ۝ۼ/ؠ;->ؤ(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v1

    new-instance v4, Lژة۪ڦضۆۿۡ/ا;

    invoke-direct {v4, v0, p1, v2}, Lژة۪ڦضۆۿۡ/ا;-><init>(Landroid/content/Context;Landroid/content/Intent;Z)V

    invoke-virtual {v1, v3, v4}, Lؾپۑ۟ڂڷ/ح;->آ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    :goto_1
    return-object p1
.end method
