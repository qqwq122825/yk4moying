.class public final Lںڍڒڸ/ء;
.super Lںڍڒڸ/؋;
.source "SourceFile"


# instance fields
.field public final إ:Ljava/lang/Thread;

.field public final ئ:Lںڍڒڸ/ف;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ا;Ljava/lang/Thread;Lںڍڒڸ/ف;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lںڍڒڸ/؋;-><init>(Lڨڡئٸت/ا;Z)V

    iput-object p2, p0, Lںڍڒڸ/ء;->إ:Ljava/lang/Thread;

    iput-object p3, p0, Lںڍڒڸ/ء;->ئ:Lںڍڒڸ/ف;

    return-void
.end method


# virtual methods
.method public final ة(Ljava/lang/Object;)V
    .locals 1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    iget-object v0, p0, Lںڍڒڸ/ء;->إ:Ljava/lang/Thread;

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    :cond_0
    return-void
.end method
