.class public Lںڍڒڸ/ٯ;
.super Lںڍڒڸ/ٵ;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ج;


# instance fields
.field public final ؤ:Z


# direct methods
.method public constructor <init>(Lںڍڒڸ/ى;)V
    .locals 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lںڍڒڸ/ٵ;-><init>(Z)V

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->غ(Lںڍڒڸ/ى;)V

    sget-object p1, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ة;

    instance-of v2, v1, Lںڍڒڸ/ت;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    check-cast v1, Lںڍڒڸ/ت;

    goto :goto_0

    :cond_0
    move-object v1, v3

    :goto_0
    if-eqz v1, :cond_3

    :goto_1
    invoke-virtual {v1}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object v1

    invoke-virtual {v1}, Lںڍڒڸ/ٵ;->ش()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_3

    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ة;

    instance-of v2, v1, Lںڍڒڸ/ت;

    if-eqz v2, :cond_2

    check-cast v1, Lںڍڒڸ/ت;

    goto :goto_2

    :cond_2
    move-object v1, v3

    :goto_2
    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_3
    iput-boolean v0, p0, Lںڍڒڸ/ٯ;->ؤ:Z

    return-void
.end method


# virtual methods
.method public final ش()Z
    .locals 1

    iget-boolean v0, p0, Lںڍڒڸ/ٯ;->ؤ:Z

    return v0
.end method

.method public final ص()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
