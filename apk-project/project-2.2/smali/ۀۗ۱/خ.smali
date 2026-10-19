.class public abstract Lۀۗ۱/خ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lۀۗ۱/ؼ;


# instance fields
.field private final delegate:Lۀۗ۱/ؼ;


# direct methods
.method public constructor <init>(Lۀۗ۱/ؼ;)V
    .locals 1

    const-string v0, "delegate"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    return-void
.end method


# virtual methods
.method public final -deprecated_delegate()Lۀۗ۱/ؼ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    return-object v0
.end method

.method public close()V
    .locals 1

    iget-object v0, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    return-void
.end method

.method public final delegate()Lۀۗ۱/ؼ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    return-object v0
.end method

.method public read(Lۀۗ۱/ب;J)J
    .locals 1

    const-string v0, "sink"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    invoke-interface {v0, p1, p2, p3}, Lۀۗ۱/ؼ;->read(Lۀۗ۱/ب;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public timeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    invoke-interface {v0}, Lۀۗ۱/ؼ;->timeout()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lۀۗ۱/خ;->delegate:Lۀۗ۱/ؼ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
