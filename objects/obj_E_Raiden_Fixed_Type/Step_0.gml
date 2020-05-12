/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	/*
	state 0:	Init
	state 1:	Idle
	state 2:	Slash
	state 3:
	*/
	case 0:
	{
		sprite_index = spr_Raiden;
		image_index = 0;
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		state = 1;
	}	break;
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
			if (idleTime < idleTimeMax)
			{
				idleTime += DELTA_TIME;
			}
			else
			{
				if (distance_to_object(obj_gameManager.playerCore) < minDistanceToAttack)
				{
					sprite_index = spr_RaidenSlash1;
					image_index = 0;
					
					idleTime = 0;
					state = 2;
				}
				else
				{
					idleTime = 0;
				}
			}
		}
	}	break;
	case 2:
	{
		if (sprite_index == spr_RaidenSlash2)
		{
			if (slashTime < slashTimeMax)
			{
				slashTime += DELTA_TIME;
			}
			else
			{
				sprite_index = spr_Raiden;
				image_index = 0;
				
				instance_destroy(slasher);
				slasher = noone;
				slashTime = 0;
				state = 1;
			}
		}
	}	break;
}