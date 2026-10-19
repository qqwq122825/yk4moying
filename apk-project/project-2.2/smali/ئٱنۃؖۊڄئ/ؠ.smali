.class public final Lئٱنۃؖۊڄئ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lئٱنۃؖۊڄئ/ء;


# static fields
.field public static final ؤ:Ljava/util/logging/Logger;


# instance fields
.field public final ؋:Lةؽڗںۍټ٘/ح;

.field public final ؠ:Ljava/util/concurrent/Executor;

.field public final ء:Lإٿ٢/إ;

.field public final آ:Lةٌخ/آ;

.field public final أ:Lةڈۑۂٝےآذ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-class v0, Lأۺؘٻڣ/ص;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lئٱنۃؖۊڄئ/ؠ;->ؤ:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lإٿ٢/إ;Lةؽڗںۍټ٘/ح;Lةٌخ/آ;Lةڈۑۂٝےآذ/ء;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lئٱنۃؖۊڄئ/ؠ;->ؠ:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lئٱنۃؖۊڄئ/ؠ;->ء:Lإٿ٢/إ;

    iput-object p3, p0, Lئٱنۃؖۊڄئ/ؠ;->؋:Lةؽڗںۍټ٘/ح;

    iput-object p4, p0, Lئٱنۃؖۊڄئ/ؠ;->آ:Lةٌخ/آ;

    iput-object p5, p0, Lئٱنۃؖۊڄئ/ؠ;->أ:Lةڈۑۂٝےآذ/ء;

    return-void
.end method
