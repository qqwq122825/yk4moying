.class public abstract Lؼۄٿأ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Lز؃ۉؾؚۖڿڨ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    new-instance v0, Lز؃ۉؾؚۖڿڨ/ؠ;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lز؃ۉؾؚۖڿڨ/ؠ;-><init>(I)V

    sput-object v0, Lؼۄٿأ/ؠ;->؋:Lز؃ۉؾؚۖڿڨ/ؠ;

    new-instance v0, Lز؃ۉؾؚۖڿڨ/ؠ;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Lز؃ۉؾؚۖڿڨ/ؠ;-><init>(I)V

    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    const-string v2, "profile"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    const-string v2, "email"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    return-void
.end method
