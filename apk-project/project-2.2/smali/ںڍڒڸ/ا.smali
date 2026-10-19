.class public final Lںڍڒڸ/ا;
.super Lںڍڒڸ/خ;
.source "SourceFile"


# static fields
.field public static final ء:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile _resumed:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lںڍڒڸ/ا;

    const-string v1, "_resumed"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ا;->ء:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lڨڡئٸت/أ;Ljava/lang/Throwable;Z)V
    .locals 0

    invoke-direct {p0, p3, p2}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    const/4 p1, 0x0

    iput p1, p0, Lںڍڒڸ/ا;->_resumed:I

    return-void
.end method
