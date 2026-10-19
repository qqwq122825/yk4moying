.class public final Lخڝٻؽؐ/ا;
.super Ljava/lang/UnsupportedOperationException;
.source "SourceFile"


# instance fields
.field public final آ:Lحۨٸڮؐێ/ء;


# direct methods
.method public constructor <init>(Lحۨٸڮؐێ/ء;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    iput-object p1, p0, Lخڝٻؽؐ/ا;->آ:Lحۨٸڮؐێ/ء;

    return-void
.end method


# virtual methods
.method public final getMessage()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lخڝٻؽؐ/ا;->آ:Lحۨٸڮؐێ/ء;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
