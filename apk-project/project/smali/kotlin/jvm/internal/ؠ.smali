.class public abstract Lkotlin/jvm/internal/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڶۇ؁ٻٿٔؽ/ؠ;
.implements Ljava/io/Serializable;


# static fields
.field public static final NO_RECEIVER:Ljava/lang/Object;


# instance fields
.field private final isTopLevel:Z

.field private final name:Ljava/lang/String;

.field private final owner:Ljava/lang/Class;

.field protected final receiver:Ljava/lang/Object;

.field private transient reflected:Lڶۇ؁ٻٿٔؽ/ؠ;

.field private final signature:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lkotlin/jvm/internal/؋;->آ:Lkotlin/jvm/internal/؋;

    sput-object v0, Lkotlin/jvm/internal/ؠ;->NO_RECEIVER:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/jvm/internal/ؠ;->receiver:Ljava/lang/Object;

    iput-object p2, p0, Lkotlin/jvm/internal/ؠ;->owner:Ljava/lang/Class;

    iput-object p3, p0, Lkotlin/jvm/internal/ؠ;->name:Ljava/lang/String;

    iput-object p4, p0, Lkotlin/jvm/internal/ؠ;->signature:Ljava/lang/String;

    iput-boolean p5, p0, Lkotlin/jvm/internal/ؠ;->isTopLevel:Z

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0, p1}, Lڶۇ؁ٻٿٔؽ/ؠ;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public callBy(Ljava/util/Map;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0, p1}, Lڶۇ؁ٻٿٔؽ/ؠ;->callBy(Ljava/util/Map;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public compute()Lڶۇ؁ٻٿٔؽ/ؠ;
    .locals 1

    iget-object v0, p0, Lkotlin/jvm/internal/ؠ;->reflected:Lڶۇ؁ٻٿٔؽ/ؠ;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->computeReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    iput-object v0, p0, Lkotlin/jvm/internal/ؠ;->reflected:Lڶۇ؁ٻٿٔؽ/ؠ;

    :cond_0
    return-object v0
.end method

.method public abstract computeReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
.end method

.method public getAnnotations()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/؋;->getAnnotations()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBoundReceiver()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lkotlin/jvm/internal/ؠ;->receiver:Ljava/lang/Object;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lkotlin/jvm/internal/ؠ;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOwner()Lڶۇ؁ٻٿٔؽ/آ;
    .locals 2

    iget-object v0, p0, Lkotlin/jvm/internal/ؠ;->owner:Ljava/lang/Class;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :cond_0
    iget-boolean v1, p0, Lkotlin/jvm/internal/ؠ;->isTopLevel:Z

    if-eqz v1, :cond_1

    sget-object v1, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lkotlin/jvm/internal/ث;

    invoke-direct {v1, v0}, Lkotlin/jvm/internal/ث;-><init>(Ljava/lang/Class;)V

    goto :goto_0

    :cond_1
    sget-object v1, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lkotlin/jvm/internal/آ;

    invoke-direct {v1, v0}, Lkotlin/jvm/internal/آ;-><init>(Ljava/lang/Class;)V

    :goto_0
    move-object v0, v1

    :goto_1
    return-object v0
.end method

.method public getParameters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->getParameters()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
.end method

.method public getReturnType()Lڶۇ؁ٻٿٔؽ/ث;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->getReturnType()Lڶۇ؁ٻٿٔؽ/ث;

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lkotlin/jvm/internal/ؠ;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeParameters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->getTypeParameters()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVisibility()Lڶۇ؁ٻٿٔؽ/ج;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->getVisibility()Lڶۇ؁ٻٿٔؽ/ج;

    move-result-object v0

    return-object v0
.end method

.method public isAbstract()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->isAbstract()Z

    move-result v0

    return v0
.end method

.method public isFinal()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->isFinal()Z

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->isOpen()Z

    move-result v0

    return v0
.end method

.method public isSuspend()Z
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ؠ;->getReflected()Lڶۇ؁ٻٿٔؽ/ؠ;

    move-result-object v0

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ؠ;->isSuspend()Z

    move-result v0

    return v0
.end method
