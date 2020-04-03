/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_font(fnt_Ingame);
draw_set_color(c_black);
draw_text(x, y + 00, "create dmg time = " + string(createDamageTime));
draw_text(x, y + 16, "timmer = " + string(timmer));