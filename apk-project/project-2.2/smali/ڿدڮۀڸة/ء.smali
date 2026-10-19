.class public final Lڿدڮۀڸة/ء;
.super Lںڍڒڸ/ق;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field public static final آ:Lڿدڮۀڸة/ء;

.field public static final أ:Lںڍڒڸ/ر;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lڿدڮۀڸة/ء;

    invoke-direct {v0}, Lڿدڮۀڸة/ء;-><init>()V

    sput-object v0, Lڿدڮۀڸة/ء;->آ:Lڿدڮۀڸة/ء;

    sget-object v0, Lڿدڮۀڸة/ة;->آ:Lڿدڮۀڸة/ة;

    sget v1, Lھۥٓڍچ/ش;->؋:I

    const/16 v2, 0x40

    if-ge v2, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    const/16 v2, 0xc

    const-string v3, "kotlinx.coroutines.io.parallelism"

    const/4 v4, 0x0

    invoke-static {v3, v1, v4, v4, v2}, Lڗًقڔ/؋;->ڂ(Ljava/lang/String;IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Lڿدڮۀڸة/ة;->limitedParallelism(I)Lںڍڒڸ/ر;

    move-result-object v0

    sput-object v0, Lڿدڮۀڸة/ء;->أ:Lںڍڒڸ/ر;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot be invoked on Dispatchers.IO"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 1

    sget-object v0, Lڿدڮۀڸة/ء;->أ:Lںڍڒڸ/ر;

    invoke-virtual {v0, p1, p2}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 1

    sget-object v0, Lڿدڮۀڸة/ء;->أ:Lںڍڒڸ/ر;

    invoke-virtual {v0, p1, p2}, Lںڍڒڸ/ر;->dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final execute(Ljava/lang/Runnable;)V
    .locals 1

    sget-object v0, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    invoke-virtual {p0, v0, p1}, Lڿدڮۀڸة/ء;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    sget-object v0, Lڿدڮۀڸة/ة;->آ:Lڿدڮۀڸة/ة;

    invoke-virtual {v0, p1}, Lڿدڮۀڸة/ة;->limitedParallelism(I)Lںڍڒڸ/ر;

    move-result-object p1

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    const-string v0, "Dispatchers.IO"

    return-object v0
.end method
