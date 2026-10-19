.class public final Lںڏۑڎڔٙ۰/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھۥٓڍچ/ج;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ؋()Ljava/lang/String;
    .locals 1

    const-string v0, "For tests Dispatchers.setMain from kotlinx-coroutines-test module can be used"

    return-object v0
.end method

.method public ؠ(Ljava/util/List;)Lںڍڒڸ/ٷ;
    .locals 1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Lںڏۑڎڔٙ۰/آ;

    invoke-static {p1}, Lںڏۑڎڔٙ۰/أ;->؋(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object p1

    invoke-direct {v0, p1}, Lںڏۑڎڔٙ۰/آ;-><init>(Landroid/os/Handler;)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "The main looper is not available"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public ء()I
    .locals 1

    const v0, 0x3fffffff    # 1.9999999f

    return v0
.end method
