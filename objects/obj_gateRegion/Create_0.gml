/// @description Initialize
event_inherited();

sprite_index = spr_gateCommon;
block = instance_create_depth(bbox_left, bbox_top, depth + 1, obj_block);
block.image_xscale = 2;
block.image_yscale = 4;

waitTimeEnd = 0;
waitTimeEndMax = 30;

roomNew = noone;
xNew = 0;
yNew = 0;