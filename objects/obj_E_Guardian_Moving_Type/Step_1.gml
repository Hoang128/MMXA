/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

mask_index = spr_Guardian;

switch sprite_index
{
	case spr_Guardian:
	case spr_GuardianCloseGuard:
	case spr_GuardianOpenGuard:		imgSpd = 0.25;	break;
	case spr_GuardianShot:			imgSpd = 0.1;	break;
	case spr_GuardianTurnBack:		imgSpd = 0.2;	break;
}

event_inherited();

