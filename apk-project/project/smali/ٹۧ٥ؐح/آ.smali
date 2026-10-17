.class public final Lٹۧ٥ؐح/آ;
.super Landroidx/core/content/res/ResourcesCompat$FontCallback;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Lٹۧ٥ؐح/إ;

.field public final synthetic ؠ:Lٹۧ٥ؐح/ؤ;


# direct methods
.method public constructor <init>(Lٹۧ٥ؐح/ؤ;Lٹۧ٥ؐح/إ;)V
    .locals 0

    iput-object p1, p0, Lٹۧ٥ؐح/آ;->ؠ:Lٹۧ٥ؐح/ؤ;

    iput-object p2, p0, Lٹۧ٥ؐح/آ;->؋:Lٹۧ٥ؐح/إ;

    invoke-direct {p0}, Landroidx/core/content/res/ResourcesCompat$FontCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFontRetrievalFailed(I)V
    .locals 2

    iget-object v0, p0, Lٹۧ٥ؐح/آ;->ؠ:Lٹۧ٥ؐح/ؤ;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lٹۧ٥ؐح/ؤ;->ث:Z

    iget-object v0, p0, Lٹۧ٥ؐح/آ;->؋:Lٹۧ٥ؐح/إ;

    invoke-virtual {v0, p1}, Lٹۧ٥ؐح/إ;->؋(I)V

    return-void
.end method

.method public final onFontRetrieved(Landroid/graphics/Typeface;)V
    .locals 2

    iget-object v0, p0, Lٹۧ٥ؐح/آ;->ؠ:Lٹۧ٥ؐح/ؤ;

    iget v1, v0, Lٹۧ٥ؐح/ؤ;->ء:I

    invoke-static {p1, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, v0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    iput-boolean p1, v0, Lٹۧ٥ؐح/ؤ;->ث:Z

    iget-object p1, v0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    const/4 v0, 0x0

    iget-object v1, p0, Lٹۧ٥ؐح/آ;->؋:Lٹۧ٥ؐح/إ;

    invoke-virtual {v1, p1, v0}, Lٹۧ٥ؐح/إ;->ؠ(Landroid/graphics/Typeface;Z)V

    return-void
.end method
