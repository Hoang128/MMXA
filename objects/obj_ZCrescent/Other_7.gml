/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_ZCrescent:
	{
		if (phase == 1)
		{
			if (loopTime < loopTimeMax)
			{
				image_index = 3;
				loopTime++;
			}
			else
			{
				imgSpd = -0.5;
				image_index--;
				phase = 2;
			}
		}
	}	break;
}