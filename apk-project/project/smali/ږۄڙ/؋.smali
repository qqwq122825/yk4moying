.class public final Lږۄڙ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic ئ:I


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:Lږۄڙ/ء;

.field public final ء:Ljava/lang/String;

.field public final آ:Ljava/lang/String;

.field public final أ:J

.field public final ؤ:J

.field public final إ:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Lآۋۻؾ۹/ث;

    invoke-direct {v0}, Lآۋۻؾ۹/ث;-><init>()V

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    sget-object v3, Lږۄڙ/ء;->آ:Lږۄڙ/ء;

    invoke-virtual {v0, v3}, Lآۋۻؾ۹/ث;->ئ(Lږۄڙ/ء;)V

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    invoke-virtual {v0}, Lآۋۻؾ۹/ث;->إ()Lږۄڙ/؋;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lږۄڙ/ء;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    iput-object p2, p0, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    iput-object p3, p0, Lږۄڙ/؋;->ء:Ljava/lang/String;

    iput-object p4, p0, Lږۄڙ/؋;->آ:Ljava/lang/String;

    iput-wide p5, p0, Lږۄڙ/؋;->أ:J

    iput-wide p7, p0, Lږۄڙ/؋;->ؤ:J

    iput-object p9, p0, Lږۄڙ/؋;->إ:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lږۄڙ/؋;

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    check-cast p1, Lږۄڙ/؋;

    iget-object v1, p0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p1, Lږۄڙ/؋;->؋:Ljava/lang/String;

    if-nez v1, :cond_5

    goto :goto_0

    :cond_1
    iget-object v3, p1, Lږۄڙ/؋;->؋:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_0
    iget-object v1, p1, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    iget-object v3, p0, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p1, Lږۄڙ/؋;->ء:Ljava/lang/String;

    iget-object v3, p0, Lږۄڙ/؋;->ء:Ljava/lang/String;

    if-nez v3, :cond_2

    if-nez v1, :cond_5

    goto :goto_1

    :cond_2
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_1
    iget-object v1, p1, Lږۄڙ/؋;->آ:Ljava/lang/String;

    iget-object v3, p0, Lږۄڙ/؋;->آ:Ljava/lang/String;

    if-nez v3, :cond_3

    if-nez v1, :cond_5

    goto :goto_2

    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_2
    iget-wide v3, p0, Lږۄڙ/؋;->أ:J

    iget-wide v5, p1, Lږۄڙ/؋;->أ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_5

    iget-wide v3, p0, Lږۄڙ/؋;->ؤ:J

    iget-wide v5, p1, Lږۄڙ/؋;->ؤ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_5

    iget-object p1, p1, Lږۄڙ/؋;->إ:Ljava/lang/String;

    iget-object v1, p0, Lږۄڙ/؋;->إ:Ljava/lang/String;

    if-nez v1, :cond_4

    if-nez p1, :cond_5

    goto :goto_3

    :cond_4
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_3

    :cond_5
    move v0, v2

    :goto_3
    return v0

    :cond_6
    return v2
.end method

.method public final hashCode()I
    .locals 8

    const/4 v0, 0x0

    iget-object v1, p0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    const v2, 0xf4243

    xor-int/2addr v1, v2

    mul-int/2addr v1, v2

    iget-object v3, p0, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lږۄڙ/؋;->ء:Ljava/lang/String;

    if-nez v3, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lږۄڙ/؋;->آ:Ljava/lang/String;

    if-nez v3, :cond_2

    move v3, v0

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-wide v3, p0, Lږۄڙ/؋;->أ:J

    const/16 v5, 0x20

    ushr-long v6, v3, v5

    xor-long/2addr v3, v6

    long-to-int v3, v3

    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-wide v3, p0, Lږۄڙ/؋;->ؤ:J

    ushr-long v5, v3, v5

    xor-long/2addr v3, v5

    long-to-int v3, v3

    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v2, p0, Lږۄڙ/؋;->إ:Ljava/lang/String;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_3
    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PersistedInstallationEntry{firebaseInstallationId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lږۄڙ/؋;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", registrationStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", authToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lږۄڙ/؋;->ء:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", refreshToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lږۄڙ/؋;->آ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", expiresInSecs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lږۄڙ/؋;->أ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", tokenCreationEpochInSecs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lږۄڙ/؋;->ؤ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", fisError="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lږۄڙ/؋;->إ:Ljava/lang/String;

    const-string v2, "}"

    invoke-static {v0, v1, v2}, Landroidx/activity/result/؋;->ا(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
