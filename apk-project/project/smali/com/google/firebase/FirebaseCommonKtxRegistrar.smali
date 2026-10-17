.class public final Lcom/google/firebase/FirebaseCommonKtxRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


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
.method public getComponents()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "L\u068a\u06df\u0686\u0697\u06d9\u0666/\u0621;",
            ">;"
        }
    .end annotation

    new-instance v0, Lڊ۟چڗۙ٦/س;

    const-class v1, Lڊ؄ړ۰ګۚڝ/؋;

    const-class v2, Lںڍڒڸ/ر;

    invoke-direct {v0, v1, v2}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v0}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v0

    new-instance v3, Lڊ۟چڗۙ٦/س;

    const-class v4, Ljava/util/concurrent/Executor;

    invoke-direct {v3, v1, v4}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v1, Lڊ۟چڗۙ٦/ت;

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct {v1, v3, v5, v6}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v0, v1}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    sget-object v1, Lڃٷښـ۝ۼ/ئ;->أ:Lڃٷښـ۝ۼ/ئ;

    iput-object v1, v0, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v0}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    new-instance v1, Lڊ۟چڗۙ٦/س;

    const-class v3, Lڊ؄ړ۰ګۚڝ/ء;

    invoke-direct {v1, v3, v2}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v1}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v1

    new-instance v7, Lڊ۟چڗۙ٦/س;

    invoke-direct {v7, v3, v4}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v3, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v3, v7, v5, v6}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v1, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    sget-object v3, Lڃٷښـ۝ۼ/ئ;->ؤ:Lڃٷښـ۝ۼ/ئ;

    iput-object v3, v1, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v1}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    new-instance v3, Lڊ۟چڗۙ٦/س;

    const-class v7, Lڊ؄ړ۰ګۚڝ/ؠ;

    invoke-direct {v3, v7, v2}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v3}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v3

    new-instance v8, Lڊ۟چڗۙ٦/س;

    invoke-direct {v8, v7, v4}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v7, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v7, v8, v5, v6}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v3, v7}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    sget-object v7, Lڃٷښـ۝ۼ/ئ;->إ:Lڃٷښـ۝ۼ/ئ;

    iput-object v7, v3, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v3}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v3

    new-instance v7, Lڊ۟چڗۙ٦/س;

    const-class v8, Lڊ؄ړ۰ګۚڝ/آ;

    invoke-direct {v7, v8, v2}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v7}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v2

    new-instance v7, Lڊ۟چڗۙ٦/س;

    invoke-direct {v7, v8, v4}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v4, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v4, v7, v5, v6}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v2, v4}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    sget-object v4, Lڃٷښـ۝ۼ/ئ;->ئ:Lڃٷښـ۝ۼ/ئ;

    iput-object v4, v2, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v2}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v2

    filled-new-array {v0, v1, v3, v2}, [Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    invoke-static {v0}, Lںڍڒڸ/ش;->ن([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
