.class public final Landroidx/work/impl/model/WorkSpecDaoKt$getWorkStatusPojoFlowDataForIds$$inlined$map$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/إ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/model/WorkSpecDaoKt;->getWorkStatusPojoFlowDataForIds(Landroidx/work/impl/model/WorkSpecDao;Ljava/util/UUID;)Lھٳ۰ڌ؄غڎۦ/إ;
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
.field final synthetic $this_unsafeTransform$inlined:Lھٳ۰ڌ؄غڎۦ/إ;


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/إ;)V
    .locals 0

    iput-object p1, p0, Landroidx/work/impl/model/WorkSpecDaoKt$getWorkStatusPojoFlowDataForIds$$inlined$map$1;->$this_unsafeTransform$inlined:Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDaoKt$getWorkStatusPojoFlowDataForIds$$inlined$map$1;->$this_unsafeTransform$inlined:Lھٳ۰ڌ؄غڎۦ/إ;

    new-instance v1, Landroidx/work/impl/model/WorkSpecDaoKt$getWorkStatusPojoFlowDataForIds$$inlined$map$1$2;

    invoke-direct {v1, p1}, Landroidx/work/impl/model/WorkSpecDaoKt$getWorkStatusPojoFlowDataForIds$$inlined$map$1$2;-><init>(Lھٳ۰ڌ؄غڎۦ/ئ;)V

    invoke-interface {v0, v1, p2}, Lھٳ۰ڌ؄غڎۦ/إ;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
