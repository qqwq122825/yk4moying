.class public final Lڽتٺۊڗ؜/ث;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؠ:Lڽتٺۊڗ؜/ت;


# instance fields
.field public final ؋:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڽتٺۊڗ؜/ت;

    invoke-direct {v0}, Lڽتٺۊڗ؜/ت;-><init>()V

    sput-object v0, Lڽتٺۊڗ؜/ث;->ؠ:Lڽتٺۊڗ؜/ت;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lڽتٺۊڗ؜/ث;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    check-cast p1, Lڽتٺۊڗ؜/ث;

    iget-object p1, p1, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    iget-object v0, p0, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    instance-of v1, v0, Lڽتٺۊڗ؜/ة;

    if-eqz v1, :cond_0

    check-cast v0, Lڽتٺۊڗ؜/ة;

    invoke-virtual {v0}, Lڽتٺۊڗ؜/ة;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Value("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
