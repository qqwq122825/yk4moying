.class public final Lةؽڗںۍټ٘/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةؽڗںۍټ٘/ح;


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Lةٌخ/آ;

.field public final ء:Lةؽڗںۍټ٘/ؠ;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lةٌخ/آ;Lةؽڗںۍټ٘/ؠ;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lةؽڗںۍټ٘/أ;->؋:Landroid/content/Context;

    iput-object p2, p0, Lةؽڗںۍټ٘/أ;->ؠ:Lةٌخ/آ;

    iput-object p3, p0, Lةؽڗںۍټ٘/أ;->ء:Lةؽڗںۍټ٘/ؠ;

    return-void
.end method


# virtual methods
.method public final ؋(Lأۺؘٻڣ/ز;IZ)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    new-instance v3, Landroid/content/ComponentName;

    iget-object v4, v0, Lةؽڗںۍټ٘/أ;->؋:Landroid/content/Context;

    const-class v5, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "jobscheduler"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/job/JobScheduler;

    new-instance v6, Ljava/util/zip/Adler32;

    invoke-direct {v6}, Ljava/util/zip/Adler32;-><init>()V

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v7, "UTF-8"

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/zip/Adler32;->update([B)V

    move-object v4, v1

    check-cast v4, Lأۺؘٻڣ/ت;

    iget-object v8, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/zip/Adler32;->update([B)V

    const/4 v7, 0x4

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    iget-object v8, v4, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-static {v8}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/zip/Adler32;->update([B)V

    iget-object v7, v4, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz v7, :cond_0

    invoke-virtual {v6, v7}, Ljava/util/zip/Adler32;->update([B)V

    :cond_0
    invoke-virtual {v6}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v6

    long-to-int v6, v6

    const-string v8, "JobInfoScheduler"

    const-string v9, "attemptNumber"

    const/4 v10, 0x1

    if-nez p3, :cond_3

    invoke-virtual {v5}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/job/JobInfo;

    invoke-virtual {v12}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v13

    invoke-virtual {v13, v9}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v12}, Landroid/app/job/JobInfo;->getId()I

    move-result v12

    if-ne v12, v6, :cond_1

    if-lt v13, v2, :cond_2

    move v11, v10

    goto :goto_0

    :cond_2
    const/4 v11, 0x0

    :goto_0
    if-eqz v11, :cond_3

    const-string v2, "Upload for context %s is already scheduled. Returning..."

    invoke-static {v8, v2, v1}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_3
    iget-object v11, v0, Lةؽڗںۍټ٘/أ;->ؠ:Lةٌخ/آ;

    check-cast v11, Lةٌخ/ة;

    invoke-virtual {v11}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    iget-object v12, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iget-object v13, v4, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-static {v13}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    filled-new-array {v12, v13}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?"

    invoke-virtual {v11, v13, v12}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    new-instance v12, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v13, 0xd

    invoke-direct {v12, v13}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {v11, v12}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    new-instance v13, Landroid/app/job/JobInfo$Builder;

    invoke-direct {v13, v6, v3}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    iget-object v3, v4, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    iget-object v14, v0, Lةؽڗںۍټ٘/أ;->ء:Lةؽڗںۍټ٘/ؠ;

    move-object v15, v8

    invoke-virtual {v14, v3, v11, v12, v2}, Lةؽڗںۍټ٘/ؠ;->؋(L؋ڽبژ٦ښيل/آ;JI)J

    move-result-wide v7

    invoke-virtual {v13, v7, v8}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    iget-object v7, v14, Lةؽڗںۍټ٘/ؠ;->ؠ:Ljava/util/Map;

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lةؽڗںۍټ٘/آ;

    iget-object v7, v7, Lةؽڗںۍټ٘/آ;->ء:Ljava/util/Set;

    sget-object v8, Lةؽڗںۍټ٘/ؤ;->آ:Lةؽڗںۍټ٘/ؤ;

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x2

    invoke-virtual {v13, v8}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    goto :goto_1

    :cond_4
    invoke-virtual {v13, v10}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    :goto_1
    sget-object v8, Lةؽڗںۍټ٘/ؤ;->ؤ:Lةؽڗںۍټ٘/ؤ;

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v13, v10}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    :cond_5
    sget-object v8, Lةؽڗںۍټ٘/ؤ;->أ:Lةؽڗںۍټ٘/ؤ;

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v13, v10}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    :cond_6
    new-instance v7, Landroid/os/PersistableBundle;

    invoke-direct {v7}, Landroid/os/PersistableBundle;-><init>()V

    invoke-virtual {v7, v9, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v8, "backendName"

    iget-object v9, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v8

    const-string v9, "priority"

    invoke-virtual {v7, v9, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iget-object v4, v4, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz v4, :cond_7

    const/4 v8, 0x0

    invoke-static {v4, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    const-string v8, "extras"

    invoke-virtual {v7, v8, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    invoke-virtual {v13, v7}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v14, v3, v11, v12, v2}, Lةؽڗںۍټ٘/ؠ;->؋(L؋ڽبژ٦ښيل/آ;JI)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v4, v3, v6, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v15}, Lسۄھؤۏ۫/؋;->ر(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string v3, "Scheduling upload for context %s with jobId=%d in %dms(Backend next call timestamp %d). Attempt %d"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    invoke-virtual {v13}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    return-void
.end method
