/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_knotBeretFall:
	case spr_knotBeretLand:
	case spr_knotBeretRun:
	case spr_knotBeretThrowBomb:	imgSpd = 0.2;	break;
	case spr_knotBeretStand:		imgSpd = 0.05;	break;
	case spr_knotBeretShotUp:
	case spr_knotBeretShot:			imgSpd = 0.1;	break;
	default:						imgSpd = 0.5;
}

event_inherited();