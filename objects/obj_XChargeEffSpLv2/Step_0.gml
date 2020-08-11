/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
myPal = core.myPal;
palNum = core.currentWeapon;
if (instance_exists(core))
{
	if (core.chargeWeapon <= 0) instance_destroy();
}