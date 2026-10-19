.class public final enum Lڽتٺۊڗ؜/؋;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum آ:Lڽتٺۊڗ؜/؋;

.field public static final enum أ:Lڽتٺۊڗ؜/؋;

.field public static final enum ؤ:Lڽتٺۊڗ؜/؋;

.field public static final synthetic إ:[Lڽتٺۊڗ؜/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lڽتٺۊڗ؜/؋;

    const-string v1, "SUSPEND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lڽتٺۊڗ؜/؋;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    new-instance v1, Lڽتٺۊڗ؜/؋;

    const-string v2, "DROP_OLDEST"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lڽتٺۊڗ؜/؋;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lڽتٺۊڗ؜/؋;->أ:Lڽتٺۊڗ؜/؋;

    new-instance v2, Lڽتٺۊڗ؜/؋;

    const-string v3, "DROP_LATEST"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lڽتٺۊڗ؜/؋;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lڽتٺۊڗ؜/؋;->ؤ:Lڽتٺۊڗ؜/؋;

    filled-new-array {v0, v1, v2}, [Lڽتٺۊڗ؜/؋;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/؋;->إ:[Lڽتٺۊڗ؜/؋;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lڽتٺۊڗ؜/؋;
    .locals 1

    const-class v0, Lڽتٺۊڗ؜/؋;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lڽتٺۊڗ؜/؋;

    return-object p0
.end method

.method public static values()[Lڽتٺۊڗ؜/؋;
    .locals 1

    sget-object v0, Lڽتٺۊڗ؜/؋;->إ:[Lڽتٺۊڗ؜/؋;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lڽتٺۊڗ؜/؋;

    return-object v0
.end method
