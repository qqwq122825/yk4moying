.class public final Lإۺهؑڋڻ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic ء:I


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:Ljava/util/List;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lإۺهؑڋڻ/أ;->؋:Ljava/lang/String;

    iput-object p2, p0, Lإۺهؑڋڻ/أ;->ؠ:Ljava/util/List;

    return-void
.end method
