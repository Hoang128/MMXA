/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_XW8DarkShield2)
{
	if (time < existTime)
		time += DELTA_TIME;
	else
	{
		sprite_index = spr_XW8DarkShield3;
		image_index = 0;
	}
}