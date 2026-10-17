.class public final Lٹۧ٥ؐح/؋;
.super Lٹۧ٥ؐح/إ;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/graphics/Typeface;

.field public final ؠ:Lڙڧا/ء;

.field public ء:Z


# direct methods
.method public constructor <init>(Lڙڧا/ء;Landroid/graphics/Typeface;)V
    .locals 0

    invoke-direct {p0}, Lٹۧ٥ؐح/إ;-><init>()V

    iput-object p2, p0, Lٹۧ٥ؐح/؋;->؋:Landroid/graphics/Typeface;

    iput-object p1, p0, Lٹۧ٥ؐح/؋;->ؠ:Lڙڧا/ء;

    return-void
.end method


# virtual methods
.method public final ؋(I)V
    .locals 1

    iget-boolean p1, p0, Lٹۧ٥ؐح/؋;->ء:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lٹۧ٥ؐح/؋;->ؠ:Lڙڧا/ء;

    iget-object p1, p1, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast p1, Lٹ؅ڟ؀ە/ؠ;

    iget-object v0, p0, Lٹۧ٥ؐح/؋;->؋:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Lٹ؅ڟ؀ە/ؠ;->ب(Landroid/graphics/Typeface;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_0
    return-void
.end method

.method public final ؠ(Landroid/graphics/Typeface;Z)V
    .locals 0

    iget-boolean p2, p0, Lٹۧ٥ؐح/؋;->ء:Z

    if-nez p2, :cond_0

    iget-object p2, p0, Lٹۧ٥ؐح/؋;->ؠ:Lڙڧا/ء;

    iget-object p2, p2, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast p2, Lٹ؅ڟ؀ە/ؠ;

    invoke-virtual {p2, p1}, Lٹ؅ڟ؀ە/ؠ;->ب(Landroid/graphics/Typeface;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_0
    return-void
.end method
