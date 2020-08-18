/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_BBoneB81DropBomb)
{
	if (instance_exists(bomb))
	{
		bomb.vspd = 0;
		bomb.state = 1;
	}
	
	state = 3;
	
	sprite_index = spr_BBoneB81FlyAway;
	image_index = 0;
}