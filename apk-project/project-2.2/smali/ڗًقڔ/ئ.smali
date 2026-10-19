.class public final enum Lڗًقڔ/ئ;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum آ:Lڗًقڔ/ئ;

.field public static final enum أ:Lڗًقڔ/ئ;

.field public static final enum ؤ:Lڗًقڔ/ئ;

.field public static final synthetic إ:[Lڗًقڔ/ئ;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lڗًقڔ/ئ;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lڗًقڔ/ئ;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lڗًقڔ/ئ;->آ:Lڗًقڔ/ئ;

    new-instance v1, Lڗًقڔ/ئ;

    const-string v2, "BAD_CONFIG"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lڗًقڔ/ئ;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lڗًقڔ/ئ;->أ:Lڗًقڔ/ئ;

    new-instance v2, Lڗًقڔ/ئ;

    const-string v3, "AUTH_ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lڗًقڔ/ئ;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lڗًقڔ/ئ;->ؤ:Lڗًقڔ/ئ;

    filled-new-array {v0, v1, v2}, [Lڗًقڔ/ئ;

    move-result-object v0

    sput-object v0, Lڗًقڔ/ئ;->إ:[Lڗًقڔ/ئ;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lڗًقڔ/ئ;
    .locals 1

    const-class v0, Lڗًقڔ/ئ;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lڗًقڔ/ئ;

    return-object p0
.end method

.method public static values()[Lڗًقڔ/ئ;
    .locals 1

    sget-object v0, Lڗًقڔ/ئ;->إ:[Lڗًقڔ/ئ;

    invoke-virtual {v0}, [Lڗًقڔ/ئ;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lڗًقڔ/ئ;

    return-object v0
.end method
