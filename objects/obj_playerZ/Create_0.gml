/// @description Init

// Inherit the parent event****************************************************************************************************************************************
event_inherited();

//Initialize Parameters********************************************************************************************************************************************
weight = WeighType.MEDIUM;
hpMax = global.hpMax[1];
hp = hpMax;
wpMax = global.wpMax[1];
wp = wpMax;
atkSpriteTimeMax = 60;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
airHikeTimeMax = 1;
slashWaitTime = 2;
canChargeTimmerMax = 2;
yDistanceToWirer = 58;
objWire = obj_ZWirer;

chargeCoreLv1Limit = 40;
chargeCoreLv2Limit = 90;
chargeCoreLv3Limit = 140;
chargeCoreLvLimit = 3;

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