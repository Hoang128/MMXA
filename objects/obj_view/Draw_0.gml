/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_red);
draw_set_alpha(0.75);

draw_circle(x, y, 6, false);

draw_set_color(c_white);
draw_set_alpha(1);

draw_set_font(fnt_Ingame);
draw_text(x, y - 8, string(moveMode));
draw_text(x, y, string(xPlayer));
draw_text(x, y + 8, string(yPlayer));