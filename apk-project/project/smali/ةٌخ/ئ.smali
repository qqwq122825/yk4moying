.class public final synthetic Lةٌخ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:J


# direct methods
.method public synthetic constructor <init>(IJ)V
    .locals 0

    iput p1, p0, Lةٌخ/ئ;->آ:I

    iput-wide p2, p0, Lةٌخ/ئ;->أ:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    iget v0, p0, Lةٌخ/ئ;->آ:I

    iget-wide v1, p0, Lةٌخ/ئ;->أ:J

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    new-array v0, v3, [Ljava/lang/String;

    const-string v3, "SELECT last_metrics_upload_ms FROM global_log_event_state LIMIT 1"

    invoke-virtual {p1, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    new-instance v0, Lةٌخ/ئ;

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Lةٌخ/ئ;-><init>(IJ)V

    invoke-static {p1, v0}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lإۺهؑڋڻ/إ;

    return-object p1

    :goto_0
    check-cast p1, Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    new-instance p1, Lإۺهؑڋڻ/إ;

    invoke-direct {p1, v3, v4, v1, v2}, Lإۺهؑڋڻ/إ;-><init>(JJ)V

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
