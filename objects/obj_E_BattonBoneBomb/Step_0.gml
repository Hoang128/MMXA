/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
	{
		image_index = 0;
		if (instance_exists(core))
		{
			x = core.x;
			y = core.y + 13;
			image_xscale = core.image_xscale;
			depth = core.depth + 1;
		}
		else
		{
			hspd = 0;
			vspd = 0;
			state = 1;
		}
	}	break;
	
	case 1:
	{
		imgSpd = 0.5;
		scr_destroyObjOutOfCamera(self);
		if (place_meeting(x, y, obj_block))
			instance_destroy();
		if (destroy == 1)
			instance_destroy();
		if (place_meeting(x, y, obj_gameManager.playerCore))
		{
			if (destroy == 0)
				destroy = 1;
		}
		if (vspd < MAX_FALL_AIR)
		{
			vspd += GRAVITY_AIR;
		}
		else	
			vspd = MAX_FALL_AIR;
		x += hspd * DELTA_TIME;
		y += vspd * DELTA_TIME;
	}	break;
}