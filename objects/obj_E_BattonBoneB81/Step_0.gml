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
			if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
			{
				state = 0.5;	
			}
		}
		else	state = 0.5;
	}	break;
	
	case 0.5:
	{
		if (haveBomb == true)
		{
			bomb = instance_create_depth(x, y + 13, depth + 1, obj_E_BattonBoneBomb);
			bomb.core = self;
			bomb.image_xscale = image_xscale;
		}
		state = 1;
	}
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x == obj_gameManager.playerCore.x)
				image_xscale = 1;
			else
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			if (haveBomb == true)
			{
				if (instance_exists(bomb))
				{
					if ((distance_to_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace) < moveSpd1)
					||	((abs(self. x - obj_gameManager.playerCore.x) < moveSpd1) && (object_index == obj_E_BattonBoneB81)))
					{
						sprite_index = spr_BBoneB81DropBomb;
						image_index = 0;
						state = 2;
					}
					else
					{
						move_towards_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace, moveSpd1 * DELTA_TIME);	
					}
				}
				else
				{
					sprite_index = spr_BBoneB81DropBomb;
					image_index = 0;
			
					state = 2;
				}
			}
			else
			{
				if ((distance_to_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace) < moveSpd1)
				||	((abs(self. x - obj_gameManager.playerCore.x) < moveSpd1) && (object_index == obj_E_BattonBoneB81)))
				{
					sprite_index = spr_BBoneB81DropBomb;
					image_index = 0;
					state = 2;
				}
				else
				{
					move_towards_point(obj_gameManager.playerCore.x, obj_gameManager.playerCore.bbox_top + yPlace, moveSpd1 * DELTA_TIME);	
				}
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
		motion_set(90 - 60 * image_xscale, moveSpd2 * DELTA_TIME);
		if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
		{
			explosion = 0;
			instance_destroy();
		}
	}	break;
}