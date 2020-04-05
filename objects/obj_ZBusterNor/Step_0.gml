/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd = moveSpd * image_xscale;

if (createDamageTime == 0) instance_destroy();

if (flyTime > 0)
{
	x += hspd * DELTA_TIME;
	flyTime -= DELTA_TIME;
}
else
{
	createEff = true;
	instance_destroy();
}