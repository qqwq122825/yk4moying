.class public final Lڹےف/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڸڈڲ/ا;


# instance fields
.field public final ؋:Ljava/lang/CharSequence;

.field public final ؠ:I

.field public final ء:I

.field public final آ:Lڲٱۘۑدٿٰ/خ;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;IILڹےف/إ;)V
    .locals 1

    const-string v0, "input"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    iput p2, p0, Lڹےف/ء;->ؠ:I

    iput p3, p0, Lڹےف/ء;->ء:I

    iput-object p4, p0, Lڹےف/ء;->آ:Lڲٱۘۑدٿٰ/خ;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    new-instance v0, Lڹےف/ؠ;

    invoke-direct {v0, p0}, Lڹےف/ؠ;-><init>(Lڹےف/ء;)V

    return-object v0
.end method
