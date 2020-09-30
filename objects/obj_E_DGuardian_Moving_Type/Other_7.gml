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
}