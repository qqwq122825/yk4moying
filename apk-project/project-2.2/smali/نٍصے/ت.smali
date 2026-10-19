.class public final Lنٍصے/ت;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:F

.field public final ؠ:Ljava/util/List;

.field public final ء:I

.field public final آ:I


# direct methods
.method public constructor <init>(FLjava/util/ArrayList;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lنٍصے/ت;->؋:F

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    iput p3, p0, Lنٍصے/ت;->ء:I

    iput p4, p0, Lنٍصے/ت;->آ:I

    return-void
.end method


# virtual methods
.method public final ؋()Lنٍصے/ة;
    .locals 2

    iget-object v0, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    iget v1, p0, Lنٍصے/ت;->ء:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lنٍصے/ة;

    return-object v0
.end method

.method public final ؠ()Lنٍصے/ة;
    .locals 2

    iget-object v0, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lنٍصے/ة;

    return-object v0
.end method

.method public final ء()Lنٍصے/ة;
    .locals 2

    iget-object v0, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    iget v1, p0, Lنٍصے/ت;->آ:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lنٍصے/ة;

    return-object v0
.end method

.method public final آ()Lنٍصے/ة;
    .locals 2

    iget-object v0, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lنٍصے/ة;

    return-object v0
.end method
