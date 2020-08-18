/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if ((self.y - obj_gameManager.playerCore.y) < 0)
				state = 1;
			else
			{
				if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
				{
					state = 1;	
				}
			}
		}
		else	state = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x == obj_gameManager.playerCore.x)
				image_xscale = 1;
			else
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			
			if (distance_to_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace) > moveSpd1)
				move_towards_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace, moveSpd1);
			else
			{
				sprite_index = spr_BBoneB81DropBomb;
				image_index = 0;
				state = 2;
			}
		}
		else
		{
			sprite_index = spr_BBoneB81DropBomb;
			image_index = 0;
			
			state = 2;
		}
	}	break;
	
	case 3:
	{
		if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
		{
			explosion = 0;
			instance_destroy();
		}
	}	break;
}