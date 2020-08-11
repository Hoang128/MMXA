/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	if ((core.object_index == obj_playerX) 
	||	(core.object_index == obj_playerXUA)
	||	(core.object_index == obj_playerEclipseX && core.partArms != 1))
	{
		if (core.chargeNormal <= 0) 
			instance_destroy();
	}
	else
	{
		if ((core.chargeNormal >= 0) && (core.chargeNormal < core.chargeSolarLv1Limit))
			instance_destroy();
	}
}