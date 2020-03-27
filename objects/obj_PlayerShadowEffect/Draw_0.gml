/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (myPalSprite != noone)
{
	if (core.object_index == obj_playerX)
	{
		scr_PalSwapSet(myPalSprite, 1, false);
	}
	
	if (core.object_index == obj_playerZ)
	{
		scr_PalSwapSet(myPalSprite, 3, false);
	}
}

gpu_set_blendmode(bm_add);
if (sprite_index != noone) draw_self();
gpu_set_blendmode(bm_normal);

if (myPalSprite != noone)
{
   scr_PalSwapReset();
}