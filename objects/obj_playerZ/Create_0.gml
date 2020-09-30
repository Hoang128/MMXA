
/// @description Init

// Inherit the parent event****************************************************************************************************************************************
event_inherited();

//Initialize Parameters********************************************************************************************************************************************
weight = WeighType.MEDIUM;
global.currentPlayer = 1;

atkSpriteTimeMax = 60;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
airHikeTimeMax = 1;
slashWaitTime = 2;
canChargeTimmerMax = 2;
yDistanceToWirer = 58;
objWire = obj_ZWirer;
gainWpPerSlash = 1;
charNum = 1;
vspdThrustDown = 4;

//Earth Gaizer
earthGaizerChargeMax = 60;
earthGaizerCost = 8;

//Buster Core
chargeCoreLv1Limit = 40;
chargeCoreLv2Limit = 90;
chargeCoreLv3Limit = 140;

cBusterCost = 4;
cBusterBarrage1Cost = 8;
cBusterBarrage2Cost = 16;

//Initialize parents sprites***************************************************************************************************************************************
scr_InitSpritePlayerHFormBase(obj_playerZ);


//Initialize parents Sound FX**************************************************************************************************************************************
audio_group_load(grpZSounds);
scr_InitSoundPlayerHFromBase(obj_playerZ);

//Initialize shader************************************************************************************************************************************************
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalZ;

//Initialize states************************************************************************************************************************************************
scr_InitStatePlayer(weight);

//Initialize Inside Variables**************************************************************************************************************************************
atkSpriteTime = 0;
airHikeTime = 1;
standCombo = 0;
canSlash = 1;
busterType = noone;
chargeCore = 0;
chargeCoreLv = 0;
earthGaizerChargeTime = 0;
earthGaizerCreateBullets = 0;
canCreateThunderDiveWire = true;

USlashEnable = true;
DSlashEnable = true;
FSlashEnable = false;
ThrustEnable = false;

cmdUSlashFlag = false;
cmdDSlashFlag = false;
cmdFSlashFlag = false;
cmdThrustFlag = false;

//Skill variable
upperSlashHspd = 2;
upperSlashTimeH1R = 0.6;
upperSlashVspd1Start = -8;
upperSlashVspd2Start = -2;
upperSlashTimeV1R = 0.4;
upperSlashTimeV2R = 0.4;
upperSlashTimeMax = 40;
upperSlashTime = 0;
playSFXUpperSlash = false;