.class public final Lڧ٣ڇڒ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final ؋:Lڧ٣ڇڒ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڧ٣ڇڒ/ؠ;

    invoke-direct {v0}, Lڧ٣ڇڒ/ؠ;-><init>()V

    sput-object v0, Lڧ٣ڇڒ/ؠ;->؋:Lڧ٣ڇڒ/ؠ;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Ljava/lang/Comparable;

    check-cast p2, Ljava/lang/Comparable;

    const-string v0, "a"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "b"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final reversed()Ljava/util/Comparator;
    .locals 1

    sget-object v0, Lڧ٣ڇڒ/؋;->؋:Lڧ٣ڇڒ/؋;

    return-object v0
.end method
