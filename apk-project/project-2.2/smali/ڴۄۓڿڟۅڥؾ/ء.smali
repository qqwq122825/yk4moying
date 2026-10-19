.class public final Lڴۄۓڿڟۅڥؾ/ء;
.super Lڴۄۓڿڟۅڥؾ/؋;
.source "SourceFile"


# instance fields
.field public final ؤ:Lڴۄۓڿڟۅڥؾ/ؠ;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lڴۄۓڿڟۅڥؾ/؋;-><init>()V

    new-instance v0, Lڴۄۓڿڟۅڥؾ/ؠ;

    invoke-direct {v0}, Lڴۄۓڿڟۅڥؾ/ؠ;-><init>()V

    iput-object v0, p0, Lڴۄۓڿڟۅڥؾ/ء;->ؤ:Lڴۄۓڿڟۅڥؾ/ؠ;

    return-void
.end method


# virtual methods
.method public final ؋()Ljava/util/Random;
    .locals 2

    iget-object v0, p0, Lڴۄۓڿڟۅڥؾ/ء;->ؤ:Lڴۄۓڿڟۅڥؾ/ؠ;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "implStorage.get()"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/Random;

    return-object v0
.end method
