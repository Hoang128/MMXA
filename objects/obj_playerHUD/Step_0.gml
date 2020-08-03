/// @description Insert description here
// You can write your code in this editor
//Init_____________________________________________________________________________________________________________________________________________________________
if (!init)
{
	//Initialize Parameters****************************************************************************************************************************************
	#region
	
	indHP = core.hp;
	indHPMax = core.hpMax;
	indWP = core.wp;
	indWPMax = core.wpMax;
	if (core.object_index == obj_playerXUA || core.object_index == obj_playerEclipseX)
	{
		indAP = core.ArmorPoint;
		indAPMax = core.ArmorPointMax;
		
		if (core.object_index == obj_playerEclipseX)
		{
			for (var i = 0; i < indAPMax; i++)
			{
				AP[i] = instance_create_depth(x, y,depth - 1, obj_HUDAP);
				AP[i].core = self;
				AP[i].count = i;
			}
		}
	}
	
	init = true;
	
	#endregion
}
else
{
	//HP animation*************************************************************************************************************************************************
	#region
	if (timeChangeHP <= 0)
	{
		timeChangeHP--;
	}
	else
	{
		if (indHP != core.hp)
		{
			if (sign(core.hp - indHP) > 0)
				audio_play_sound_on(global.SFX_Emitter, snd_gainHp, false, false);
			indHP += sign(core.hp - indHP);
		}
		timeChangeHP = timeChangeHPMax;
	}

	#endregion

	//Unique animation*********************************************************************************************************************************************
	switch (core.object_index)
	{
		case obj_playerEclipseX:
		{
			//Eclipse Armor point handle
			#region
			if (indAP != core.ArmorPoint)
			{
				if (indAP < core.ArmorPoint)
				{
					for (var i = 0; i < indAPMax; i++)
					{
						if (AP[i] == noone)
						{
							AP[i] = instance_create_depth(x, y, depth - 1, obj_HUDAP);
							AP[i].core = self;
							AP[i].count = i;
							break;
						}
					}
					indAP ++;
				}
				else if (indAP > core.ArmorPoint)
				{
					for (var i = (indAPMax - 1); i >= 0; i--)
					{
						if (AP[i] != noone)
						{
							instance_destroy(AP[i]);
							AP[i] = noone;
							break;
						}
					}
					indAP --;
				}
			}
			#endregion
		}	break;
	}
}