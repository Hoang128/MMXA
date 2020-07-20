/// @description Draw with palette

event_inherited();

scr_DrawPlayerSprite(obj_playerXUA);
if (gpu_get_blendmode() == bm_add)
	gpu_set_blendmode(bm_normal);