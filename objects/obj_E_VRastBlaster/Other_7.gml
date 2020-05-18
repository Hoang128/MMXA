/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_VRastBlasterMove1:
	{
		sprite_index = spr_VRastBlasterMove2;
		image_index = 0;
		
		y -= image_yscale * stepDistance;
		image_yscale = 1;
	}	break;
	
	case spr_VRastBlasterChangeToSpin:
	{
		sprite_index = spr_VRastBlasterSpin;
		image_index = 0;
		
		state = 5.1;
		break;
	}
	
	case spr_VRastBlasterChangeToIdle:
	case spr_VRastBlasterMove2:
	case spr_VRastBlasterShot:
	{
		sprite_index = spr_VRastBlasterIdle;
		image_index = 0;
		
		lastState = state;
		shot = 0;
		spinTime = 0;
		idleTime = 0;
		state = 1;
	}	break;
}