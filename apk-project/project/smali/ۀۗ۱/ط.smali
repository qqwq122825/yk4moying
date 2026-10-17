.class public final Lۀۗ۱/ط;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:[B

.field public ؠ:I

.field public ء:I

.field public آ:Z

.field public final أ:Z

.field public ؤ:Lۀۗ۱/ط;

.field public إ:Lۀۗ۱/ط;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lۀۗ۱/ط;->؋:[B

    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ط;->أ:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lۀۗ۱/ط;->آ:Z

    return-void
.end method

.method public constructor <init>([BIIZZ)V
    .locals 1

    const-string v0, "data"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/ط;->؋:[B

    iput p2, p0, Lۀۗ۱/ط;->ؠ:I

    iput p3, p0, Lۀۗ۱/ط;->ء:I

    iput-boolean p4, p0, Lۀۗ۱/ط;->آ:Z

    iput-boolean p5, p0, Lۀۗ۱/ط;->أ:Z

    return-void
.end method


# virtual methods
.method public final ؋()Lۀۗ۱/ط;
    .locals 4

    iget-object v0, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    const/4 v1, 0x0

    if-eq v0, p0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    iget-object v2, p0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iput-object v3, v2, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iget-object v2, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, p0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v3, v2, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object v1, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iput-object v1, p0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    return-object v0
.end method

.method public final ؠ(Lۀۗ۱/ط;)V
    .locals 1

    iput-object p0, p1, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iget-object v0, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iput-object v0, p1, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    iget-object v0, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iput-object p1, v0, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    iput-object p1, p0, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    return-void
.end method

.method public final ء()Lۀۗ۱/ط;
    .locals 7

    const/4 v0, 0x1

    iput-boolean v0, p0, Lۀۗ۱/ط;->آ:Z

    new-instance v0, Lۀۗ۱/ط;

    iget-object v2, p0, Lۀۗ۱/ط;->؋:[B

    iget v3, p0, Lۀۗ۱/ط;->ؠ:I

    iget v4, p0, Lۀۗ۱/ط;->ء:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lۀۗ۱/ط;-><init>([BIIZZ)V

    return-object v0
.end method

.method public final آ(Lۀۗ۱/ط;I)V
    .locals 5

    iget-boolean v0, p1, Lۀۗ۱/ط;->أ:Z

    if-eqz v0, :cond_3

    iget v0, p1, Lۀۗ۱/ط;->ء:I

    add-int v1, v0, p2

    iget-object v2, p1, Lۀۗ۱/ط;->؋:[B

    const/16 v3, 0x2000

    if-le v1, v3, :cond_2

    iget-boolean v4, p1, Lۀۗ۱/ط;->آ:Z

    if-nez v4, :cond_1

    iget v4, p1, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v4

    if-gt v1, v3, :cond_0

    const/4 v1, 0x0

    invoke-static {v1, v4, v0, v2, v2}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    iget v0, p1, Lۀۗ۱/ط;->ء:I

    iget v3, p1, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v0, v3

    iput v0, p1, Lۀۗ۱/ط;->ء:I

    iput v1, p1, Lۀۗ۱/ط;->ؠ:I

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    :cond_2
    :goto_0
    iget v0, p1, Lۀۗ۱/ط;->ء:I

    iget v1, p0, Lۀۗ۱/ط;->ؠ:I

    add-int v3, v1, p2

    iget-object v4, p0, Lۀۗ۱/ط;->؋:[B

    invoke-static {v0, v1, v3, v4, v2}, Lڡپٔۯ/ة;->ڎ(III[B[B)V

    iget v0, p1, Lۀۗ۱/ط;->ء:I

    add-int/2addr v0, p2

    iput v0, p1, Lۀۗ۱/ط;->ء:I

    iget p1, p0, Lۀۗ۱/ط;->ؠ:I

    add-int/2addr p1, p2

    iput p1, p0, Lۀۗ۱/ط;->ؠ:I

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "only owner can write"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
