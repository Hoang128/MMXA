/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_RaidenSlash1)
{
	slasher = instance_create_depth(x, y, depth, obj_E_RaidenSlash);
	slasher.core = self;
	slasher.image_xscale = image_xscale;
	
	sprite_index = spr_RaidenSlash2;
	image_index = 0;
}