.class public final Lةؽڗںۍټ٘/ت;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Lإٿ٢/إ;

.field public final ء:Lةٌخ/آ;

.field public final آ:Lةؽڗںۍټ٘/ح;

.field public final أ:Ljava/util/concurrent/Executor;

.field public final ؤ:Lةڈۑۂٝےآذ/ء;

.field public final إ:Lثڈا/؋;

.field public final ئ:Lثڈا/؋;

.field public final ا:Lةٌخ/ء;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lإٿ٢/إ;Lةٌخ/آ;Lةؽڗںۍټ٘/ح;Ljava/util/concurrent/Executor;Lةڈۑۂٝےآذ/ء;Lثڈا/؋;Lثڈا/؋;Lةٌخ/ء;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lةؽڗںۍټ٘/ت;->؋:Landroid/content/Context;

    iput-object p2, p0, Lةؽڗںۍټ٘/ت;->ؠ:Lإٿ٢/إ;

    iput-object p3, p0, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    iput-object p4, p0, Lةؽڗںۍټ٘/ت;->آ:Lةؽڗںۍټ٘/ح;

    iput-object p5, p0, Lةؽڗںۍټ٘/ت;->أ:Ljava/util/concurrent/Executor;

    iput-object p6, p0, Lةؽڗںۍټ٘/ت;->ؤ:Lةڈۑۂٝےآذ/ء;

    iput-object p7, p0, Lةؽڗںۍټ٘/ت;->إ:Lثڈا/؋;

    iput-object p8, p0, Lةؽڗںۍټ٘/ت;->ئ:Lثڈا/؋;

    iput-object p9, p0, Lةؽڗںۍټ٘/ت;->ا:Lةٌخ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Lأۺؘٻڣ/ز;I)V
    .locals 43

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object v0, v8

    check-cast v0, Lأۺؘٻڣ/ت;

    iget-object v0, v0, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iget-object v1, v7, Lةؽڗںۍټ٘/ت;->ؠ:Lإٿ٢/إ;

    invoke-virtual {v1, v0}, Lإٿ٢/إ;->؋(Ljava/lang/String;)Lإٿ٢/ئ;

    move-result-object v1

    const-wide/16 v2, 0x0

    :goto_0
    move-wide v5, v2

    new-instance v0, Lةؽڗںۍټ٘/ئ;

    const/4 v2, 0x0

    invoke-direct {v0, v7, v8, v2}, Lةؽڗںۍټ٘/ئ;-><init>(Lةؽڗںۍټ٘/ت;Lأۺؘٻڣ/ز;I)V

    iget-object v3, v7, Lةؽڗںۍټ٘/ت;->ؤ:Lةڈۑۂٝےآذ/ء;

    move-object v9, v3

    check-cast v9, Lةٌخ/ة;

    invoke-virtual {v9, v0}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v3, v7, Lةؽڗںۍټ٘/ت;->إ:Lثڈا/؋;

    if-eqz v0, :cond_26

    new-instance v0, Lةؽڗںۍټ٘/ئ;

    const/4 v4, 0x1

    invoke-direct {v0, v7, v8, v4}, Lةؽڗںۍټ٘/ئ;-><init>(Lةؽڗںۍټ٘/ت;Lأۺؘٻڣ/ز;I)V

    invoke-virtual {v9, v0}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Ljava/lang/Iterable;

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    const-wide/16 v11, -0x1

    if-nez v1, :cond_1

    const-string v2, "Uploader"

    const-string v3, "Unknown backend for %s, deleting event batch for it..."

    invoke-static {v2, v3, v8}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Lإٿ٢/؋;

    invoke-direct {v2, v0, v11, v12}, Lإٿ٢/؋;-><init>(IJ)V

    move-object/from16 v25, v1

    move-wide/from16 v28, v5

    move-object/from16 v27, v9

    goto/16 :goto_f

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lةٌخ/ؠ;

    iget-object v12, v12, Lةٌخ/ؠ;->ء:Lأۺؘٻڣ/ا;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v11, v8

    check-cast v11, Lأۺؘٻڣ/ت;

    iget-object v11, v11, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz v11, :cond_3

    goto :goto_2

    :cond_3
    move v4, v2

    :goto_2
    const/4 v11, 0x5

    const-string v12, "proto"

    if-eqz v4, :cond_4

    iget-object v4, v7, Lةؽڗںۍټ٘/ت;->ا:Lةٌخ/ء;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Landroidx/constraintlayout/core/state/؋;

    invoke-direct {v13, v11, v4}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v9, v13}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lإۺهؑڋڻ/؋;

    new-instance v11, Lأۺؘٻڣ/ئ;

    invoke-direct {v11}, Lأۺؘٻڣ/ئ;-><init>()V

    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    iput-object v13, v11, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    check-cast v3, Lثڈا/ؠ;

    invoke-virtual {v3}, Lثڈا/ؠ;->؋()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v11, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    iget-object v3, v7, Lةؽڗںۍټ٘/ت;->ئ:Lثڈا/؋;

    check-cast v3, Lثڈا/ؠ;

    invoke-virtual {v3}, Lثڈا/ؠ;->؋()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v11, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    const-string v3, "GDT_CLIENT_METRICS"

    invoke-virtual {v11, v3}, Lأۺؘٻڣ/ئ;->إ(Ljava/lang/String;)V

    new-instance v3, Lأۺؘٻڣ/ح;

    new-instance v13, L؋ڽبژ٦ښيل/ء;

    invoke-direct {v13, v12}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, Lأۺؘٻڣ/خ;->؋:Lةؽڗںۍټ٘/ء;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    invoke-virtual {v14, v4, v15}, Lةؽڗںۍټ٘/ء;->أ(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v13, v4}, Lأۺؘٻڣ/ح;-><init>(L؋ڽبژ٦ښيل/ء;[B)V

    invoke-virtual {v11, v3}, Lأۺؘٻڣ/ئ;->ؤ(Lأۺؘٻڣ/ح;)V

    invoke-virtual {v11}, Lأۺؘٻڣ/ئ;->ؠ()Lأۺؘٻڣ/ا;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Lء؅ڱ٢/آ;

    invoke-virtual {v4, v3}, Lء؅ڱ٢/آ;->؋(Lأۺؘٻڣ/ا;)Lأۺؘٻڣ/ا;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    move-object v3, v8

    check-cast v3, Lأۺؘٻڣ/ت;

    move-object v4, v1

    check-cast v4, Lء؅ڱ٢/آ;

    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lأۺؘٻڣ/ا;

    iget-object v14, v13, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v11, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_5

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v15, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_5
    invoke-virtual {v11, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-interface {v14, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v11}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    const-string v14, "CctTransportBackend"

    if-eqz v13, :cond_14

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    invoke-interface {v15, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lأۺؘٻڣ/ا;

    sget-object v24, Lآۋۻؾ۹/ظ;->آ:Lآۋۻؾ۹/ظ;

    iget-object v15, v4, Lء؅ڱ٢/آ;->ؤ:Lثڈا/؋;

    check-cast v15, Lثڈا/ؠ;

    invoke-virtual {v15}, Lثڈا/ؠ;->؋()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object/from16 v25, v1

    iget-object v1, v4, Lء؅ڱ٢/آ;->أ:Lثڈا/؋;

    check-cast v1, Lثڈا/ؠ;

    invoke-virtual {v1}, Lثڈا/ؠ;->؋()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    move-object/from16 v26, v11

    sget-object v11, Lآۋۻؾ۹/ر;->آ:Lآۋۻؾ۹/ر;

    const-string v8, "sdk-version"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->ؠ(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const-string v8, "model"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string v8, "hardware"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    const-string v8, "device"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    const-string v8, "product"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    const-string v8, "os-uild"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v8, "manufacturer"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    const-string v8, "fingerprint"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    const-string v8, "country"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    const-string v8, "locale"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    const-string v8, "mcc_mnc"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    const-string v8, "application_build"

    invoke-virtual {v2, v8}, Lأۺؘٻڣ/ا;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    new-instance v2, Lآۋۻؾ۹/ا;

    move-object/from16 v27, v2

    invoke-direct/range {v27 .. v39}, Lآۋۻؾ۹/ا;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Lآۋۻؾ۹/ت;

    invoke-direct {v8, v11, v2}, Lآۋۻؾ۹/ت;-><init>(Lآۋۻؾ۹/ر;Lآۋۻؾ۹/؋;)V

    :try_start_1
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v11, 0x0

    move-object/from16 v21, v2

    move-object/from16 v22, v11

    goto :goto_5

    :catch_1
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v11, 0x0

    move-object/from16 v22, v2

    move-object/from16 v21, v11

    :goto_5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    const-string v7, "Missing required properties:"

    const-string v16, ""

    if-eqz v13, :cond_10

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lأۺؘٻڣ/ا;

    move-object/from16 v17, v11

    iget-object v11, v13, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    move-object/from16 v27, v9

    iget-object v9, v11, Lأۺؘٻڣ/ح;->؋:L؋ڽبژ٦ښيل/ء;

    move-wide/from16 v28, v5

    new-instance v5, L؋ڽبژ٦ښيل/ء;

    invoke-direct {v5, v12}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, L؋ڽبژ٦ښيل/ء;->equals(Ljava/lang/Object;)Z

    move-result v5

    iget-object v6, v11, Lأۺؘٻڣ/ح;->ؠ:[B

    if-eqz v5, :cond_7

    new-instance v5, Lآۋۻؾ۹/ث;

    invoke-direct {v5}, Lآۋۻؾ۹/ث;-><init>()V

    iput-object v6, v5, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    :goto_7
    move-object v6, v12

    goto :goto_8

    :cond_7
    new-instance v5, L؋ڽبژ٦ښيل/ء;

    const-string v11, "json"

    invoke-direct {v5, v11}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, L؋ڽبژ٦ښيل/ء;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    new-instance v5, Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-static {v9}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v9

    invoke-direct {v5, v6, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    new-instance v6, Lآۋۻؾ۹/ث;

    invoke-direct {v6}, Lآۋۻؾ۹/ث;-><init>()V

    iput-object v5, v6, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    move-object v5, v6

    goto :goto_7

    :goto_8
    iget-wide v11, v13, Lأۺؘٻڣ/ا;->آ:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    iput-object v9, v5, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    iget-wide v11, v13, Lأۺؘٻڣ/ا;->أ:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    iput-object v9, v5, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    iget-object v9, v13, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    const-string v11, "tz-offset"

    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    if-nez v9, :cond_8

    const-wide/16 v11, 0x0

    goto :goto_9

    :cond_8
    invoke-static {v9}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    :goto_9
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    iput-object v9, v5, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    const-string v9, "net-type"

    invoke-virtual {v13, v9}, Lأۺؘٻڣ/ا;->ؠ(Ljava/lang/String;)I

    move-result v9

    sget-object v11, Lآۋۻؾ۹/ض;->آ:Landroid/util/SparseArray;

    invoke-virtual {v11, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lآۋۻؾ۹/ض;

    const-string v11, "mobile-subtype"

    invoke-virtual {v13, v11}, Lأۺؘٻڣ/ا;->ؠ(Ljava/lang/String;)I

    move-result v11

    sget-object v12, Lآۋۻؾ۹/ص;->آ:Landroid/util/SparseArray;

    invoke-virtual {v12, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lآۋۻؾ۹/ص;

    new-instance v12, Lآۋۻؾ۹/د;

    invoke-direct {v12, v9, v11}, Lآۋۻؾ۹/د;-><init>(Lآۋۻؾ۹/ض;Lآۋۻؾ۹/ص;)V

    iput-object v12, v5, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    iget-object v9, v13, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    if-eqz v9, :cond_9

    iput-object v9, v5, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    :cond_9
    iget-object v9, v5, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Long;

    if-nez v9, :cond_a

    const-string v16, " eventTimeMs"

    :cond_a
    move-object/from16 v9, v16

    iget-object v11, v5, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Long;

    if-nez v11, :cond_b

    const-string v11, " eventUptimeMs"

    invoke-virtual {v9, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :cond_b
    iget-object v11, v5, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Long;

    if-nez v11, :cond_c

    const-string v11, " timezoneOffsetSeconds"

    invoke-static {v9, v11}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :cond_c
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_d

    new-instance v7, Lآۋۻؾ۹/ج;

    iget-object v9, v5, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v31

    iget-object v9, v5, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    move-object/from16 v33, v9

    check-cast v33, Ljava/lang/Integer;

    iget-object v9, v5, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v34

    iget-object v9, v5, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    move-object/from16 v36, v9

    check-cast v36, [B

    iget-object v9, v5, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    move-object/from16 v37, v9

    check-cast v37, Ljava/lang/String;

    iget-object v9, v5, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v38

    iget-object v5, v5, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    move-object/from16 v40, v5

    check-cast v40, Lآۋۻؾ۹/ط;

    move-object/from16 v30, v7

    invoke-direct/range {v30 .. v40}, Lآۋۻؾ۹/ج;-><init>(JLjava/lang/Integer;J[BLjava/lang/String;JLآۋۻؾ۹/ط;)V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v7, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    move-object v6, v12

    invoke-static {v14}, Lسۄھؤۏ۫/؋;->ر(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x5

    invoke-static {v5, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_f

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v7

    const-string v9, "Received event of unsupported encoding %s. Skipping..."

    invoke-static {v9, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f
    :goto_a
    move-object/from16 v7, p0

    move-object v12, v6

    move-object/from16 v11, v17

    move-object/from16 v9, v27

    move-wide/from16 v5, v28

    goto/16 :goto_6

    :cond_10
    move-wide/from16 v28, v5

    move-object/from16 v27, v9

    move-object v6, v12

    if-nez v15, :cond_11

    const-string v16, " requestTimeMs"

    :cond_11
    move-object/from16 v5, v16

    if-nez v1, :cond_12

    const-string v9, " requestUptimeMs"

    invoke-virtual {v5, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_12
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_13

    new-instance v5, Lآۋۻؾ۹/ح;

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v18

    move-object v15, v5

    move-object/from16 v20, v8

    move-object/from16 v23, v2

    invoke-direct/range {v15 .. v24}, Lآۋۻؾ۹/ح;-><init>(JJLآۋۻؾ۹/ز;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Lآۋۻؾ۹/ظ;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object v12, v6

    move-object/from16 v1, v25

    move-object/from16 v11, v26

    move-object/from16 v9, v27

    move-wide/from16 v5, v28

    goto/16 :goto_4

    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    move-object/from16 v25, v1

    move-wide/from16 v28, v5

    move-object/from16 v27, v9

    const/4 v1, 0x5

    new-instance v2, Lآۋۻؾ۹/ب;

    invoke-direct {v2, v0}, Lآۋۻؾ۹/ب;-><init>(Ljava/util/ArrayList;)V

    iget-object v0, v3, Lأۺؘٻڣ/ت;->ؠ:[B

    iget-object v3, v4, Lء؅ڱ٢/آ;->آ:Ljava/net/URL;

    if-eqz v0, :cond_16

    :try_start_2
    invoke-static {v0}, Lء؅ڱ٢/؋;->؋([B)Lء؅ڱ٢/؋;

    move-result-object v0

    iget-object v5, v0, Lء؅ڱ٢/؋;->ؠ:Ljava/lang/String;

    if-eqz v5, :cond_15

    goto :goto_b

    :cond_15
    const/4 v5, 0x0

    :goto_b
    iget-object v6, v0, Lء؅ڱ٢/؋;->؋:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    if-eqz v6, :cond_17

    :try_start_3
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_c

    :catch_2
    move-exception v0

    :try_start_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid url: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_3

    :catch_3
    new-instance v2, Lإٿ٢/؋;

    const/4 v0, 0x3

    const-wide/16 v3, -0x1

    invoke-direct {v2, v0, v3, v4}, Lإٿ٢/؋;-><init>(IJ)V

    goto :goto_f

    :cond_16
    const/4 v5, 0x0

    :cond_17
    :goto_c
    :try_start_5
    new-instance v0, Lء؅ڱ٢/ؠ;

    invoke-direct {v0, v3, v2, v5}, Lء؅ڱ٢/ؠ;-><init>(Ljava/net/URL;Lآۋۻؾ۹/ذ;Ljava/lang/String;)V

    new-instance v2, Landroidx/constraintlayout/core/state/؋;

    const/4 v3, 0x2

    invoke-direct {v2, v3, v4}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    :cond_18
    invoke-virtual {v2, v0}, Landroidx/constraintlayout/core/state/؋;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lء؅ڱ٢/ء;

    iget-object v5, v4, Lء؅ڱ٢/ء;->ؠ:Ljava/net/URL;

    if-eqz v5, :cond_19

    const-string v6, "Following redirect to: %s"

    invoke-static {v14, v6, v5}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v5, Lء؅ڱ٢/ؠ;

    iget-object v6, v0, Lء؅ڱ٢/ؠ;->ؠ:Lآۋۻؾ۹/ذ;

    iget-object v0, v0, Lء؅ڱ٢/ؠ;->ء:Ljava/lang/String;

    iget-object v4, v4, Lء؅ڱ٢/ء;->ؠ:Ljava/net/URL;

    invoke-direct {v5, v4, v6, v0}, Lء؅ڱ٢/ؠ;-><init>(Ljava/net/URL;Lآۋۻؾ۹/ذ;Ljava/lang/String;)V

    move-object v0, v5

    goto :goto_d

    :cond_19
    const/4 v0, 0x0

    :goto_d
    if-eqz v0, :cond_1a

    add-int/lit8 v1, v1, -0x1

    const/4 v4, 0x1

    if-ge v1, v4, :cond_18

    :cond_1a
    check-cast v3, Lء؅ڱ٢/ء;

    iget v0, v3, Lء؅ڱ٢/ء;->؋:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_1b

    iget-wide v0, v3, Lء؅ڱ٢/ء;->ء:J

    new-instance v2, Lإٿ٢/؋;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v0, v1}, Lإٿ٢/؋;-><init>(IJ)V

    goto :goto_f

    :cond_1b
    const/16 v1, 0x1f4

    if-ge v0, v1, :cond_1e

    const/16 v1, 0x194

    if-ne v0, v1, :cond_1c

    goto :goto_e

    :cond_1c
    const/16 v1, 0x190

    if-ne v0, v1, :cond_1d

    new-instance v2, Lإٿ٢/؋;

    const/4 v0, 0x4

    const-wide/16 v3, -0x1

    invoke-direct {v2, v0, v3, v4}, Lإٿ٢/؋;-><init>(IJ)V

    goto :goto_f

    :cond_1d
    const-wide/16 v0, -0x1

    new-instance v2, Lإٿ٢/؋;

    const/4 v3, 0x3

    invoke-direct {v2, v3, v0, v1}, Lإٿ٢/؋;-><init>(IJ)V

    goto :goto_f

    :cond_1e
    :goto_e
    new-instance v2, Lإٿ٢/؋;

    const/4 v0, 0x2

    const-wide/16 v3, -0x1

    invoke-direct {v2, v0, v3, v4}, Lإٿ٢/؋;-><init>(IJ)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    :goto_f
    const/4 v0, 0x2

    goto :goto_10

    :catch_4
    move-exception v0

    const-string v1, "Could not make request to the backend"

    invoke-static {v14, v1, v0}, Lسۄھؤۏ۫/؋;->ح(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    new-instance v2, Lإٿ٢/؋;

    const/4 v0, 0x2

    const-wide/16 v3, -0x1

    invoke-direct {v2, v0, v3, v4}, Lإٿ٢/؋;-><init>(IJ)V

    :goto_10
    iget v1, v2, Lإٿ٢/؋;->؋:I

    if-ne v1, v0, :cond_1f

    new-instance v0, Lةؽڗںۍټ٘/ا;

    move-object v1, v0

    move-object/from16 v2, p0

    move-object v3, v10

    move-object/from16 v4, p1

    move-wide/from16 v5, v28

    invoke-direct/range {v1 .. v6}, Lةؽڗںۍټ٘/ا;-><init>(Lةؽڗںۍټ٘/ت;Ljava/lang/Iterable;Lأۺؘٻڣ/ز;J)V

    move-object/from16 v1, v27

    invoke-virtual {v1, v0}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    const/4 v0, 0x1

    add-int/lit8 v1, p2, 0x1

    move-object/from16 v4, p0

    iget-object v2, v4, Lةؽڗںۍټ٘/ت;->آ:Lةؽڗںۍټ٘/ح;

    check-cast v2, Lةؽڗںۍټ٘/أ;

    move-object/from16 v5, p1

    invoke-virtual {v2, v5, v1, v0}, Lةؽڗںۍټ٘/أ;->؋(Lأۺؘٻڣ/ز;IZ)V

    return-void

    :cond_1f
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v1, v27

    const/4 v0, 0x1

    new-instance v3, Lةؽڗںۍټ٘/ب;

    const/4 v6, 0x0

    invoke-direct {v3, v6, v4, v10}, Lةؽڗںۍټ٘/ب;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    iget v3, v2, Lإٿ٢/؋;->؋:I

    if-ne v3, v0, :cond_21

    iget-wide v2, v2, Lإٿ٢/؋;->ؠ:J

    move-wide/from16 v7, v28

    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, v5

    check-cast v0, Lأۺؘٻڣ/ت;

    iget-object v0, v0, Lأۺؘٻڣ/ت;->ؠ:[B

    if-eqz v0, :cond_20

    const/4 v6, 0x1

    :cond_20
    if-eqz v6, :cond_25

    new-instance v0, Landroidx/constraintlayout/core/state/؋;

    const/4 v6, 0x4

    invoke-direct {v0, v6, v4}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    goto :goto_13

    :cond_21
    move-wide/from16 v7, v28

    const/4 v0, 0x4

    if-ne v3, v0, :cond_24

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lةٌخ/ؠ;

    iget-object v3, v3, Lةٌخ/ؠ;->ء:Lأۺؘٻڣ/ا;

    iget-object v3, v3, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_22

    const/4 v6, 0x1

    goto :goto_12

    :cond_22
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    :goto_12
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    :cond_23
    const/4 v2, 0x1

    new-instance v3, Lةؽڗںۍټ٘/ب;

    invoke-direct {v3, v2, v4, v0}, Lةؽڗںۍټ٘/ب;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    :cond_24
    move-wide v2, v7

    :cond_25
    :goto_13
    move-object v7, v4

    move-object v8, v5

    move-object/from16 v1, v25

    goto/16 :goto_0

    :cond_26
    move-object v4, v7

    move-object v1, v9

    move-wide/from16 v41, v5

    move-object v5, v8

    move-wide/from16 v7, v41

    invoke-virtual {v1}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    new-instance v6, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v0, 0xe

    invoke-direct {v6, v0}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iget-object v0, v1, Lةٌخ/ة;->ؤ:Lثڈا/؋;

    move-object v9, v0

    check-cast v9, Lثڈا/ؠ;

    invoke-virtual {v9}, Lثڈا/ؠ;->؋()J

    move-result-wide v10

    :goto_14
    :try_start_6
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_15

    :catch_5
    move-exception v0

    move-object v12, v0

    invoke-virtual {v9}, Lثڈا/ؠ;->؋()J

    move-result-wide v13

    iget-object v0, v1, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget v0, v0, Lةٌخ/؋;->ء:I

    move-object/from16 v27, v1

    int-to-long v0, v0

    add-long/2addr v0, v10

    cmp-long v0, v13, v0

    if-ltz v0, :cond_27

    invoke-virtual {v6, v12}, Landroidx/constraintlayout/core/state/ؠ;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_15
    :try_start_7
    check-cast v3, Lثڈا/ؠ;

    invoke-virtual {v3}, Lثڈا/ؠ;->؋()J

    move-result-wide v0

    add-long/2addr v0, v7

    iget-object v3, v4, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v3, Lةٌخ/ة;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lةٌخ/أ;

    invoke-direct {v6, v0, v1, v5}, Lةٌخ/أ;-><init>(JLأۺؘٻڣ/ز;)V

    invoke-virtual {v3, v6}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_27
    const-wide/16 v0, 0x32

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    move-object/from16 v1, v27

    goto :goto_14
.end method
