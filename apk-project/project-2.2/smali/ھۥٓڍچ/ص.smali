.class public final Lھۥٓڍچ/ص;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/پ;


# instance fields
.field public final آ:Ljava/lang/Object;

.field public final أ:Ljava/lang/ThreadLocal;

.field public final ؤ:Lھۥٓڍچ/ض;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/ThreadLocal;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھۥٓڍچ/ص;->آ:Ljava/lang/Object;

    iput-object p2, p0, Lھۥٓڍچ/ص;->أ:Ljava/lang/ThreadLocal;

    new-instance p1, Lھۥٓڍچ/ض;

    invoke-direct {p1, p2}, Lھۥٓڍچ/ض;-><init>(Ljava/lang/ThreadLocal;)V

    iput-object p1, p0, Lھۥٓڍچ/ص;->ؤ:Lھۥٓڍچ/ض;

    return-void
.end method


# virtual methods
.method public final fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p2, p1, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ص;->ؤ:Lھۥٓڍچ/ض;

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move-object p1, p0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final getKey()Lڨڡئٸت/ئ;
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ص;->ؤ:Lھۥٓڍچ/ض;

    return-object v0
.end method

.method public final minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ص;->ؤ:Lھۥٓڍچ/ض;

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    goto :goto_0

    :cond_0
    move-object p1, p0

    :goto_0
    return-object p1
.end method

.method public final plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ThreadLocal(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lھۥٓڍچ/ص;->آ:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", threadLocal = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lھۥٓڍچ/ص;->أ:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ص;->أ:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public final آ(Lڨڡئٸت/ا;)Ljava/lang/Object;
    .locals 2

    iget-object p1, p0, Lھۥٓڍچ/ص;->أ:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lھۥٓڍچ/ص;->آ:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-object v0
.end method
