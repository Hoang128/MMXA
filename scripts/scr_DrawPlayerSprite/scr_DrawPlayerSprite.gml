var object = argument0;
switch (object)
{
	case obj_playerX:
	{
		scr_PalSwapSet(myPal, 0, false);

		draw_self();

		scr_PalSwapReset();
		break;
	}
	case obj_playerZ:
	{
		scr_PalSwapSet(myPal, 2, false);

		draw_self();

		scr_PalSwapReset();
		break;
	}
}