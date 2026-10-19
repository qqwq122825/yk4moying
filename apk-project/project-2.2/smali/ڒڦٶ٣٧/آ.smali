.class public final enum Lڒڦٶ٣٧/آ;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum آ:Lڒڦٶ٣٧/آ;

.field public static final synthetic أ:[Lڒڦٶ٣٧/آ;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lڒڦٶ٣٧/آ;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lڒڦٶ٣٧/آ;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lڒڦٶ٣٧/آ;->آ:Lڒڦٶ٣٧/آ;

    new-instance v1, Lڒڦٶ٣٧/آ;

    const-string v2, "SIGNED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lڒڦٶ٣٧/آ;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lڒڦٶ٣٧/آ;

    const-string v3, "FIXED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lڒڦٶ٣٧/آ;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Lڒڦٶ٣٧/آ;

    move-result-object v0

    sput-object v0, Lڒڦٶ٣٧/آ;->أ:[Lڒڦٶ٣٧/آ;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lڒڦٶ٣٧/آ;
    .locals 1

    const-class v0, Lڒڦٶ٣٧/آ;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lڒڦٶ٣٧/آ;

    return-object p0
.end method

.method public static values()[Lڒڦٶ٣٧/آ;
    .locals 1

    sget-object v0, Lڒڦٶ٣٧/آ;->أ:[Lڒڦٶ٣٧/آ;

    invoke-virtual {v0}, [Lڒڦٶ٣٧/آ;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lڒڦٶ٣٧/آ;

    return-object v0
.end method
