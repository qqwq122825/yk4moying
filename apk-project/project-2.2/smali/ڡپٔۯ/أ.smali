.class public final Lڡپٔۯ/أ;
.super Lڡپٔۯ/ؤ;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# instance fields
.field public final آ:Lڡپٔۯ/ؤ;

.field public final أ:I

.field public final ؤ:I


# direct methods
.method public constructor <init>(Lڡپٔۯ/ؤ;II)V
    .locals 1

    const-string v0, "list"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lڡپٔۯ/ؤ;-><init>()V

    iput-object p1, p0, Lڡپٔۯ/أ;->آ:Lڡپٔۯ/ؤ;

    iput p2, p0, Lڡپٔۯ/أ;->أ:I

    invoke-virtual {p1}, Lڡپٔۯ/ؠ;->؋()I

    move-result p1

    invoke-static {p2, p3, p1}, Lړجإٖټض/أ;->ء(III)V

    sub-int/2addr p3, p2

    iput p3, p0, Lڡپٔۯ/أ;->ؤ:I

    return-void
.end method


# virtual methods
.method public final get(I)Ljava/lang/Object;
    .locals 4

    iget v0, p0, Lڡپٔۯ/أ;->ؤ:I

    if-ltz p1, :cond_0

    if-ge p1, v0, :cond_0

    iget v0, p0, Lڡپٔۯ/أ;->أ:I

    add-int/2addr v0, p1

    iget-object p1, p0, Lڡپٔۯ/أ;->آ:Lڡپٔۯ/ؤ;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "index: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final ؋()I
    .locals 1

    iget v0, p0, Lڡپٔۯ/أ;->ؤ:I

    return v0
.end method
