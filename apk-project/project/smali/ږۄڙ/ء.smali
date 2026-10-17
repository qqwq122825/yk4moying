.class public final enum Lږۄڙ/ء;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum آ:Lږۄڙ/ء;

.field public static final enum أ:Lږۄڙ/ء;

.field public static final enum ؤ:Lږۄڙ/ء;

.field public static final enum إ:Lږۄڙ/ء;

.field public static final enum ئ:Lږۄڙ/ء;

.field public static final synthetic ا:[Lږۄڙ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 7

    new-instance v0, Lږۄڙ/ء;

    const-string v1, "ATTEMPT_MIGRATION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lږۄڙ/ء;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lږۄڙ/ء;->آ:Lږۄڙ/ء;

    new-instance v1, Lږۄڙ/ء;

    const-string v2, "NOT_GENERATED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lږۄڙ/ء;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lږۄڙ/ء;->أ:Lږۄڙ/ء;

    new-instance v2, Lږۄڙ/ء;

    const-string v3, "UNREGISTERED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lږۄڙ/ء;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lږۄڙ/ء;->ؤ:Lږۄڙ/ء;

    new-instance v3, Lږۄڙ/ء;

    const-string v4, "REGISTERED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lږۄڙ/ء;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lږۄڙ/ء;->إ:Lږۄڙ/ء;

    new-instance v4, Lږۄڙ/ء;

    const-string v5, "REGISTER_ERROR"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Lږۄڙ/ء;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lږۄڙ/ء;->ئ:Lږۄڙ/ء;

    filled-new-array {v0, v1, v2, v3, v4}, [Lږۄڙ/ء;

    move-result-object v0

    sput-object v0, Lږۄڙ/ء;->ا:[Lږۄڙ/ء;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lږۄڙ/ء;
    .locals 1

    const-class v0, Lږۄڙ/ء;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lږۄڙ/ء;

    return-object p0
.end method

.method public static values()[Lږۄڙ/ء;
    .locals 1

    sget-object v0, Lږۄڙ/ء;->ا:[Lږۄڙ/ء;

    invoke-virtual {v0}, [Lږۄڙ/ء;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lږۄڙ/ء;

    return-object v0
.end method
