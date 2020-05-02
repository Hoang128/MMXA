/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: falling
2: run
3: jump
4: guard
5.1 - 5.2: trans from air to ground - or from ground to air
6.1 - 6.2: trans from normal to guard - or from guard to normal
*/

if (timeToNextGuard < timeToNextGuardMax)
{
	timeToNextGuard += DELTA_TIME;
}
else	timeToNextGuard = timeToNextGuardMax;

if (state == 0)
{
	if (place_meeting(x, y + 1, obj_block))
	{
		sprite_index = spr_metoolRun;
		image_index = 0;
		state = 2;
	}
	else
	{
		sprite_index = spr_metoolFalling;
		image_index = 0;
		state = 1;
	}
}

if (state == 1)
{
	if (place_meeting(x, y + 1, obj_block))
	{
		sprite_index = spr_metoolTrans;
		image_index = 0;
		state = 5.1;
	}
}



if (state == 2)
{
	if (!collision_rectangle(x + abs(bbox_right - bbox_left) / 2 * image_xscale, y, x + (abs(bbox_right - bbox_left) / 2 + 1) * image_xscale, y + 1, obj_block, false, false))
	{
		image_xscale *= -1;
		hspd = image_xscale * moveSpd;
	}
	
	if (image_xscale == 1)
	{
		if (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_block, false, false))
		{
			image_xscale = -1;
			hspd = -1 * moveSpd;
		}
	}
	
	if (image_xscale == -1)
	{
		if (collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_block, false, false))
		{
			image_xscale = 1;
			hspd = 1 * moveSpd;
		}
	}
	
	if (instance_exists(obj_PlayerWeapon) && distance_to_object(instance_nearest(x, y, obj_PlayerWeapon)) < 60)
	{
		if (timeToNextGuard == timeToNextGuardMax)
		{
			sprite_index = spr_metoolDown;
			image_index = 0;
			hspd = 0;
			state = 6.1;
		}
	}
}

if (state == 4)
{
	if (guardTime < guardTimeMax)
		guardTime += DELTA_TIME;
	else
	{
		sprite_index = spr_metoolUp;
		image_index = 0;
		guardTime = 0;
		guard = 0;
		state = 6.2;
	}
}