/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_SeaHorseIdle:
	case spr_SeaHorseShot:
	case spr_SeaHorseChange:
	{
		imgSpd = 0.2;
		mask_index = spr_SeaHorseIdle;
	}	break;
	case spr_SeaHorseSpin:
	{
		imgSpd = 0.5;
		if (image_angle < 360)
			image_angle -= DELTA_TIME * image_xscale * spinSpd;
		else
			image_angle = 0;
		mask_index = spr_SeaHorseSpin;
	}	break;
}

switch (sprite_index)
{
	case spr_SeaHorseIdle:
	case spr_SeaHorseShot:
	case spr_SeaHorseChange:
	{
		damage = 1;
		damageRed = 1;
	}	break;
	case spr_SeaHorseSpin:
	{
		damage = 2;
		damageRed = 2;
	}	break;
}

event_inherited();