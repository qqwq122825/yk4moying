.class public final Lڊ۟چڗۙ٦/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lڊ۟چڗۙ٦/ء;

.field public final ؠ:Ljava/util/HashSet;

.field public final ء:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Lڊ۟چڗۙ٦/ء;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lڊ۟چڗۙ٦/ب;->ؠ:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lڊ۟چڗۙ٦/ب;->ء:Ljava/util/HashSet;

    iput-object p1, p0, Lڊ۟چڗۙ٦/ب;->؋:Lڊ۟چڗۙ٦/ء;

    return-void
.end method
