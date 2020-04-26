/// @description Init

// Inherit the parent event****************************************************************************************************************************************
event_inherited();

//Initialize Parameters********************************************************************************************************************************************
hp = global.hp[1];
wp = global.wp[1];
atkSpriteTimeMax = 60;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
airHikeTimeMax = 1;
slashWaitTime = 2;
canChargeTimmerMax = 2;

chargeFormLv1Limit = 30;
chargeFormLv2Limit = 60;
chargeFormLv3Limit = 90;

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
canCharge = 0;
canChargeTimmer = 0;
chargeForm = 0;

//Sound Beam-down
audio_play_sound_on(global.SFX_Emitter, sndBeamDown, 0, 0);