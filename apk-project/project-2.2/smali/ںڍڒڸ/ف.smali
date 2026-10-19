.class public abstract Lںڍڒڸ/ف;
.super Lںڍڒڸ/ر;
.source "SourceFile"


# static fields
.field public static final synthetic إ:I


# instance fields
.field public آ:J

.field public أ:Z

.field public ؤ:Lڡپٔۯ/ب;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lںڍڒڸ/ر;-><init>()V

    return-void
.end method


# virtual methods
.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 0

    invoke-static {p1}, Lڗًقڔ/؋;->ث(I)V

    return-object p0
.end method

.method public abstract shutdown()V
.end method

.method public final ؾ(Z)V
    .locals 4

    iget-wide v0, p0, Lںڍڒڸ/ف;->آ:J

    if-eqz p1, :cond_0

    const-wide v2, 0x100000000L

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x1

    :goto_0
    sub-long/2addr v0, v2

    iput-wide v0, p0, Lںڍڒڸ/ف;->آ:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_1

    goto :goto_1

    :cond_1
    iget-boolean p1, p0, Lںڍڒڸ/ف;->أ:Z

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lںڍڒڸ/ف;->shutdown()V

    :cond_2
    :goto_1
    return-void
.end method

.method public final ؿ(Lںڍڒڸ/ع;)V
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ف;->ؤ:Lڡپٔۯ/ب;

    if-nez v0, :cond_0

    new-instance v0, Lڡپٔۯ/ب;

    invoke-direct {v0}, Lڡپٔۯ/ب;-><init>()V

    iput-object v0, p0, Lںڍڒڸ/ف;->ؤ:Lڡپٔۯ/ب;

    :cond_0
    invoke-virtual {v0, p1}, Lڡپٔۯ/ب;->addLast(Ljava/lang/Object;)V

    return-void
.end method

.method public abstract ـ()Ljava/lang/Thread;
.end method

.method public final ف(Z)V
    .locals 4

    iget-wide v0, p0, Lںڍڒڸ/ف;->آ:J

    if-eqz p1, :cond_0

    const-wide v2, 0x100000000L

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x1

    :goto_0
    add-long/2addr v2, v0

    iput-wide v2, p0, Lںڍڒڸ/ف;->آ:J

    if-nez p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lںڍڒڸ/ف;->أ:Z

    :cond_1
    return-void
.end method

.method public final ق()Z
    .locals 4

    iget-wide v0, p0, Lںڍڒڸ/ف;->آ:J

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public abstract ك()J
.end method

.method public final ل()Z
    .locals 3

    iget-object v0, p0, Lںڍڒڸ/ف;->ؤ:Lڡپٔۯ/ب;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lڡپٔۯ/ب;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lڡپٔۯ/ب;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    :goto_0
    check-cast v0, Lںڍڒڸ/ع;

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Lںڍڒڸ/ع;->run()V

    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public م(JLںڍڒڸ/ؾ;)V
    .locals 1

    sget-object v0, Lںڍڒڸ/ص;->ة:Lںڍڒڸ/ص;

    invoke-virtual {v0, p1, p2, p3}, Lںڍڒڸ/ـ;->ي(JLںڍڒڸ/ؾ;)V

    return-void
.end method
