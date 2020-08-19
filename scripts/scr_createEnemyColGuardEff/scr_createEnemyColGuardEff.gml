function scr_createEnemyColGuardEff() {
	if (other.slowTime == true)
		scr_setTimeSlowEff(2, 0.2);

	if (guardEffEnable == true)
	{
		var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
		if (other.type == WeaponType.SABER)
			var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
		else
			var yPlace = clamp((other.bbox_top + other.bbox_bottom) / 2, bbox_top, bbox_bottom);
		
		var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, obj_ArmorGuardColEff);
		objColEff.image_xscale = other.image_xscale;
		
		switch(other.object_index)
		{
			case obj_SolarBusterNormal:
			case obj_XBusterNormal:
			{
				other.bounce = 1;
				instance_destroy(other);
			}	break;

			case obj_SolarBusterC3:
			{
				if (other.level == 1)
					instance_destroy(other);
				else
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
			}	break;
		
			case obj_ZBusterNor:
			case obj_ZBusterCharge:
			case obj_XBusterC1:
			case obj_XBusterC2:
			case obj_PlasmaBuster:
			case obj_SolarBusterC1:
			case obj_SolarBusterC2:
			{
				instance_destroy(other);
			}	break;
			default:
			{
			
			}	break;
		}
	}


}
