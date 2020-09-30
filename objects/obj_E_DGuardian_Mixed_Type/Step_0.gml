/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: idle move
2: trans direction
3.1: open guard
3.2: close guard
4: shot
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
		if (canShot == true)
		{
			if (idleTime < idleTimeMax)
			{
				idleTime += DELTA_TIME;
			}
			else
			{
				if (instance_exists(obj_gameManager.playerCore))
				{
					if (distance_to_object(obj_gameManager.playerCore) <= minDistanceToPlayer)
					{
						if (sign(obj_gameManager.playerCore.x - self.x) == image_xscale)
						{
							if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
							{
								sprite_index = spr_DGuardianOpenGuard;
								image_index = 0;
								hspd = 0;
								state = 3.1;
							}
						}
					}
				}
			}
		}
	}	break;
	
	case 4:
	{
		guardDir = 90;
		if (shotTime <= shotTimeMax)
		{
			if (image_index >= 2)
			{
				if (createBullet == false)
				{
					var bullet = instance_create_depth(x + 16 * image_xscale, y - 11, depth - 1, obj_E_GuardianBullet);
					bullet.image_xscale = image_xscale;
					if (instance_exists(obj_gameManager.playerCore) && bullet.image_xscale == sign(obj_gameManager.playerCore.x - self.x))
						bullet.track = true;
					else	
						bullet.track = false;
					createBullet = true;
				}
			}
		}
		else
		{
			sprite_index = spr_DGuardianCloseGuard;
			image_index = 0;
			state = 3.2;
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