.class public abstract Lٿةڥۣ٠ؕآڏ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic ؋:I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lٿةڥۣ٠ؕآڏ/؋;

    invoke-direct {v2}, Lٿةڥۣ٠ؕآڏ/؋;-><init>()V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    return-void
.end method
