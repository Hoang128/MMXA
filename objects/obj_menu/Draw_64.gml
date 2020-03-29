/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font);

if ((visibleWhenDeactivate) || ((active) && (!visibleWhenDeactivate)))
{
	if (background != noone)
	{
		draw_set_alpha(backgroundAlpha);
		draw_rectangle_color(x, y, x + width, y + height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
		draw_set_alpha(1);
	}

	
	if (shadow == 1)
	{
		draw_set_color(c_black);
		draw_text(x + shadowDistance + xStartSpace, y + shadowDistance + yStartSpace, lineContext[0]);
	}
	draw_set_color(c_white);
	draw_text(x + xStartSpace, y + yStartSpace, lineContext[0]);

	for(var i = 1; i <= lineNumber; i++)
	{
		if (shadow == 1)
		{
			draw_set_color(c_black);
			draw_text(x + shadowDistance + xStartSpace, y + shadowDistance + yStartSpace + i * lineSpace, lineContext[i]);
		}
		draw_set_color(c_white);
		if (cursor == i) draw_set_color(c_yellow);
		if (lineEnable[i] == false) draw_set_color(c_gray);
		draw_text(x + xStartSpace, y + yStartSpace + i * lineSpace, lineContext[i]);
	}
}