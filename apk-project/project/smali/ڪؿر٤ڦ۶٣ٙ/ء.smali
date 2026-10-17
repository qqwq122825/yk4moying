.class public final Lڪؿر٤ڦ۶٣ٙ/ء;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public آ:I

.field public final synthetic أ:Lڲٱۘۑدٿٰ/خ;

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;Lڲٱۘۑدٿٰ/خ;Ljava/lang/Object;)V
    .locals 0

    iput-object p3, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->أ:Lڲٱۘۑدٿٰ/خ;

    iput-object p4, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->ؤ:Ljava/lang/Object;

    const-string p3, "null cannot be cast to non-null type kotlin.coroutines.Continuation<kotlin.Any?>"

    invoke-static {p1, p3}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->آ:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    if-ne v0, v2, :cond_0

    iput v1, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->آ:I

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This coroutine had already completed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iput v2, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->آ:I

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->أ:Lڲٱۘۑدٿٰ/خ;

    const-string v0, "null cannot be cast to non-null type kotlin.Function2<R of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted$lambda$1, kotlin.coroutines.Continuation<T of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted$lambda$1>, kotlin.Any?>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, p1}, Lڗًقڔ/ء;->ء(ILjava/lang/Object;)V

    iget-object v0, p0, Lڪؿر٤ڦ۶٣ٙ/ء;->ؤ:Ljava/lang/Object;

    invoke-interface {p1, v0, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    return-object p1
.end method
