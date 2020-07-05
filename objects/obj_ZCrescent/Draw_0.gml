/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

scr_PalSwapSet(myPalette, pal, false);

event_inherited();

scr_PalSwapReset();

collisionEff = obj_flareSlash;
collisionSFX = snd_MWeaponColEnemyEff;