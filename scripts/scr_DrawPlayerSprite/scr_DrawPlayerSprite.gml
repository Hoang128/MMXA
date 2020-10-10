function scr_DrawPlayerSprite(argument0) {
	var alpha = 0.8;
	var object = argument0;
	if (blink > blinkMax / 2)
		gpu_set_blendmode(bm_add);
	switch (object.object_index)
	{
		case obj_playerX:
		case obj_playerEclipseX:
		{
			scr_PalSwapSet(myPal, currentWeapon, false);

			draw_self();
			
			if (gpu_get_blendmode() == bm_add)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
			
			scr_PalSwapReset();
		}	break;
		case obj_playerXUA:
		{
			scr_PalSwapSet(myPal, currentWeapon, false);

			draw_self();
			
			if (gpu_get_blendmode() == bm_add)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);

			scr_PalSwapReset();
		}	break;
		case obj_playerZ:
		{
			scr_PalSwapSet(myPal, 0, false);

			draw_self();
			
			if (gpu_get_blendmode() == bm_add)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);

			scr_PalSwapReset();
		}	break;
	}
	
	if (gpu_get_blendmode() != bm_normal)
		gpu_set_blendmode(bm_normal);
}