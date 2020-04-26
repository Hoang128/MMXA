/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

if (instance_exists(core))
{
	if (formCharge == 0)
	{
		if (core.chargeNormal < core.chargeLv1Limit) 
		instance_destroy();
	}
	
	else
	{
		if (core.chargeForm < core.chargeLv1Limit) 
		instance_destroy();
	}
}