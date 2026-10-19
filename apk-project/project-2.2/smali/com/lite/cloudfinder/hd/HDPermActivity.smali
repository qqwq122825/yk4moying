.class public Lcom/lite/cloudfinder/hd/HDPermActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static أ:I

.field public static ؤ:Landroid/content/Intent;


# instance fields
.field public ؋:I

.field public ؠ:I

.field public ء:I

.field public آ:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/16 v0, 0x1e0

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->؋:I

    const/16 v0, 0x356

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؠ:I

    const/16 v0, 0x19

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ء:I

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->آ:I

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onActivityResult code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HDPerm"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x26ad

    if-ne p1, v0, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    if-eqz p3, :cond_0

    const/4 p1, 0x0

    sput-boolean p1, Lسۄھؤۏ۫/؋;->ص:Z

    sput p2, Lcom/lite/cloudfinder/hd/HDPermActivity;->أ:I

    sput-object p3, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؤ:Landroid/content/Intent;

    invoke-virtual {p0, p2, p3}, Lcom/lite/cloudfinder/hd/HDPermActivity;->؋(ILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    const-string p1, "Permission denied"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onBackPressed()V
    .locals 0

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "width"

    const/16 v1, 0x1e0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->؋:I

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "height"

    const/16 v1, 0x356

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؠ:I

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "quality"

    const/16 v1, 0x19

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ء:I

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "fps"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->آ:I

    sget p1, Lcom/lite/cloudfinder/hd/HDPermActivity;->أ:I

    const/4 v0, -0x1

    const/16 v1, 0x22

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؤ:Landroid/content/Intent;

    if-eqz p1, :cond_0

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p1, v1, :cond_0

    const-string p1, "HDPerm"

    const-string v0, "Using cached projection permission"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget p1, Lcom/lite/cloudfinder/hd/HDPermActivity;->أ:I

    sget-object v0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؤ:Landroid/content/Intent;

    invoke-virtual {p0, p1, v0}, Lcom/lite/cloudfinder/hd/HDPermActivity;->؋(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_0
    const-string p1, "media_projection"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_1

    invoke-static {}, Landroid/media/projection/MediaProjectionConfig;->createConfigForDefaultDisplay()Landroid/media/projection/MediaProjectionConfig;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/core/view/accessibility/آ;->؋(Landroid/media/projection/MediaProjectionManager;Landroid/media/projection/MediaProjectionConfig;)Landroid/content/Intent;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/media/projection/MediaProjectionManager;->createScreenCaptureIntent()Landroid/content/Intent;

    move-result-object p1

    :goto_0
    const/16 v0, 0x26ad

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public final ؋(ILandroid/content/Intent;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "resultCode"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "data"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "width"

    iget p2, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->؋:I

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "height"

    iget p2, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ؠ:I

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "quality"

    iget p2, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->ء:I

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "fps"

    iget p2, p0, Lcom/lite/cloudfinder/hd/HDPermActivity;->آ:I

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method
