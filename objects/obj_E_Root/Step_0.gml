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

if (damageTimmer > 0) damageTimmer -= global.deltaTime;

if (blinkTime > 0)
{
	if (blink > 0) blink -= DELTA_TIME;
	else blink = blinkMax;
	blinkTime -= DELTA_TIME;
}
else
{
	blink = 0;
	blinkTime = 0;
}