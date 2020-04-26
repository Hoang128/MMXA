/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();
if (instance_exists(core))
{
	if (coreCharge == 0)
	{
		if (core.chargeNormal < core.chargeLv2Limit) 
		instance_destroy();
	}
	
	else
	{
		if ((core.chargeCore < core.chargeCoreLv2Limit) && (core.chargeCore > 0)) 
		instance_destroy();
	}
}