/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameters
weight = WeighType.MEDIUM;
hpMax = global.hpMax[0];
hp = hpMax;
wpMax = global.wpMax[0];
wp = wpMax;
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
waitShotSpecial = 0;
waitShotSpecialSet = 0;
yDistanceToWirer = 44;
objWire = obj_XWirer;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerX);

//Initialize Sound FX
audio_group_load(grpXSounds);
scr_InitSoundPlayerHFromBase(obj_playerX);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalX;

//Initialize states
scr_InitStatePlayer(weight);

//Initialize Inside Variables
currentWeapon = 0;
atkSpriteTime = 0;
inShotFrame = false;
busterOnRow = 0;
resetBusterOnRowMax = 0;
chargeWeapon = 0;