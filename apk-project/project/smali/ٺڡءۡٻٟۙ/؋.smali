.class public final Lٺڡءۡٻٟۙ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ا:[I

.field public static final ب:[F

.field public static final ة:[I

.field public static final ت:[F


# instance fields
.field public final ؋:Landroid/graphics/Paint;

.field public final ؠ:Landroid/graphics/Paint;

.field public final ء:Landroid/graphics/Paint;

.field public آ:I

.field public أ:I

.field public ؤ:I

.field public final إ:Landroid/graphics/Path;

.field public final ئ:Landroid/graphics/Paint;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x3

    new-array v1, v0, [I

    sput-object v1, Lٺڡءۡٻٟۙ/؋;->ا:[I

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lٺڡءۡٻٟۙ/؋;->ب:[F

    const/4 v0, 0x4

    new-array v1, v0, [I

    sput-object v1, Lٺڡءۡٻٟۙ/؋;->ة:[I

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lٺڡءۡٻٟۙ/؋;->ت:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lٺڡءۡٻٟۙ/؋;->إ:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lٺڡءۡٻٟۙ/؋;->ئ:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lٺڡءۡٻٟۙ/؋;->؋:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {p0, v1}, Lٺڡءۡٻٟۙ/؋;->؋(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lٺڡءۡٻٟۙ/؋;->ؠ:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lٺڡءۡٻٟۙ/؋;->ء:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public final ؋(I)V
    .locals 1

    const/16 v0, 0x44

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lٺڡءۡٻٟۙ/؋;->آ:I

    const/16 v0, 0x14

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lٺڡءۡٻٟۙ/؋;->أ:I

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result p1

    iput p1, p0, Lٺڡءۡٻٟۙ/؋;->ؤ:I

    iget-object p1, p0, Lٺڡءۡٻٟۙ/؋;->؋:Landroid/graphics/Paint;

    iget v0, p0, Lٺڡءۡٻٟۙ/؋;->آ:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method
