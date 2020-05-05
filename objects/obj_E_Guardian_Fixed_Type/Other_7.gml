/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_GuardianTurnBack:
	{
		sprite_index = spr_Guardian;
		image_index = 0;
		image_xscale *= -1;
		state = 1;
		break;
	}
	case spr_GuardianOpenGuard:
	{
		sprite_index = spr_GuardianShot;
		image_index = 0;
		shotTime = 1;
		state = 4;
	}	break;
	
	case spr_GuardianCloseGuard:
	{
		sprite_index = spr_Guardian;
		image_index = 0;
		idleTime = 0;
		state = 1;
	}	break;
	
	case spr_GuardianShot:
	{
		if (shotTime < shotTimeMax)
		{
			image_index = 0;
			createBullet = 0;
			shotTime++;
		}
		else
		{
			sprite_index = spr_GuardianCloseGuard;
			image_index = 0;
		}
	}	break;
}