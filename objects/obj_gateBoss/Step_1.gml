/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch (sprite_index)
{
	case spr_gateBoss:	
	case spr_gateBossUnlock:			imgSpd = 0;		break;
	case spr_gateBossOpen:	
	{
		if (state == gateState.OPENING)	imgSpd = 0.25;	
		if (state == gateState.CLOSING)	imgSpd = -0.25;
	}	break;
	default:							imgSpd = 0;		break;
}

event_inherited();

