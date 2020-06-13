/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_gateBossOpen:
	{
		sprite_index = spr_gateBossUnlock;
		image_index = 0;
		waitTimeOpen = 0;
		instance_destroy(block);
		block = noone;
		phase = 3;
	}
}