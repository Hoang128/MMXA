/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -1) 
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	damageTimmer = other.maxTimmer;
	var realDamage = 0;

	switch (other.element)
	{
		case Element.NEUTRAL:	realDamage = other.damage - neutralArmor;	break;
		case Element.FIRE:		realDamage = other.damage - fireArmor;		break;
		case Element.ICE:		realDamage = other.damage - iceArmor;		break;
		case Element.ELECT:		realDamage = other.damage - electArmor;		break;
	}
	if (realDamage < 0)	realDamage = 0;
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
			case 90:
			{
				if ((other.y - (bbox_top + bbox_bottom) / 2) < 0)
				{
					realDamage = 0;
				}
			}	break;
			case 270:
			{
				if ((other.y - (bbox_top + bbox_bottom) / 2) > 0)
				{
					realDamage = 0;
				}
			}	break;
		}
	}
	if (guard == 1)
	{
		realDamage = 0;
	}
	if (realDamage > 0)
	{
		hp -= realDamage;
		
		//Create Effect
		if (other.slowTime == true) 
			scr_setTimeSlowEff(2, 0.2);
		if (other.collisionEff != noone)
		{
			//Create collision effect
			#region
			
			var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
			if (other.type == WeaponType.SABER)
				var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
			else
				var yPlace = clamp((other.bbox_top + other.bbox_bottom) / 2, bbox_top, bbox_bottom);
			
			if (other.object_index == obj_ZSaber)
			{
				randomize();
				var effAngle = random(60) * 3;
		
				var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
				objColEff.image_angle = effAngle;
				objColEff.image_xscale = other.image_xscale;
			
				var objZEff = instance_create_depth(xPlace, yPlace, other.depth - 2, obj_ZSaberSlashEff);
				objZEff.image_angle = effAngle;
			}
			else
			{
				var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
				objColEff.image_xscale = other.image_xscale;
			}
			#endregion
		}
		audio_play_sound_on(global.SFX_Emitter, other.collisionSFX, 0, 0);
	
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
		#region
		if (guardEffEnable == true)
		{
			var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
			if (other.type == WeaponType.SABER)
				var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
			else
				var yPlace = clamp((other.bbox_top + other.bbox_bottom) / 2, bbox_top, bbox_bottom);
		
			var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, obj_ArmorGuardColEff);
			objColEff.image_xscale = other.image_xscale;
			#endregion
		
			switch(other.object_index)
			{
				case obj_XBusterNormal:
				{
					other.bounce = 1;
					instance_destroy(other);
				}	break;
			
				case obj_ZBusterNor:
				case obj_ZBusterCharge:
				case obj_XBusterC1:
				case obj_XBusterC2:
					instance_destroy(other);
				break;
				case obj_ZSaber:
					scr_setTimeSlowEff(2, 0.2);
				break;
			}
		}
	}
}