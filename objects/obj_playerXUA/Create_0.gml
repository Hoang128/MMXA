/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameters
weight = WeighType.MEDIUM;
hp = global.hpMax[0];
wp = global.wpMax[0];
atkSpriteTimeMax = 20;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
chargeLv1Limit = 30; //Time hold attack button to show lv1 charge effect
chargeLv2Limit = 100; //Time hold attack button to show lv2 charge effect
busterOnRowMax = 3;
waitShotNormal = 3;
waitShotLong = 15;
waitShotMax = 30;
waitShot = 0;
yDistanceToWirer = 44;
objWire = obj_XWirer;
UN_DashKeyEnable = true;
maxDashUpTime = 32;
dashUpSpdPhase1 = 0.5;
dashUpSpdPhase2 = 5;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerXUA);

//Initialize Sound FX
audio_group_load(grpXSounds);
scr_InitSoundPlayerHFromBase(obj_playerXUA);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalX;

//Initialize states
scr_InitStatePlayer(weight);

//Initialize Inside Variables
atkSpriteTime = 0;
inShotFrame = false;
busterOnRow = 0;
resetBusterOnRowMax = 0;