/// @description Draw

if (visible == true)
{
	draw_set_font(font);
	if (shadow == 1)
	{
		if ((active == 1 && effectTime >= 15) || (active == 0))
		{
			draw_set_color(c_black)
			draw_text(core.x + 640 + shadowDistance, core.y + (keyId + 2 - core.lineVisibleTop) * lineSpace + yStartSpace + 4 + shadowDistance, scr_keyToString(keyCode));
		}
	}
	if (active == 0)
	{
		draw_set_color(c_white);
		draw_text(core.x + 640, core.y + (keyId + 2 - core.lineVisibleTop) * lineSpace + yStartSpace + 4, scr_keyToString(keyCode));
	}
	if (active == 1)
	{
		if (effectTime >= 15)
		{
			draw_set_color(c_yellow);
			draw_text(core.x + 640, core.y + (keyId + 2 - core.lineVisibleTop) * lineSpace + yStartSpace + 4, scr_keyToString(keyCode));
		}
	}
}