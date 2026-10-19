.class public final Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/إ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/constraints/WorkConstraintsTracker;->track(Landroidx/work/impl/model/WorkSpec;)Lھٳ۰ڌ؄غڎۦ/إ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;"
    }
.end annotation


# instance fields
.field final synthetic $flowArray$inlined:[Lھٳ۰ڌ؄غڎۦ/إ;


# direct methods
.method public constructor <init>([Lھٳ۰ڌ؄غڎۦ/إ;)V
    .locals 0

    iput-object p1, p0, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1;->$flowArray$inlined:[Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 7

    iget-object v5, p0, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1;->$flowArray$inlined:[Lھٳ۰ڌ؄غڎۦ/إ;

    new-instance v2, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1$2;

    invoke-direct {v2, v5}, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1$2;-><init>([Lھٳ۰ڌ؄غڎۦ/إ;)V

    new-instance v3, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1$3;

    const/4 v0, 0x0

    invoke-direct {v3, v0}, Landroidx/work/impl/constraints/WorkConstraintsTracker$track$$inlined$combine$1$3;-><init>(Lڨڡئٸت/أ;)V

    new-instance v6, Lھڳۄ٧ڕڊ/ة;

    const/4 v1, 0x0

    move-object v0, v6

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lھڳۄ٧ڕڊ/ة;-><init>(Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/؋;Lڲٱۘۑدٿٰ/د;Lھٳ۰ڌ؄غڎۦ/ئ;[Lھٳ۰ڌ؄غڎۦ/إ;)V

    new-instance p1, Lھڳۄ٧ڕڊ/ث;

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lھڳۄ٧ڕڊ/ث;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    invoke-static {p1, p1, v6}, Lسۄھؤۏ۫/؋;->ش(Lھۥٓڍچ/ر;Lھۥٓڍچ/ر;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    if-ne p1, p2, :cond_1

    return-object p1

    :cond_1
    return-object v0
.end method
