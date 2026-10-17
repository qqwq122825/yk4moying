.class public final synthetic Lڛڜڕڰڑ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

.field public final synthetic ؤ:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;I)V
    .locals 0

    iput p3, p0, Lڛڜڕڰڑ/؋;->آ:I

    iput-object p1, p0, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    iput-object p2, p0, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 20

    move-object/from16 v1, p0

    iget v0, v1, Lڛڜڕڰڑ/؋;->آ:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    :pswitch_0
    iget-object v0, v1, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v2, v1, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lڝږ؁ڋ/ء;->؋:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v10, "|"

    :try_start_0
    invoke-virtual {v2}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    if-nez v2, :cond_0

    goto/16 :goto_3

    :cond_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Lڝږ؁ڋ/ء;->ؤ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/util/HashMap;Ljava/lang/StringBuilder;I)V

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sget-object v3, Lڝږ؁ڋ/ء;->؋:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v2, :cond_8

    :try_start_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lڝږ؁ڋ/ء;->ء:[[Ljava/lang/String;

    invoke-static {v2, v4}, Lڝږ؁ڋ/ء;->ء(Ljava/lang/String;[[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v2, "balance"

    :goto_1
    move-object v4, v2

    goto :goto_2

    :cond_2
    sget-object v4, Lڝږ؁ڋ/ء;->آ:[[Ljava/lang/String;

    invoke-static {v2, v4}, Lڝږ؁ڋ/ء;->ء(Ljava/lang/String;[[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v2, "transfer"

    goto :goto_1

    :cond_3
    sget-object v4, Lڝږ؁ڋ/ء;->أ:[[Ljava/lang/String;

    invoke-static {v2, v4}, Lڝږ؁ڋ/ء;->ء(Ljava/lang/String;[[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v2, "received"

    goto :goto_1

    :cond_4
    sget-object v4, Lڝږ؁ڋ/ء;->ؤ:[[Ljava/lang/String;

    invoke-static {v2, v4}, Lڝږ؁ڋ/ء;->ء(Ljava/lang/String;[[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "payment"

    goto :goto_1

    :cond_5
    const-string v2, "unknown"

    goto :goto_1

    :goto_2
    invoke-static {v5, v0}, Lڝږ؁ڋ/ء;->؋(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Lڝږ؁ڋ/ء;->أ(Ljava/lang/String;)D

    move-result-wide v7

    const-wide/high16 v13, 0x4014000000000000L    # 5.0

    cmpg-double v2, v7, v13

    if-gez v2, :cond_6

    goto :goto_0

    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    if-eqz v13, :cond_7

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    sub-long v16, v14, v16

    const-wide/32 v18, 0x927c0

    cmp-long v13, v16, v18

    if-gez v13, :cond_7

    goto/16 :goto_0

    :cond_7
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v3, v2, v13}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v0

    move-object v3, v0

    invoke-static/range {v2 .. v9}, Lڝږ؁ڋ/ء;->إ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    new-instance v2, Lڝږ؁ڋ/ؠ;

    invoke-direct {v2, v4, v5}, Lڝږ؁ڋ/ؠ;-><init>(J)V

    invoke-interface {v0, v2}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    const-string v2, "AmountScanner"

    const-string v3, "scan error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void

    :pswitch_1
    iget-object v0, v1, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v2, v1, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_2
    invoke-virtual {v2, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ئ(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    return-void

    :pswitch_2
    iget-object v0, v1, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v2, v1, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    if-eqz v2, :cond_9

    goto :goto_4

    :cond_9
    :try_start_3
    const-string v2, ""

    :goto_4
    invoke-static {v0, v2}, Lڝږ؁ڋ/ك;->ب(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    return-void

    :pswitch_3
    iget-object v0, v1, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    sget-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v2, v1, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_4
    invoke-virtual {v2, v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :catch_3
    return-void

    :goto_5
    iget-object v0, v1, Lڛڜڕڰڑ/؋;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    iget-object v2, v1, Lڛڜڕڰڑ/؋;->ؤ:Ljava/lang/String;

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_5
    sput-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ث:Ljava/lang/String;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sput-object v2, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ب:Ljava/lang/Boolean;

    const-wide/16 v2, 0xc8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ح()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_6

    :catch_4
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
