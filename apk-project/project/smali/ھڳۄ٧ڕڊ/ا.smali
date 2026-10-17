.class public final Lھڳۄ٧ڕڊ/ا;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/ئ;


# instance fields
.field public final synthetic آ:Lڽتٺۊڗ؜/ب;

.field public final synthetic أ:I


# direct methods
.method public constructor <init>(Lڽتٺۊڗ؜/ب;I)V
    .locals 0

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ا;->آ:Lڽتٺۊڗ؜/ب;

    iput p2, p0, Lھڳۄ٧ڕڊ/ا;->أ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 6

    instance-of v0, p2, Lھڳۄ٧ڕڊ/ئ;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lھڳۄ٧ڕڊ/ئ;

    iget v1, v0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    goto :goto_0

    :cond_0
    new-instance v0, Lھڳۄ٧ڕڊ/ئ;

    invoke-direct {v0, p0, p2}, Lھڳۄ٧ڕڊ/ئ;-><init>(Lھڳۄ٧ڕڊ/ا;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object p2, v0, Lھڳۄ٧ڕڊ/ئ;->آ:Ljava/lang/Object;

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v2, v0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    sget-object v3, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eqz v2, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v5, :cond_1

    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto/16 :goto_b

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p2}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    new-instance p2, Lڡپٔۯ/ش;

    iget v2, p0, Lھڳۄ٧ڕڊ/ا;->أ:I

    invoke-direct {p2, v2, p1}, Lڡپٔۯ/ش;-><init>(ILjava/lang/Object;)V

    iput v4, v0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    iget-object p1, p0, Lھڳۄ٧ڕڊ/ا;->آ:Lڽتٺۊڗ؜/ب;

    invoke-interface {p1, p2, v0}, Lڽتٺۊڗ؜/ش;->ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    iput v5, v0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    invoke-interface {v0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    invoke-static {p1}, Lڗًقڔ/ء;->ب(Lڨڡئٸت/ا;)V

    invoke-static {v0}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p2

    instance-of v0, p2, Lھۥٓڍچ/إ;

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    check-cast p2, Lھۥٓڍچ/إ;

    goto :goto_2

    :cond_5
    move-object p2, v2

    :goto_2
    if-nez p2, :cond_6

    goto :goto_7

    :cond_6
    iget-object v0, p2, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    invoke-virtual {v0, p1}, Lںڍڒڸ/ر;->isDispatchNeeded(Lڨڡئٸت/ا;)Z

    move-result v5

    if-eqz v5, :cond_7

    iput-object v3, p2, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v4, p2, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {v0, p1, p2}, Lںڍڒڸ/ر;->dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto :goto_8

    :cond_7
    new-instance v5, Lںڍڒڸ/ڄ;

    invoke-direct {v5}, Lںڍڒڸ/ڄ;-><init>()V

    invoke-interface {p1, v5}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    iput-object v3, p2, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v4, p2, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {v0, p1, p2}, Lںڍڒڸ/ر;->dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    iget-boolean p1, v5, Lںڍڒڸ/ڄ;->آ:Z

    if-eqz p1, :cond_d

    invoke-static {}, Lںڍڒڸ/ٿ;->؋()Lںڍڒڸ/ف;

    move-result-object p1

    iget-object v0, p1, Lںڍڒڸ/ف;->ؤ:Lڡپٔۯ/ب;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v0

    goto :goto_3

    :cond_8
    move v0, v4

    :goto_3
    if-eqz v0, :cond_9

    goto :goto_5

    :cond_9
    invoke-virtual {p1}, Lںڍڒڸ/ف;->ق()Z

    move-result v0

    if-eqz v0, :cond_a

    iput-object v3, p2, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v4, p2, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {p1, p2}, Lںڍڒڸ/ف;->ؿ(Lںڍڒڸ/ع;)V

    goto :goto_6

    :cond_a
    invoke-virtual {p1, v4}, Lںڍڒڸ/ف;->ف(Z)V

    :try_start_0
    invoke-virtual {p2}, Lںڍڒڸ/ع;->run()V

    :cond_b
    invoke-virtual {p1}, Lںڍڒڸ/ف;->ل()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_b

    goto :goto_4

    :catchall_0
    move-exception v0

    :try_start_1
    invoke-virtual {p2, v0, v2}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_4
    invoke-virtual {p1, v4}, Lںڍڒڸ/ف;->ؾ(Z)V

    :goto_5
    const/4 v4, 0x0

    :goto_6
    if-eqz v4, :cond_c

    goto :goto_8

    :cond_c
    :goto_7
    move-object p1, v3

    goto :goto_9

    :catchall_1
    move-exception p2

    invoke-virtual {p1, v4}, Lںڍڒڸ/ف;->ؾ(Z)V

    throw p2

    :cond_d
    :goto_8
    sget-object p1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    :goto_9
    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_e

    goto :goto_a

    :cond_e
    move-object p1, v3

    :goto_a
    if-ne p1, v1, :cond_f

    return-object v1

    :cond_f
    :goto_b
    return-object v3
.end method
