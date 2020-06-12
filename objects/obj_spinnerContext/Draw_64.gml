/// @description Draw

draw_set_halign(fa_center);
draw_set_valign(fa_top);
if (active)
{
	draw_set_color(c_yellow);
	draw_triangle(x - triangleSpace, y, x - triangleSpace, y + triangleHeight, x - triangleSpace - triangleWidth, y + triangleHeight / 2, 0);
	draw_triangle(x + triangleSpace, y, x + triangleSpace, y + triangleHeight, x + triangleSpace + triangleWidth, y + triangleHeight / 2, 0);
	draw_text(x, y, string(context[cursor]));
}
else
{
	if (enable)	draw_set_color(c_white);
	else		draw_set_color(c_gray);
	draw_text(x, y, string(context[cursor]));
}