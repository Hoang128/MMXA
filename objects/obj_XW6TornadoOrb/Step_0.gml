/// @description Insert description here
// You can write your code in this editor
scr_destroyObjOutOfCamera(self);
if (sprite_index == spr_XW6WindOrb2)
{
	if (time < existTime)
		time += DELTA_TIME;
	else
	{
		sprite_index = spr_XW6WindOrb3;
		image_index = 0;
	}
}