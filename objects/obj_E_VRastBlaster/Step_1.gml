/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_VRastBlasterIdle:
	case spr_VRastBlasterMove1:
	case spr_VRastBlasterMove2:		mask_index = spr_VRastBlasterIdle;	break;
	default:						mask_index = sprite_index;
}

switch (sprite_index)
{
	case spr_VRastBlasterIdle:				imgSpd = 0.1;	break;
	case spr_VRastBlasterChangeToSpin:		imgSpd = 0.2;	break;
	case spr_VRastBlasterMove1:				imgSpd = 0.2;	break;
	case spr_VRastBlasterMove2:				imgSpd = 0.2;	break;
	case spr_VRastBlasterShot:				imgSpd = 0.2;	break;
	case spr_VRastBlasterSpin:				imgSpd = 0.5;	break;
}

event_inherited();

