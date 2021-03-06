.class public Lcom/android/internal/telephony/meizu/MzRadioManager;
.super Landroid/os/Handler;
.source "MzRadioManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/meizu/MzRadioManager$RadioPowerRunnable;,
        Lcom/android/internal/telephony/meizu/MzRadioManager$MSimModeChangeRunnable;
    }
.end annotation


# static fields
.field private static final AIRPLANE_MODE_OFF:Z = false

.field private static final AIRPLANE_MODE_ON:Z = true

.field private static final DBG:Z = true

.field private static final ICC_READ_NOT_READY:Z = false

.field private static final ICC_READ_READY:Z = true

.field private static final INITIAL_RETRY_INTERVAL_MSEC:I = 0xc8

.field private static final INVALID_PHONE_ID:I = -0x1

.field public static final MAIN_SIM_SLOT_PROP:Ljava/lang/String; = "persist.radio.simswitch"

.field private static final MODE_PHONE1_ONLY:I = 0x1

.field private static final NO_SIM_INSERTED:I = 0x0

.field private static final PREF_CATEGORY_RADIO_STATUS:Ljava/lang/String; = "RADIO_STATUS"

.field private static final RADIO_POWER_OFF:Z = false

.field private static final RADIO_POWER_ON:Z = true

.field private static final SIM_INSERTED:I = 0x1

.field private static final SIM_NOT_INITIALIZED:I = -0x1

.field private static final STRING_NO_SIM_INSERTED:Ljava/lang/String; = "N/A"

.field private static final TAG:Ljava/lang/String; = "FWK-MzRadioManager"

.field private static mIccidPreference:Landroid/content/SharedPreferences;

.field private static sRadioManager:Lcom/android/internal/telephony/meizu/MzRadioManager;


# instance fields
.field private PROPERTY_ICCID_SIM:[Ljava/lang/String;

.field private mAirplaneMode:Z

.field private mBitmapForPhoneCount:I

.field private mContext:Landroid/content/Context;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mPhoneCount:I

.field private mSimInsertedStatus:[I


# direct methods
.method private constructor <init>(Landroid/content/Context;I)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "phoneCount"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-boolean v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "ril.iccid.sim1"

    aput-object v6, v5, v4

    const-string v6, "ril.iccid.sim2"

    aput-object v6, v5, v3

    const/4 v6, 0x2

    const-string v7, "ril.iccid.sim3"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "ril.iccid.sim4"

    aput-object v7, v5, v6

    iput-object v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->PROPERTY_ICCID_SIM:[Ljava/lang/String;

    new-instance v5, Lcom/android/internal/telephony/meizu/MzRadioManager$1;

    invoke-direct {v5, p0}, Lcom/android/internal/telephony/meizu/MzRadioManager$1;-><init>(Lcom/android/internal/telephony/meizu/MzRadioManager;)V

    iput-object v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "airplane_mode_on"

    invoke-static {v5, v6, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, "airplaneMode":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Initialize MzRadioManager under airplane mode:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->convertPhoneCountIntoBitmap(I)I

    move-result v5

    iput v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mBitmapForPhoneCount:I

    iput p2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-nez v0, :cond_0

    move v3, v4

    :cond_0
    iput-boolean v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    iget-object v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    const-string v5, "RADIO_STATUS"

    invoke-virtual {v3, v5, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    sput-object v3, Lcom/android/internal/telephony/meizu/MzRadioManager;->mIccidPreference:Landroid/content/SharedPreferences;

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .local v1, "filter":Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-array v3, p2, [I

    iput-object v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_1

    iget-object v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    const/4 v4, -0x1

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    invoke-static {p0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/meizu/MzRadioManager;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/meizu/MzRadioManager;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->onReceiveSimStateChangedIntent(Landroid/content/Intent;)V

    return-void
.end method

.method private checkForCTACase()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .local v1, "isCTACase":Z
    const-string v2, "Check For CTA case!"

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-nez v2, :cond_2

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-ge v0, v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Check For CTA case: mSimInsertedStatus["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aget v2, v2, v0

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aget v2, v2, v0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    :cond_0
    const/4 v1, 0x0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v0    # "i":I
    :cond_2
    const/4 v1, 0x0

    :cond_3
    if-nez v1, :cond_4

    invoke-direct {p0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->turnOffCTARadioIfNecessary()V

    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CTA case: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    return v1
.end method

.method private convertPhoneCountIntoBitmap(I)I
    .locals 4
    .param p1, "phoneCount"    # I

    .prologue
    const/4 v1, 0x0

    .local v1, "ret":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    const/4 v2, 0x1

    shl-int/2addr v2, v0

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Convert phoneCount "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " into bitmap "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    return v1
.end method

.method private findMainCapabilityPhoneId()I
    .locals 4

    .prologue
    const/4 v0, 0x0

    .local v0, "result":I
    const-string v2, "persist.radio.simswitch"

    const-string v3, "1"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .local v1, "switchStatus":I
    add-int/lit8 v0, v1, -0x1

    if-ltz v0, :cond_0

    iget v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-lt v0, v2, :cond_1

    :cond_0
    const/4 v0, 0x0

    .end local v0    # "result":I
    :cond_1
    return v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/meizu/MzRadioManager;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/meizu/MzRadioManager;->sRadioManager:Lcom/android/internal/telephony/meizu/MzRadioManager;

    return-object v0
.end method

.method private getSimInsertedStatus(I)I
    .locals 1
    .param p1, "phoneId"    # I

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aget v0, v0, p1

    return v0
.end method

.method public static init(Landroid/content/Context;I)Lcom/android/internal/telephony/meizu/MzRadioManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneCount"    # I

    .prologue
    const-class v1, Lcom/android/internal/telephony/meizu/MzRadioManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/android/internal/telephony/meizu/MzRadioManager;->sRadioManager:Lcom/android/internal/telephony/meizu/MzRadioManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/telephony/meizu/MzRadioManager;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/telephony/meizu/MzRadioManager;-><init>(Landroid/content/Context;I)V

    sput-object v0, Lcom/android/internal/telephony/meizu/MzRadioManager;->sRadioManager:Lcom/android/internal/telephony/meizu/MzRadioManager;

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/meizu/MzRadioManager;->sRadioManager:Lcom/android/internal/telephony/meizu/MzRadioManager;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private isIccIdReady(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "iccId":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "ret":Z
    if-eqz v0, :cond_0

    const-string v2, ""

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ICC read not ready for phone:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ICC read ready, iccid["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isMSimModeSupport()Z
    .locals 2

    .prologue
    const-string v0, "ro.mtk_bsp_package"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isValidPhoneId(I)Z
    .locals 1
    .param p1, "phoneId"    # I

    .prologue
    if-ltz p1, :cond_0

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v0

    if-lt p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const-string v0, "FWK-MzRadioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MzRadioManager] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private onReceiveSimStateChangedIntent(Landroid/content/Intent;)V
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const-string v4, "ss"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .local v3, "simStatus":Ljava/lang/String;
    const-string v4, "phone"

    const/4 v5, -0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .local v2, "phoneId":I
    invoke-direct {p0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->isValidPhoneId(I)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INTENT:Invalid phone id:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", do nothing!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INTENT:SIM_STATE_CHANGED: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", sim status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", phoneId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v0, 0x1

    .local v0, "desiredRadioPower":Z
    const-string v4, "READY"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "LOCKED"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "LOADED"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aput v7, v4, v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Phone["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/meizu/MzRadioManager;->simStatusToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v1

    .local v1, "iccid":Ljava/lang/String;
    const-string v4, "N/A"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Phone "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":SIM ready but ICCID not ready, do nothing"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_3
    const/4 v0, 0x1

    iget-boolean v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Set Radio Power due to SIM_STATE_CHANGED, power: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", phoneId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->setRadioPower(ZI)V

    goto/16 :goto_0

    .end local v1    # "iccid":Ljava/lang/String;
    :cond_4
    const-string v4, "ABSENT"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aput v6, v4, v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Phone["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/meizu/MzRadioManager;->simStatusToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    iget-boolean v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Set Radio Power due to SIM_STATE_CHANGED, power: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", phoneId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->setRadioPower(ZI)V

    goto/16 :goto_0
.end method

.method private putIccIdToPreference(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V
    .locals 2
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;
    .param p2, "iccid"    # Ljava/lang/String;

    .prologue
    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Add radio off SIM: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_0
    return-void
.end method

.method private readIccIdUsingPhoneId(I)Ljava/lang/String;
    .locals 3
    .param p1, "phoneId"    # I

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->PROPERTY_ICCID_SIM:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "ret":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ICCID for phone "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    return-object v0
.end method

.method private refreshIccIdPreference(ZLjava/lang/String;)V
    .locals 2
    .param p1, "power"    # Z
    .param p2, "iccid"    # Ljava/lang/String;

    .prologue
    const-string v1, "refresh iccid preference"

    invoke-static {v1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    sget-object v1, Lcom/android/internal/telephony/meizu/MzRadioManager;->mIccidPreference:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    if-nez p1, :cond_0

    const-string v1, "N/A"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->putIccIdToPreference(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void

    :cond_0
    invoke-direct {p0, v0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->removeIccIdFromPreference(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private refreshSimSetting(ZI)V
    .locals 6
    .param p1, "radioPower"    # Z
    .param p2, "phoneId"    # I

    .prologue
    const/4 v5, 0x1

    iget-object v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "msim_mode_setting"

    iget v4, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mBitmapForPhoneCount:I

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .local v1, "simMode":I
    move v0, v1

    .local v0, "oldMode":I
    if-nez p1, :cond_1

    shl-int v2, v5, p2

    xor-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    :goto_0
    if-eq v1, v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Refresh MSIM mode setting to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "msim_mode_setting"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_0
    return-void

    :cond_1
    shl-int v2, v5, p2

    or-int/2addr v1, v2

    goto :goto_0
.end method

.method private removeIccIdFromPreference(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V
    .locals 2
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;
    .param p2, "iccid"    # Ljava/lang/String;

    .prologue
    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Remove radio off SIM: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_0
    return-void
.end method

.method private setSimInsertedStatus(I)V
    .locals 3
    .param p1, "phoneId"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "iccId":Ljava/lang/String;
    const-string v1, "N/A"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    const/4 v2, 0x0

    aput v2, v1, p1

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    const/4 v2, 0x1

    aput v2, v1, p1

    goto :goto_0
.end method

.method private simStatusToString(I)Ljava/lang/String;
    .locals 1
    .param p1, "simStatus"    # I

    .prologue
    const/4 v0, 0x0

    .local v0, "result":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "SIM HAVE NOT INITIALIZED"

    goto :goto_0

    :pswitch_1
    const-string v0, "SIM DETECTED"

    goto :goto_0

    :pswitch_2
    const-string v0, "NO SIM DETECTED"

    goto :goto_0

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private turnOffCTARadioIfNecessary()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mSimInsertedStatus:[I

    aget v1, v1, v0

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "turn off phone "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " radio because we are no longer in CTA mode"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public forceSetRadioPower(ZI)V
    .locals 1
    .param p1, "power"    # Z
    .param p2, "phoneId"    # I

    .prologue
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->setRadioPower(ZI)V

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "iccId":Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->refreshIccIdPreference(ZLjava/lang/String;)V

    return-void
.end method

.method public notifyAirplaneModeChange(Z)V
    .locals 4
    .param p1, "enabled"    # Z

    .prologue
    iget-boolean v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-ne p1, v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "enabled = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mAirplaneMode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "is not expected (the same)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    iput-boolean p1, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Airplane mode changed:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const-string v2, "Airplane mode changed: turn on/off all radio"

    invoke-static {v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    if-eqz p1, :cond_2

    const/4 v1, 0x0

    .local v1, "radioPower":Z
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v1, v0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->setRadioPower(ZI)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "radioPower":Z
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public notifyMSimModeChange(I)V
    .locals 7
    .param p1, "mode"    # I

    .prologue
    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MSIM mode changed, mode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v5, -0x1

    if-ne p1, v5, :cond_1

    const-string v4, "Invalid mode, MSIM_MODE intent has no extra value"

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/meizu/MzRadioManager;->isMSimModeSupport()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-boolean v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-ne v5, v4, :cond_3

    :cond_2
    const-string v4, "Airplane mode on or MSIM Mode option is closed, do nothing!"

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .local v2, "phoneId":I
    const/4 v0, 0x1

    .local v0, "iccIdReady":Z
    const/4 v2, 0x0

    :goto_1
    iget v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-ge v2, v5, :cond_4

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->isIccIdReady(I)Z

    move-result v5

    if-nez v5, :cond_5

    const/4 v0, 0x0

    :cond_4
    if-nez v0, :cond_6

    const-string v4, "msim mode read iccid not ready, wait for 200ms"

    invoke-static {v4}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    new-instance v1, Lcom/android/internal/telephony/meizu/MzRadioManager$MSimModeChangeRunnable;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/telephony/meizu/MzRadioManager$MSimModeChangeRunnable;-><init>(Lcom/android/internal/telephony/meizu/MzRadioManager;I)V

    .local v1, "notifyMSimModeChangeRunnable":Lcom/android/internal/telephony/meizu/MzRadioManager$MSimModeChangeRunnable;
    const-wide/16 v4, 0xc8

    invoke-virtual {p0, v1, v4, v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .end local v1    # "notifyMSimModeChangeRunnable":Lcom/android/internal/telephony/meizu/MzRadioManager$MSimModeChangeRunnable;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    const/4 v2, 0x0

    :goto_2
    iget v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mPhoneCount:I

    if-ge v2, v5, :cond_0

    shl-int v5, v4, v2

    and-int/2addr v5, p1

    if-nez v5, :cond_7

    const/4 v3, 0x0

    .local v3, "singlePhonePower":Z
    :goto_3
    invoke-direct {p0, v2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->refreshIccIdPreference(ZLjava/lang/String;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Set Radio Power due to MSIM mode change, power: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", phoneId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5, v3}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v3    # "singlePhonePower":Z
    :cond_7
    move v3, v4

    goto :goto_3
.end method

.method public setRadioPower(ZI)V
    .locals 9
    .param p1, "power"    # Z
    .param p2, "phoneId"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "setRadioPower power = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " phone: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v8, "airplane_mode_on"

    invoke-static {v5, v8, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, "airplaneMode":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "airplaneMode: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    if-nez v0, :cond_0

    move v5, v6

    :goto_0
    iput-boolean v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    iget-boolean v5, p0, Lcom/android/internal/telephony/meizu/MzRadioManager;->mAirplaneMode:Z

    if-ne v5, v7, :cond_1

    const-string v5, "Set Radio Power under airplane mode, ignore"

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_0
    move v5, v7

    goto :goto_0

    :cond_1
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->isIccIdReady(I)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "RILD initialize not completed, wait for 200ms"

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    new-instance v4, Lcom/android/internal/telephony/meizu/MzRadioManager$RadioPowerRunnable;

    invoke-direct {v4, p0, p1, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager$RadioPowerRunnable;-><init>(Lcom/android/internal/telephony/meizu/MzRadioManager;ZI)V

    .local v4, "setRadioPowerRunnable":Lcom/android/internal/telephony/meizu/MzRadioManager$RadioPowerRunnable;
    const-wide/16 v6, 0xc8

    invoke-virtual {p0, v4, v6, v7}, Lcom/android/internal/telephony/meizu/MzRadioManager;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .end local v4    # "setRadioPowerRunnable":Lcom/android/internal/telephony/meizu/MzRadioManager$RadioPowerRunnable;
    :cond_2
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->setSimInsertedStatus(I)V

    move v3, p1

    .local v3, "radioPower":Z
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->readIccIdUsingPhoneId(I)Ljava/lang/String;

    move-result-object v1

    .local v1, "iccId":Ljava/lang/String;
    sget-object v5, Lcom/android/internal/telephony/meizu/MzRadioManager;->mIccidPreference:Landroid/content/SharedPreferences;

    invoke-interface {v5, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Adjust radio to off because once manually turned off, iccid: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " , phone: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v3, 0x0

    :cond_3
    invoke-direct {p0}, Lcom/android/internal/telephony/meizu/MzRadioManager;->checkForCTACase()Z

    move-result v2

    .local v2, "isCTACase":Z
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->getSimInsertedStatus(I)I

    move-result v5

    if-nez v5, :cond_5

    if-ne v2, v7, :cond_4

    const-string v5, "No SIM inserted, force to turn on phone 0"

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-static {v6}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5, v7}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto :goto_1

    :cond_4
    const-string v5, "No SIM inserted, turn Radio off!"

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-static {p2}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5, v3}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto :goto_1

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Trigger set Radio Power, power: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", phoneId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/meizu/MzRadioManager;->log(Ljava/lang/String;)V

    invoke-direct {p0, v3, p2}, Lcom/android/internal/telephony/meizu/MzRadioManager;->refreshSimSetting(ZI)V

    invoke-static {p2}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5, v3}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto/16 :goto_1
.end method
