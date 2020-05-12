/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_Raiden:		imgSpd = 0.05;	break;
	case spr_RaidenSlash1:	imgSpd = 0.2;	break;
	case spr_RaidenSlash2:	imgSpd = 1;		break;
}

event_inherited();