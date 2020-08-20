/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
	{
		if ((image_angle == 0) || (image_angle == 180))
		{
			hspd = 0;
			vspd = moveSpd * moveDir;
		}
		else if ((image_angle == 90) || (image_angle == 270))
		{
			hspd = moveSpd * moveDir;
			vspd = 0;
		}
		
		state = 1;
	}	break;
	
	case 1:
	{
		if ((image_angle == 0) || (image_angle == 180))
		{
			hspd = 0;
			vspd = moveSpd * moveDir;
		}
		else if ((image_angle == 90) || (image_angle == 270))
		{
			hspd = moveSpd * moveDir;
			vspd = 0;
		}
		if (moveSpaceCurrent > moveSpaceMax)
		{
			if ((image_angle == 0) || (image_angle == 180))
			{
				y -= (moveSpaceCurrent - moveSpaceMax) * moveDir;
			}
			else if ((image_angle == 90) || (image_angle == 270))
			{
				x -= (moveSpaceCurrent - moveSpaceMax);
			}
			
			moveSpaceCurrent = 0;
			moveDir *= -1;
		}
		
		x += hspd * DELTA_TIME;
		y += vspd * DELTA_TIME;
		
		if (hspd != 0)
		{
			moveSpaceCurrent += abs(hspd * DELTA_TIME);
		}
		if (vspd != 0)
		{
			moveSpaceCurrent += abs(vspd * DELTA_TIME);
		}
		
	}	break;
}