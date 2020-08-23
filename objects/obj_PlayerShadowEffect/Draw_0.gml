/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (instance_exists(core))
{
	if (myPalSprite != noone)
	{
		if ((core.object_index == obj_playerX) || (core.object_index == obj_playerEclipseX))
		{
			scr_PalSwapSet(myPalSprite, 1, false);
		}
	
		if (core.object_index == obj_playerXUA)
		{
			scr_PalSwapSet(myPalSprite, 1 ,false);
		}
	
		if (core.object_index == obj_playerZ)
		{
			scr_PalSwapSet(myPalSprite, 1, false);
		}
	}

	gpu_set_blendmode(bm_add);
	if (sprite_index != noone) draw_self();
	gpu_set_blendmode(bm_normal);

	if (myPalSprite != noone)
	{
	   scr_PalSwapReset();
	}
}