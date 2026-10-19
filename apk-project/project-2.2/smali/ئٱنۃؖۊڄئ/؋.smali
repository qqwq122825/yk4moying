.class public final synthetic Lئٱنۃؖۊڄئ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةڈۑۂٝےآذ/ؠ;
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p4, p0, Lئٱنۃؖۊڄئ/؋;->آ:I

    iput-object p1, p0, Lئٱنۃؖۊڄئ/؋;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lئٱنۃؖۊڄئ/؋;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Lئٱنۃؖۊڄئ/؋;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lةٌخ/ة;Ljava/lang/Object;Lأۺؘٻڣ/ز;I)V
    .locals 0

    iput p4, p0, Lئٱنۃؖۊڄئ/؋;->آ:I

    iput-object p1, p0, Lئٱنۃؖۊڄئ/؋;->أ:Ljava/lang/Object;

    iput-object p2, p0, Lئٱنۃؖۊڄئ/؋;->إ:Ljava/lang/Object;

    iput-object p3, p0, Lئٱنۃؖۊڄئ/؋;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 25

    move-object/from16 v0, p0

    sget-object v1, Lإۺهؑڋڻ/ء;->إ:Lإۺهؑڋڻ/ء;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "PRAGMA page_size"

    const-string v5, "PRAGMA page_count"

    const/4 v6, 0x5

    iget v9, v0, Lئٱنۃؖۊڄئ/؋;->آ:I

    const-string v10, "bytes"

    const/4 v11, 0x4

    const/4 v12, 0x3

    const/4 v13, 0x2

    const/4 v14, 0x1

    iget-object v15, v0, Lئٱنۃؖۊڄئ/؋;->إ:Ljava/lang/Object;

    iget-object v8, v0, Lئٱنۃؖۊڄئ/؋;->ؤ:Ljava/lang/Object;

    iget-object v7, v0, Lئٱنۃؖۊڄئ/؋;->أ:Ljava/lang/Object;

    packed-switch v9, :pswitch_data_0

    goto/16 :goto_9

    :pswitch_0
    check-cast v7, Lةٌخ/ة;

    check-cast v8, Ljava/util/Map;

    check-cast v15, Lژة۪ڦضۆۿۡ/ص;

    move-object/from16 v3, p1

    check-cast v3, Landroid/database/Cursor;

    sget-object v9, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    sget-object v16, Lإۺهؑڋڻ/ء;->أ:Lإۺهؑڋڻ/ء;

    if-nez v10, :cond_0

    goto :goto_1

    :cond_0
    if-ne v10, v14, :cond_1

    sget-object v16, Lإۺهؑڋڻ/ء;->ؤ:Lإۺهؑڋڻ/ء;

    goto :goto_1

    :cond_1
    if-ne v10, v13, :cond_2

    move-object v6, v1

    goto :goto_2

    :cond_2
    if-ne v10, v12, :cond_3

    sget-object v16, Lإۺهؑڋڻ/ء;->ئ:Lإۺهؑڋڻ/ء;

    goto :goto_1

    :cond_3
    if-ne v10, v11, :cond_4

    sget-object v16, Lإۺهؑڋڻ/ء;->ا:Lإۺهؑڋڻ/ء;

    goto :goto_1

    :cond_4
    if-ne v10, v6, :cond_5

    sget-object v16, Lإۺهؑڋڻ/ء;->ب:Lإۺهؑڋڻ/ء;

    goto :goto_1

    :cond_5
    const/4 v6, 0x6

    if-ne v10, v6, :cond_6

    sget-object v16, Lإۺهؑڋڻ/ء;->ة:Lإۺهؑڋڻ/ء;

    goto :goto_1

    :cond_6
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "SQLiteEventStore"

    const-string v11, "%n is not valid. No matched LogEventDropped-Reason found. Treated it as REASON_UNKNOWN"

    invoke-static {v10, v11, v6}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    move-object/from16 v6, v16

    :goto_2
    invoke-interface {v3, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-interface {v8, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_7

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v8, v9, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    new-instance v12, Lإۺهؑڋڻ/آ;

    invoke-direct {v12, v10, v11, v6}, Lإۺهؑڋڻ/آ;-><init>(JLإۺهؑڋڻ/ء;)V

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v6, 0x5

    const/4 v11, 0x4

    const/4 v12, 0x3

    goto :goto_0

    :cond_8
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    sget v6, Lإۺهؑڋڻ/أ;->ء:I

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    new-instance v8, Lإۺهؑڋڻ/أ;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v8, v6, v3}, Lإۺهؑڋڻ/أ;-><init>(Ljava/lang/String;Ljava/util/List;)V

    iget-object v3, v15, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_9
    iget-object v1, v7, Lةٌخ/ة;->أ:Lثڈا/؋;

    check-cast v1, Lثڈا/ؠ;

    invoke-virtual {v1}, Lثڈا/ؠ;->؋()J

    move-result-wide v8

    new-instance v1, Lةٌخ/ئ;

    invoke-direct {v1, v2, v8, v9}, Lةٌخ/ئ;-><init>(IJ)V

    invoke-virtual {v7, v1}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lإۺهؑڋڻ/إ;

    iput-object v1, v15, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    invoke-virtual {v7}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v1

    invoke-virtual {v7}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v3

    mul-long/2addr v3, v1

    sget-object v1, Lةٌخ/؋;->ؤ:Lةٌخ/؋;

    iget-wide v1, v1, Lةٌخ/؋;->؋:J

    new-instance v5, Lإۺهؑڋڻ/ؤ;

    invoke-direct {v5, v3, v4, v1, v2}, Lإۺهؑڋڻ/ؤ;-><init>(JJ)V

    new-instance v1, Lإۺهؑڋڻ/ؠ;

    invoke-direct {v1, v5}, Lإۺهؑڋڻ/ؠ;-><init>(Lإۺهؑڋڻ/ؤ;)V

    iput-object v1, v15, Lژة۪ڦضۆۿۡ/ص;->آ:Ljava/lang/Object;

    iget-object v1, v7, Lةٌخ/ة;->ئ:Lڡحڠبںۨږۛ/؋;

    invoke-interface {v1}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v15, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    new-instance v1, Lإۺهؑڋڻ/؋;

    iget-object v2, v15, Lژة۪ڦضۆۿۡ/ص;->ؠ:Ljava/lang/Object;

    check-cast v2, Lإۺهؑڋڻ/إ;

    iget-object v3, v15, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    check-cast v3, Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, v15, Lژة۪ڦضۆۿۡ/ص;->آ:Ljava/lang/Object;

    check-cast v4, Lإۺهؑڋڻ/ؠ;

    iget-object v5, v15, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Lإۺهؑڋڻ/؋;-><init>(Lإۺهؑڋڻ/إ;Ljava/util/List;Lإۺهؑڋڻ/ؠ;Ljava/lang/String;)V

    return-object v1

    :pswitch_1
    check-cast v7, Lةٌخ/ة;

    check-cast v15, Ljava/util/List;

    check-cast v8, Lأۺؘٻڣ/ز;

    move-object/from16 v1, p1

    check-cast v1, Landroid/database/Cursor;

    sget-object v3, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_4
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v5, 0x7

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    if-eqz v5, :cond_a

    move v5, v14

    goto :goto_5

    :cond_a
    move v5, v2

    :goto_5
    new-instance v6, Lأۺؘٻڣ/ئ;

    invoke-direct {v6}, Lأۺؘٻڣ/ئ;-><init>()V

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iput-object v9, v6, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Lأۺؘٻڣ/ئ;->إ(Ljava/lang/String;)V

    invoke-interface {v1, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    iput-object v9, v6, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    const/4 v9, 0x3

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    iput-object v11, v6, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    if-eqz v5, :cond_c

    new-instance v5, Lأۺؘٻڣ/ح;

    const/4 v11, 0x4

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_b

    sget-object v11, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    goto :goto_6

    :cond_b
    new-instance v11, L؋ڽبژ٦ښيل/ء;

    invoke-direct {v11, v12}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    :goto_6
    const/4 v12, 0x5

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v9

    invoke-direct {v5, v11, v9}, Lأۺؘٻڣ/ح;-><init>(L؋ڽبژ٦ښيل/ء;[B)V

    goto :goto_8

    :cond_c
    const/4 v12, 0x5

    new-instance v5, Lأۺؘٻڣ/ح;

    const/4 v9, 0x4

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_d

    sget-object v11, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    goto :goto_7

    :cond_d
    new-instance v9, L؋ڽبژ٦ښيل/ء;

    invoke-direct {v9, v11}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    move-object v11, v9

    :goto_7
    invoke-virtual {v7}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v17

    const-string v18, "event_payloads"

    filled-new-array {v10}, [Ljava/lang/String;

    move-result-object v19

    const-string v20, "event_id = ?"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x0

    const/16 v23, 0x0

    const-string v24, "sequence_num"

    invoke-virtual/range {v17 .. v24}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    new-instance v12, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v14, 0x12

    invoke-direct {v12, v14}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {v9, v12}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    invoke-direct {v5, v11, v9}, Lأۺؘٻڣ/ح;-><init>(L؋ڽبژ٦ښيل/ء;[B)V

    :goto_8
    invoke-virtual {v6, v5}, Lأۺؘٻڣ/ئ;->ؤ(Lأۺؘٻڣ/ح;)V

    const/4 v5, 0x6

    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-nez v9, :cond_e

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iput-object v9, v6, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    :cond_e
    invoke-virtual {v6}, Lأۺؘٻڣ/ئ;->ؠ()Lأۺؘٻڣ/ا;

    move-result-object v6

    new-instance v9, Lةٌخ/ؠ;

    invoke-direct {v9, v3, v4, v8, v6}, Lةٌخ/ؠ;-><init>(JLأۺؘٻڣ/ز;Lأۺؘٻڣ/ا;)V

    invoke-interface {v15, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v14, 0x1

    goto/16 :goto_4

    :cond_f
    const/4 v3, 0x0

    return-object v3

    :pswitch_2
    const/4 v3, 0x0

    check-cast v7, Lةٌخ/ة;

    check-cast v8, Ljava/lang/String;

    check-cast v15, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Landroid/database/sqlite/SQLiteDatabase;

    sget-object v2, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v8}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    invoke-virtual {v1, v15, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    new-instance v4, Lةٌخ/إ;

    invoke-direct {v4, v7, v13}, Lةٌخ/إ;-><init>(Lةٌخ/ة;I)V

    invoke-static {v2, v4}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    const-string v2, "DELETE FROM events WHERE num_attempts >= 16"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    return-object v3

    :goto_9
    check-cast v7, Lةٌخ/ة;

    check-cast v15, Lأۺؘٻڣ/ا;

    check-cast v8, Lأۺؘٻڣ/ز;

    move-object/from16 v6, p1

    check-cast v6, Landroid/database/sqlite/SQLiteDatabase;

    sget-object v9, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-virtual {v7}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v5

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v11

    invoke-virtual {v7}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v4

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v4

    mul-long/2addr v4, v11

    iget-object v9, v7, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget-wide v11, v9, Lةٌخ/؋;->؋:J

    cmp-long v4, v4, v11

    if-ltz v4, :cond_10

    const/4 v4, 0x1

    goto :goto_a

    :cond_10
    move v4, v2

    :goto_a
    if-eqz v4, :cond_11

    iget-object v2, v15, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    new-instance v3, Lةؽڗںۍټ٘/ة;

    const-wide/16 v4, 0x1

    invoke-direct {v3, v4, v5, v2, v1}, Lةؽڗںۍټ٘/ة;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v3}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto/16 :goto_10

    :cond_11
    invoke-static {v6, v8}, Lةٌخ/ة;->ء(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_b

    :cond_12
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    check-cast v8, Lأۺؘٻڣ/ت;

    iget-object v4, v8, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    const-string v5, "backend_name"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v8, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-static {v4}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "priority"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "next_request_ms"

    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v4, v8, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz v4, :cond_13

    invoke-static {v4, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    const-string v5, "extras"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    const-string v4, "transport_contexts"

    const/4 v5, 0x0

    invoke-virtual {v6, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v7

    move-wide v4, v7

    :goto_b
    iget-object v1, v15, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    iget-object v1, v1, Lأۺؘٻڣ/ح;->ؠ:[B

    array-length v7, v1

    iget v8, v9, Lةٌخ/؋;->أ:I

    if-gt v7, v8, :cond_14

    const/4 v7, 0x1

    goto :goto_c

    :cond_14
    move v7, v2

    :goto_c
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    const-string v11, "context_id"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v9, v11, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "transport_name"

    iget-object v5, v15, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v9, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v4, v15, Lأۺؘٻڣ/ا;->آ:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "timestamp_ms"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-wide v4, v15, Lأۺؘٻڣ/ا;->أ:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "uptime_ms"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v4, v15, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    iget-object v4, v4, Lأۺؘٻڣ/ح;->؋:L؋ڽبژ٦ښيل/ء;

    iget-object v4, v4, L؋ڽبژ٦ښيل/ء;->؋:Ljava/lang/String;

    const-string v5, "payload_encoding"

    invoke-virtual {v9, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "code"

    iget-object v5, v15, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    invoke-virtual {v9, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "num_attempts"

    invoke-virtual {v9, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "inline"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v9, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    if-eqz v7, :cond_15

    move-object v2, v1

    goto :goto_d

    :cond_15
    new-array v2, v2, [B

    :goto_d
    const-string v3, "payload"

    invoke-virtual {v9, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v2, "events"

    const/4 v3, 0x0

    invoke-virtual {v6, v2, v3, v9}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-string v2, "event_id"

    if-nez v7, :cond_16

    array-length v3, v1

    int-to-double v11, v3

    int-to-double v13, v8

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v3, v11

    const/4 v14, 0x1

    :goto_e
    if-gt v14, v3, :cond_16

    add-int/lit8 v7, v14, -0x1

    mul-int/2addr v7, v8

    mul-int v9, v14, v8

    array-length v11, v1

    invoke-static {v9, v11}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v1, v7, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v2, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v11, "sequence_num"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {v9, v10, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v7, "event_payloads"

    const/4 v11, 0x0

    invoke-virtual {v6, v7, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v14, v14, 0x1

    goto :goto_e

    :cond_16
    iget-object v1, v15, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v2, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v9, "name"

    invoke-virtual {v7, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v8, "value"

    invoke-virtual {v7, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "event_metadata"

    const/4 v8, 0x0

    invoke-virtual {v6, v3, v8, v7}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_f

    :cond_17
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :goto_10
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final execute()Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lئٱنۃؖۊڄئ/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lئٱنۃؖۊڄئ/ؠ;

    iget-object v1, p0, Lئٱنۃؖۊڄئ/؋;->ؤ:Ljava/lang/Object;

    check-cast v1, Lأۺؘٻڣ/ز;

    iget-object v2, p0, Lئٱنۃؖۊڄئ/؋;->إ:Ljava/lang/Object;

    check-cast v2, Lأۺؘٻڣ/ا;

    iget-object v3, v0, Lئٱنۃؖۊڄئ/ؠ;->آ:Lةٌخ/آ;

    check-cast v3, Lةٌخ/ة;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v4, v1

    check-cast v4, Lأۺؘٻڣ/ت;

    iget-object v5, v4, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    iget-object v6, v2, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    iget-object v4, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    filled-new-array {v5, v6, v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "SQLiteEventStore"

    invoke-static {v5}, Lسۄھؤۏ۫/؋;->ر(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "Storing event with priority=%s, name=%s for destination %s"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-instance v4, Lئٱنۃؖۊڄئ/؋;

    const/4 v5, 0x4

    invoke-direct {v4, v3, v2, v1, v5}, Lئٱنۃؖۊڄئ/؋;-><init>(Lةٌخ/ة;Ljava/lang/Object;Lأۺؘٻڣ/ز;I)V

    invoke-virtual {v3, v4}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    :goto_0
    iget-object v0, v0, Lئٱنۃؖۊڄئ/ؠ;->؋:Lةؽڗںۍټ٘/ح;

    check-cast v0, Lةؽڗںۍټ٘/أ;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lةؽڗںۍټ٘/أ;->؋(Lأۺؘٻڣ/ز;IZ)V

    const/4 v0, 0x0

    return-object v0

    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null transportContext"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
