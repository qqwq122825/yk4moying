.class final Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$1;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/ت;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/room/RoomDatabaseKt;->acquireTransactionThread(Ljava/util/concurrent/Executor;Lںڍڒڸ/ى;Lڨڡئٸت/أ;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/\u0628;",
        "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
    }
.end annotation


# instance fields
.field final synthetic $controlJob:Lںڍڒڸ/ى;


# direct methods
.method public constructor <init>(Lںڍڒڸ/ى;)V
    .locals 0

    iput-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$1;->$controlJob:Lںڍڒڸ/ى;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$1;->invoke(Ljava/lang/Throwable;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final invoke(Ljava/lang/Throwable;)V
    .locals 1

    iget-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$1;->$controlJob:Lںڍڒڸ/ى;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    return-void
.end method
