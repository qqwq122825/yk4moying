.class public final synthetic Lٿخ۴۟ؽ/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AutoCompleteTextView$OnDismissListener;


# instance fields
.field public final synthetic ؋:Lٿخ۴۟ؽ/ة;


# direct methods
.method public synthetic constructor <init>(Lٿخ۴۟ؽ/ة;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lٿخ۴۟ؽ/ب;->؋:Lٿخ۴۟ؽ/ة;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 4

    const/4 v0, 0x1

    iget-object v1, p0, Lٿخ۴۟ؽ/ب;->؋:Lٿخ۴۟ؽ/ة;

    iput-boolean v0, v1, Lٿخ۴۟ؽ/ة;->ث:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lٿخ۴۟ؽ/ة;->ح:J

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lٿخ۴۟ؽ/ة;->ز(Z)V

    return-void
.end method
