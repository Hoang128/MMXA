/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
	{
		if (place_meeting(x + 4, y, obj_block))
			image_xscale = -1;
		else if (place_meeting(x - 4, y, obj_block))
			image_xscale = 1;
		else
		{
			if (instance_exists(obj_gameManager.playerCore))
			{
				if ((self.x - obj_gameManager.playerCore.x) == 0)
					image_xscale = 1;
				else
					image_xscale = -1;
			}
			
		}
		
		state = 1;
	}	break;
	case 1:
	{
		if (instance_exists(objHatchOpen))
		{
			instance_destroy(objHatchOpen);
			objHatchOpen = 0;
		}
		if (!instance_exists(leg1))
		{
			leg1 = instance_create_depth(x, y, depth - 3, obj_E_SGLeg1);
			leg1.core = self;
		}
		if (!instance_exists(leg2))
		{
			leg2 = instance_create_depth(x, y, depth + 1, obj_E_SGLeg2);
			leg2.core = self;
		}
		if (waitTime < waitTimeMax)
		{
			waitTime += DELTA_TIME;
		}
		else
		{
			state = 2;
			waitTime = 0;
		}
	}	break;
	case 2:
	{
		openSide *= -1;
		if (openSide == 1)
		{
			objHatchOpen = instance_create_depth(x, y, depth - 1, obj_E_SGOpenHatchUp);
		}
		else if (openSide == -1)
		{
			objHatchOpen = instance_create_depth(x, y, depth - 1, obj_E_SGOpenHatchDown);
		}
		objHatchOpen.core = self;
		guard = 0;
		state = 3;
	}	break;
	case 3:
	{
		if (!instance_exists(objHatchOpen))
		{
			guard = 1;
			state = 1;
		}
	}	break;
}