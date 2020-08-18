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
		
		state = 3;
	}	break;
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;