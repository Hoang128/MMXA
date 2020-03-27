/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameters
atkSpriteTimeMax = 60;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
airHikeTimeMax = 1;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerZ);
sprDoubleJump = spr_ZDoubleJump;

//Initialize Sound FX
audio_group_load(grpZSounds);
scr_InitSoundPlayerHFromBase(obj_playerZ);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalZ;

//Initialize Inside Variables
atkSpriteTime = 0;
airHikeTime = 1;

//Debug
sprite_index=sprStand;