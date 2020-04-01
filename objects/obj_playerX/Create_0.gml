/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameters
atkSpriteTimeMax = 60;
xPlaceDashEff = -25;
yPlaceDashEff = -4;

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
atkSpriteTime = 0;