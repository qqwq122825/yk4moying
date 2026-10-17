.class public final Lخڝٻؽؐ/آ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؠ:Lخڝٻؽؐ/آ;


# instance fields
.field public final ؋:Lٽچڃ/أ;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    new-instance v0, Lٽچڃ/أ;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lٽچڃ/أ;-><init>(I)V

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lخڝٻؽؐ/آ;

    invoke-direct {v2, v0, v1}, Lخڝٻؽؐ/آ;-><init>(Lٽچڃ/أ;Landroid/os/Looper;)V

    sput-object v2, Lخڝٻؽؐ/آ;->ؠ:Lخڝٻؽؐ/آ;

    return-void
.end method

.method public constructor <init>(Lٽچڃ/أ;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lخڝٻؽؐ/آ;->؋:Lٽچڃ/أ;

    return-void
.end method
