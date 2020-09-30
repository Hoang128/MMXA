/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

mask_index = spr_DGuardian;

switch sprite_index
{
	case spr_DGuardian:
	case spr_DGuardianCloseGuard:
	case spr_DGuardianOpenGuard:		imgSpd = 0.25;	break;
	case spr_DGuardianShot:			imgSpd = 0.1;	break;
	case spr_DGuardianTurnBack:		imgSpd = 0.2;	break;
}

event_inherited();

