.class public final synthetic Lڝږ؁ڋ/ل;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:I

.field public final synthetic ؤ:Landroid/accessibilityservice/AccessibilityService;

.field public final synthetic إ:I


# direct methods
.method public synthetic constructor <init>(IILandroid/accessibilityservice/AccessibilityService;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lڝږ؁ڋ/ل;->آ:I

    iput p2, p0, Lڝږ؁ڋ/ل;->أ:I

    iput-object p3, p0, Lڝږ؁ڋ/ل;->ؤ:Landroid/accessibilityservice/AccessibilityService;

    iput p4, p0, Lڝږ؁ڋ/ل;->إ:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    iget v0, p0, Lڝږ؁ڋ/ل;->آ:I

    iget v1, p0, Lڝږ؁ڋ/ل;->أ:I

    iget-object v2, p0, Lڝږ؁ڋ/ل;->ؤ:Landroid/accessibilityservice/AccessibilityService;

    iget v3, p0, Lڝږ؁ڋ/ل;->إ:I

    const-string v4, "TouchPinGrab"

    const-string v5, "Replay touch #"

    :try_start_0
    new-instance v7, Landroid/graphics/Path;

    invoke-direct {v7}, Landroid/graphics/Path;-><init>()V

    int-to-float v6, v0

    int-to-float v8, v1

    invoke-virtual {v7, v6, v8}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance v12, Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-direct {v12}, Landroid/accessibilityservice/GestureDescription$Builder;-><init>()V

    new-instance v13, Landroid/accessibilityservice/GestureDescription$StrokeDescription;

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x64

    move-object v6, v13

    invoke-direct/range {v6 .. v11}, Landroid/accessibilityservice/GestureDescription$StrokeDescription;-><init>(Landroid/graphics/Path;JJ)V

    invoke-virtual {v12, v13}, Landroid/accessibilityservice/GestureDescription$Builder;->addStroke(Landroid/accessibilityservice/GestureDescription$StrokeDescription;)Landroid/accessibilityservice/GestureDescription$Builder;

    invoke-virtual {v12}, Landroid/accessibilityservice/GestureDescription$Builder;->build()Landroid/accessibilityservice/GestureDescription;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v2, v6, v7, v7}, Landroid/accessibilityservice/AccessibilityService;->dispatchGesture(Landroid/accessibilityservice/GestureDescription;Landroid/accessibilityservice/AccessibilityService$GestureResultCallback;Landroid/os/Handler;)Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Replay gesture error"

    invoke-static {v4, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method
