/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!instance_exists(core))
	instance_destroy();
else
{
	if (core.engine != self.id)
		instance_destroy();
	else
	{
		x = core.x - 26 * core.image_xscale;
		y = core.y - 9;
	}
}