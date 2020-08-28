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
			if (self.x == obj_gameManager.playerCore.x)
				moveDir = 1;
			else
				moveDir = sign(obj_gameManager.playerCore.x - self.x);
		}
		state = 1;
	}	break;
	case 1:
	{
		if (!instance_exists(eChild))
		{
			if (sprite_index == spr_WiredCreeperDown)
			{
				if (position_meeting(x, y + 124, obj_E_WireCreeperMoving))
				{
					var tempPair = instance_position(x, y + 124, obj_E_WireCreeperMoving);
					if (tempPair.state == 1)
					{
						pairWirer = tempPair;
						eChild = instance_create_depth(x, y + eY, depth - 1, obj_E_ElectricBeam);
						eChild.image_yscale = 1;
					}
				}
			}
			else if (sprite_index == spr_WiredCreeperUp)
			{
				if (position_meeting(x, y - 124, obj_E_WireCreeperMoving))
				{
					var tempPair = instance_position(x, y - 124, obj_E_WireCreeperMoving);
					if (tempPair.state == 1)
					{
						pairWirer = tempPair;
						eChild = instance_create_depth(x, y - eY, depth - 1, obj_E_ElectricBeam);
						eChild.image_yscale = -1;
					}
				}
			}
		}
		if (moveDir == 1)
		{
			if (collision_rectangle(bbox_right, y - 2, bbox_right + 1, y + 2, obj_wire, false, false))
			{
				hspd = moveSpd;
			}
			else
			{
				hspd = 0;
				while(collision_rectangle(bbox_right, y - 2, bbox_right + 1, y + 2, obj_wire, false, false))
					x++;
				state = 2;
			}
		}
		else if (moveDir == -1)
		{
			if (collision_rectangle(bbox_left - 1, y - 2, bbox_left, y + 2, obj_wire, false, false))
			{
				hspd = -moveSpd;
			}
			else
			{
				hspd = 0;
				while(collision_rectangle(bbox_left - 1, y - 2, bbox_left, y + 2, obj_wire, false, false))
					x--;
				state = 2;
			}
		}
	}	break;
	case 2:
	{
		pairWirer = noone;
		if (sprite_index == spr_WiredCreeperDown)
		{
			sprite_index = spr_WiredCreeperChangeDirUp;
		}
		if (sprite_index == spr_WiredCreeperUp)
		{
			sprite_index = spr_WiredCreeperChangeDirDown;
		}
		image_index = 0;
		moveDir *= -1;
		if (instance_exists(eChild))
			instance_destroy(eChild);
		state = 3;
	}	break;
	case 4:
	{
		
		state = 5;
	}	break;
	case 5:
	{
		if (waitTime < waitTimeMax)
			waitTime += DELTA_TIME;
		else
		{
			state = 1;
			waitTime = 0;
		}
	}
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;

if (instance_exists(eChild))
	eChild.x = self.x;