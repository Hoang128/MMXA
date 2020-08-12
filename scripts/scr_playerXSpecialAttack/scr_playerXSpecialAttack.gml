var XType = argument0;

switch (currentWeapon)
{
	case 0:
	{
		if (XType == obj_playerEclipseX)
		{
			//Solar Charge Upgrade
			if (partArms == 1)
			{
				#region
			
				if (keyboard_check_pressed(global.keySpAtk))
				{
					if (ArmorPoint > 0)
					{
						upgradeChargeStack++;
						audio_play_sound_on(global.SFX_Emitter, snd_UISelectPart, false ,false);
						if (!instance_exists(obj_SolarChargeEff))
						{
							var objCStackEff = instance_create_depth(x, bbox_top + (bbox_bottom) / 2, depth - 5, obj_SolarChargeEff);
							objCStackEff.core = self;
						}
						else
						{
							with (obj_SolarChargeEff)
							{
								sprite_index = spr_SolarChargeEff;
								image_index = 0;
							}
						}
						ArmorPoint--;
					}
				}
			
				#endregion
			}
		}
	}	break;
	case 6:
	{
		scr_XAtk6Tornado();
	}	break;
	case 7:
	{
		scr_XAtk7Time();
	}	break;
	case 8:
	{
		scr_XAtk8Dark();
	}	break;
	default:	break;
}

if ((XType == obj_playerXUA) || ((XType == obj_playerEclipseX) && (partArms != 0)))
{
	if (currentWeapon != 0)
	{
		if (keyboard_check(global.keySpAtk))
		{
			if (chargeWeapon < chargeLv2Limit)
			{
				chargeWeapon += DELTA_TIME;
				if (chargeWeapon >= chargeLv1Limit)
				{
					if (!instance_exists(obj_XChargeEffSpLv1))
					{
						var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffSpLv1);
						objChargeEff.core = self;
					}
				}
			}
			else
			{
				chargeWeapon = chargeLv2Limit;
				if (!instance_exists(obj_XChargeEffSpLv2))
				{
					var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffSpLv2);
					objChargeEff.core = self;
				}
			}
		}
	
		switch (currentWeapon)
		{
			case 8:
			{
				scr_XAtk8DarkCharge();
			}	break;
			default:	break;
		}
	}
}