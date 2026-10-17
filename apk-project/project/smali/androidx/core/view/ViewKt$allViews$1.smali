.class final Landroidx/core/view/ViewKt$allViews$1;
.super Lګؓ۝ؒڄس/إ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/view/ViewKt;->getAllViews(Landroid/view/View;)Lڸڈڲ/ا;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "L\u06ab\u0613\u06dd\u0612\u0684\u0633/\u0625;",
        "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;"
    }
.end annotation

.annotation runtime Lګؓ۝ؒڄس/أ;
    c = "androidx.core.view.ViewKt$allViews$1"
    f = "View.kt"
    l = {
        0x19e,
        0x1a0
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $this_allViews:Landroid/view/View;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(Landroid/view/View;Lڨڡئٸت/أ;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/core/view/ViewKt$allViews$1;->$this_allViews:Landroid/view/View;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/إ;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;"
        }
    .end annotation

    new-instance v0, Landroidx/core/view/ViewKt$allViews$1;

    iget-object v1, p0, Landroidx/core/view/ViewKt$allViews$1;->$this_allViews:Landroid/view/View;

    invoke-direct {v0, v1, p2}, Landroidx/core/view/ViewKt$allViews$1;-><init>(Landroid/view/View;Lڨڡئٸت/أ;)V

    iput-object p1, v0, Landroidx/core/view/ViewKt$allViews$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lڸڈڲ/ة;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Landroidx/core/view/ViewKt$allViews$1;->invoke(Lڸڈڲ/ة;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lڸڈڲ/ة;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06b8\u0688\u06b2/\u0629;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Landroidx/core/view/ViewKt$allViews$1;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Landroidx/core/view/ViewKt$allViews$1;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Landroidx/core/view/ViewKt$allViews$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Landroidx/core/view/ViewKt$allViews$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    const/4 v3, 0x2

    if-eq v1, v2, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iget-object v1, p0, Landroidx/core/view/ViewKt$allViews$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lڸڈڲ/ة;

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/core/view/ViewKt$allViews$1;->$this_allViews:Landroid/view/View;

    instance-of v2, p1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p1}, Landroidx/core/view/ViewGroupKt;->getDescendants(Landroid/view/ViewGroup;)Lڸڈڲ/ا;

    move-result-object p1

    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/core/view/ViewKt$allViews$1;->L$0:Ljava/lang/Object;

    iput v3, p0, Landroidx/core/view/ViewKt$allViews$1;->label:I

    invoke-virtual {v1, p1, p0}, Lڸڈڲ/ة;->؋(Lڸڈڲ/ا;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    :cond_2
    :goto_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1

    :cond_3
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/core/view/ViewKt$allViews$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lڸڈڲ/ة;

    iget-object v1, p0, Landroidx/core/view/ViewKt$allViews$1;->$this_allViews:Landroid/view/View;

    iput-object p1, p0, Landroidx/core/view/ViewKt$allViews$1;->L$0:Ljava/lang/Object;

    iput v2, p0, Landroidx/core/view/ViewKt$allViews$1;->label:I

    check-cast p1, Lڸڈڲ/ب;

    iput-object v1, p1, Lڸڈڲ/ب;->أ:Ljava/lang/Object;

    const/4 v1, 0x3

    iput v1, p1, Lڸڈڲ/ب;->آ:I

    iput-object p0, p1, Lڸڈڲ/ب;->إ:Lڨڡئٸت/أ;

    return-object v0
.end method
