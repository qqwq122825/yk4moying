.class public final synthetic Lةٌخ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةٌخ/ا;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lةٌخ/ة;

.field public final synthetic ؤ:Lأۺؘٻڣ/ز;


# direct methods
.method public synthetic constructor <init>(Lةٌخ/ة;Lأۺؘٻڣ/ز;I)V
    .locals 0

    iput p3, p0, Lةٌخ/ؤ;->آ:I

    iput-object p1, p0, Lةٌخ/ؤ;->أ:Lةٌخ/ة;

    iput-object p2, p0, Lةٌخ/ؤ;->ؤ:Lأۺؘٻڣ/ز;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    iget v0, p0, Lةٌخ/ؤ;->آ:I

    iget-object v1, p0, Lةٌخ/ؤ;->ؤ:Lأۺؘٻڣ/ز;

    iget-object v2, p0, Lةٌخ/ؤ;->أ:Lةٌخ/ة;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, v1}, Lةٌخ/ة;->ء(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_0

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string v1, "SELECT 1 FROM events WHERE context_id = ? LIMIT 1"

    invoke-virtual {v0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    new-instance v0, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {p1, v0}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    :goto_0
    return-object p1

    :goto_1
    move-object v0, p1

    check-cast v0, Landroid/database/sqlite/SQLiteDatabase;

    iget-object p1, v2, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget v3, p1, Lةٌخ/؋;->ؠ:I

    invoke-virtual {v2, v0, v1, v3}, Lةٌخ/ة;->ؾ(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;I)Ljava/util/ArrayList;

    move-result-object v8

    invoke-static {}, L؋ڽبژ٦ښيل/آ;->values()[L؋ڽبژ٦ښيل/آ;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_2
    if-ge v6, v4, :cond_3

    aget-object v7, v3, v6

    move-object v9, v1

    check-cast v9, Lأۺؘٻڣ/ت;

    iget-object v9, v9, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    if-ne v7, v9, :cond_1

    goto :goto_3

    :cond_1
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    iget v10, p1, Lةٌخ/؋;->ؠ:I

    sub-int/2addr v10, v9

    if-gtz v10, :cond_2

    goto :goto_4

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lأۺؘٻڣ/ز;->؋()Lأۺؘٻڣ/ة;

    move-result-object v9

    move-object v11, v1

    check-cast v11, Lأۺؘٻڣ/ت;

    iget-object v12, v11, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v9, v12}, Lأۺؘٻڣ/ة;->ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;

    invoke-virtual {v9, v7}, Lأۺؘٻڣ/ة;->ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;

    iget-object v7, v11, Lأۺؘٻڣ/ت;->ؠ:[B

    iput-object v7, v9, Lأۺؘٻڣ/ة;->ؠ:[B

    invoke-virtual {v9}, Lأۺؘٻڣ/ة;->؋()Lأۺؘٻڣ/ت;

    move-result-object v7

    invoke-virtual {v2, v0, v7, v10}, Lةٌخ/ة;->ؾ(Landroid/database/sqlite/SQLiteDatabase;Lأۺؘٻڣ/ز;I)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_3
    :goto_4
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "event_id IN ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_5
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v5, v2, :cond_5

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lةٌخ/ؠ;

    iget-wide v2, v2, Lةٌخ/ؠ;->؋:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v5, v2, :cond_4

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_5
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "event_metadata"

    const-string v3, "event_id"

    const-string v4, "name"

    const-string v5, "value"

    filled-new-array {v3, v4, v5}, [Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v9

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    new-instance v1, Landroidx/constraintlayout/core/state/؋;

    const/16 v2, 0x9

    invoke-direct {v1, v2, p1}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-static {v0, v1}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lةٌخ/ؠ;

    iget-wide v2, v1, Lةٌخ/ؠ;->؋:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_6

    :cond_6
    iget-object v2, v1, Lةٌخ/ؠ;->ء:Lأۺؘٻڣ/ا;

    invoke-virtual {v2}, Lأۺؘٻڣ/ا;->ء()Lأۺؘٻڣ/ئ;

    move-result-object v2

    iget-wide v3, v1, Lةٌخ/ؠ;->؋:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lةٌخ/ب;

    iget-object v7, v6, Lةٌخ/ب;->؋:Ljava/lang/String;

    iget-object v6, v6, Lةٌخ/ب;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, v7, v6}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_7
    invoke-virtual {v2}, Lأۺؘٻڣ/ئ;->ؠ()Lأۺؘٻڣ/ا;

    move-result-object v2

    new-instance v5, Lةٌخ/ؠ;

    iget-object v1, v1, Lةٌخ/ؠ;->ؠ:Lأۺؘٻڣ/ز;

    invoke-direct {v5, v3, v4, v1, v2}, Lةٌخ/ؠ;-><init>(JLأۺؘٻڣ/ز;Lأۺؘٻڣ/ا;)V

    invoke-interface {v0, v5}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    goto :goto_6

    :cond_8
    return-object v8

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
