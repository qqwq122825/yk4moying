.class public final Lڝږ؁ڋ/ػ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# virtual methods
.method public final run()V
    .locals 3

    sget-boolean v0, Lڝږ؁ڋ/ؼ;->؋:Z

    if-eqz v0, :cond_1

    sget-object v0, Lڝږ؁ڋ/ؼ;->ة:Landroid/accessibilityservice/AccessibilityService;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lڝږ؁ڋ/ؼ;->ة:Landroid/accessibilityservice/AccessibilityService;

    invoke-static {v0}, Lڝږ؁ڋ/ؼ;->إ(Landroid/accessibilityservice/AccessibilityService;)V

    sget-object v0, Lڝږ؁ڋ/ؼ;->ؠ:Landroid/os/Handler;

    const-wide/16 v1, 0x1e

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_1
    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ؼ;->آ:Ljava/lang/Runnable;

    return-void
.end method
