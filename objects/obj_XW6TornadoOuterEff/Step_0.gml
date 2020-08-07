/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (instance_exists(core) && (core != noone))
{
	if (core.sprite_index == spr_XW6WindEff)
	{
		imgSpd = core.imgSpd;
		image_index = core.image_index;
		image_xscale = core.image_xscale;
		image_yscale = core.image_yscale;
	}
	else instance_destroy();
}	else instance_destroy();