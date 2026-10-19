.class public final Lإۊ۲ڽِٓر/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڡحڠبںۨږۛ/؋;


# static fields
.field public static final ؤ:Ljava/lang/Object;


# instance fields
.field public volatile آ:Lڡحڠبںۨږۛ/؋;

.field public volatile أ:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lإۊ۲ڽِٓر/؋;->ؤ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lإۊ۲ڽِٓر/ؠ;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lإۊ۲ڽِٓر/؋;->ؤ:Ljava/lang/Object;

    iput-object v0, p0, Lإۊ۲ڽِٓر/؋;->أ:Ljava/lang/Object;

    iput-object p1, p0, Lإۊ۲ڽِٓر/؋;->آ:Lڡحڠبںۨږۛ/؋;

    return-void
.end method

.method public static ؋(Lإۊ۲ڽِٓر/ؠ;)Lڡحڠبںۨږۛ/؋;
    .locals 1

    instance-of v0, p0, Lإۊ۲ڽِٓر/؋;

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lإۊ۲ڽِٓر/؋;

    invoke-direct {v0, p0}, Lإۊ۲ڽِٓر/؋;-><init>(Lإۊ۲ڽِٓر/ؠ;)V

    return-object v0
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 5

    iget-object v0, p0, Lإۊ۲ڽِٓر/؋;->أ:Ljava/lang/Object;

    sget-object v1, Lإۊ۲ڽِٓر/؋;->ؤ:Ljava/lang/Object;

    if-ne v0, v1, :cond_4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lإۊ۲ڽِٓر/؋;->أ:Ljava/lang/Object;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lإۊ۲ڽِٓر/؋;->آ:Lڡحڠبںۨږۛ/؋;

    invoke-interface {v0}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v2, p0, Lإۊ۲ڽِٓر/؋;->أ:Ljava/lang/Object;

    if-eq v2, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    if-ne v2, v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Scoped provider was invoked recursively returning different results: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " & "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ". This is likely due to a circular dependency."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    :goto_1
    iput-object v0, p0, Lإۊ۲ڽِٓر/؋;->أ:Ljava/lang/Object;

    const/4 v1, 0x0

    iput-object v1, p0, Lإۊ۲ڽِٓر/؋;->آ:Lڡحڠبںۨږۛ/؋;

    :cond_3
    monitor-exit p0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_4
    :goto_2
    return-object v0
.end method
