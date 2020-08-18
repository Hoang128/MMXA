/// @description Insert description here
// You can write your code in this editor

switch(sprite_index)
{
	case spr_WiredCreeperChangeDirDown:
	{
		sprite_index = spr_WiredCreeperChangeDirUp;
		image_index = 0;
	}	break;
	case spr_WiredCreeperChangeDirUp:
	{
		sprite_index = spr_WiredCreeperChangeDirDown;
		image_index = 0;
	}	break;
}
