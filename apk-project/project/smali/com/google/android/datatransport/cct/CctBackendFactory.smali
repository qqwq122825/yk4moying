.class public Lcom/google/android/datatransport/cct/CctBackendFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lإٿ٢/آ;)Lإٿ٢/ئ;
    .locals 3

    new-instance v0, Lء؅ڱ٢/آ;

    move-object v1, p1

    check-cast v1, Lإٿ٢/ؠ;

    iget-object v1, v1, Lإٿ٢/ؠ;->؋:Landroid/content/Context;

    check-cast p1, Lإٿ٢/ؠ;

    iget-object v2, p1, Lإٿ٢/ؠ;->ؠ:Lثڈا/؋;

    iget-object p1, p1, Lإٿ٢/ؠ;->ء:Lثڈا/؋;

    invoke-direct {v0, v1, v2, p1}, Lء؅ڱ٢/آ;-><init>(Landroid/content/Context;Lثڈا/؋;Lثڈا/؋;)V

    return-object v0
.end method
