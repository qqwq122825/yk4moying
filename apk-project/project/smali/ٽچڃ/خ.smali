.class public final Lٽچڃ/خ;
.super Lٽچڃ/ذ;
.source "SourceFile"


# static fields
.field public static final ئ:Landroid/graphics/RectF;


# instance fields
.field public ؠ:F

.field public ء:F

.field public آ:F

.field public أ:F

.field public ؤ:F

.field public إ:F


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lٽچڃ/خ;->ئ:Landroid/graphics/RectF;

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    invoke-direct {p0}, Lٽچڃ/ذ;-><init>()V

    iput p1, p0, Lٽچڃ/خ;->ؠ:F

    iput p2, p0, Lٽچڃ/خ;->ء:F

    iput p3, p0, Lٽچڃ/خ;->آ:F

    iput p4, p0, Lٽچڃ/خ;->أ:F

    return-void
.end method


# virtual methods
.method public final ؋(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .locals 5

    iget-object v0, p0, Lٽچڃ/ذ;->؋:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    sget-object v0, Lٽچڃ/خ;->ئ:Landroid/graphics/RectF;

    iget v1, p0, Lٽچڃ/خ;->ؠ:F

    iget v2, p0, Lٽچڃ/خ;->ء:F

    iget v3, p0, Lٽچڃ/خ;->آ:F

    iget v4, p0, Lٽچڃ/خ;->أ:F

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    iget v1, p0, Lٽچڃ/خ;->ؤ:F

    iget v2, p0, Lٽچڃ/خ;->إ:F

    const/4 v3, 0x0

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method
