/// @description Insert description here
// You can write your code in this editor

/// @description Handle
if (instance_exists(obj_ZChronoField))
{
	if ((distance_to_object(obj_ZChronoField) < obj_ZChronoField.radius) && (obj_ZChronoField.phase > 0))
	{
		if (myDeltaTime == 1)
			myDeltaTime *= obj_ZChronoField.slowRatio;
	}
	else myDeltaTime = 1;
}	
else myDeltaTime = 1;