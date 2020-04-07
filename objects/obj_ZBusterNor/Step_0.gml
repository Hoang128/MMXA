/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd = moveSpd * image_xscale;

if (flyTime > 0)
{
	x += hspd * DELTA_TIME;
	if place_meeting(x, y, obj_block) 
	{
		var xPlace = x + image_xscale * (bbox_right - bbox_left) / 2;
		var colWallObj = instance_create_depth(xPlace , y, depth - 1, obj_ZBusterColEffLv1);
		colWallObj.image_xscale = image_xscale;
		instance_destroy();
	}
	flyTime -= DELTA_TIME;
}
else
{
	createEff = true;
	instance_destroy();
}