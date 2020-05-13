/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_SeaHorseShot:
	{
		sprite_index = spr_SeaHorseIdle;
		image_index = 0;
		
		shot = false;
		state = 1;
	}	break;
	
	case spr_SeaHorseChange:
	{
		sprite_index = spr_SeaHorseSpin;
		image_index = 0;
		
		state = 4.1;
	}	break;
}