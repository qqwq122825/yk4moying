.class public final synthetic Lڽتٺۊڗ؜/إ;
.super Lkotlin/jvm/internal/ا;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# static fields
.field public static final آ:Lڽتٺۊڗ؜/إ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڽتٺۊڗ؜/إ;

    invoke-direct {v0}, Lڽتٺۊڗ؜/إ;-><init>()V

    sput-object v0, Lڽتٺۊڗ؜/إ;->آ:Lڽتٺۊڗ؜/إ;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const/4 v1, 0x2

    const-class v2, Lڽتٺۊڗ؜/ئ;

    const-string v3, "createSegment"

    const-string v4, "createSegment(JLkotlinx/coroutines/channels/ChannelSegment;)Lkotlinx/coroutines/channels/ChannelSegment;"

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/ا;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    move-object v3, p2

    check-cast v3, Lڽتٺۊڗ؜/ج;

    sget-object p1, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    new-instance p1, Lڽتٺۊڗ؜/ج;

    iget-object v4, v3, Lڽتٺۊڗ؜/ج;->ئ:Lڽتٺۊڗ؜/ؤ;

    invoke-static {v4}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lڽتٺۊڗ؜/ج;-><init>(JLڽتٺۊڗ؜/ج;Lڽتٺۊڗ؜/ؤ;I)V

    return-object p1
.end method
