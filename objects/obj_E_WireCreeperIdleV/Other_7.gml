/// @description Insert description here
// You can write your code in this editor

switch(sprite_index)
{
	case spr_WiredCreeperChangeDirLeftV:
	{
		sprite_index = spr_WiredCreeperChangeDirRightV;
		image_index = 0;
	}	break;
	case spr_WiredCreeperChangeDirRightV:
	{
		sprite_index = spr_WiredCreeperChangeDirLeftV;
		image_index = 0;
	}	break;
}
