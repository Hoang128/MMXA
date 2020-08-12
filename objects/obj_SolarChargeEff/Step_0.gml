/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core) && (core.upgradeChargeStack > 0))
{
	x = core.x;
	y = (core.bbox_top + core.bbox_bottom) / 2;
}
else
	instance_destroy();