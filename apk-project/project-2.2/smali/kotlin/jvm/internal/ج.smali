.class public abstract Lkotlin/jvm/internal/ج;
.super Lkotlin/jvm/internal/د;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/؋;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 6

    const-class v2, Lںڍڒڸ/ش;

    const-string v3, "classSimpleName"

    const-string v4, "getClassSimpleName(Ljava/lang/Object;)Ljava/lang/String;"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/د;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final computeReflected()Lڶۇ؁ٻٿٔؽ/ؠ;
    .locals 1

    sget-object v0, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public final invoke()Ljava/lang/Object;
    .locals 1

    move-object v0, p0

    check-cast v0, Lھۥٓڍچ/ا;

    invoke-virtual {v0}, Lھۥٓڍچ/ا;->؋()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
