.class public final Lڸڈڲ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڸڈڲ/ا;


# instance fields
.field public final ؋:Lڸڈڲ/ا;

.field public final ؠ:Z

.field public final ء:Lڲٱۘۑدٿٰ/ت;


# direct methods
.method public constructor <init>(Lڸڈڲ/ئ;)V
    .locals 1

    sget-object v0, Lڸڈڲ/ح;->أ:Lڸڈڲ/ح;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڸڈڲ/ؤ;->؋:Lڸڈڲ/ا;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lڸڈڲ/ؤ;->ؠ:Z

    iput-object v0, p0, Lڸڈڲ/ؤ;->ء:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    new-instance v0, Lڸڈڲ/أ;

    invoke-direct {v0, p0}, Lڸڈڲ/أ;-><init>(Lڸڈڲ/ؤ;)V

    return-object v0
.end method
