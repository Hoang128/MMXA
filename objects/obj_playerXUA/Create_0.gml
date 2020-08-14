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
yDistanceToWirer = 44;
objWire = obj_XWirer;
UN_DashKeyEnable = true;
maxDashUpTime = 32;
dashUpSpdPhase1 = 0.5;
dashUpSpdPhase2 = 5;
hoverTimeMax = 120;
hoverMoveSpd = 2;
canHover = 1;
ArmorPointMax = 1;
coolDownAPTimeMax = 120;
coolDownSpdSlow = 1;
coolDownSpdNormal = 2;
canUseArmorPoint = true;
novaTimeMax = 25;
novaStrikeStartVspd = -2.4;
novaStrikeStartHspd = 2.4;
novaStrikeSpd = 9;
novaStrikeEndHspd = 1;
novaStrikeEndVspd = 1;
chargeWeapon = 0;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerXUA);

//Initialize Sound FX
audio_group_load(grpXSounds);
scr_InitSoundPlayerHFromBase(obj_playerXUA);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalXUA;

//Initialize states
scr_InitStatePlayer(weight);

//Initialize Inside Variables
currentWeapon = 0;
atkSpriteTime = 0;
inShotFrame = false;
busterOnRow = 0;
resetBusterOnRowMax = 0;
hoverTime = 0;
ArmorPoint = 1;
coolDownAPTime = 0;
coolDownSpd = coolDownSpdNormal;
novaTime = 0;
impactAtkTime = 0;