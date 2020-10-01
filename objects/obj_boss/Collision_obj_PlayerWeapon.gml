/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (inviTime == 0)
{
	event_inherited();
	if (damageTimmer = other.maxTimmer)
	{
		if (other.wpType == WeaponType.SABER)
		{
			if (other.hit == 2)
			{
				invi = true;
			}
		}
		else
		{
			invi = true;
		}
	}
}
if (blinkTime > 0)
{
	if (invi)
	{
		if (inviTime == 0)
			inviTime = inviTimeMax;
		if (damageTimmer <= 0)
		{
			damageTimmer = other.maxTimmer;
			scr_createEnemyColGuardEff();
		}
	}
}