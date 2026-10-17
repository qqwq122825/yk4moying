.class final synthetic Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/Observer;
.implements Lkotlin/jvm/internal/ؤ;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/CoroutineLiveDataKt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private final synthetic function:Lڲٱۘۑدٿٰ/ت;


# direct methods
.method public constructor <init>(Lڲٱۘۑدٿٰ/ت;)V
    .locals 1

    const-string v0, "function"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;->function:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Landroidx/lifecycle/Observer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lkotlin/jvm/internal/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;->getFunctionDelegate()Lڡُؑڨ/؋;

    move-result-object v0

    check-cast p1, Lkotlin/jvm/internal/ؤ;

    invoke-interface {p1}, Lkotlin/jvm/internal/ؤ;->getFunctionDelegate()Lڡُؑڨ/؋;

    move-result-object p1

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_0
    return v1
.end method

.method public final getFunctionDelegate()Lڡُؑڨ/؋;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06a1\u064f\u0611\u06a8/\u060b;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;->function:Lڲٱۘۑدٿٰ/ت;

    return-object v0
.end method

.method public final hashCode()I
    .locals 1

    invoke-virtual {p0}, Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;->getFunctionDelegate()Lڡُؑڨ/؋;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final synthetic onChanged(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Landroidx/lifecycle/CoroutineLiveDataKt$sam$androidx_lifecycle_Observer$0;->function:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v0, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
