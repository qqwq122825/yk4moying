.class public final Lةٌخ/ة;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةٌخ/آ;
.implements Lةڈۑۂٝےآذ/ء;
.implements Lةٌخ/ء;


# static fields
.field public static final ا:L؋ڽبژ٦ښيل/ء;


# instance fields
.field public final آ:Lةٌخ/ج;

.field public final أ:Lثڈا/؋;

.field public final ؤ:Lثڈا/؋;

.field public final إ:Lةٌخ/؋;

.field public final ئ:Lڡحڠبںۨږۛ/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, L؋ڽبژ٦ښيل/ء;

    const-string v1, "proto"

    invoke-direct {v0, v1}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    sput-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    return-void
.end method

.method public constructor <init>(Lثڈا/؋;Lثڈا/؋;Lةٌخ/؋;Lةٌخ/ج;Lڡحڠبںۨږۛ/؋;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lةٌخ/ة;->آ:Lةٌخ/ج;

    iput-object p1, p0, Lةٌخ/ة;->أ:Lثڈا/؋;

    iput-object p2, p0, Lةٌخ/ة;->ؤ:Lثڈا/؋;

    iput-object p3, p0, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iput-object p5, p0, Lةٌخ/ة;->ئ:Lڡحڠبںۨږۛ/؋;

    return-void
.end method

.method public static ء(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;)Ljava/lang/Long;
    .locals 11

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "backend_name = ? and priority = ?"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    check-cast p1, Lأۺؘٻڣ/ت;

    iget-object v2, p1, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iget-object v3, p1, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-static {v3}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v2, 0x0

    iget-object p1, p1, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz p1, :cond_0

    const-string v3, " and extras = ?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const-string p1, " and extras is null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    const-string v4, "transport_contexts"

    const-string p1, "_id"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array p1, v2, [Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    move-object v7, p1

    check-cast v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, p0

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    new-instance p1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v0, 0x13

    invoke-direct {p1, v0}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {p0, p1}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    return-object p0
.end method

.method public static ـ(Ljava/lang/Iterable;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lةٌخ/ؠ;

    iget-wide v1, v1, Lةٌخ/ؠ;->؋:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;
    .locals 0

    :try_start_0
    invoke-interface {p1, p0}, Lةٌخ/ا;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1
.end method


# virtual methods
.method public final close()V
    .locals 1

    iget-object v0, p0, Lةٌخ/ة;->آ:Lةٌخ/ج;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-void
.end method

.method public final ؋()Landroid/database/sqlite/SQLiteDatabase;
    .locals 10

    iget-object v0, p0, Lةٌخ/ة;->آ:Lةٌخ/ج;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iget-object v2, p0, Lةٌخ/ة;->ؤ:Lثڈا/؋;

    check-cast v2, Lثڈا/ؠ;

    invoke-virtual {v2}, Lثڈا/ؠ;->؋()J

    move-result-wide v3

    :goto_0
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    invoke-virtual {v2}, Lثڈا/ؠ;->؋()J

    move-result-wide v6

    iget-object v8, p0, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget v8, v8, Lةٌخ/؋;->ء:I

    int-to-long v8, v8

    add-long/2addr v8, v3

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    invoke-virtual {v1, v5}, Landroidx/constraintlayout/core/state/ؠ;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_1
    check-cast v0, Landroid/database/sqlite/SQLiteDatabase;

    return-object v0

    :cond_0
    const-wide/16 v5, 0x32

    invoke-static {v5, v6}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_0
.end method

.method public final ر(Lةٌخ/ا;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_0
    invoke-interface {p1, v0}, Lةٌخ/ا;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public final ؾ(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;I)Ljava/util/ArrayList;
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p2}, Lةٌخ/ة;->ء(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;)Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    const-string v3, "events"

    const-string v4, "_id"

    const-string v5, "transport_name"

    const-string v6, "timestamp_ms"

    const-string v7, "uptime_ms"

    const-string v8, "payload_encoding"

    const-string v9, "payload"

    const-string v10, "code"

    const-string v11, "inline"

    filled-new-array/range {v4 .. v11}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "context_id = ?"

    invoke-virtual {v1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    move-object v2, p1

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    new-instance p3, Lئٱنۃؖۊڄئ/؋;

    const/4 v1, 0x2

    invoke-direct {p3, p0, v0, p2, v1}, Lئٱنۃؖۊڄئ/؋;-><init>(Lةٌخ/ة;Ljava/lang/Object;Lأۺؘٻڣ/ز;I)V

    invoke-static {p1, p3}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    return-object v0
.end method

.method public final ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;
    .locals 10

    invoke-virtual {p0}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iget-object v2, p0, Lةٌخ/ة;->ؤ:Lثڈا/؋;

    check-cast v2, Lثڈا/ؠ;

    invoke-virtual {v2}, Lثڈا/ؠ;->؋()J

    move-result-wide v3

    :goto_0
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    invoke-virtual {v2}, Lثڈا/ؠ;->؋()J

    move-result-wide v6

    iget-object v8, p0, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget v8, v8, Lةٌخ/؋;->ء:I

    int-to-long v8, v8

    add-long/2addr v8, v3

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    invoke-virtual {v1, v5}, Landroidx/constraintlayout/core/state/ؠ;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    :try_start_1
    invoke-interface {p1}, Lةڈۑۂٝےآذ/ؠ;->execute()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1

    :cond_0
    const-wide/16 v5, 0x32

    invoke-static {v5, v6}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_0
.end method
