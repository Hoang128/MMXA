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
			if (self.y == obj_gameManager.playerCore.y)
				moveDir = 1;
			else
				moveDir = sign(obj_gameManager.playerCore.y - self.y);
		}
		state = 1;
	}	break;
	case 1:
	{
		if (!instance_exists(eChild))
		{
			if (sprite_index == spr_WiredCreeperLeftV)
			{
				var tempPair = instance_position(x - 124, y, obj_E_WireCreeperMovingV);
				if (tempPair != noone)
				{
					if (tempPair.state == 1)
					{
						pairWirer = tempPair;
						eChild = instance_create_depth(x - eY, y, depth - 1, obj_E_ElectricBeamV);
						eChild.image_xscale = 1;
					}
				}
			}
			else if (sprite_index == spr_WiredCreeperRightV)
			{
				var tempPair = instance_position(x + 124, y, obj_E_WireCreeperMovingV);
				if (tempPair != noone)
				{
					if (tempPair.state == 1)
					{
						pairWirer = tempPair;
						eChild = instance_create_depth(x + eY, y, depth - 1, obj_E_ElectricBeamV);
						eChild.image_xscale = -1;
					}
				}
			}
		}
		if (moveDir == 1)
		{
			if (collision_rectangle(x - 2, bbox_bottom, x + 2, bbox_bottom + 1, obj_wire, false, false))
			{
				vspd = moveSpd;
			}
			else
			{
				vspd = 0;
				while(collision_rectangle(x - 2, bbox_bottom, x + 2, bbox_bottom + 1, obj_wire, false, false))
					x++;
				state = 2;
			}
		}
		else if (moveDir == -1)
		{
			if (collision_rectangle(x - 2, bbox_top - 1, x + 2, bbox_top, obj_wire, false, false))
			{
				vspd = -moveSpd;
			}
			else
			{
				vspd = 0;
				while(collision_rectangle(x - 2, bbox_top - 1, x + 2, bbox_top, obj_wire, false, false))
					x--;
				state = 2;
			}
		}
	}	break;
	case 2:
	{
		pairWirer = noone;
		if (sprite_index == spr_WiredCreeperLeftV)
		{
			sprite_index = spr_WiredCreeperChangeDirRightV;
		}
		if (sprite_index == spr_WiredCreeperRightV)
		{
			sprite_index = spr_WiredCreeperChangeDirLeftV;
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
	eChild.y = self.y;