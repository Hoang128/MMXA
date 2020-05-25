/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_ZChronoStart:	
	{
		sprite_index = spr_ZChrono;
		image_index = 0;
	}	break;
	case spr_ZChronoEnd:
	{
		instance_destroy();
	}
}