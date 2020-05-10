/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event=

switch (sprite_index)
{
	case spr_walkCannonJump:
	case spr_walkCannonLand:
	case spr_walkCannonWalking:	imgSpd = 0.1;	break;
	default:					imgSpd = 0.2;
}

event_inherited();