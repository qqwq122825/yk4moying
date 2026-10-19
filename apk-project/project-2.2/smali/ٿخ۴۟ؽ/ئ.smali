.class public abstract Lٿخ۴۟ؽ/ئ;
.super Lٽچڃ/إ;
.source "SourceFile"


# static fields
.field public static final synthetic ط:I


# instance fields
.field public ض:Lٿخ۴۟ؽ/ؤ;


# direct methods
.method public constructor <init>(Lٿخ۴۟ؽ/ؤ;)V
    .locals 0

    invoke-direct {p0, p1}, Lٽچڃ/إ;-><init>(Lٽچڃ/ؤ;)V

    iput-object p1, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    return-void
.end method


# virtual methods
.method public final mutate()Landroid/graphics/drawable/Drawable;
    .locals 2

    new-instance v0, Lٿخ۴۟ؽ/ؤ;

    iget-object v1, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    invoke-direct {v0, v1}, Lٿخ۴۟ؽ/ؤ;-><init>(Lٿخ۴۟ؽ/ؤ;)V

    iput-object v0, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    return-object p0
.end method

.method public final ج(FFFF)V
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    iget-object v0, v0, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    cmpl-float v1, p1, v1

    if-nez v1, :cond_0

    iget v1, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v1, p2, v1

    if-nez v1, :cond_0

    iget v1, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v1, p3, v1

    if-nez v1, :cond_0

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, p4, v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_1
    return-void
.end method
