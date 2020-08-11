/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case spr_WPFireEffStart:
	{
		sprite_index = spr_WPFireEff;
		image_index = 0;
	}	break;
	
	case spr_WPFireEffEnd:
	{
		instance_destroy();
	}	break;
}