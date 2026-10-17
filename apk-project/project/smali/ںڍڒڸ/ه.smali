.class public final Lںڍڒڸ/ه;
.super Lںڍڒڸ/ٮ;
.source "SourceFile"


# static fields
.field public static final ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile _invoked:I

.field public final ئ:Lڲٱۘۑدٿٰ/ت;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lںڍڒڸ/ه;

    const-string v1, "_invoked"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ه;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lڲٱۘۑدٿٰ/ت;)V
    .locals 0

    invoke-direct {p0}, Lںڍڒڸ/ٮ;-><init>()V

    iput-object p1, p0, Lںڍڒڸ/ه;->ئ:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public final bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ه;->ة(Ljava/lang/Throwable;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final ة(Ljava/lang/Throwable;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    sget-object v2, Lںڍڒڸ/ه;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lںڍڒڸ/ه;->ئ:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v0, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
