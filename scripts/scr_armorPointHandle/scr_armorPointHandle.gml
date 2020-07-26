if (ArmorPoint < ArmorPointMax)
{
	if (coolDownAPTime > 0)
		coolDownAPTime -= DELTA_TIME;
	else
	{
		ArmorPoint++;
		coolDownAPTime = coolDownAPTimeMax;
	}
}
else
{
	if (coolDownAPTime < coolDownAPTimeMax)
		coolDownAPTime = coolDownAPTimeMax; 
}