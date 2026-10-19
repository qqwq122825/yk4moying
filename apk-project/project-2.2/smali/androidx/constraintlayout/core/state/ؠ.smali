.class public final synthetic Landroidx/constraintlayout/core/state/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/constraintlayout/core/state/Interpolator;
.implements Landroidx/arch/core/util/Function;
.implements Lةٌخ/ا;
.implements Lٿخ۴۟ؽ/غ;
.implements Lڙڧا/أ;
.implements Lڊ۟چڗۙ٦/إ;
.implements Lؾپۑ۟ڂڷ/؋;
.implements Lڊ۟چڗۙ٦/ؤ;


# instance fields
.field public final synthetic آ:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Landroidx/constraintlayout/core/state/ؠ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    iget v0, p0, Landroidx/constraintlayout/core/state/ؠ;->آ:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_6

    :pswitch_1
    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move v1, v3

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    array-length v2, v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_0
    new-array p1, v1, [B

    move v1, v3

    move v2, v1

    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    array-length v5, v4

    invoke-static {v4, v3, p1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v4, v4

    add-int/2addr v2, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-object p1

    :pswitch_2
    check-cast p1, Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :pswitch_3
    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-lez p1, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :pswitch_4
    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_3
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-static {}, Lأۺؘٻڣ/ز;->؋()Lأۺؘٻڣ/ة;

    move-result-object v4

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lأۺؘٻڣ/ة;->ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;

    const/4 v5, 0x2

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Lثڙآ۷ۖس/؋;->ؠ(I)L؋ڽبژ٦ښيل/آ;

    move-result-object v5

    invoke-virtual {v4, v5}, Lأۺؘٻڣ/ة;->ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;

    const/4 v5, 0x3

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    move-object v5, v1

    goto :goto_4

    :cond_3
    invoke-static {v5, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    :goto_4
    iput-object v5, v4, Lأۺؘٻڣ/ة;->ؠ:[B

    invoke-virtual {v4}, Lأۺؘٻڣ/ة;->؋()Lأۺؘٻڣ/ت;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    return-object v0

    :pswitch_5
    check-cast p1, Ljava/lang/Throwable;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    new-instance v0, Lةڈۑۂٝےآذ/؋;

    const-string v1, "Timed out while trying to acquire the lock."

    invoke-direct {v0, v1, p1}, Lةڈۑۂٝےآذ/؋;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_6
    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    goto :goto_5

    :cond_5
    const-wide/16 v0, 0x0

    :goto_5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_7
    check-cast p1, Ljava/lang/Throwable;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    new-instance v0, Lةڈۑۂٝےآذ/؋;

    const-string v1, "Timed out while trying to open db."

    invoke-direct {v0, v1, p1}, Lةڈۑۂٝےآذ/؋;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_8
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SELECT distinct t._id, t.backend_name, t.priority, t.extras FROM transport_contexts AS t, events AS e WHERE e.context_id = t._id"

    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    new-instance v0, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-static {p1, v0}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1

    :pswitch_9
    check-cast p1, Ljava/lang/Long;

    invoke-static {p1}, Landroidx/work/impl/utils/PreferenceUtils;->؋(Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_a
    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Landroidx/work/impl/model/WorkSpec;->؋(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :goto_6
    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_7

    :cond_6
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :goto_7
    return-object v1

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public getInterpolation(F)F
    .locals 1

    iget v0, p0, Landroidx/constraintlayout/core/state/ؠ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->ئ(F)F

    move-result p1

    return p1

    :pswitch_1
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->إ(F)F

    move-result p1

    return p1

    :pswitch_2
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->ؠ(F)F

    move-result p1

    return p1

    :pswitch_3
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->؋(F)F

    move-result p1

    return p1

    :pswitch_4
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->آ(F)F

    move-result p1

    return p1

    :pswitch_5
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->ء(F)F

    move-result p1

    return p1

    :goto_0
    invoke-static {p1}, Landroidx/constraintlayout/core/state/Transition;->أ(F)F

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public ؋(Lcom/google/firebase/components/ComponentRegistrar;)Ljava/util/List;
    .locals 0

    invoke-interface {p1}, Lcom/google/firebase/components/ComponentRegistrar;->getComponents()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public ؠ(Lآۋۻؾ۹/ث;)Ljava/lang/Object;
    .locals 3

    iget v0, p0, Landroidx/constraintlayout/core/state/ؠ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1}, Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;->؋(Lآۋۻؾ۹/ث;)Lږٍڔڴٝ/آ;

    move-result-object p1

    return-object p1

    :pswitch_1
    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->؋(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;

    move-result-object p1

    return-object p1

    :pswitch_2
    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->ء(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;

    move-result-object p1

    return-object p1

    :pswitch_3
    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->ؠ(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;

    move-result-object p1

    return-object p1

    :pswitch_4
    sget-object p1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->؋:Lڊ۟چڗۙ٦/خ;

    sget-object p1, Lڍڤٜڞڽۧ/ب;->آ:Lڍڤٜڞڽۧ/ب;

    return-object p1

    :pswitch_5
    sget-object p1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->ؠ:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {p1}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p1

    :pswitch_6
    sget-object p1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->ء:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {p1}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p1

    :pswitch_7
    sget-object p1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->؋:Lڊ۟چڗۙ٦/خ;

    invoke-virtual {p1}, Lڊ۟چڗۙ٦/خ;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p1

    :goto_0
    new-instance v0, Lڙڧا/ؠ;

    const-class v1, Lڙڧا/؋;

    invoke-static {v1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v1

    invoke-virtual {p1, v1}, Lآۋۻؾ۹/ث;->أ(Lڊ۟چڗۙ٦/س;)Ljava/util/Set;

    move-result-object p1

    sget-object v1, Lڙڧا/ء;->أ:Lڙڧا/ء;

    if-nez v1, :cond_1

    const-class v2, Lڙڧا/ء;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lڙڧا/ء;->أ:Lڙڧا/ء;

    if-nez v1, :cond_0

    new-instance v1, Lڙڧا/ء;

    invoke-direct {v1}, Lڙڧا/ء;-><init>()V

    sput-object v1, Lڙڧا/ء;->أ:Lڙڧا/ء;

    :cond_0
    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_1
    invoke-direct {v0, p1, v1}, Lڙڧا/ؠ;-><init>(Ljava/util/Set;Lڙڧا/ء;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 0

    iget p1, p0, Landroidx/constraintlayout/core/state/ؠ;->آ:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object p1, Lژة۪ڦضۆۿۡ/ب;->ء:Ljava/lang/Object;

    const/16 p1, 0x193

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :goto_0
    sget-object p1, Lژة۪ڦضۆۿۡ/ب;->ء:Ljava/lang/Object;

    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1b
        :pswitch_0
    .end packed-switch
.end method
