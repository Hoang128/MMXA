/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();
if (instance_exists(core))
{
	if (formCharge == 0)
	{
		if (core.chargeNormal < core.chargeFormLv2Limit) 
		instance_destroy();
	}
	
	else
	{
		if (core.chargeForm < core.chargeFormLv2Limit) 
		instance_destroy();
	}
}