/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerX);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalX;

//Debug
sprite_index=sprStand;