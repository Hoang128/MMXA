/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	init
state 1:	fall down
state 2:	turn back
state 3:	move
state 4:	wait
*/

switch (state)
{
	case 0:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		
		hspd = 0;
		vspd = moveSpd;
		state = 1;
	}	break;
	case 1:
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			sprite_index = spr_redBeetleTurnBack;
			image_index = 1;
			
			hspd = 0;
			vspd = 0;
			state = 2;
		}
	}	break;
	case 3:
	{
		if (image_xscale == 1)
		{
			if (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_block, false, false)
			|| !collision_rectangle(bbox_right, bbox_bottom, bbox_right + 1, bbox_bottom + 1, obj_block, false, false))
			{
				sprite_index = spr_redBeetleTurnBack;
				image_index = 0;
			
				hspd = 0;
				vspd = 0;
				state = 2;
			}
		}
	
		if (image_xscale == -1)
		{
			if (collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_block, false, false)
			|| !collision_rectangle(bbox_left - 1, bbox_bottom, bbox_left, bbox_bottom + 1, obj_block, false, false))
			{
				sprite_index = spr_redBeetleTurnBack;
				image_index = 0;
			
				hspd = 0;
				vspd = 0;
				state = 2;
			}
		}
	}	break;
}