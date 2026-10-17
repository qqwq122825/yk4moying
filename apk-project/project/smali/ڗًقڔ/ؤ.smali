.class public final enum Lڗًقڔ/ؤ;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum آ:Lڗًقڔ/ؤ;

.field public static final enum أ:Lڗًقڔ/ؤ;

.field public static final synthetic ؤ:[Lڗًقڔ/ؤ;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Lڗًقڔ/ؤ;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lڗًقڔ/ؤ;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lڗًقڔ/ؤ;->آ:Lڗًقڔ/ؤ;

    new-instance v1, Lڗًقڔ/ؤ;

    const-string v2, "BAD_CONFIG"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lڗًقڔ/ؤ;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lڗًقڔ/ؤ;->أ:Lڗًقڔ/ؤ;

    filled-new-array {v0, v1}, [Lڗًقڔ/ؤ;

    move-result-object v0

    sput-object v0, Lڗًقڔ/ؤ;->ؤ:[Lڗًقڔ/ؤ;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lڗًقڔ/ؤ;
    .locals 1

    const-class v0, Lڗًقڔ/ؤ;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lڗًقڔ/ؤ;

    return-object p0
.end method

.method public static values()[Lڗًقڔ/ؤ;
    .locals 1

    sget-object v0, Lڗًقڔ/ؤ;->ؤ:[Lڗًقڔ/ؤ;

    invoke-virtual {v0}, [Lڗًقڔ/ؤ;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lڗًقڔ/ؤ;

    return-object v0
.end method
