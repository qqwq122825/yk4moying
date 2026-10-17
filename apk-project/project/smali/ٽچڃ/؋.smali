.class public final Lٽچڃ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lٽچڃ/ء;


# instance fields
.field public final ؋:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lٽچڃ/؋;->؋:F

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lٽچڃ/؋;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lٽچڃ/؋;

    iget v1, p0, Lٽچڃ/؋;->؋:F

    iget p1, p1, Lٽچڃ/؋;->؋:F

    cmpl-float p1, v1, p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, Lٽچڃ/؋;->؋:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final ؋(Landroid/graphics/RectF;)F
    .locals 0

    iget p1, p0, Lٽچڃ/؋;->؋:F

    return p1
.end method
