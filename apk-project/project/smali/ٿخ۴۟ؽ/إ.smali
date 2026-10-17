.class public final Lٿخ۴۟ؽ/إ;
.super Lٿخ۴۟ؽ/ئ;
.source "SourceFile"


# virtual methods
.method public final ؤ(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    iget-object v0, v0, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lٽچڃ/إ;->ؤ(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    iget-object v0, v0, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipOutRect(Landroid/graphics/RectF;)Z

    invoke-super {p0, p1}, Lٽچڃ/إ;->ؤ(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :goto_0
    return-void
.end method
