/// @description Insert description here
// You can write your code in this editor
var realDamage = 0;

if (damageTimmer == -1) 
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	damageTimmer = other.maxTimmer;

	switch (other.element)
	{
		case Element.NEUTRAL:	realDamage = other.damage;					break;
		case Element.DARK:		realDamage = other.damage - darkArmor;		break;
		case Element.FIRE:		realDamage = other.damage - fireArmor;		break;
		case Element.ICE:		realDamage = other.damage - iceArmor;		break;
		case Element.ELECT:		realDamage = other.damage - electArmor;		break;
	}
	realDamage -= neutralArmor;
	if (realDamage < 0)	realDamage = 0;
	if (other.isGuardBreaker == false)
	{
		if (guard == 0.5)
		{
			switch (guardDir)
			{
				case 0:	
				{
					if ((other.x - (bbox_right + bbox_left) / 2) > 0)
						realDamage = 0;
				}	break;
				case 180:
				{
					if ((other.x - (bbox_right + bbox_left) / 2) < 0)
						realDamage = 0;
				}	break;
			}
		}
		if (guard == 1)
		{
			realDamage = 0;
		}
	}
	
	if (other.type == WeaponType.SABER)
	{
		other.hit++;
	}
	
	if (realDamage > 0)
	{
		hp -= realDamage;
		
		//Create Effect
		
		//Blink effect
		if (blinkTime == 0)
			blinkTime = blinkTimeMax;
		
		scr_createEnemyColDamageEff();
		
		if (other.type == WeaponType.BUSTER)
		{
			if (other.object_index == obj_XBusterNormal)
				instance_destroy(other);
			else
			{
				if (hp > 0)
					instance_destroy(other);
			}
		}
	}
	else
	{
		//Create collision effect
		
		scr_createEnemyColGuardEff();
	}
}