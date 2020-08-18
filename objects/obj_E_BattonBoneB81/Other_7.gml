/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_BBoneB81DropBomb)
{
	sprite_index = spr_BBoneB81FlyAway;
	image_index = 0;
	
	if (image_xscale == 1)
		motion_set(30, moveSpd2);
	else
		motion_set(150, moveSpd2);
	state = 3;
}