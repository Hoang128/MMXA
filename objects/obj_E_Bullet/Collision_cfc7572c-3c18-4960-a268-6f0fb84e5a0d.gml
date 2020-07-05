/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -1)
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	if (guard == 0)
	{		
		if ((other.object_index == obj_ZSaber) || (other.object_index == obj_ZCrescent))
		{
			if (global.zSaber[2] == ItemState.USING)
			{
				if ((size <= 2) && (size > 0))
				{
					audio_play_sound_on(global.SFX_Emitter, snd_MWeaponColEnemyEff, false, false);
					createBulletEff = true;
					instance_destroy();
				}
			}
		}
	}
	else
	{	
		//Create collision effect
		#region
			
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
	damageTimmer = other.maxTimmer;
}