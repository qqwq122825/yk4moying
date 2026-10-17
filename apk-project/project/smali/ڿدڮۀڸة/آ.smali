.class public final Lڿدڮۀڸة/آ;
.super Lڿدڮۀڸة/إ;
.source "SourceFile"


# static fields
.field public static final أ:Lڿدڮۀڸة/آ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڿدڮۀڸة/آ;

    invoke-direct {v0}, Lڿدڮۀڸة/آ;-><init>()V

    sput-object v0, Lڿدڮۀڸة/آ;->أ:Lڿدڮۀڸة/آ;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    sget v1, Lڿدڮۀڸة/ب;->ء:I

    sget v2, Lڿدڮۀڸة/ب;->آ:I

    sget-wide v3, Lڿدڮۀڸة/ب;->أ:J

    sget-object v5, Lڿدڮۀڸة/ب;->؋:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lڿدڮۀڸة/إ;-><init>(IIJLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Dispatchers.Default cannot be closed"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    invoke-static {p1}, Lڗًقڔ/؋;->ث(I)V

    sget v0, Lڿدڮۀڸة/ب;->ء:I

    if-lt p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-super {p0, p1}, Lںڍڒڸ/ر;->limitedParallelism(I)Lںڍڒڸ/ر;

    move-result-object p1

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    const-string v0, "Dispatchers.Default"

    return-object v0
.end method
