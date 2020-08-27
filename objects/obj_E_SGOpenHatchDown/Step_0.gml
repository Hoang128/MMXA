/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (instance_exists(core))
{
	depth = core.depth - 1;
	image_xscale = core.image_xscale;
	if (open == 0)
	{
		if (timeWait > 0)
		{
			if (timeWait < timeWaitMax/2)
			{
				if (createBullet == true)
				{
					var objBullet = instance_create_depth(x + 8*image_xscale, y - 12, depth - 1, obj_E_SparkGunnerBullet);
					objBullet.yDir = 1;
					objBullet.image_xscale = image_xscale;
					createBullet = false;
				}
			}
			imgSpd = 0;
			timeWait -= DELTA_TIME;
		}
		else
		{
			imgSpd = -imgSpdAnim;
			if (image_index < 1)
				instance_destroy();
		}
	}
}
else	instance_destroy();