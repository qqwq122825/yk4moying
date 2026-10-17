.class public final enum Lژػز/ء;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lڒڦٶ٣٧/ء;


# static fields
.field public static final enum أ:Lژػز/ء;

.field public static final synthetic ؤ:[Lژػز/ء;


# instance fields
.field public final آ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 6

    new-instance v0, Lژػز/ء;

    const-string v1, "UNKNOWN_OS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lژػز/ء;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lژػز/ء;

    const-string v2, "ANDROID"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lژػز/ء;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lژػز/ء;->أ:Lژػز/ء;

    new-instance v2, Lژػز/ء;

    const-string v3, "IOS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lژػز/ء;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lژػز/ء;

    const-string v4, "WEB"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lژػز/ء;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2, v3}, [Lژػز/ء;

    move-result-object v0

    sput-object v0, Lژػز/ء;->ؤ:[Lژػز/ء;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lژػز/ء;->آ:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lژػز/ء;
    .locals 1

    const-class v0, Lژػز/ء;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lژػز/ء;

    return-object p0
.end method

.method public static values()[Lژػز/ء;
    .locals 1

    sget-object v0, Lژػز/ء;->ؤ:[Lژػز/ء;

    invoke-virtual {v0}, [Lژػز/ء;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lژػز/ء;

    return-object v0
.end method


# virtual methods
.method public final ؋()I
    .locals 1

    iget v0, p0, Lژػز/ء;->آ:I

    return v0
.end method
