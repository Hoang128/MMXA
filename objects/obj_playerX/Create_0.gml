/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Initialize Parameters
atkSpriteTimeMax = 60;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerX);

//Initialize Sound FX
audio_group_load(grpXSounds);
scr_InitSoundPlayerHFromBase(obj_playerX);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalX;

//Initialize Inside Variables
atkSpriteTime = 0;

//Debug
sprite_index=sprStand;