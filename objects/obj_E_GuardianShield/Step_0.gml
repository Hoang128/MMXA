/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!instance_exists(core))
	instance_destroy();
else
{
	if (core.shield != self)
		instance_destroy();
	else
	{
		x = core.x;
		y = core.y;
	}
}