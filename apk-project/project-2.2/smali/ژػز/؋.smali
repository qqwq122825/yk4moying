.class public final enum Lژػز/؋;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lڒڦٶ٣٧/ء;


# static fields
.field public static final enum أ:Lژػز/؋;

.field public static final synthetic ؤ:[Lژػز/؋;


# instance fields
.field public final آ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lژػز/؋;

    const-string v1, "UNKNOWN_EVENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lژػز/؋;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lژػز/؋;

    const-string v2, "MESSAGE_DELIVERED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lژػز/؋;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lژػز/؋;->أ:Lژػز/؋;

    new-instance v2, Lژػز/؋;

    const-string v3, "MESSAGE_OPEN"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lژػز/؋;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2}, [Lژػز/؋;

    move-result-object v0

    sput-object v0, Lژػز/؋;->ؤ:[Lژػز/؋;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lژػز/؋;->آ:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lژػز/؋;
    .locals 1

    const-class v0, Lژػز/؋;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lژػز/؋;

    return-object p0
.end method

.method public static values()[Lژػز/؋;
    .locals 1

    sget-object v0, Lژػز/؋;->ؤ:[Lژػز/؋;

    invoke-virtual {v0}, [Lژػز/؋;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lژػز/؋;

    return-object v0
.end method


# virtual methods
.method public final ؋()I
    .locals 1

    iget v0, p0, Lژػز/؋;->آ:I

    return v0
.end method
