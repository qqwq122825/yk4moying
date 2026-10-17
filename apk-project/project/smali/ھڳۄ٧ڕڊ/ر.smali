.class public final Lھڳۄ٧ڕڊ/ر;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public final synthetic آ:Lھڳۄ٧ڕڊ/خ;


# direct methods
.method public constructor <init>(Lھڳۄ٧ڕڊ/خ;)V
    .locals 0

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ر;->آ:Lھڳۄ٧ڕڊ/خ;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    check-cast p2, Lڨڡئٸت/إ;

    invoke-interface {p2}, Lڨڡئٸت/إ;->getKey()Lڨڡئٸت/ئ;

    move-result-object v0

    iget-object v1, p0, Lھڳۄ٧ڕڊ/ر;->آ:Lھڳۄ٧ڕڊ/خ;

    iget-object v1, v1, Lھڳۄ٧ڕڊ/خ;->أ:Lڨڡئٸت/ا;

    invoke-interface {v1, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    sget-object v2, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    if-eq v0, v2, :cond_0

    if-eq p2, v1, :cond_3

    const/high16 p1, -0x80000000

    goto :goto_2

    :cond_0
    check-cast v1, Lںڍڒڸ/ى;

    check-cast p2, Lںڍڒڸ/ى;

    :goto_0
    const/4 v0, 0x0

    if-nez p2, :cond_1

    move-object p2, v0

    goto :goto_1

    :cond_1
    if-ne p2, v1, :cond_2

    goto :goto_1

    :cond_2
    instance-of v2, p2, Lھۥٓڍچ/ر;

    if-nez v2, :cond_5

    :goto_1
    if-ne p2, v1, :cond_4

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 p1, p1, 0x1

    :goto_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Flow invariant is violated:\n\t\tEmission from another coroutine is detected.\n\t\tChild of "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ", expected child of "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ".\n\t\tFlowCollector is not thread-safe and concurrent emissions are prohibited.\n\t\tTo mitigate this restriction please use \'channelFlow\' builder instead of \'flow\'"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    check-cast p2, Lںڍڒڸ/ٵ;

    sget-object v2, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lںڍڒڸ/ة;

    if-eqz p2, :cond_6

    invoke-interface {p2}, Lںڍڒڸ/ة;->getParent()Lںڍڒڸ/ى;

    move-result-object p2

    goto :goto_0

    :cond_6
    move-object p2, v0

    goto :goto_0
.end method
