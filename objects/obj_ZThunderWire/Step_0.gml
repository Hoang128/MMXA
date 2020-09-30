/// @description Insert description here
// You can write your code in this editor

scr_destroyObjOutOfCamera(self);

if (collision_rectangle(bbox_left, y - 1, bbox_right, y + 1, obj_block, false, false))
{
	freeZone.x1 = 0;
	freeZone.x2 = 0;
	while (collision_rectangle(bbox_left + freeZone.x1, y - 1, (bbox_left + bbox_right) / 2, y + 1, obj_block, false, false))
	{
		freeZone.x1++;
		if (bbox_left + freeZone.x1 >= bbox_right)
			break;
	}
	
	while (collision_rectangle((bbox_left + bbox_right) / 2, y - 1, bbox_right - freeZone.x2, y + 1, obj_block, false, false))
	{
		freeZone.x2++;
		if (bbox_right - freeZone.x2 <= bbox_left)
			break;
	}
}

if (((bbox_right - freeZone.x2) - (bbox_left + freeZone.x1)) <= 0)
	instance_destroy();
else
{
	if (freeZone.x1 > 0)
	{
		if (canCreateFlare > 0)
		{
			canCreateFlare -= DELTA_TIME;
		}
		else
		{
			instance_create_depth(bbox_left + freeZone.x1, y, depth - 1, obj_flareSmall);
			canCreateFlare = canCreateFlareMax;
		}
	}
	
	if (freeZone.x2 > 0)
	{
		if (canCreateFlare > 0)
		{
			canCreateFlare -= DELTA_TIME;
		}
		else
		{
			instance_create_depth(bbox_right - freeZone.x2, y, depth - 1, obj_flareSmall);
			canCreateFlare = canCreateFlareMax;
		}
	}
}

x += hspd * dir * DELTA_TIME;