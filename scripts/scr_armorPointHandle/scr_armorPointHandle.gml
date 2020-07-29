if (object_index == obj_playerEclipseX)
{
	if (ArmorPoint == 0)
	{
		if (canUseArmorPoint)
		{
			if ((partHead == 1) &&
				(partArms == 1) &&
				(partBody == 1) &&
				(partFoot == 1))
			{
				coolDownAPTime = coolDownAPTimeSlow;
				canUseArmorPoint = false;
			}
		}
	}
}

if (ArmorPoint < ArmorPointMax)
{
	if (coolDownAPTime > 0)
		coolDownAPTime -= DELTA_TIME;
	else
	{
		ArmorPoint++;
		coolDownAPTime = coolDownAPTimeMax;
		if (canUseArmorPoint == false)
			coolDownAPTime = coolDownAPTimeSlow;
	}
}
else
{
	if (object_index == obj_playerEclipseX)
	{
		canUseArmorPoint = true;
	}
	if (coolDownAPTime < coolDownAPTimeMax)
		coolDownAPTime = coolDownAPTimeMax; 
}