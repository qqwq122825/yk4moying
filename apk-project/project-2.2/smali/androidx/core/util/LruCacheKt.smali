.class public final Landroidx/core/util/LruCacheKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final lruCache(ILڲٱۘۑدٿٰ/خ;Lڲٱۘۑدٿٰ/ت;Lڲٱۘۑدٿٰ/ذ;)Landroid/util/LruCache;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u0630;",
            ")",
            "Landroid/util/LruCache<",
            "TK;TV;>;"
        }
    .end annotation

    new-instance v0, Landroidx/core/util/LruCacheKt$lruCache$4;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/core/util/LruCacheKt$lruCache$4;-><init>(ILڲٱۘۑدٿٰ/خ;Lڲٱۘۑدٿٰ/ت;Lڲٱۘۑدٿٰ/ذ;)V

    return-object v0
.end method

.method public static synthetic lruCache$default(ILڲٱۘۑدٿٰ/خ;Lڲٱۘۑدٿٰ/ت;Lڲٱۘۑدٿٰ/ذ;ILjava/lang/Object;)Landroid/util/LruCache;
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    sget-object p1, Landroidx/core/util/LruCacheKt$lruCache$1;->INSTANCE:Landroidx/core/util/LruCacheKt$lruCache$1;

    :cond_0
    and-int/lit8 p5, p4, 0x4

    if-eqz p5, :cond_1

    sget-object p2, Landroidx/core/util/LruCacheKt$lruCache$2;->INSTANCE:Landroidx/core/util/LruCacheKt$lruCache$2;

    :cond_1
    and-int/lit8 p4, p4, 0x8

    if-eqz p4, :cond_2

    sget-object p3, Landroidx/core/util/LruCacheKt$lruCache$3;->INSTANCE:Landroidx/core/util/LruCacheKt$lruCache$3;

    :cond_2
    new-instance p4, Landroidx/core/util/LruCacheKt$lruCache$4;

    invoke-direct {p4, p0, p1, p2, p3}, Landroidx/core/util/LruCacheKt$lruCache$4;-><init>(ILڲٱۘۑدٿٰ/خ;Lڲٱۘۑدٿٰ/ت;Lڲٱۘۑدٿٰ/ذ;)V

    return-object p4
.end method
