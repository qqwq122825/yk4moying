.class public final synthetic Lةٌخ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:J

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLأۺؘٻڣ/ز;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lةٌخ/أ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lةٌخ/أ;->أ:J

    iput-object p3, p0, Lةٌخ/أ;->ؤ:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lةٌخ/ة;J)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lةٌخ/أ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lةٌخ/أ;->ؤ:Ljava/lang/Object;

    iput-wide p2, p0, Lةٌخ/أ;->أ:J

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    iget v0, p0, Lةٌخ/أ;->آ:I

    const/4 v1, 0x1

    iget-wide v2, p0, Lةٌخ/أ;->أ:J

    iget-object v4, p0, Lةٌخ/أ;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v4, Lةٌخ/ة;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v2, "SELECT COUNT(*), transport_name FROM events WHERE timestamp_ms < ? GROUP BY transport_name"

    invoke-virtual {p1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    new-instance v3, Lةٌخ/إ;

    invoke-direct {v3, v4, v1}, Lةٌخ/إ;-><init>(Lةٌخ/ة;I)V

    invoke-static {v2, v3}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    const-string v1, "events"

    const-string v2, "timestamp_ms < ?"

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :goto_0
    check-cast v4, Lأۺؘٻڣ/ز;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "next_request_ms"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    check-cast v4, Lأۺؘٻڣ/ت;

    iget-object v2, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iget-object v3, v4, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-static {v3}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v2, v5}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "transport_contexts"

    const-string v6, "backend_name = ? and priority = ?"

    invoke-virtual {p1, v5, v0, v6, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    const/4 v6, 0x0

    if-ge v2, v1, :cond_0

    const-string v1, "backend_name"

    iget-object v2, v4, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lثڙآ۷ۖس/؋;->؋(L؋ڽبژ٦ښيل/آ;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "priority"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    :cond_0
    return-object v6

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
