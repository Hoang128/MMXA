/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch(sprite_index)
{
	case spr_metoolGuard:	mask_index = spr_metoolGuard;	break;
	default:				mask_index = spr_metoolRun;		break;
}

switch(sprite_index)
{
	case spr_metoolDown:
	case spr_metoolUp:		imgSpd = 0.7;	break;
	case spr_metoolFalling:
	case spr_metoolGuard:
	case spr_metoolJump1:
	case spr_metoolJump2:	
	case spr_metoolRun:		imgSpd = 0.25;	break;
	case spr_metoolTrans:	imgSpd = 0.3;	break;
	default: imgSpd = 0.5;
}

event_inherited();