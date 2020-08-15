/// @description Insert description here
// You can write your code in this editor

/// @description Handle
if (instance_exists(obj_PlayerWeaponTime))
{
	if ((distance_to_object(obj_PlayerWeaponTime) < obj_PlayerWeaponTime.radius) && (obj_PlayerWeaponTime.phase > 0))
	{
		if (myDeltaTime == 1)
			myDeltaTime *= obj_PlayerWeaponTime.slowRatio;
	}
	else myDeltaTime = 1;
}	
else myDeltaTime = 1;

if (sprite_index == noone)
	visible = 0;
else visible = 1;