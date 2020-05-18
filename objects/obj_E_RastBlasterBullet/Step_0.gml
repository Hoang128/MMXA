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
		var xx = (obj_gameManager.playerCore.bbox_right + obj_gameManager.playerCore.bbox_left) / 2;
		var yy = (obj_gameManager.playerCore.bbox_bottom + obj_gameManager.playerCore.bbox_top) / 2;
		direction = point_direction(self.x, self.y, xx, yy);
	}
	else
	{
		direction = 90 - 90 * image_xscale;
	}
	init = true;
}

motion_set(direction, moveSpd * DELTA_TIME);