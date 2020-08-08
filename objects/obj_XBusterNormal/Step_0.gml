/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd = moveSpd * image_xscale;

x += hspd * DELTA_TIME;
if place_meeting(x, y, obj_block) 
{
	var xPlace = x + image_xscale * (bbox_right - bbox_left) / 2;
	var colWallObj = instance_create_depth(xPlace , y, depth - 1, collisionEff);
	colWallObj.image_xscale = image_xscale;
	colWallObj.from = self.object_index;
	colWallObj.myPalette = spr_PalBusterColEff;
	instance_destroy();
}