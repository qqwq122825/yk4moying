.class public abstract Lkotlin/jvm/internal/ة;
.super Lkotlin/jvm/internal/د;
.source "SourceFile"

# interfaces
.implements Lڶۇ؁ٻٿٔؽ/ئ;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-class v2, Landroidx/sqlite/db/SupportSQLiteDatabase;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/د;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public computeReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
    .locals 1

    sget-object v0, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public getDelegate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/د;->getReflected()Lڶۇ؁ٻٿٔؽ/ت;

    move-result-object v0

    check-cast v0, Lڶۇ؁ٻٿٔؽ/ئ;

    invoke-interface {v0, p1}, Lڶۇ؁ٻٿٔؽ/ة;->getDelegate(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getGetter()Lڶۇ؁ٻٿٔؽ/ا;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ة;->getGetter()Lڶۇ؁ٻٿٔؽ/ب;

    const/4 v0, 0x0

    return-object v0
.end method

.method public getGetter()Lڶۇ؁ٻٿٔؽ/ب;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/د;->getReflected()Lڶۇ؁ٻٿٔؽ/ت;

    move-result-object v0

    check-cast v0, Lڶۇ؁ٻٿٔؽ/ئ;

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ة;->getGetter()Lڶۇ؁ٻٿٔؽ/ب;

    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getSetter()Lڶۇ؁ٻٿٔؽ/ؤ;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/ة;->getSetter()Lڶۇ؁ٻٿٔؽ/إ;

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSetter()Lڶۇ؁ٻٿٔؽ/إ;
    .locals 1

    invoke-virtual {p0}, Lkotlin/jvm/internal/د;->getReflected()Lڶۇ؁ٻٿٔؽ/ت;

    move-result-object v0

    check-cast v0, Lڶۇ؁ٻٿٔؽ/ئ;

    invoke-interface {v0}, Lڶۇ؁ٻٿٔؽ/ئ;->getSetter()Lڶۇ؁ٻٿٔؽ/إ;

    const/4 v0, 0x0

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p0, p1}, Lڶۇ؁ٻٿٔؽ/ة;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
