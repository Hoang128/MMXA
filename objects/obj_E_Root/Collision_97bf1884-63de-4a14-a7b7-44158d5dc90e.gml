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
				if (other.object_index == obj_PlasmaBuster)
				{
					with (other)
					{
						if (orbCanCreate > 0)
						{
							if (canCreateOrb == 1)
							{
								orbCanCreate --;
								canCreateOrb -= waitTimeToCreateOrb * DELTA_TIME;
								var xPlace = clamp(x + (abs(sprite_width) - abs(sprite_xoffset)) * 0.75 * image_xscale, other.bbox_left, other.bbox_right);
								var yPlace = clamp((bbox_top + bbox_bottom) / 2, other.bbox_top, other.bbox_bottom);
								instance_create_depth(xPlace, yPlace, depth, obj_PlasmaOrb);
							}
						}
					}
				}
				else if (hp > 0)
				{
					if ((other.object_index == obj_SolarBusterC3) && (other.level == 2))
					{
						with (other)
						{
							if (moveSpd != 0)
							{
								damage = 0.2;
								maxTimmer = 10;
								moveSpd = 0;
								lv2ExistTime--;
							}
						}
					}
					else
						instance_destroy(other);
				}
			}
		}
		
		if ((other.object_index == obj_XW6TornadoMissle)
		||	(other.object_index == obj_XW6TornadoMissleCharge))
		{
			other.createOrb = true;
			instance_destroy(other);
		}
	}
	else
	{
		if (other.object_index == obj_PlasmaBuster)
		{
			with (other)
			{
				if (orbCanCreate > 0)
				{
					if (canCreateOrb == 1)
					{
						orbCanCreate--;
						canCreateOrb -= waitTimeToCreateOrb * DELTA_TIME;
						var xPlace = clamp(x + (abs(sprite_width) - abs(sprite_xoffset)) * 0.75 * image_xscale, other.bbox_left, other.bbox_right);
						var yPlace = clamp((bbox_top + bbox_bottom) / 2, other.bbox_top, other.bbox_bottom);
						instance_create_depth(xPlace, yPlace, depth, obj_PlasmaOrb);
					}
				}
			}
		}
		
		//Create collision effect
		scr_createEnemyColGuardEff();
	}
}