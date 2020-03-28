/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fontDebug);

draw_rectangle_color(x, y, x + width, y + height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);

for(var i = 0; i <= lineNumber; i++)
{
	draw_set_color(c_gray);
	if (cursor == i) draw_set_color(c_white);
	draw_text(x + xStartSpace, y + yStartSpace + i * lineSpace, lineContext[i]);
}