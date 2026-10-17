.class final Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/constraints/controllers/ConstraintController;->track()Lھٳ۰ڌ؄غڎۦ/إ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "L\u06ab\u0613\u06dd\u0612\u0684\u0633/\u0626;",
        "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;"
    }
.end annotation

.annotation runtime Lګؓ۝ؒڄس/أ;
    c = "androidx.work.impl.constraints.controllers.ConstraintController$track$1"
    f = "ContraintControllers.kt"
    l = {
        0x37
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/work/impl/constraints/controllers/ConstraintController<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/work/impl/constraints/controllers/ConstraintController;Lڨڡئٸت/أ;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/constraints/controllers/ConstraintController<",
            "TT;>;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

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

    new-instance v0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;

    iget-object v1, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;

    invoke-direct {v0, v1, p2}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;-><init>(Landroidx/work/impl/constraints/controllers/ConstraintController;Lڨڡئٸت/أ;)V

    iput-object p1, v0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lڽتٺۊڗ؜/ر;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->invoke(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06bd\u062a\u067a\u06ca\u0697\u061c/\u0631;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lڽتٺۊڗ؜/ر;

    new-instance v1, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1$listener$1;

    iget-object v3, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;

    invoke-direct {v1, v3, p1}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1$listener$1;-><init>(Landroidx/work/impl/constraints/controllers/ConstraintController;Lڽتٺۊڗ؜/ر;)V

    iget-object v3, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;

    invoke-static {v3}, Landroidx/work/impl/constraints/controllers/ConstraintController;->access$getTracker$p(Landroidx/work/impl/constraints/controllers/ConstraintController;)Landroidx/work/impl/constraints/trackers/ConstraintTracker;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroidx/work/impl/constraints/trackers/ConstraintTracker;->addListener(Landroidx/work/impl/constraints/ConstraintListener;)V

    new-instance v3, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1$1;

    iget-object v4, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->this$0:Landroidx/work/impl/constraints/controllers/ConstraintController;

    invoke-direct {v3, v4, v1}, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1$1;-><init>(Landroidx/work/impl/constraints/controllers/ConstraintController;Landroidx/work/impl/constraints/controllers/ConstraintController$track$1$listener$1;)V

    iput v2, p0, Landroidx/work/impl/constraints/controllers/ConstraintController$track$1;->label:I

    invoke-static {p1, v3, p0}, Lںڍڒڸ/ش;->أ(Lڽتٺۊڗ؜/ر;Lڲٱۘۑدٿٰ/؋;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    :cond_2
    :goto_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
