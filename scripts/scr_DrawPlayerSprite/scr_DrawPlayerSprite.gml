function scr_DrawPlayerSprite(argument0) {
	var object = argument0;
	switch (object)
	{
		case obj_playerX:
		{
			scr_PalSwapSet(myPal, currentWeapon, false);

			draw_self();

			scr_PalSwapReset();
			break;
		}
		case obj_playerXUA:
		{
			scr_PalSwapSet(myPal, currentWeapon, false);

			draw_self();

			scr_PalSwapReset();
			break;
		}
		case obj_playerZ:
		{
			scr_PalSwapSet(myPal, 0, false);

			draw_self();

			scr_PalSwapReset();
			break;
		}
	}


}
