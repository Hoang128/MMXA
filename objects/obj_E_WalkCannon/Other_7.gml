/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_walkCannonJump:
	{
		sprite_index = spr_walkCannonJumpShotUp;
		image_index = 0;
		
		vspd = jumpSpd;
		state = 6;
	}	break;
	
	case spr_walkCannonLand:
	{
		sprite_index = spr_walkCannonWalking;
		image_index = 0;
		
		state = 1;
	}	break;
}