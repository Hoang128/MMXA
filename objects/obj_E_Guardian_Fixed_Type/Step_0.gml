/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: idle
2: trans direction
3.1: open guard
3.2: close guard
4: shot
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_Guardian;
		image_index = 0;
		if (instance_exists(obj_gameManager.playerCore))
			image_xscale = sign(obj_gameManager.playerCore.x - self.x);
		guardDir = 90 - image_xscale * 90;
		state = 1;
	}	break;
	
	case 1:
	{
		guardDir = 90 - image_xscale * 90;
		if (image_xscale != sign(obj_gameManager.playerCore.x - self.x))
		{
			if (sign(obj_gameManager.playerCore.x - self.x) != 0)
			{
				sprite_index = spr_GuardianTurnBack;
				image_index = 0;
				state = 2;
			}
		}
		else
		{
			if (idleTime < idleTimeMax)
			{
				idleTime += DELTA_TIME;
			}
			else
			{
				if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
				{
					sprite_index = spr_GuardianOpenGuard;
					image_index = 0;
					state = 3.1;
				}
				else
				{
					idleTime = 0;
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
					instance_create_depth(x + 16 * image_xscale, y - 11, depth - 1, obj_E_GuardianBullet);
					createBullet = true;
				}
			}
		}
		else
		{
			sprite_index = spr_GuardianCloseGuard;
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
	shield = instance_create_depth(x, y, depth - 1, obj_E_GuardianShield);
	shield.core = self;
}

if (!instance_exists(shield))
{
	shield = noone;
}