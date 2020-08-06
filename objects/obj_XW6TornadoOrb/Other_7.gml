/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_XW6WindOrb1:
	{
		sprite_index = spr_XW6WindOrb2;
		image_index = 0;
	}	break;
	
	case spr_XW6WindOrb3:
	{
		instance_destroy();
	}	break;
}