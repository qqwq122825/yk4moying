.class public final synthetic Landroidx/work/impl/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:Landroidx/work/impl/WorkManagerImpl;

.field public final synthetic أ:Ljava/lang/String;

.field public final synthetic ؤ:Landroidx/work/impl/OperationImpl;

.field public final synthetic إ:Lڲٱۘۑدٿٰ/؋;

.field public final synthetic ئ:Landroidx/work/WorkRequest;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;Landroidx/work/impl/OperationImpl;Lڲٱۘۑدٿٰ/؋;Landroidx/work/WorkRequest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/إ;->آ:Landroidx/work/impl/WorkManagerImpl;

    iput-object p2, p0, Landroidx/work/impl/إ;->أ:Ljava/lang/String;

    iput-object p3, p0, Landroidx/work/impl/إ;->ؤ:Landroidx/work/impl/OperationImpl;

    iput-object p4, p0, Landroidx/work/impl/إ;->إ:Lڲٱۘۑدٿٰ/؋;

    iput-object p5, p0, Landroidx/work/impl/إ;->ئ:Landroidx/work/WorkRequest;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Landroidx/work/impl/إ;->إ:Lڲٱۘۑدٿٰ/؋;

    iget-object v1, p0, Landroidx/work/impl/إ;->ئ:Landroidx/work/WorkRequest;

    iget-object v2, p0, Landroidx/work/impl/إ;->آ:Landroidx/work/impl/WorkManagerImpl;

    iget-object v3, p0, Landroidx/work/impl/إ;->أ:Ljava/lang/String;

    iget-object v4, p0, Landroidx/work/impl/إ;->ؤ:Landroidx/work/impl/OperationImpl;

    invoke-static {v2, v3, v4, v0, v1}, Landroidx/work/impl/WorkerUpdater;->؋(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;Landroidx/work/impl/OperationImpl;Lڲٱۘۑدٿٰ/؋;Landroidx/work/WorkRequest;)V

    return-void
.end method
