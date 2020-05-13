/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Init
state 1:	Idle
state 2:	Shot
state 3:	Change
state 4.1:	Spin delay 1
state 4.2:	Spin delay 2
state 4.3:	Spin vertical
state 4.4:	Spin horizontal
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_SeaHorseIdle;
		image_index = 0;
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		state = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
			if (idleTime < idleTimeMax)
			{
				idleTime += DELTA_TIME;
			}
			else
			{
				if (abs(self.y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2) < minYDistanceToAct)
				{
					if (abs(self.x - obj_gameManager.playerCore.x) < minXDistanceToShot)
					{
						if (abs(self.x - obj_gameManager.playerCore.x) > minXDistanceToSpin)
						{
							if ((self.bbox_bottom - obj_gameManager.playerCore.bbox_bottom) > 0)
							{
								sprite_index = spr_SeaHorseShot;
								image_index = 0;
							
								state = 2;
							}
						}
						else
						{
							sprite_index = spr_SeaHorseChange;
							image_index = 0;
					
							state = 3;
						}
					}
					idleTime = 0;
				}
				else
				{
					idleTime = 0;
				}
			}
		}
	}	break;
	
	case 2:
	{
		if (image_index > 3)
		{
			if (shot == false)
			{
				var bullet = instance_create_depth(x - image_xscale * 8, y - 22, depth - 1, obj_E_SeaHorseBullet);
				bullet.image_xscale = image_xscale;
				shot = true;
			}
		}
	}	break;
	
	
	case 4.1:
	{
		if (delaySpin < delaySpinMax)
			delaySpin += DELTA_TIME;
		else
		{
			if (instance_exists(obj_gameManager.playerCore))
			{
				if ((y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2) <= 0)
					vspd = moveSpd;
				else
					vspd = -moveSpd;
			}
			delaySpin = 0;
			state = 4.3;
		}
	}	break;
	
	case 4.2:
	{
		if (delaySpin < delaySpinMax)
			delaySpin += DELTA_TIME;
		else
		{
			hspd = image_xscale * moveSpd;
			delaySpin = 0;
			state = 4.4;
		}
	}	break;
	
	case 4.3:
	{
		if (place_meeting(x, y, obj_block))	instance_destroy();
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (abs(y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2) <= moveSpd)
			{
				vspd = 0;
				state = 4.2;
			}
		}
	}	break;
	
	case 4.4:
	{
		if (place_meeting(x, y, obj_block))	instance_destroy();
	}	break;
	
}