/// @description Initialize
event_inherited();

sprite_index = spr_gateCommon;
block = instance_create_depth(bbox_left, bbox_top, depth + 1, obj_block);
block.image_xscale = 2;
block.image_yscale = 4;

state = gateState.LOCKING;
phase = 0;
waitTimeOpenMax = 30;
waitTimeOpen = 0;
waitTimeEndMax = 30;
waitTimeEnd = 0;
imgSpd = 0;
sndEff = 0;

roomNew = noone;
xNew = 0;
yNew = 0;

lock = false;