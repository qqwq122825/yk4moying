.class public final synthetic Lةٌخ/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lةٌخ/ة;


# direct methods
.method public synthetic constructor <init>(Lةٌخ/ة;I)V
    .locals 0

    iput p2, p0, Lةٌخ/إ;->آ:I

    iput-object p1, p0, Lةٌخ/إ;->أ:Lةٌخ/ة;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    iget v0, p0, Lةٌخ/إ;->آ:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lةٌخ/إ;->أ:Lةٌخ/ة;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    int-to-long v6, v0

    sget-object v0, Lإۺهؑڋڻ/ء;->ؤ:Lإۺهؑڋڻ/ء;

    new-instance v8, Lةؽڗںۍټ٘/ة;

    invoke-direct {v8, v6, v7, v5, v0}, Lةؽڗںۍټ٘/ة;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v3

    :pswitch_1
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "DELETE FROM log_event_dropped"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UPDATE global_log_event_state SET last_metrics_upload_ms="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v4, Lةٌخ/ة;->أ:Lثڈا/؋;

    check-cast v1, Lثڈا/ؠ;

    invoke-virtual {v1}, Lثڈا/ؠ;->؋()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object p1

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    return-object v3

    :goto_1
    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    int-to-long v6, v0

    sget-object v0, Lإۺهؑڋڻ/ء;->ا:Lإۺهؑڋڻ/ء;

    new-instance v8, Lةؽڗںۍټ٘/ة;

    invoke-direct {v8, v6, v7, v5, v0}, Lةؽڗںۍټ٘/ة;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    goto :goto_2

    :cond_1
    return-object v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
