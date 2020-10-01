/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_GunvoltIdle:
	{
		guard = 0;
		imgSpd = 0.5;	break;
	}
	case spr_GunvoltOpenHatchDown:
	case spr_GunvoltOpenHatchUp:
	{
		guard = 0;
		imgSpd = 0.3;	break;
	}
}

event_inherited();