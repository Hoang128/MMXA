/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	if (core.sprite_index != spr_ZShotHoldThunderBlaster)
		instance_destroy();
	else
	{
		self.x = core.x + 24 * core.image_xscale;
		self.y = core.y - 22;
		self.image_xscale = core.image_xscale;
	}
}
else	instance_destroy();