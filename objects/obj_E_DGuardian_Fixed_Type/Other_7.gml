/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_DGuardianTurnBack:
	{
		sprite_index = spr_DGuardian;
		image_index = 0;
		image_xscale *= -1;
		state = 1;
		break;
	}
	case spr_DGuardianOpenGuard:
	{
		sprite_index = spr_DGuardianShot;
		image_index = 0;
		shotTime = 0;
		state = 4;
	}	break;
	
	case spr_DGuardianCloseGuard:
	{
		sprite_index = spr_DGuardian;
		image_index = 0;
		idleTime = 0;
		state = 1;
	}	break;
	
	case spr_DGuardianShot:
	{
		if (shotTime <= shotTimeMax)
		{
			image_index = 0;
			createBullet = 0;
			shotTime += DELTA_TIME;
		}
		else
		{
			sprite_index = spr_DGuardianCloseGuard;
			image_index = 0;
		}
	}	break;
}