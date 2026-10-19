.class public final Lcom/google/android/material/datepicker/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؤ:J

.field public static final إ:J


# instance fields
.field public final ؋:J

.field public final ؠ:J

.field public ء:Ljava/lang/Long;

.field public final آ:I

.field public final أ:Lcom/google/android/material/datepicker/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    const/16 v0, 0x76c

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/material/datepicker/ز;->؋(II)Lcom/google/android/material/datepicker/ز;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/google/android/material/datepicker/ػ;->آ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v2

    iget-wide v3, v0, Lcom/google/android/material/datepicker/ز;->ا:J

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {v2}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/google/android/material/datepicker/؋;->ؤ:J

    const/16 v0, 0x834

    const/16 v2, 0xb

    invoke-static {v0, v2}, Lcom/google/android/material/datepicker/ز;->؋(II)Lcom/google/android/material/datepicker/ز;

    move-result-object v0

    invoke-static {v1}, Lcom/google/android/material/datepicker/ػ;->آ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v1

    iget-wide v2, v0, Lcom/google/android/material/datepicker/ز;->ا:J

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {v1}, Lcom/google/android/material/datepicker/ػ;->ؠ(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/material/datepicker/؋;->إ:J

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/datepicker/ء;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-wide v0, Lcom/google/android/material/datepicker/؋;->ؤ:J

    iput-wide v0, p0, Lcom/google/android/material/datepicker/؋;->؋:J

    sget-wide v0, Lcom/google/android/material/datepicker/؋;->إ:J

    iput-wide v0, p0, Lcom/google/android/material/datepicker/؋;->ؠ:J

    new-instance v0, Lcom/google/android/material/datepicker/آ;

    const-wide/high16 v1, -0x8000000000000000L

    invoke-direct {v0, v1, v2}, Lcom/google/android/material/datepicker/آ;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/material/datepicker/؋;->أ:Lcom/google/android/material/datepicker/ؠ;

    iget-object v0, p1, Lcom/google/android/material/datepicker/ء;->آ:Lcom/google/android/material/datepicker/ز;

    iget-wide v0, v0, Lcom/google/android/material/datepicker/ز;->ا:J

    iput-wide v0, p0, Lcom/google/android/material/datepicker/؋;->؋:J

    iget-object v0, p1, Lcom/google/android/material/datepicker/ء;->أ:Lcom/google/android/material/datepicker/ز;

    iget-wide v0, v0, Lcom/google/android/material/datepicker/ز;->ا:J

    iput-wide v0, p0, Lcom/google/android/material/datepicker/؋;->ؠ:J

    iget-object v0, p1, Lcom/google/android/material/datepicker/ء;->إ:Lcom/google/android/material/datepicker/ز;

    iget-wide v0, v0, Lcom/google/android/material/datepicker/ز;->ا:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/datepicker/؋;->ء:Ljava/lang/Long;

    iget v0, p1, Lcom/google/android/material/datepicker/ء;->ئ:I

    iput v0, p0, Lcom/google/android/material/datepicker/؋;->آ:I

    iget-object p1, p1, Lcom/google/android/material/datepicker/ء;->ؤ:Lcom/google/android/material/datepicker/ؠ;

    iput-object p1, p0, Lcom/google/android/material/datepicker/؋;->أ:Lcom/google/android/material/datepicker/ؠ;

    return-void
.end method
