/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();
if (instance_exists(core))
{
	if (core.chargeNormal < core.chargeLv2Limit) instance_destroy();
}