.class final Landroidx/room/migration/MigrationImpl;
.super Landroidx/room/migration/Migration;
.source "SourceFile"


# instance fields
.field private final migrateCallback:Lڲٱۘۑدٿٰ/ت;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IILڲٱۘۑدٿٰ/ت;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;",
            ")V"
        }
    .end annotation

    const-string v0, "migrateCallback"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Landroidx/room/migration/Migration;-><init>(II)V

    iput-object p3, p0, Landroidx/room/migration/MigrationImpl;->migrateCallback:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public final getMigrateCallback()Lڲٱۘۑدٿٰ/ت;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/room/migration/MigrationImpl;->migrateCallback:Lڲٱۘۑدٿٰ/ت;

    return-object v0
.end method

.method public migrate(Landroidx/sqlite/db/SupportSQLiteDatabase;)V
    .locals 1

    const-string v0, "database"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/room/migration/MigrationImpl;->migrateCallback:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v0, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
