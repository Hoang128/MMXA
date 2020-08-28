/// @description Handle
if (instance_exists(obj_PlayerWeaponTime))
{
	if ((distance_to_point(obj_PlayerWeaponTime.x, obj_PlayerWeaponTime.y) < obj_PlayerWeaponTime.radius) && (obj_PlayerWeaponTime.phase > 0))
	{
		if (myDeltaTime == 1)
			myDeltaTime *= obj_PlayerWeaponTime.slowRatio;
	}
	else
	{
		if (object_index == obj_E_WireCreeperMoving)
		{
			if (instance_exists(pairWirer))
			{
				if (self.pairWirer.myDeltaTime != 1)
					myDeltaTime = pairWirer.myDeltaTime;
				else
					myDeltaTime = 1;
			}
			else	myDeltaTime = 1;
		}
		else myDeltaTime = 1;
	}
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