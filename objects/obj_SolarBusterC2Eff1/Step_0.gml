/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ((core != noone) && instance_exists(core))
{
	x = core.x + xPlace * image_xscale;
	y = core.y;
	var LLimit = 0;
	var RLimit = 0;
	if (createObjTime < createObjTimeMax)
	{
		createObjTime += DELTA_TIME;
	}
	else
	{
		if (image_xscale == 1)
		{
			LLimit = bbox_right - 4;
			RLimit = bbox_right;
		}
		else
		{
			LLimit = bbox_left;
			RLimit = bbox_left + 4;
		}
		var col = collision_rectangle(LLimit, bbox_bottom - 4, RLimit, bbox_bottom + 4, obj_block, false, false);
		if (col)
		{
			instance_create_depth((LLimit + RLimit) / 2, col.bbox_top, depth - 1, obj_WPFireEff);
		}
		createObjTime = 0;
	}
}
else
	instance_destroy();