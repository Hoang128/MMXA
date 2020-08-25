/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	if (core.sprite_index == spr_KillerMothNormal)
	{
		x = core.x;
		y = core.y + 13;
	}
	else
		instance_destroy();
}
else
	instance_destroy();