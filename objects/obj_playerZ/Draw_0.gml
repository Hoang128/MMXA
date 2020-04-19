/// @description Draw with palette

event_inherited();

scr_DrawPlayerSprite(obj_playerZ);
if (gpu_get_blendmode() == bm_add)
	gpu_set_blendmode(bm_normal);
	
draw_set_alpha(0.5);
var colTopPart = false;
var colBotPart = false;
if (instance_exists(obj_water))
{
	colTopPart = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + (bbox_bottom - bbox_top) / 2, obj_water, false, false);
	colBotPart = collision_rectangle(bbox_left, bbox_top + (bbox_bottom - bbox_top) / 2 + 1, bbox_right, bbox_bottom, obj_water, false, false);
}

if (colTopPart) draw_set_color(c_blue);
else			draw_set_color(c_red);

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + (bbox_bottom - bbox_top) / 2, false);

if (colBotPart) draw_set_color(c_blue);
else			draw_set_color(c_red);

draw_rectangle(bbox_left, bbox_top + (bbox_bottom - bbox_top) / 2 + 1, bbox_right, bbox_bottom, false);
draw_set_alpha(1);