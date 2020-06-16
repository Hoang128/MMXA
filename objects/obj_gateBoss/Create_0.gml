/// @description Initialize
event_inherited();

block = instance_create_depth(bbox_left, bbox_top, depth + 1, obj_block);
block.image_xscale = 2;
block.image_yscale = 4;

