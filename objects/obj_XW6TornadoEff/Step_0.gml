/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (init == false)
{
	var objWindOuter = instance_create_depth(x, y, obj_gameManager.playerCore - 100, obj_XW6TornadoOuterEff);
	objWindOuter.image_xscale = image_xscale;
	objWindOuter.image_yscale = image_yscale;
	objWindOuter.image_angle = image_angle;
	objWindOuter.core = self;
	init = true;
}
else
{
	scr_destroyObjOutOfCamera(self);

	image_xscale += sign(image_xscale) * sizeIncSpd * DELTA_TIME;
	image_yscale += sign(image_yscale) * sizeIncSpd * DELTA_TIME;

	if (sprite_index == spr_XW6WindEff)
	{
		if (time < existTime)
		{
			time += DELTA_TIME;
		}
		else
		{
			sprite_index = spr_XW6WindEffEnd;
			image_index = 0;
		}
	}
}