/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_GunvoltOpenHatchDown:
	case spr_GunvoltOpenHatchUp:
	{
		sprite_index = spr_GunvoltIdle;
		image_index = 0;
		
		waitTime = 0;
		state = 1;
	}	break;
}