/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_destroyObjOutOfCamera(self);

if (place_meeting(x, y, obj_block))
{
	createBulletEff = true;
	instance_destroy();
}

if (init == false)
{
	if (track == true)
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			var xx = (obj_gameManager.playerCore.bbox_right + obj_gameManager.playerCore.bbox_left) / 2;
			var yy = (obj_gameManager.playerCore.bbox_bottom + obj_gameManager.playerCore.bbox_top) / 2;
			var dir = point_direction(self.x, self.y, xx, yy);
			if ((dir < (direction + dirRange / 2)) && (dir > (direction - dirRange / 2)))
			{
				direction = dir;
			}
		}
	}
	init = true;
}

motion_set(direction, moveSpd * DELTA_TIME);