.class public final Lذ٨ۍ/ج;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lذ٨ۍ/ؠ;


# instance fields
.field public final synthetic ؋:Lذ٨ۍ/أ;


# direct methods
.method public constructor <init>(Lذ٨ۍ/أ;)V
    .locals 0

    iput-object p1, p0, Lذ٨ۍ/ج;->؋:Lذ٨ۍ/أ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋(Z)V
    .locals 2

    iget-object v0, p0, Lذ٨ۍ/ج;->؋:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/4 v1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
