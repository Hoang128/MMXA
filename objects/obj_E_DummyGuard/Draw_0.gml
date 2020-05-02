/// @description Draw

draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_Ingame);
draw_set_color(c_black);
draw_text((bbox_right + bbox_left)/2, (bbox_top + bbox_bottom)/2, "My HP = " + string(hp));