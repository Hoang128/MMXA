/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: falling
2: stand
3.1: shot
3.2: shot up
3.3: throw bomb
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_knotBeretFall;
		image_index = 0;
		if (instance_exists(obj_gameManager.playerCore))
			image_xscale = sign(obj_gameManager.playerCore.x - self.x);
		state = 1;
	}	break;

	case 1:
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			sprite_index = spr_knotBeretLand;
			image_index = 0;
			state = 2;
		}
	}	break;
	
	case 2:
	{
		if (sprite_index == spr_knotBeretStand)
		{
			if (instance_exists(obj_gameManager.playerCore))
			{
				if (sign(self.x - obj_gameManager.playerCore.x) == 0)	image_xscale = 1;
				else
				{
					image_xscale = sign(obj_gameManager.playerCore.x - self.x);
				}
			}
			if (standTime < standTimeMax)
			{
				standTime += DELTA_TIME;
			}
			else
			{
				if (instance_exists(obj_gameManager.playerCore))
				{
					var yDifferent = self.y - obj_gameManager.playerCore.y;
					if (yDifferent > 20)
					{
						var xPlace = 17 * image_xscale;
						var yPlace = -63;
						if (!collision_line(x + xPlace, y + yPlace, obj_gameManager.playerCore.x, obj_gameManager.playerCore.y, obj_block, false, false))
						{
							sprite_index = spr_knotBeretShotUp;
							image_index = 0;
							state = 3.2;
						}
						else
						{
							standTime = 0;
						}
					}
					else if (yDifferent > -20)
					{
						var xPlace = 38 * image_xscale;
						var yPlace = -38;
						if (!collision_line(x + xPlace, y + yPlace, obj_gameManager.playerCore.x, obj_gameManager.playerCore.y, obj_block, false, false))
						{
							sprite_index = spr_knotBeretShot;
							image_index = 0;
							state = 3.1;
						}
						else
						{
							standTime = 0;
						}
					}
					else
					{
						sprite_index = spr_knotBeretThrowBomb;
						image_index = 0;
						state = 3.3;
					}
				}
			}
		}
	}	break;
	
	case 3.1:
	{
		if (image_index >= 1)
		{
			if (shot == false)
			{
				var xPlace = 38 * image_xscale;
				var yPlace = -38;
				var objBullet = instance_create_depth(x + xPlace, y + yPlace, depth - 1, obj_E_KnotBeretBullet);
				objBullet.image_xscale = self.image_xscale;
				shot = true;
			}
		}
	}	break;
	
	case 3.2:
	{
		if (image_index >= 1)
		{
			if (shot == false)
			{
				var xPlace = 17 * image_xscale;
				var yPlace = -63;
				var objBullet = instance_create_depth(x + xPlace, y + yPlace, depth - 1, obj_E_KnotBeretBullet);
				objBullet.image_xscale = self.image_xscale;
				objBullet.moveHspd /=sqrt(2);
				objBullet.moveVspd = -objBullet.moveHspd;
				shot = true;
			}
		}
	}	break;
	
	case 3.3:
	{
		if (image_index >= 4)
		{
			if (shot == false)
			{
				var xPlace = 10 * image_xscale;
				var yPlace = -36;
				var objBullet = instance_create_depth(x + xPlace, y + yPlace, depth - 1, obj_E_KnotBeretBomb);
				objBullet.image_xscale = self.image_xscale;
				shot = true;
			}
		}
	}	break;
}