.class public final synthetic Landroidx/work/impl/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:Landroidx/work/impl/WorkDatabase;

.field public final synthetic أ:Landroidx/work/impl/model/WorkSpec;

.field public final synthetic ؤ:Landroidx/work/impl/model/WorkSpec;

.field public final synthetic إ:Ljava/util/List;

.field public final synthetic ئ:Ljava/lang/String;

.field public final synthetic ا:Ljava/util/Set;

.field public final synthetic ب:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/ؤ;->آ:Landroidx/work/impl/WorkDatabase;

    iput-object p2, p0, Landroidx/work/impl/ؤ;->أ:Landroidx/work/impl/model/WorkSpec;

    iput-object p3, p0, Landroidx/work/impl/ؤ;->ؤ:Landroidx/work/impl/model/WorkSpec;

    iput-object p4, p0, Landroidx/work/impl/ؤ;->إ:Ljava/util/List;

    iput-object p5, p0, Landroidx/work/impl/ؤ;->ئ:Ljava/lang/String;

    iput-object p6, p0, Landroidx/work/impl/ؤ;->ا:Ljava/util/Set;

    iput-boolean p7, p0, Landroidx/work/impl/ؤ;->ب:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Landroidx/work/impl/ؤ;->آ:Landroidx/work/impl/WorkDatabase;

    iget-object v1, p0, Landroidx/work/impl/ؤ;->أ:Landroidx/work/impl/model/WorkSpec;

    iget-object v2, p0, Landroidx/work/impl/ؤ;->ؤ:Landroidx/work/impl/model/WorkSpec;

    iget-object v3, p0, Landroidx/work/impl/ؤ;->إ:Ljava/util/List;

    iget-object v4, p0, Landroidx/work/impl/ؤ;->ئ:Ljava/lang/String;

    iget-object v5, p0, Landroidx/work/impl/ؤ;->ا:Ljava/util/Set;

    iget-boolean v6, p0, Landroidx/work/impl/ؤ;->ب:Z

    invoke-static/range {v0 .. v6}, Landroidx/work/impl/WorkerUpdater;->ء(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V

    return-void
.end method
