/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_WPFireEff)
{
	if (time < existTime)
		time += DELTA_TIME;
	else
	{
		sprite_index = spr_WPFireEffEnd;
		image_index = 0;
	}
}