.class public final synthetic Lڛڜڕڰڑ/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:J

.field public final synthetic أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;


# direct methods
.method public synthetic constructor <init>(JLcom/lite/cloudfinder/accessibility/MyAccessibilityService;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lڛڜڕڰڑ/آ;->آ:J

    iput-object p3, p0, Lڛڜڕڰڑ/آ;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-wide v0, p0, Lڛڜڕڰڑ/آ;->آ:J

    iget-object v2, p0, Lڛڜڕڰڑ/آ;->أ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    sget-object v3, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    :cond_0
    sget-boolean v3, Lڗًقڔ/؋;->ئ:Z

    if-eqz v3, :cond_1

    const-wide/16 v3, 0x1f4

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    const-wide/32 v5, 0x186a0

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    :cond_1
    const/4 v0, 0x0

    sput-boolean v0, Lسۄھؤۏ۫/؋;->د:Z

    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_2

    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-wide/16 v3, 0x96

    :try_start_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x12c

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    :try_start_3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    invoke-virtual {v2, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    const-string v0, "MyAccessSvc"

    const-string v1, "Update battery optimization flow complete, returned to home"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
