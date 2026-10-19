.class public final synthetic Lةؽڗںۍټ٘/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةڈۑۂٝےآذ/ؠ;
.implements Lؾپۑ۟ڂڷ/آ;
.implements Lؾپۑ۟ڂڷ/؋;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Lةؽڗںۍټ٘/ب;->آ:I

    iput-object p2, p0, Lةؽڗںۍټ٘/ب;->أ:Ljava/lang/Object;

    iput-object p3, p0, Lةؽڗںۍټ٘/ب;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .locals 9

    iget v0, p0, Lةؽڗںۍټ٘/ب;->آ:I

    const/4 v1, 0x0

    iget-object v2, p0, Lةؽڗںۍټ٘/ب;->ؤ:Ljava/lang/Object;

    iget-object v3, p0, Lةؽڗںۍټ٘/ب;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    check-cast v3, Lةؽڗںۍټ٘/ت;

    check-cast v2, Ljava/lang/Iterable;

    iget-object v0, v3, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "DELETE FROM events WHERE _id in "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lةٌخ/ة;->ـ(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    :goto_0
    return-object v1

    :goto_1
    check-cast v3, Lةؽڗںۍټ٘/ت;

    check-cast v2, Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Lإۺهؑڋڻ/ء;->ب:Lإۺهؑڋڻ/ء;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v7, v3, Lةؽڗںۍټ٘/ت;->ا:Lةٌخ/ء;

    check-cast v7, Lةٌخ/ة;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lةؽڗںۍټ٘/ة;

    invoke-direct {v8, v4, v5, v2, v6}, Lةؽڗںۍټ٘/ة;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    goto :goto_2

    :cond_1
    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋(Lؾپۑ۟ڂڷ/ح;)V
    .locals 2

    iget-object p1, p0, Lةؽڗںۍټ٘/ب;->أ:Ljava/lang/Object;

    check-cast p1, Lcom/google/firebase/messaging/EnhancedIntentService;

    iget-object v0, p0, Lةؽڗںۍټ٘/ب;->ؤ:Ljava/lang/Object;

    check-cast v0, Landroid/content/Intent;

    sget v1, Lcom/google/firebase/messaging/EnhancedIntentService;->ؤ:I

    invoke-virtual {p1, v0}, Lcom/google/firebase/messaging/EnhancedIntentService;->؋(Landroid/content/Intent;)V

    return-void
.end method

.method public final آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lةؽڗںۍټ٘/ب;->أ:Ljava/lang/Object;

    check-cast v0, Lژة۪ڦضۆۿۡ/ش;

    iget-object v1, p0, Lةؽڗںۍټ٘/ب;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    monitor-enter v0

    :try_start_0
    iget-object v2, v0, Lژة۪ڦضۆۿۡ/ش;->ؠ:Landroidx/collection/ArrayMap;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
