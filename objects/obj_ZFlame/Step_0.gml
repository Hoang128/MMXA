/// @description Insert description here
// You can write your code in this editor

if (existTime > 0)
{
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
		var col1 = collision_rectangle(LLimit, bbox_bottom - 4, RLimit, bbox_bottom + 4, obj_block, false, false);
		var col2 = collision_rectangle(LLimit, bbox_bottom - 4, RLimit, bbox_bottom + 4, obj_dynamicBlock, false, false)
		if (col1)
		{
			instance_create_depth((LLimit + RLimit) / 2, col1.bbox_top, depth - 1, obj_WPFireEff);
		}
		else if (col2)
		{
			instance_create_depth((LLimit + RLimit) / 2, col2.bbox_top, depth - 1, obj_WPFireEff);
		}
		createObjTime = 0;
	}
	if (image_index >= 2)
		image_index = 0;
	if (place_meeting(x, y, obj_block))
		existTime = 0;
	existTime -= DELTA_TIME;
	
	x += hspd * image_xscale * DELTA_TIME;
}
else
{
	x += hspd * image_xscale * (6 - image_index) / 6;
}

