/// @description Draw

draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (active)
{
	draw_set_color(c_yellow);
	draw_triangle(x - triangleSpace, y, x - triangleWidth, y + triangleHeight / 2, x - triangleSpace , y + triangleHeight , 0);
	draw_triangle(x + triangleSpace, y, x + triangleSpace, y + triangleHeight, x + triangleWidth, y + triangleHeight / 2, 0);
	draw_text(x, y, string(valDisplay));
}
else
{
	draw_set_color(c_white);
	draw_text(x, y, string(valDisplay));
}