.class public final synthetic Lةؽڗںۍټ٘/ة;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةڈۑۂٝےآذ/ؠ;
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:J

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput-object p3, p0, Lةؽڗںۍټ٘/ة;->أ:Ljava/lang/Object;

    iput-object p4, p0, Lةؽڗںۍټ٘/ة;->ؤ:Ljava/lang/Object;

    iput-wide p1, p0, Lةؽڗںۍټ٘/ة;->آ:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lةؽڗںۍټ٘/ة;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lةؽڗںۍټ٘/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lإۺهؑڋڻ/ء;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    sget-object v2, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    iget v2, v1, Lإۺهؑڋڻ/ء;->آ:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "SELECT 1 FROM log_event_dropped WHERE log_source = ? AND reason = ?"

    invoke-virtual {p1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    new-instance v3, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {v2, v3}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const/4 v3, 0x0

    iget-wide v4, p0, Lةؽڗںۍټ٘/ة;->آ:J

    iget v1, v1, Lإۺهؑڋڻ/ء;->آ:I

    if-nez v2, :cond_0

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v6, "log_source"

    invoke-virtual {v2, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "reason"

    invoke-virtual {v2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "events_dropped_count"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "log_event_dropped"

    invoke-virtual {p1, v0, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "UPDATE log_event_dropped SET events_dropped_count = events_dropped_count + "

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " WHERE log_source = ? AND reason = ?"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-object v3
.end method

.method public final execute()Ljava/lang/Object;
    .locals 6

    iget-object v0, p0, Lةؽڗںۍټ٘/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lةؽڗںۍټ٘/ت;

    iget-object v1, p0, Lةؽڗںۍټ٘/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lأۺؘٻڣ/ز;

    iget-object v2, v0, Lةؽڗںۍټ٘/ت;->إ:Lثڈا/؋;

    check-cast v2, Lثڈا/ؠ;

    invoke-virtual {v2}, Lثڈا/ؠ;->؋()J

    move-result-wide v2

    iget-wide v4, p0, Lةؽڗںۍټ٘/ة;->آ:J

    add-long/2addr v2, v4

    iget-object v0, v0, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lةٌخ/أ;

    invoke-direct {v4, v2, v3, v1}, Lةٌخ/أ;-><init>(JLأۺؘٻڣ/ز;)V

    invoke-virtual {v0, v4}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    const/4 v0, 0x0

    return-object v0
.end method
