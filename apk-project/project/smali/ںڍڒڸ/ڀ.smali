.class public final Lںڍڒڸ/ڀ;
.super Lںڍڒڸ/ر;
.source "SourceFile"


# static fields
.field public static final synthetic آ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lںڍڒڸ/ڀ;

    invoke-direct {v0}, Lںڍڒڸ/ڀ;-><init>()V

    return-void
.end method


# virtual methods
.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 0

    sget-object p2, Lںڍڒڸ/ڄ;->أ:Lذ۠ۋؿ/ب;

    invoke-interface {p1, p2}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    check-cast p1, Lںڍڒڸ/ڄ;

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    iput-boolean p2, p1, Lںڍڒڸ/ڄ;->آ:Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Dispatchers.Unconfined.dispatch function can only be used by the yield function. If you wrap Unconfined dispatcher in your code, make sure you properly delegate isDispatchNeeded and dispatch calls."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "limitedParallelism is not supported for Dispatchers.Unconfined"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    const-string v0, "Dispatchers.Unconfined"

    return-object v0
.end method
