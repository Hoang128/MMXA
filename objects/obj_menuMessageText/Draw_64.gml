/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font);

draw_text(0, 0, string(charCursor));
draw_text(0, 16, string(charCursorMax));

if (background != noone)
{
	draw_set_alpha(backgroundAlpha);
	draw_rectangle_color(x, y, x + width, y + height, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
}

if (bustShotImg != noone)
{
	draw_sprite_ext(bustShotImg, 0, x + bustShotX, y + bustShotY, bustShotXScale, bustShotYScale, 0, c_white, 1);
}

if (phase == 1)
{
	if (shadow == 1)
	{
		draw_set_color(c_black);
		draw_text_ext(x + shadowDistance + xStartSpace, y + shadowDistance + yStartSpace, messageIndex, lineSpace, lineW);
	}
	draw_set_color(c_white);
	draw_text_ext(x + xStartSpace, y + yStartSpace, messageIndex, lineSpace, lineW);
}
