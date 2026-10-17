.class public final synthetic Lحظتۢۋۜآظ/ز;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field public static final synthetic آ:Lحظتۢۋۜآظ/ز;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lحظتۢۋۜآظ/ز;

    invoke-direct {v0}, Lحظتۢۋۜآظ/ز;-><init>()V

    sput-object v0, Lحظتۢۋۜآظ/ز;->آ:Lحظتۢۋۜآظ/ز;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .locals 0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method
