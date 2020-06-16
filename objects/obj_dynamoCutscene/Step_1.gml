/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_dynamoBeam:
	case spr_dynamoBeamDown:	imgSpd = 0.3;	break;
	case spr_dynamoStand:		imgSpd = 0.2;	break;
}

event_inherited();

