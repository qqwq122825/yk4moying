.class public final Landroidx/work/impl/model/RawWorkInfoDaoKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final getWorkInfoPojosFlow(Landroidx/work/impl/model/RawWorkInfoDao;Lںڍڒڸ/ر;Landroidx/sqlite/db/SupportSQLiteQuery;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/model/RawWorkInfoDao;",
            "L\u06ba\u068d\u0692\u06b8/\u0631;",
            "Landroidx/sqlite/db/SupportSQLiteQuery;",
            ")",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dispatcher"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "query"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p2}, Landroidx/work/impl/model/RawWorkInfoDao;->getWorkInfoPojosFlow(Landroidx/sqlite/db/SupportSQLiteQuery;)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/work/impl/model/WorkSpecDaoKt;->dedup(Lھٳ۰ڌ؄غڎۦ/إ;Lںڍڒڸ/ر;)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p0

    return-object p0
.end method
