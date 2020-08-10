/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd = moveSpd * image_xscale;

x += hspd * DELTA_TIME;
var meetWallLeft = collision_rectangle(bbox_left, (bbox_top + (bbox_bottom + bbox_top) / 2) / 2, bbox_left - 1, (bbox_bottom + (bbox_top + bbox_bottom) / 2) / 2, obj_block, false , true);
var meetWallRight = collision_rectangle(bbox_right, (bbox_top + (bbox_bottom + bbox_top) / 2) / 2, bbox_right + 1, (bbox_bottom + (bbox_top + bbox_bottom) / 2) / 2, obj_block, false , true);
if (image_xscale == 1 && meetWallRight) || (image_xscale == -1 && meetWallLeft)
{
	var xPlace = x + image_xscale * (bbox_right - bbox_left) / 2;
	var colWallObj = instance_create_depth(xPlace , y, depth - 1, collisionEff);
	colWallObj.image_xscale = image_xscale;
	colWallObj.from = self.object_index;
	instance_destroy();
}