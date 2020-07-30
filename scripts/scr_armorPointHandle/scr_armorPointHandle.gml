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
				coolDownSpd = coolDownSpdSlow;
				canUseArmorPoint = false;
			}
		}
	}
	
	if (partFoot == 1)
	{
		if (sprite_index == spr_XEImpactDown)
		{
			if (timeInImpactDown == 0)
			{
				coolDownSpd = coolDownSpdCharge;
			}
		}
		else
		{
			if (canUseArmorPoint)	coolDownSpd = coolDownSpdNormal;
			else					coolDownSpd = coolDownSpdSlow;
		}
	}
}

if (ArmorPoint < ArmorPointMax)
{
	if (coolDownAPTime > 0)
		coolDownAPTime -= DELTA_TIME * coolDownSpd;
	else
	{
		ArmorPoint++;
		coolDownAPTime = coolDownAPTimeMax;
		if (canUseArmorPoint == false)
			coolDownSpd = coolDownSpdSlow;
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