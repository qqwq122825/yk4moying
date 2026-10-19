.class public final Lٿخ۴۟ؽ/ؤ;
.super Lٽچڃ/ؤ;
.source "SourceFile"


# instance fields
.field public final ش:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lٽچڃ/ب;Landroid/graphics/RectF;)V
    .locals 0

    invoke-direct {p0, p1}, Lٽچڃ/ؤ;-><init>(Lٽچڃ/ب;)V

    iput-object p2, p0, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    return-void
.end method

.method public constructor <init>(Lٿخ۴۟ؽ/ؤ;)V
    .locals 0

    invoke-direct {p0, p1}, Lٽچڃ/ؤ;-><init>(Lٽچڃ/ؤ;)V

    iget-object p1, p1, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    iput-object p1, p0, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    new-instance v0, Lٿخ۴۟ؽ/إ;

    invoke-direct {v0, p0}, Lٿخ۴۟ؽ/إ;-><init>(Lٿخ۴۟ؽ/ؤ;)V

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    return-object v0
.end method
