/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ((core != noone) && instance_exists(core))
{
	x = core.x + xPlace * image_xscale;
	y = core.y;
}
else
	instance_destroy();