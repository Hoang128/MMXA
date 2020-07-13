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
		scr_createEnemyColGuardEff();
	}
	damageTimmer = other.maxTimmer;
}