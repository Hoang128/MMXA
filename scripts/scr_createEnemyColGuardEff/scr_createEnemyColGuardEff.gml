function scr_createEnemyColGuardEff(playerDamageSource) {
	if (playerDamageSource.slowTime == true)
		scr_setTimeSlowEff(2, 0.2);

	if (guardEffEnable == true)
	{
		var xPlace = clamp(playerDamageSource.x + (abs(playerDamageSource.sprite_width) - abs(playerDamageSource.sprite_xoffset)) * 0.75 * playerDamageSource.image_xscale, bbox_left, bbox_right);
		if (playerDamageSource.wpType == WeaponType.SABER)
			var yPlace = clamp((playerDamageSource.core.bbox_top + playerDamageSource.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
		else
			var yPlace = clamp((playerDamageSource.bbox_top + playerDamageSource.bbox_bottom) / 2, bbox_top, bbox_bottom);
		
		var objColEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, obj_ArmorGuardColEff);
		objColEff.image_xscale = playerDamageSource.image_xscale;
		
		switch(playerDamageSource.object_index)
		{
			case obj_SolarBusterNormal:
			case obj_XBusterNormal:
			{
				playerDamageSource.bounce = 1;
				instance_destroy(playerDamageSource);
			}	break;

			case obj_SolarBusterC3:
			{
				if (playerDamageSource.level == 1)
					instance_destroy(playerDamageSource);
				else
				{
					with (playerDamageSource)
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
			}	break;
		
			case obj_ZBusterNor:
			case obj_ZBusterCharge:
			case obj_XBusterC1:
			case obj_XBusterC2:
			case obj_PlasmaBuster:
			case obj_SolarBusterC1:
			case obj_SolarBusterC2:
			{
				instance_destroy(playerDamageSource);
			}	break;
			default:
			{
			
			}	break;
		}
	}


}
