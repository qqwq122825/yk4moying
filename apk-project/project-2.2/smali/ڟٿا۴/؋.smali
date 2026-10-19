.class public final Lڟٿا۴/؋;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lcom/lite/cloudfinder/hd/HDStreamService;


# direct methods
.method public constructor <init>(Lcom/lite/cloudfinder/hd/HDStreamService;)V
    .locals 0

    iput-object p1, p0, Lڟٿا۴/؋;->؋:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onStop()V
    .locals 2

    const-string v0, "HDStream"

    const-string v1, "MediaProjection stopped by system"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lcom/lite/cloudfinder/hd/HDStreamService;->ث:Z

    iget-object v0, p0, Lڟٿا۴/؋;->؋:Lcom/lite/cloudfinder/hd/HDStreamService;

    invoke-virtual {v0}, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ()V

    return-void
.end method
