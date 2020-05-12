/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	init
state 1:	idle
state 2:	attack
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_cyberTriangle;
		image_index = 0;
		
		state = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (idleTime < idleTimeMax)
			{
				idleTime += DELTA_TIME;
			}
			else
			{
				if (distance_to_object(obj_gameManager.playerCore) < minDistanceToAttack)
				{
					sprite_index = spr_cyberTriangleMove;
					
					var xPlayerPlace = (obj_gameManager.playerCore.bbox_left + obj_gameManager.playerCore.bbox_right) / 2;
					var yPlayerPlace = (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2;
					xPlace = x + (xPlayerPlace - x) * moveRatio;
					yPlace = y + (yPlayerPlace - y) * moveRatio;
					direction = point_direction(x, y, xPlace, yPlace);
					state = 2;
				}
				idleTime = 0;
			}
		}
	}	break;
	
	case 2:
	{
		if (distance_to_point(xPlace, yPlace) < moveSpd)
		{
			sprite_index = spr_cyberTriangle;
			
			motion_set(0, 0);
			x = xPlace;
			y = yPlace;
			state = 1;
		}
		else
			motion_set(direction, moveSpd * DELTA_TIME);
	}	break;
}