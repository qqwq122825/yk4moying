.class public final Lإۺهؑڋڻ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic أ:I


# instance fields
.field public final ؋:Lإۺهؑڋڻ/إ;

.field public final ؠ:Ljava/util/List;

.field public final ء:Lإۺهؑڋڻ/ؠ;

.field public final آ:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lژة۪ڦضۆۿۡ/ص;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lژة۪ڦضۆۿۡ/ص;-><init>(I)V

    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lإۺهؑڋڻ/إ;Ljava/util/List;Lإۺهؑڋڻ/ؠ;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lإۺهؑڋڻ/؋;->؋:Lإۺهؑڋڻ/إ;

    iput-object p2, p0, Lإۺهؑڋڻ/؋;->ؠ:Ljava/util/List;

    iput-object p3, p0, Lإۺهؑڋڻ/؋;->ء:Lإۺهؑڋڻ/ؠ;

    iput-object p4, p0, Lإۺهؑڋڻ/؋;->آ:Ljava/lang/String;

    return-void
.end method
