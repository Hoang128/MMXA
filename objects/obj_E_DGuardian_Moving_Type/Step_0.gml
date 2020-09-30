/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: idle move
2: trans direction
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_DGuardian;
		image_index = 0;
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		guardDir = 90 - image_xscale * 90;
		state = 1;
	}	break;
	
	case 1:
	{
		hspd = image_xscale * hMoveSpd;
		guardDir = 90 - image_xscale * 90;
		if (image_xscale == 1)
		{
			if (collision_rectangle(bbox_right, bbox_top, bbox_right + 20, bbox_bottom, obj_block, false, false))
			{
				hspd = 0;
				sprite_index = spr_DGuardianTurnBack;
				image_index = 0;
				state = 2;
			}
		}
	
		if (image_xscale == -1)
		{
			if (collision_rectangle(bbox_left - 20, bbox_top, bbox_left, bbox_bottom, obj_block, false, false))
			{
				hspd = 0;
				sprite_index = spr_DGuardianTurnBack;
				image_index = 0;
				state = 2;
			}
		}
	}	break;
	
	default:
	{
		guardDir = 90 - image_xscale * 90;
	}
}

if (shield == noone)
{
	shield = instance_create_depth(x, y, depth - 1, obj_E_DGuardianShield);
	shield.palette = self.palette;
	shield.paletteNumber = self.paletteNumber;
	shield.core = self;
}

if (!instance_exists(shield))
{
	shield = noone;
}

if (sprite_index == spr_DGuardian)
{
	if (engine == noone)
	{
		engine = instance_create_depth(x - 26 * image_xscale, y - 9, depth - 1, obj_E_GuardianEngine);
		engine.core = self;
		engine.image_xscale = image_xscale;
	}
	
	if (!instance_exists(engine))
	{
		engine = noone;
	}
}
else
{
	engine = noone;
}