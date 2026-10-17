.class public final enum Lإۺهؑڋڻ/ء;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lڒڦٶ٣٧/ء;


# static fields
.field public static final enum أ:Lإۺهؑڋڻ/ء;

.field public static final enum ؤ:Lإۺهؑڋڻ/ء;

.field public static final enum إ:Lإۺهؑڋڻ/ء;

.field public static final enum ئ:Lإۺهؑڋڻ/ء;

.field public static final enum ا:Lإۺهؑڋڻ/ء;

.field public static final enum ب:Lإۺهؑڋڻ/ء;

.field public static final enum ة:Lإۺهؑڋڻ/ء;

.field public static final synthetic ت:[Lإۺهؑڋڻ/ء;


# instance fields
.field public final آ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 9

    new-instance v0, Lإۺهؑڋڻ/ء;

    const-string v1, "REASON_UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lإۺهؑڋڻ/ء;->أ:Lإۺهؑڋڻ/ء;

    new-instance v1, Lإۺهؑڋڻ/ء;

    const-string v2, "MESSAGE_TOO_OLD"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lإۺهؑڋڻ/ء;->ؤ:Lإۺهؑڋڻ/ء;

    new-instance v2, Lإۺهؑڋڻ/ء;

    const-string v3, "CACHE_FULL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lإۺهؑڋڻ/ء;->إ:Lإۺهؑڋڻ/ء;

    new-instance v3, Lإۺهؑڋڻ/ء;

    const-string v4, "PAYLOAD_TOO_BIG"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lإۺهؑڋڻ/ء;->ئ:Lإۺهؑڋڻ/ء;

    new-instance v4, Lإۺهؑڋڻ/ء;

    const-string v5, "MAX_RETRIES_REACHED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lإۺهؑڋڻ/ء;->ا:Lإۺهؑڋڻ/ء;

    new-instance v5, Lإۺهؑڋڻ/ء;

    const-string v6, "INVALID_PAYLOD"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lإۺهؑڋڻ/ء;->ب:Lإۺهؑڋڻ/ء;

    new-instance v6, Lإۺهؑڋڻ/ء;

    const-string v7, "SERVER_ERROR"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lإۺهؑڋڻ/ء;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lإۺهؑڋڻ/ء;->ة:Lإۺهؑڋڻ/ء;

    filled-new-array/range {v0 .. v6}, [Lإۺهؑڋڻ/ء;

    move-result-object v0

    sput-object v0, Lإۺهؑڋڻ/ء;->ت:[Lإۺهؑڋڻ/ء;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lإۺهؑڋڻ/ء;->آ:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lإۺهؑڋڻ/ء;
    .locals 1

    const-class v0, Lإۺهؑڋڻ/ء;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lإۺهؑڋڻ/ء;

    return-object p0
.end method

.method public static values()[Lإۺهؑڋڻ/ء;
    .locals 1

    sget-object v0, Lإۺهؑڋڻ/ء;->ت:[Lإۺهؑڋڻ/ء;

    invoke-virtual {v0}, [Lإۺهؑڋڻ/ء;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lإۺهؑڋڻ/ء;

    return-object v0
.end method


# virtual methods
.method public final ؋()I
    .locals 1

    iget v0, p0, Lإۺهؑڋڻ/ء;->آ:I

    return v0
.end method
