.class public final Lٽچڃ/د;
.super Lٽچڃ/ذ;
.source "SourceFile"


# instance fields
.field public ؠ:F

.field public ء:F


# virtual methods
.method public final ؋(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/ذ;->؋:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    iget v0, p0, Lٽچڃ/د;->ؠ:F

    iget v1, p0, Lٽچڃ/د;->ء:F

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method
