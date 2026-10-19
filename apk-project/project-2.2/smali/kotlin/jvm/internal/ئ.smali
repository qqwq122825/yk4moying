.class public abstract Lkotlin/jvm/internal/ئ;
.super Lkotlin/jvm/internal/ؠ;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/internal/إ;
.implements Lڶۇ؁ٻٿٔؽ/أ;


# instance fields
.field private final arity:I

.field private final flags:I


# direct methods
.method public constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8

    and-int/lit8 v0, p6, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    move v7, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    move v7, v0

    :goto_0
    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v2 .. v7}, Lkotlin/jvm/internal/ؠ;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V

    iput p1, p0, Lkotlin/jvm/internal/ئ;->arity:I

    shr-int/lit8 p1, p6, 0x1

    iput p1, p0, Lkotlin/jvm/internal/ئ;->flags:I

    return-void
.end method


# virtual methods
.method public computeReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
    .locals 1

    sget-object v0, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lkotlin/jvm/internal/ئ;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    check-cast p1, Lkotlin/jvm/internal/ئ;

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/ؠ;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/ؠ;->getSignature()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lkotlin/jvm/internal/ئ;->flags:I

    iget v3, p1, Lkotlin/jvm/internal/ئ;->flags:I

    if-ne v1, v3, :cond_1

    iget v1, p0, Lkotlin/jvm/internal/ئ;->arity:I

    iget v3, p1, Lkotlin/jvm/internal/ئ;->arity:I

    if-ne v1, v3, :cond_1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getBoundReceiver()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/ؠ;->getBoundReceiver()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getOwner()Lڶۇ؁ٻٿٔؽ/آ;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/ؠ;->getOwner()Lڶۇ؁ٻٿٔؽ/آ;

    move-result-object p1

    invoke-static {v1, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    instance-of v0, p1, Lڶۇ؁ٻٿٔؽ/أ;

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->compute()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    return v2
.end method

.method public getArity()I
    .locals 1

    iget v0, p0, Lkotlin/jvm/internal/ئ;->arity:I

    return v0
.end method

.method public bridge synthetic getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    return-object v0
.end method

.method public getReflected()Lڶۇ؁ٻٿٔؽ/أ;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->compute()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    if-eq v0, p0, :cond_0

    check-cast v0, Lڶۇ؁ٻٿٔؽ/أ;

    return-object v0

    :cond_0
    new-instance v0, Lڲایڙؕ/؋;

    invoke-direct {v0}, Lڲایڙؕ/؋;-><init>()V

    throw v0
.end method

.method public hashCode()I
    .locals 2

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getOwner()Lڶۇ؁ٻٿٔؽ/آ;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getOwner()Lڶۇ؁ٻٿٔؽ/آ;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    :goto_0
    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    return v0
.end method

.method public isExternal()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/أ;->isExternal()Z

    move-result v0

    return v0
.end method

.method public isInfix()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/أ;->isInfix()Z

    move-result v0

    return v0
.end method

.method public isInline()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/أ;->isInline()Z

    move-result v0

    return v0
.end method

.method public isOperator()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/أ;->isOperator()Z

    move-result v0

    return v0
.end method

.method public isSuspend()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ئ;->getReflected()Lڶۇ؁ٻٿٔؽ/أ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/أ;->isSuspend()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->compute()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    if-eq v0, p0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "<init>"

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "constructor (Kotlin reflection is not available)"

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "function "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (Kotlin reflection is not available)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
