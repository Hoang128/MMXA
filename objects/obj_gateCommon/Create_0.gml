/// @description Initialize
event_inherited();

block = instance_create_depth(bbox_left, bbox_top, depth + 1, obj_block);
block.image_xscale = (bbox_right - bbox_left) * (block.bbox_right - block.bbox_left);
block.image_yscale = (bbox_bottom - bbox_top) * (block.bbox_bottom - block.bbox_top);

state = gateState.LOCKING;