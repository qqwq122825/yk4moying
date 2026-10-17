.class public final Lڊ۟چڗۙ٦/ر;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڕۇۅؑۨؼ۫ە/؋;


# static fields
.field public static final ء:Landroidx/constraintlayout/core/state/ؠ;

.field public static final آ:Lڊ۟چڗۙ٦/ئ;


# instance fields
.field public ؋:Landroidx/constraintlayout/core/state/ؠ;

.field public volatile ؠ:Lڕۇۅؑۨؼ۫ە/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    sput-object v0, Lڊ۟چڗۙ٦/ر;->ء:Landroidx/constraintlayout/core/state/ؠ;

    new-instance v0, Lڊ۟چڗۙ٦/ئ;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lڊ۟چڗۙ٦/ئ;-><init>(I)V

    sput-object v0, Lڊ۟چڗۙ٦/ر;->آ:Lڊ۟چڗۙ٦/ئ;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    sget-object v0, Lڊ۟چڗۙ٦/ر;->ء:Landroidx/constraintlayout/core/state/ؠ;

    sget-object v1, Lڊ۟چڗۙ٦/ر;->آ:Lڊ۟چڗۙ٦/ئ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lڊ۟چڗۙ٦/ر;->؋:Landroidx/constraintlayout/core/state/ؠ;

    iput-object v1, p0, Lڊ۟چڗۙ٦/ر;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڊ۟چڗۙ٦/ر;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {v0}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
