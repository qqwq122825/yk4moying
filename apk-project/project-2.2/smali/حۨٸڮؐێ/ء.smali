.class public final Lحۨٸڮؐێ/ء;
.super Lرسٗ/؋;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "L\u062d\u06e8\u0678\u06ae\u0610\u06ce/\u0621;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final آ:Ljava/lang/String;

.field public final أ:I

.field public final ؤ:J


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lجۖ؅/؋;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lجۖ؅/؋;-><init>(I)V

    sput-object v0, Lحۨٸڮؐێ/ء;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    const-string v0, "CLIENT_TELEMETRY"

    iput-object v0, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lحۨٸڮؐێ/ء;->ؤ:J

    const/4 v0, -0x1

    iput v0, p0, Lحۨٸڮؐێ/ء;->أ:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IJ)V
    .locals 0

    invoke-direct {p0}, Lرسٗ/؋;-><init>()V

    iput-object p1, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    iput p2, p0, Lحۨٸڮؐێ/ء;->أ:I

    iput-wide p3, p0, Lحۨٸڮؐێ/ء;->ؤ:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 6

    instance-of v0, p1, Lحۨٸڮؐێ/ء;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    check-cast p1, Lحۨٸڮؐێ/ء;

    iget-object v0, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v2, p1, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    if-nez v0, :cond_2

    iget-object v0, p1, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v2

    invoke-virtual {p1}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v4

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v1
.end method

.method public final hashCode()I
    .locals 2

    invoke-virtual {p0}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Lآۋۻؾ۹/ة;

    invoke-direct {v0, p0}, Lآۋۻؾ۹/ة;-><init>(Ljava/lang/Object;)V

    iget-object v1, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    const-string v2, "name"

    invoke-virtual {v0, v1, v2}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "version"

    invoke-virtual {v0, v1, v2}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lآۋۻؾ۹/ة;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 p2, 0x4f45

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    iget-object v1, p0, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    const/4 v0, 0x2

    iget v1, p0, Lحۨٸڮؐێ/ء;->أ:I

    invoke-static {p1, v0, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    invoke-virtual {p0}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v0

    const v2, 0x80003

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    invoke-static {p1, p2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final ؋()J
    .locals 4

    const-wide/16 v0, -0x1

    iget-wide v2, p0, Lحۨٸڮؐێ/ء;->ؤ:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    iget v0, p0, Lحۨٸڮؐێ/ء;->أ:I

    int-to-long v0, v0

    return-wide v0

    :cond_0
    return-wide v2
.end method
