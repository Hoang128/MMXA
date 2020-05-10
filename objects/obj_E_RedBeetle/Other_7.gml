/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_redBeetleTurnBack)
{
	image_xscale *= -1;
	sprite_index = spr_redBeetleNormal;
	image_index = 0;
	
	hspd = image_xscale * moveSpd;
	state = 3;
}